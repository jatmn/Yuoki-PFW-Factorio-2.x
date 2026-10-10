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
    'graphics/imports/coilsr32.png', 'graphics/imports/coilsgr32.png',
    'graphics/imports/crystal_1.png', 'graphics/imports/crystal_green.png',
    'graphics/imports/wire_2.png', 'graphics/imports/uni-com-pro.png',
    'graphics/imports/barren_mixed_9.png', 'graphics/imports/barren_mixed_11.png',
    'graphics/entity/fabrik-bio-icon.png',
    'graphics/entity/fabrik-comp-icon.png',
    'graphics/entity/fabrik-equip-icon.png',
    'graphics/entity/fabrik-trucks-icon.png',
    'graphics/entity/fabrik-weapons-icon.png',
    'graphics/entity/profit-show-1-icon.png',
    'graphics/entity/profit-show-2-icon.png',
    'graphics/zmaterial/biomass-icon.png',
    'graphics/zmaterial/combattrain-icon.png',
    'graphics/zmaterial/medic-icon.png',
    'graphics/zmaterial/panz1_32.png',
    'graphics/zmaterial/zielfern-icon.png',
    'graphics/fab8/teil_04_32.png',
    'graphics/fab8/msg-cb.png',
    'graphics/fab8/sfg400.png',
    'graphics/fab8/teil_02.png',
    'graphics/fab8/fusion-cell-empty.png',
    'graphics/fab3/neron_u5_32.png',
    'graphics/mpfw_ticon2.png',
    'graphics/equip/fusion-cell-64.png',
    'graphics/entity/profit-show-1.png',
    'graphics/entity/profit-show-2.png',
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
    expected_size = 320 if entry['path'] in {
        'graphics/entity/profit-show-1.png', 'graphics/entity/profit-show-2.png'
    } else 128 if entry['path'] in {
        'graphics/mpfw_ticon2.png', 'graphics/equip/fusion-cell-64.png'
    } else 64
    assert entry['dimensions'] == [expected_size, expected_size]
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
            value['icon_size'] = redraw_paths[value['icon']]['dimensions'][0]
        for key, child in value.items():
            value[key] = replace_visuals(child)
    elif isinstance(value, list):
        return [replace_visuals(child) for child in value]
    elif isinstance(value, str) and value in paths:
        entry = paths[value]
        return '__' + entry['provider'] + '__/' + entry['provider_path']
    return value

replace_visuals(expected)
# Batch7 doubles only this equipment image's source resolution at the same display size.
cell_sprite = expected['battery-equipment']['y-zproduct-8']['sprite']
assert cell_sprite['filename'] == '__yi_pfw__/graphics/equip/fusion-cell-64.png'
assert (cell_sprite['width'], cell_sprite['height'], cell_sprite.get('scale', 1)) == (64, 64, 1)
cell_sprite.update(width=128, height=128, scale=0.5)
# Batch8 changes only the two static profit-display source dimensions/scale.
for name, filename in [('y-rich-1', 'profit-show-2.png'), ('y-rich-2', 'profit-show-1.png')]:
    sprite = expected['assembling-machine'][name]['graphics_set']['animation']
    assert sprite['filename'] == '__yi_pfw__/graphics/entity/' + filename
    assert (sprite['width'], sprite['height'], sprite.get('scale', 1)) == (160, 160, 1)
    sprite.update(width=320, height=320, scale=0.5)
# Batch9 reuses only the matching east/west frames; north/south remain unchanged.
for name in ['y-factory-4', 'y-factory-6', 'y-factory-7']:
    for direction in ['east', 'west']:
        sprite = expected['assembling-machine'][name]['graphics_set']['animation'][direction]
        assert sprite['filename'] == '__yi_engines__/graphics/entity/science_gen.png'
        assert (sprite['width'], sprite['height'], sprite.get('scale', 1)) == (120, 120, 1)
        sprite.update(width=128, height=128, scale=0.9375)
# The ammunition factory shares one layered animation in all directions.
ammo_layers = []
for name, width, height, shift in [
    ('base', 256, 256, [0.5, 0]),
    ('upper', 44, 35, [0.046875, -0.6953125]),
    ('front', 44, 41, [0.0625, 1.1015625]),
    ('rear', 44, 41, [0.0625, -1.3671875]),
    ('shadow', 256, 256, [0.5, 0]),
]:
    layer = dict(filename='__yi_pfw__/graphics/entity/fab-ammo-' + name + '.png',
                 width=width, height=height, scale=0.5, shift=shift)
    if name in {'base', 'shadow'}:
        layer.update(frame_count=1, repeat_count=16)
    else:
        layer.update(frame_count=16, line_length=16)
    if name == 'shadow':
        layer['draw_as_shadow'] = True
    ammo_layers.append(layer)
expected['assembling-machine']['y-factory-1']['graphics_set']['animation'] = {'layers': ammo_layers}
weapons_layers = []
for name, width, height, shift in [
    ('base', 256, 256, [0.5, 0]),
    ('upper', 44, 32, [-0.5, -0.734375]),
    ('front', 46, 43, [-0.484375, 1.0390625]),
    ('shadow', 256, 256, [0.5, 0]),
]:
    layer = dict(filename='__yi_pfw__/graphics/entity/fab-weapons-' + name + '.png',
                 width=width, height=height, scale=0.5, shift=shift)
    if name in {'base', 'shadow'}:
        layer.update(frame_count=1, repeat_count=16)
    else:
        layer.update(frame_count=16, line_length=16)
    if name == 'shadow':
        layer['draw_as_shadow'] = True
    weapons_layers.append(layer)
