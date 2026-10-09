"""Reproduce the PFW ownership evidence. Reads source/dump; writes only docs/data.

This is an archive-specific literal-table scanner, not a Lua interpreter.
Recommendations are maintained in content-evaluation.md, not inferred by this tool.
"""
import argparse
import collections
import csv
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'docs/data'
DECL = re.compile(r'\{\s*type\s*=\s*"([^"]+)"\s*,\s*name\s*=\s*"([^"]+)"')
COMMENT = re.compile(r'--\[\[.*?\]\]|--[^\n]*', re.S)


def mask_comments(text):
    return COMMENT.sub(lambda m: ''.join('\n' if c == '\n' else ' ' for c in m[0]), text)


def table(text, start):
    depth = 0
    quoted = escaped = False
    for end in range(start, len(text)):
        c = text[end]
        if quoted:
            if escaped:
                escaped = False
            elif c == '\\':
                escaped = True
            elif c == '"':
                quoted = False
        elif c == '"':
            quoted = True
        elif c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if not depth:
                return text[start:end + 1]
    raise ValueError('Unbalanced literal table')


def field(text, key, default=None):
    m = re.search(r'\b' + key + r'\s*=\s*("[^"]*"|[0-9.]+)', text)
    if not m:
        return default
    return m[1][1:-1] if m[1].startswith('"') else float(m[1])


def amounts(text, key):
    m = re.search(r'\b' + key + r'\s*=\s*{', text)
    if not m:
        return []
    result = []
    for child in re.findall(r'\{([^{}]+)\}', table(text, m.end() - 1)):
        if re.search(r'\bname\s*=', child):
            result.append({'type': field(child, 'type', 'item'), 'name': field(child, 'name'), 'amount': field(child, 'amount')})
        else:
            name, amount = re.fullmatch(r'\s*"([^"]+)"\s*,\s*([0-9.]+)\s*,?\s*', child).groups()
            result.append({'type': 'item', 'name': name, 'amount': float(amount)})
    assert all(x['name'] and x['amount'] is not None for x in result)
    return result


def scan(root, include_disabled=False):
    records = []
    for path in sorted((root / 'prototypes').rglob('*.lua')):
        raw = path.read_text()
        active = mask_comments(raw)
        # Preserve offsets when exposing commented declarations. Only the supplied
        # archive uses this path; parent evidence always excludes comments.
        text = re.sub(r'--\[\[|\]\]|--', lambda m: ' ' * len(m[0]), raw) if include_disabled else active
        previous_end = -1
        for match in DECL.finditer(text):
            if match.start() < previous_end:
                continue
            literal = table(text, match.start())
            previous_end = match.start() + len(literal)
            typ, name = match.groups()
            record = dict(type=typ, name=name, source=str(path.relative_to(root)), line=raw[:match.start()].count('\n') + 1,
                          state='active' if DECL.match(active, match.start()) else 'commented', literal=literal)
            if typ == 'recipe' and include_disabled:
                results = amounts(literal, 'results')
                if not results and field(literal, 'result'):
                    results = [{'type': 'item', 'name': field(literal, 'result'), 'amount': field(literal, 'result_count', 1)}]
                record.update(ingredients=amounts(literal, 'ingredients'), results=results,
                              category=field(literal, 'category', 'crafting'), seconds=field(literal, 'energy_required', 0.5))
            records.append(record)
    return records


# A comparison scenario, NOT an approved migration. Pending mappings deliberately
# collapse multiple old products so the audit exposes resulting recipe overlap.
SCENARIO = {
    'y-sm-1': 'yi_lasergun', 'y-sm-2': 'yi_lasergun', 'y-sm-5': 'yi_minigun',
    'y-mun-2': 'yi_ammo_energie', 'y-combat-armor-2': 'yi_equip_shield_a',
    'y-combat-armor-3': 'yi_equip_shield_a', 'y-equ-1': 'yi_equip_shield_b',
    'y-equ-2': 'yi_equip_shield_b', 'y-equ-6': 'yi_equip_generator_a',
    'y-equ-9': 'yi_equip_legs_a', 'y-retrader-1': 'ye_trade_node',
    'raw-wood': 'wood', 'flame-thrower': 'flamethrower',
}


