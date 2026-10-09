"""Verify the imported archive bytes and ensure changes are confined to docs/."""
import argparse
import hashlib
import json
import subprocess
from pathlib import Path

repo = Path(__file__).resolve().parents[2]
manifest = json.loads((repo / 'docs/data/archive-manifest.json').read_text())
baseline = '103efa8'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--archive-only', action='store_true', help='Verify the immutable import after implementation changes the working tree')
args = parser.parse_args()

def git(*args):
    return subprocess.check_output(['git', '-C', str(repo), *args])

expected = {entry['path']: entry for entry in manifest['files']}
actual = set(git('ls-tree', '-r', '--name-only', '-z', baseline).decode().split('\0')) - {''}
if actual != set(expected):
    raise SystemExit('Original commit paths differ from archive manifest')

for path, entry in expected.items():
    sources = [('commit', git('show', f'{baseline}:{path}'))]
    if not args.archive_only:
        sources.append(('working tree', (repo / path).read_bytes()))
    for source, content in sources:
        if len(content) != entry['bytes'] or hashlib.sha256(content).hexdigest() != entry['sha256']:
            raise SystemExit(f'Archive mismatch in {source}: {path}')

if args.archive_only:
    print(f'PASS: {len(expected)} original files remain intact in import commit {baseline}.')
    raise SystemExit(0)

changed = git('diff', '--name-only', '-z', baseline).decode().split('\0')
untracked = git('ls-files', '--others', '--exclude-standard', '-z').decode().split('\0')
non_docs = [path for path in changed + untracked if path and not path.startswith('docs/')]
if non_docs:
    raise SystemExit(f'Changes outside docs/: {non_docs}')
print(f'PASS: {len(expected)} original files match the archive manifest; changes confined to docs/.')
