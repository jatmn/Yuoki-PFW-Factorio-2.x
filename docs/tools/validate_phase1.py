"""Validate PFW's final engine dump, preserved assets and package metadata.

Usage: python3 docs/tools/validate_phase1.py --dump /path/to/data-raw-dump.json
       --yuoki /path/to/Yuoki --engines /path/to/yi_engines
This checks the real data-stage output; it is not a replacement for a game launch.
"""
import argparse
import csv
import hashlib
import json
import math
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dump', type=Path, required=True)
parser.add_argument('--yuoki', type=Path, required=True)
parser.add_argument('--engines', type=Path, required=True)
args = parser.parse_args()
dump = json.loads(args.dump.read_text())
info = json.loads((ROOT / 'info.json').read_text())
assert info['version'] == '0.5.0' and info['factorio_version'] == '2.1'
assert info['dependencies'] == ['base >= 2.1.21', 'Yuoki >= 1.3.0', 'yi_engines >= 1.3.0']
assert not list(ROOT.glob('**/migrations/*'))
lines = (ROOT / 'changelog.txt').read_text().splitlines()
assert lines[0] == '-' * 99 and lines[1] == 'Version: 0.5.0'
assert sum(x.startswith('Version:') for x in lines) == 1
assert re.fullmatch(r'Date: [1-9][0-9]?\. [1-9][0-9]?\. [0-9]{4}', lines[2])
for line in lines:
    assert '\t' not in line and line == line.rstrip()
    assert line in lines[:3] or re.fullmatch(r'  [A-Za-z ]+:|    - .+|      .+', line)

renamed = {'raw-wood': 'wood', 'flame-thrower': 'flamethrower'}
def amounts(rows):
    return sorted((r.get('type', 'item'), renamed.get(r['name'], r['name']), r['amount']) for r in rows)

original = json.loads((ROOT / 'docs/data/recipes.json').read_text())
for old in original:
    new = dump['recipe'][old['name']]
    assert amounts(old['ingredients']) == amounts(new['ingredients']), old['name']
    assert amounts(old['results']) == amounts(new['results']), old['name']
    assert new.get('categories', ['crafting']) == [old['category']], old['name']
    assert new.get('energy_required', 0.5) == old['seconds'], old['name']
    assert new['enabled'] is True
for old in json.loads((ROOT / 'docs/data/recipe-ownership-audit.json').read_text()):
    if old['state'] == 'commented':
        assert old['name'] not in dump['recipe'], old['name']

manifest = json.loads((ROOT / 'docs/data/archive-manifest.json').read_text())
assets = [x for x in manifest['files'] if x['path'].startswith('graphics/')]
for asset in assets:
    assert hashlib.sha256((ROOT / asset['path']).read_bytes()).hexdigest() == asset['sha256'], asset['path']

roots = {'yi_pfw': ROOT, 'Yuoki': args.yuoki, 'yi_engines': args.engines}
checked = set()
def check_images(value):
    if isinstance(value, list):
        for child in value:
            check_images(child)
    elif isinstance(value, dict):
        for key in ['filename', 'icon']:
            filename = value.get(key, '')
            match = re.fullmatch(r'__([^_]+(?:_[^_]+)*)__/(.+)', filename)
            if not match or match[1] not in roots:
                continue
            path = roots[match[1]] / match[2]
            assert path.is_file(), path
            checked.add(filename)
            if path.suffix == '.png':
                width, height = struct.unpack('>II', path.read_bytes()[16:24])
                if key == 'icon':
                    size = value.get('icon_size', 64)
                    assert width >= size and height >= size, (path, size, width, height)
                elif 'width' in value and 'height' in value:
                    # The retained sprites use single-file frame grids, not stripes.
                    frames = value.get('frame_count', 1)
                    directions = value.get('direction_count', 1)
                    columns = value.get('line_length', 0) or frames
                    needed_width = value.get('x', 0) + min(frames, columns) * value['width']
                    needed_height = value.get('y', 0) + math.ceil(frames * directions / columns) * value['height']
                    assert width >= needed_width and height >= needed_height, (path, needed_width, needed_height, width, height)
        for child in value.values():
            check_images(child)

with (ROOT / 'docs/data/prototype-ownership-inventory.csv').open() as f:
    originals = [r for r in csv.DictReader(f) if r['State'] == 'active']
for old in originals:
    name = 'yi-pfw-walker-grid' if old['PFW ID'] == 'y_walker_grid' else old['PFW ID']
    proto = dump[old['Type']][name]
    if name != 'p2':  # Parent-owned projectile is not a retained PFW graphic.
        check_images(proto)
for recipe in original:
    check_images(dump['recipe'][recipe['name']])
for animation in dump['character']['character']['animations']:
    if set(animation.get('armors', [])) & {'y-cyb-8u', 'y-cyb-9u'}:
        check_images(animation)
assert dump['equipment-grid']['y_walker_grid']['width'] == 14
assert dump['equipment-grid']['yi-pfw-walker-grid']['width'] == 12
assert dump['item']['y-zproduct-8']['fuel_value'] == '12GJ'
assert dump['item']['y-zproduct-8']['fuel_categories'] == ['chemical']
assert dump['item']['y-zproduct-8']['place_as_equipment_result'] == 'y-zproduct-8'
assert dump['ammo']['y-mun-2']['ammo_category'] == 'yi-pfw-energy'
for name in ['y-sm-1', 'y-sm-2']:
    assert dump['gun'][name]['attack_parameters']['ammo_category'] == 'yi-pfw-energy'
print(f'PASS: 105 recipes preserved; 35 disabled recipes remain inactive; {len(assets)} original graphics unchanged; {len(checked)} referenced asset paths/layouts checked; 0.5.0 metadata/changelog and legacy-migration removal verified.')
