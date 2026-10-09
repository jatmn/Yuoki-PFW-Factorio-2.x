"""Inventory PFW PNGs and parent-mod reuse candidates without altering images.

Candidates use exact bytes or a shared filename, not an assertion of visual or
sprite-layout equivalence. Python 3 standard library only.
"""
import argparse
import collections
import csv
import hashlib
import json
import re
import struct
import subprocess
from pathlib import Path

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--yuoki', type=Path, required=True)
parser.add_argument('--engines', type=Path, required=True)
args = parser.parse_args()
repo = Path(__file__).resolve().parents[2]
parents = {'Yuoki': args.yuoki.resolve(), 'yi_engines': args.engines.resolve()}

def clean(text):
    text = re.sub(r'--\[\[.*?\]\]', lambda m: '\n' * m[0].count('\n'), text, flags=re.S)
    return re.sub(r'--[^\n]*', '', text)

def references(root, namespace):
    refs = collections.defaultdict(list)
    pattern = re.compile(re.escape('__' + namespace + '__/') + r'([^"\s]+\.png)')
    for path in sorted(root.rglob('*.lua')):
        for number, line in enumerate(clean(path.read_text(errors='replace')).splitlines(), 1):
            for match in pattern.finditer(line):
                refs[match[1]].append(f'{path.relative_to(root)}:{number}')
    return refs

def image_record(path, root):
    blob = path.read_bytes()
    if blob[:8] != b'\x89PNG\r\n\x1a\n':
        raise ValueError(f'Not a PNG: {path}')
    width, height = struct.unpack('>II', blob[16:24])
    return {'path': path.relative_to(root).as_posix(), 'bytes': len(blob),
            'sha256': hashlib.sha256(blob).hexdigest(), 'width': width, 'height': height}

by_hash, by_name = collections.defaultdict(list), collections.defaultdict(list)
versions = []
for name, root in parents.items():
    info = json.loads((root / 'info.json').read_text())
    if info['name'] != name:
        raise ValueError(f'Expected mod {name}, found {info["name"]}')
    refs = references(root, name)
    versions.append({'name': name, 'version': info['version'],
                     'commit': subprocess.check_output(['git', '-C', str(root), 'rev-parse', 'HEAD'], text=True).strip(),
                     'working_tree_clean': not subprocess.check_output(['git', '-C', str(root), 'status', '--porcelain']).strip()})
    for path in sorted(root.rglob('*.png')):
        record = image_record(path, root)
        record['mod'] = name
        record['literal_lua_references'] = refs[record['path']]
        by_hash[record['sha256']].append(record)
        by_name[path.name].append(record)

own_refs = references(repo, 'yi_pfw')
records = []
for path in sorted((repo / 'graphics').rglob('*.png')):
    record = image_record(path, repo)
    record['literal_lua_references'] = own_refs[record['path']]
    candidates = {(x['mod'], x['path']): x for x in by_hash[record['sha256']] + by_name[path.name]}
    record['candidates'] = []
    for key in sorted(candidates):
        candidate = dict(candidates[key])
        candidate['same_bytes'] = candidate['sha256'] == record['sha256']
        candidate['same_dimensions'] = (candidate['width'], candidate['height']) == (record['width'], record['height'])
        candidate['replacement_approved'] = False
        record['candidates'].append(candidate)
    records.append(record)

candidates = [r for r in records if r['candidates']]
summary = {'pfw_png_count': len(records), 'pfw_png_bytes': sum(r['bytes'] for r in records),
           'byte_identical_pfw_files': sum(any(c['same_bytes'] for c in r['candidates']) for r in records),
           'candidate_pfw_files': len(candidates), 'candidate_pfw_bytes': sum(r['bytes'] for r in candidates),
           'candidate_files_with_active_literal_reference': sum(bool(r['literal_lua_references']) for r in candidates),
           'files_without_active_literal_reference': sum(not r['literal_lua_references'] for r in records)}
result = {'scope': 'Initial exact-byte and filename candidate audit; no exhaustive visual/renamed-asset search, no deletion approval, no sprite-layout or game validation. Sizes are uncompressed file bytes, not ZIP savings. Literal-reference absence is not proof of unused content.',
          'parents': versions, 'summary': summary, 'assets': records}
(repo / 'docs/data/asset-audit.json').write_text(json.dumps(result, indent=2) + '\n')
with (repo / 'docs/data/asset-reuse-candidates.csv').open('w', newline='') as handle:
    writer = csv.writer(handle, lineterminator='\n')
    writer.writerow(['PFW path', 'PFW bytes', 'PFW dimensions', 'PFW literal references', 'Provider', 'Provider path', 'Provider dimensions', 'Same bytes', 'Same dimensions', 'Provider literal references', 'Replacement approved'])
    for record in candidates:
        for candidate in record['candidates']:
            writer.writerow([record['path'], record['bytes'], f"{record['width']}x{record['height']}", '; '.join(record['literal_lua_references']), candidate['mod'], candidate['path'], f"{candidate['width']}x{candidate['height']}", candidate['same_bytes'], candidate['same_dimensions'], '; '.join(candidate['literal_lua_references']), False])
print(json.dumps(summary, indent=2))