def signature(rows, aliases=None):
    # Preserve probability, temperature, quality and all other material semantics;
    # parent-specific fields cannot accidentally become an exact match.
    aliases = aliases or {}
    normalized = []
    for row in rows:
        value = dict(row)
        value['type'] = value.get('type', 'item')
        value['name'] = aliases.get(value['name'], value['name'])
        for key, item in value.items():
            if isinstance(item, (int, float)) and not isinstance(item, bool):
                value[key] = float(item)
        normalized.append(json.dumps(value, sort_keys=True))
    return sorted(normalized)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def disposition(typ, name):
    if name == 'ypfw_trader_sign':
        return 'reuse_parent', 'Yuoki:item/ypfw_trader_sign', 'Existing parent currency; local item is already commented.'
    if name == 'y-retrader-1':
        return 'reuse_candidate_with_compatibility', 'yi_engines:' + typ + '/ye_trade_node', 'Same trading role; category, speed, power and construction differ; retain PFW trades.'
    if name.startswith('y-factory-'):
        return 'retain_pfw', '', 'Dedicated PFW category absent from parent machines; factories 4/6/7 retain commented construction.'
    if name.startswith('y-rich-'):
        return 'retain_unfinished_pfw', '', 'No confirmed replacement for wealth tiers; commented construction and obsolete category require later design.'
    if name == 'y-zproduct-8':
        if typ == 'battery-equipment':
            return 'split_equipment_from_trade_item', 'Yuoki:battery-equipment/yi_equip_battery_a', 'Reuse parent equipment role; preserve separate PFW fuel/refill/export loop.'
        return 'retain_pfw_trade_and_fuel', '', '12GJ fuel and refill/export casing cycle are absent from parent battery item.'
    if name in ['y-cyb-8u', 'y-cyb-9u']:
        return ('reuse_candidate' if name.endswith('8u') else 'pending_armor_choice', 'Yuoki:armor/yi_walker_a' if name.endswith('8u') else 'Yuoki:armor/yi_walker_a or yi_armor_gray', 'Walker/armor role moved, but statistics and animation associations differ; preserve disabled conversions.')
    if name in ['y_walker_grid', 'y_armor_grid']:
        return 'reuse_parent_grid_after_armor_choice', 'Yuoki:equipment-grid/y_walker_grid', 'Parent grid is 14x14; old y_walker_grid is 12x12 and collides; old y_armor_grid is 14x14.'
    if name == 'p2':
        return 'reuse_parent', 'Yuoki:projectile/p2', 'Direct collision; use parent ammunition/projectile together, preserving original commented definition.'
    if name in SCENARIO:
        pending = name in ['y-sm-2', 'y-combat-armor-2', 'y-combat-armor-3', 'y-equ-1', 'y-equ-2']
        parent_type = ('ammo' if name == 'y-mun-2' else 'gun') if typ == 'item' and name in ['y-mun-2', 'y-sm-1', 'y-sm-2', 'y-sm-5'] else typ
        return ('reuse_parent_role_pending_tier_mapping' if pending else 'reuse_parent', 'Yuoki:' + parent_type + '/' + SCENARIO[name], 'Historical migration evidence; retain unique consumers and recipes; consult equipment comparison for changed stats and tier collapse.')
    if typ == 'gun':
        return 'preserve_unfinished_pfw', '', 'Commented grenade launcher is not an active gun; distinct from active packaged item.'
    if typ in ['item-group', 'item-subgroup', 'recipe-category']:
        return 'retain_pfw_presentation_or_category', '', 'No same-type collision; category consolidation may follow machine choice; preserve commented placeholders.'
    return 'retain_pfw', '', 'No functional parent equivalent established; preserve trade-good/material identity and its recipes.'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--yuoki', type=Path, required=True)
    parser.add_argument('--engines', type=Path, required=True)
    parser.add_argument('--dump', type=Path, required=True)
    args = parser.parse_args()
    dump = json.loads(args.dump.read_text())
    originals = scan(ROOT, True)
    active = [r for r in originals if r['state'] == 'active']
    expected = json.loads((DATA / 'inventory-summary.json').read_text())
    assert dict(collections.Counter(r['type'] for r in active)) == expected['prototype_types']
    providers = {}
    locations = collections.defaultdict(list)
    for mod, root in [('Yuoki', args.yuoki), ('yi_engines', args.engines)]:
        commit = subprocess.check_output(['git', '-C', str(root), 'rev-parse', 'HEAD'], text=True).strip()
        assert not subprocess.check_output(['git', '-C', str(root), 'status', '--porcelain'], text=True).strip()
        providers[mod] = dict(commit=commit, version=json.loads((root / 'info.json').read_text())['version'])
        for rec in scan(root):
            locations[rec['type'], rec['name']].append(dict(mod=mod, source=rec['source'], line=rec['line']))
    def loc(typ, name):
        return locations.get((typ, name), [])
    recipes = dump['recipe']
    audits = []
    for rec in originals:
        if rec['type'] != 'recipe':
            continue
        entry = {k: v for k, v in rec.items() if k != 'literal'}
        entry['scenario_references'] = {x['name']: SCENARIO[x['name']] for x in rec['ingredients'] + rec['results'] if x['name'] in SCENARIO}
        for label, aliases in [('original', {}), ('scenario', SCENARIO)]:
            matches = [n for n, r in recipes.items() if signature(rec['ingredients'], aliases) == signature(r.get('ingredients', [])) and signature(rec['results'], aliases) == signature(r.get('results', []))]
            entry[label + '_material_matches'] = matches
        output_names = {SCENARIO.get(x['name'], x['name']) for x in rec['results']}
        entry['same_product_parent_recipes'] = sorted(n for n, r in recipes.items() if loc('recipe', n) and output_names & {x['name'] for x in r.get('results', [])})
        entry['assessment'] = ('retain_distinct_recipe' if rec['state'] == 'active' else
                               'preserve_commented_material_duplicate_with_different_access' if entry['scenario_material_matches'] else 'preserve_commented_recipe')
        audits.append(entry)
    collisions = [{k: r[k] for k in ['type', 'name', 'source', 'line']} for r in active if r['name'] in dump.get(r['type'], {})]
    allitems = {n for t in ['item', 'ammo', 'gun', 'armor', 'capsule', 'tool', 'item-with-entity-data', 'repair-tool'] for n in dump.get(t, {})}
    owned = {r['name'] for r in active if r['type'] in ['item', 'ammo', 'gun', 'armor']}
    refs = {x['name'] for r in active if r['type'] == 'recipe' for x in r['ingredients'] + r['results'] if x['type'] == 'item'}
    machines = {n: {k: v[k] for k in ['crafting_categories', 'crafting_speed', 'energy_usage', 'ingredient_count', 'fluid_boxes'] if k in v} for n, v in dump['assembling-machine'].items()}
    categories = {r['name']: sorted(n for n, v in machines.items() if r['name'] in v.get('crafting_categories', [])) for r in active if r['type'] == 'recipe-category'}
    evidence = dict(date='2026-10-09', engine='2.1.21', enabled_mods=['base', 'Yuoki', 'yi_engines'], default_startup_settings=True,
                    providers=providers, dump_sha256=sha(args.dump), parent_baseline_recipe_count=len(recipes),
                    active_count=len(active), active_counts=dict(sorted(collections.Counter(r['type'] for r in active).items())),
                    commented_counts=dict(sorted(collections.Counter(r['type'] for r in originals if r['state'] == 'commented').items())),
                    same_type_name_collisions=collisions, external_item_references_missing=sorted(refs - owned - allitems),
                    parent_machines_supporting_pfw_categories=categories, comparison_scenario=SCENARIO,
                    limitations='Static original-source scan plus parent-only data-stage dump. Material signatures are candidate detection, not complete recipe equivalence. No PFW load/playtest or approved migration.')
    (DATA / 'content-evaluation.json').write_text(json.dumps(evidence, indent=2) + '\n')
    (DATA / 'recipe-ownership-audit.json').write_text(json.dumps(audits, indent=2) + '\n')
    with (DATA / 'prototype-ownership-inventory.csv').open('w') as out:
        writer = csv.writer(out, lineterminator='\n')
        writer.writerow(['State', 'Type', 'PFW ID', 'Source', 'Line', 'Same-type parent ID present', 'Recommended disposition', 'Parent candidate', 'Reason', 'Evidence section'])
        for rec in originals:
            if rec['type'] == 'recipe':
                continue
            n, typ = rec['name'], rec['type']
            section = ('machines' if typ == 'assembling-machine' or n.startswith(('y-factory-', 'y-rich-', 'y-retrader-')) else
                       'equipment-and-weapons' if typ in ['gun', 'ammo', 'armor', 'projectile', 'equipment-grid'] or typ.endswith('-equipment') or n in SCENARIO or n == 'y-zproduct-8' else
                       'categories-and-presentation' if typ in ['item-group', 'item-subgroup', 'recipe-category'] else 'trade-goods-and-materials')
            decision, replacement, reason = disposition(typ, n)
            if rec['state'] == 'commented':
                decision = 'preserve_commented; ' + decision
            writer.writerow([rec['state'], typ, n, rec['source'], rec['line'], n in dump.get(typ, {}), decision, replacement, reason, section])
    with (DATA / 'recipe-ownership-audit.csv').open('w') as out:
        writer = csv.writer(out, lineterminator='\n')
        writer.writerow(['State', 'Recipe ID', 'Source', 'Line', 'Assessment', 'Scenario reference changes', 'Original material matches', 'Scenario material matches'])
        for r in audits:
            writer.writerow([r['state'], r['name'], r['source'], r['line'], r['assessment'], '; '.join(k + ' -> ' + v for k, v in r['scenario_references'].items()), '; '.join(r['original_material_matches']), '; '.join(r['scenario_material_matches'])])
    names = set(SCENARIO.values()) | {'yi_equip_battery_a', 'yi_walker_a', 'yi_walker_c', 'yi_armor_gray', 'y_walker_grid', 'y_walker_grid_b', 'y_armor_grid_a', 'p2', 'ypfw_trader_sign', 'ye_biomixed', 'y_organic_dust', 'ye_fassembly1', 'ye_fassembly2', 'ye_fassembly_sp', 'y-stargate', 'y-fame-gen'}
    selected = []
    for typ, entries in dump.items():
        for n, v in entries.items():
            if n in names and loc(typ, n):
                selected.append(dict(type=typ, name=n, locations=loc(typ, n), prototype=v))
    (DATA / 'parent-content-evidence.json').write_text(json.dumps(selected, indent=2) + '\n')
    print(json.dumps({k: evidence[k] for k in ['active_count', 'commented_counts', 'parent_baseline_recipe_count', 'same_type_name_collisions', 'external_item_references_missing']}, indent=2))
    print('Material matches:', [(r['name'], r['original_material_matches'], r['scenario_material_matches']) for r in audits if r['original_material_matches'] or r['scenario_material_matches']])


if __name__ == '__main__':
    main()
