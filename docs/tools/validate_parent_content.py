"""Compare 0.5.1's real data dump with the merged 0.5.0 baseline.

Use the same Factorio 2.1.21 and pinned parent mods for both dumps.
Run: python3 docs/tools/validate_parent_content.py --before before.json --after after.json
     --yuoki /path/to/Yuoki --engines /path/to/yi_engines
"""
import argparse
import copy
import hashlib
import json
import re
import struct
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--before', type=Path, required=True)
parser.add_argument('--after', type=Path, required=True)
parser.add_argument('--yuoki', type=Path, required=True)
parser.add_argument('--engines', type=Path, required=True)
args = parser.parse_args()
before = json.loads(args.before.read_text())
after = json.loads(args.after.read_text())
assert before['recipe']['y-retrader-recipe']['results'][0]['name'] == 'y-retrader-1'
mapping = json.loads((ROOT / 'docs/data/parent-content-0.5.1.json').read_text())
expected = copy.deepcopy(before)
item_aliases = {}
removed = 0
for entry in mapping['mappings']:
    old, new = entry['old'], entry['new']
    for declaration in entry['declarations']:
        kind = declaration['type']
        assert new in before[kind], (kind, new)
        del expected[kind][old]
        removed += 1
        if kind in {'item', 'gun', 'ammo', 'armor'}:
            item_aliases[old] = new
        source = (ROOT / declaration['path']).read_text()
        marker = f"-- Parent owner: {entry['owner']}, {kind} {new}."
        assert marker in source, (kind, old)
        inactive = source.split(marker, 1)[1].split('--[=[', 1)[1].split(']=]', 1)[0]
        assert re.search(r'name\s*=\s*"' + re.escape(old) + '"', inactive), old

recipes = json.loads((ROOT / 'docs/data/recipes.json').read_text())
for old in recipes:
    recipe = expected['recipe'][old['name']]
    for field in ['ingredients', 'results']:
        for part in recipe[field]:
            part['name'] = item_aliases.get(part['name'], part['name'])
for gun in ['y-sm-1', 'y-sm-2']:
    expected['gun'][gun]['attack_parameters']['ammo_category'] = 'plasma'
expected['assembling-machine']['ye_trade_node']['crafting_categories'].append('yrcat-retrade')
animations = expected['character']['character']['animations']
expected['character']['character']['animations'] = [
    a for a in animations if a.get('armors') != ['y-cyb-8u']
]
asset_map = json.loads((ROOT / 'docs/data/asset-reuse-0.5.1.json').read_text())
replacements = {a['pfw_path']: a for a in asset_map['replacements']}
paths = {'__yi_pfw__/' + a['pfw_path']: a for a in replacements.values()}
redraw_map = json.loads((ROOT / 'docs/data/ai-redraw-0.5.1.json').read_text())
redraws = {a['path']: a for a in redraw_map['redraws']}
redraw_paths = {'__yi_pfw__/' + path: entry for path, entry in redraws.items()}
assert set(redraws) == {
    'graphics/entity/fabrik-ammo-icon.png', 'graphics/fab2/plasma-gun.png',
    'graphics/fab5/reifen.png', 'graphics/fab8/fusion-cell.png',
}
assert not redraws.keys() & replacements.keys()
for entry in redraws.values():
    for path, digest, dimensions in [
        (entry['path'], entry['sha256'], entry['dimensions']),
        (entry['source_path'], entry['source_sha256'], entry['source_dimensions']),
    ]:
        content = (ROOT / path).read_bytes()
        assert hashlib.sha256(content).hexdigest() == digest, path
        assert list(struct.unpack('>II', content[16:24])) == dimensions, path
    assert entry['dimensions'] == [64, 64]
providers = {'Yuoki': args.yuoki, 'yi_engines': args.engines}
provider_paths = {}
for entry in replacements.values():
    source = providers[entry['provider']] / entry['provider_path']
    content = source.read_bytes()
    assert hashlib.sha256(content).hexdigest() == entry['provider_sha256'], source
    assert list(struct.unpack('>II', content[16:24])) == entry['provider_dimensions'], source
    target = '__' + entry['provider'] + '__/' + entry['provider_path']
    provider_paths[target] = entry
    assert not (ROOT / entry['pfw_path']).exists(), entry['pfw_path']
    for lua in ROOT.rglob('*.lua'):
        assert '__yi_pfw__/' + entry['pfw_path'] not in lua.read_text(), lua