expected['assembling-machine']['y-factory-2']['graphics_set']['animation'] = {'layers': weapons_layers}
bio_layers = []
for name, width, height, shift in [
    ('base', 256, 256, [0.5, 0]),
    ('liquid', 169, 61, [0.0078125, 0.2734375]),
    ('shadow', 256, 256, [0.5, 0]),
]:
    layer = dict(filename='__yi_pfw__/graphics/entity/fab-bio-' + name + '.png',
                 width=width, height=height, scale=0.5, shift=shift, animation_speed=0.2)
    if name == 'liquid':
        layer.update(frame_count=16, line_length=16)
    else:
        layer.update(frame_count=1, repeat_count=16)
    if name == 'shadow':
        layer['draw_as_shadow'] = True
    bio_layers.append(layer)
expected['assembling-machine']['y-factory-3']['graphics_set']['animation'] = {'layers': bio_layers}
trucks_layers = []
for name, width, height, shift in [
    ('base', 256, 256, [0.5, 0]),
    ('upper', 49, 38, [-0.4296875, -0.75]),
    ('front', 63, 55, [-0.4140625, 1.0546875]),
    ('rear', 57, 49, [-0.3984375, -1.3828125]),
    ('shadow', 256, 256, [0.5, 0]),
]:
    layer = dict(filename='__yi_pfw__/graphics/entity/fab-trucks-' + name + '.png',
                 width=width, height=height, scale=0.5, shift=shift)
    if name in {'base', 'shadow'}:
        layer.update(frame_count=1, repeat_count=16)
    else:
        layer.update(frame_count=16, line_length=16)
    if name == 'shadow':
        layer['draw_as_shadow'] = True
    trucks_layers.append(layer)
expected['assembling-machine']['y-factory-5']['graphics_set']['animation'] = {'layers': trucks_layers}
layered_entries = {e['prototype']: e for e in redraw_map['layered_animations']}
assert set(layered_entries) == {'y-factory-1', 'y-factory-2', 'y-factory-3', 'y-factory-5'}
for prototype, layers in [('y-factory-1', ammo_layers), ('y-factory-2', weapons_layers), ('y-factory-3', bio_layers), ('y-factory-5', trucks_layers)]:
    layered = layered_entries[prototype]
    assert {e['path'] for e in layered['outputs']} == {
        layer['filename'].removeprefix('__yi_pfw__/') for layer in layers
    }
    for entry in [layered['original'], layered['source'], *layered['outputs']]:
        content = (ROOT / entry['path']).read_bytes()
        assert hashlib.sha256(content).hexdigest() == entry['sha256'], entry['path']
        assert list(struct.unpack('>II', content[16:24])) == entry['dimensions'], entry['path']
    for layer in layers:
        content = (ROOT / layer['filename'].removeprefix('__yi_pfw__/')).read_bytes()
        assert struct.unpack('>II', content[16:24]) == (layer['width'] * layer.get('line_length', 1), layer['height'])
trade_map = json.loads((ROOT / 'docs/data/trade-icons-0.5.1.json').read_text())
arrow_variants = {a['path']: a for a in trade_map['removed_variants']}
assert len(arrow_variants) == 49
assert not arrow_variants.keys() & (replacements.keys() | redraws.keys())
assert len(trade_map['trades']) == 56
assert len({t['recipe'] for t in trade_map['trades']}) == 56
assert sum(t['direction'] == 'up' for t in trade_map['trades']) == 8
item_types = ['item', 'tool', 'ammo', 'gun', 'armor', 'capsule', 'module', 'item-with-entity-data']
for trade in trade_map['trades']:
    recipe = expected['recipe'][trade['recipe']]
    assert trade['direction'] in {'up', 'down'}
    parts = recipe['results'] if trade['direction'] == 'up' else recipe['ingredients']
    assert parts[0]['name'] == trade['source'], trade['recipe']
    source = next(expected[k][trade['source']] for k in item_types if trade['source'] in expected.get(k, {}))
    if source.get('icons'):
        icons = copy.deepcopy(source['icons'])
    else:
        size = source.get('icon_size', 64)
        icons = [{'icon': source['icon'], 'icon_size': size, 'scale': 32 / size}]
    icons.append({'icon': '__Yuoki__/graphics/icons/atomics/atomics-' + trade['direction'] + '-arrow.png',
                  'icon_size': 128, 'scale': 0.25})
    recipe['icons'] = icons
    recipe.pop('icon', None)
    recipe.pop('icon_size', None)
for entry in arrow_variants.values():
    assert not (ROOT / entry['path']).exists(), entry['path']
    for lua in ROOT.rglob('*.lua'):
        assert '__yi_pfw__/' + entry['path'] not in lua.read_text(), lua
    provider, relative = entry['base_icon'][2:].split('__/', 1)
    base = (ROOT if provider == 'yi_pfw' else providers[provider]) / relative
    content = base.read_bytes()
    assert hashlib.sha256(content).hexdigest() == entry['base_sha256'], base
    assert list(struct.unpack('>II', content[16:24])) == entry['base_dimensions'], base
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
    elif asset['path'] in arrow_variants:
        assert arrow_variants[asset['path']]['original_sha256'] == asset['sha256'], asset['path']
    else:
        assert hashlib.sha256((ROOT / asset['path']).read_bytes()).hexdigest() == asset['sha256'], asset['path']
assert len(replacements) == 41
assert len(list((ROOT / 'graphics').rglob('*.png'))) == len(assets) - len(replacements) - len(arrow_variants) + len(ammo_layers) + len(weapons_layers) + len(bio_layers) + len(trucks_layers)

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
      '56 trades supported; pending mappings/parent behavior preserved; 41 parent assets verified, '
      '34 AI artwork/source images verified, 49 arrow variants replaced, 82 original graphics unchanged; '
      '0.5.1 changelog and no migrations verified.')