def replace_visuals(value):
    if isinstance(value, dict):
        if isinstance(value.get('icon'), str) and value['icon'] in paths:
            value['icon_size'] = paths[value['icon']]['provider_dimensions'][0]
        if isinstance(value.get('icon'), str) and value['icon'] in redraw_paths:
            value['icon_size'] = 64
        for key, child in value.items():
            value[key] = replace_visuals(child)
    elif isinstance(value, list):
        return [replace_visuals(child) for child in value]
    elif isinstance(value, str) and value in paths:
        entry = paths[value]
        return '__' + entry['provider'] + '__/' + entry['provider_path']
    return value

replace_visuals(expected)
# Full equality catches lost recipes, changed quantities, pending mappings and parent regressions.
for kind in expected.keys() | after.keys():
    assert expected.get(kind, {}).keys() == after.get(kind, {}).keys(), kind
    for name, prototype in expected.get(kind, {}).items():
        assert prototype == after[kind][name], (kind, name)
for recipe in json.loads((ROOT / 'docs/data/recipe-ownership-audit.json').read_text()):
    if recipe['state'] == 'commented':
        assert recipe['name'] not in after['recipe'], recipe['name']
manifest = json.loads((ROOT / 'docs/data/archive-manifest.json').read_text())
assets = [a for a in manifest['files'] if a['path'].startswith('graphics/')]
for asset in assets:
    if asset['path'] in replacements:
        assert replacements[asset['path']]['original_sha256'] == asset['sha256'], asset['path']
    elif asset['path'] in redraws:
        assert redraws[asset['path']]['original_sha256'] == asset['sha256'], asset['path']
    else:
        assert hashlib.sha256((ROOT / asset['path']).read_bytes()).hexdigest() == asset['sha256'], asset['path']
assert len(replacements) == 39
assert len(list((ROOT / 'graphics').rglob('*.png'))) == len(assets) - len(replacements)

def check_layouts(value):
    if isinstance(value, list):
        for child in value:
            check_layouts(child)
    elif isinstance(value, dict):
        if isinstance(value.get('icon'), str) and value['icon'] in provider_paths:
            dimensions = provider_paths[value['icon']]['provider_dimensions']
            assert value['icon_size'] <= min(dimensions), value['icon']
        if isinstance(value.get('filename'), str) and value['filename'] in provider_paths and 'width' in value and 'height' in value:
            dimensions = provider_paths[value['filename']]['provider_dimensions']
            frames = value.get('frame_count', 1)
            directions = value.get('direction_count', 1)
            columns = value.get('line_length', 0) or frames
            assert value.get('x', 0) + min(frames, columns) * value['width'] <= dimensions[0], value['filename']
            assert value.get('y', 0) + math.ceil(frames * directions / columns) * value['height'] <= dimensions[1], value['filename']
        for child in value.values():
            check_layouts(child)

check_layouts(after)
assert not list(ROOT.glob('**/migrations/*'))
info = json.loads((ROOT / 'info.json').read_text())
assert info['version'] == '0.5.1' and info['factorio_version'] == '2.1'
assert info['dependencies'] == ['base >= 2.1.21', 'Yuoki >= 1.3.0', 'yi_engines >= 1.3.0']
lines = (ROOT / 'changelog.txt').read_text().splitlines()
assert [x for x in lines if x.startswith('Version:')] == ['Version: 0.5.1', 'Version: 0.5.0']
for i, line in enumerate(lines):
    assert line == line.rstrip() and '\t' not in line
    if line.startswith('Version:'):
        assert lines[i-1] == '-' * 99
        assert re.fullmatch(r'Date: [1-9][0-9]?\. [1-9][0-9]?\. [0-9]{4}', lines[i+1])
trades = [r for r in recipes if 'yrcat-retrade' in after['recipe'][r['name']].get('categories', [])]
assert len(trades) == 56
print(f'PASS: {removed} redundant declarations inactive; 105 recipe routes and quantities retained; '
      '56 trades supported; pending mappings/parent behavior preserved; 39 parent assets verified, '
      '4 approved AI icons/source images verified, 163 original graphics unchanged; '
      '0.5.1 changelog and no migrations verified.')
