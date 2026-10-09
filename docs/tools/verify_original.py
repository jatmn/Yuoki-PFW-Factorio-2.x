"""Verify the imported archive bytes and ensure changes are confined to docs/."""
import hashlib
import json
import subprocess
from pathlib import Path

repo = Path(__file__).resolve().parents[2]
manifest = json.loads((repo / 'docs/data/archive-manifest.json').read_text())
baseline = '103efa8'

def git(*args):
    return subprocess.check_output(['git', '-C', str(repo), *args])

expected = {entry['path']: entry for entry in manifest['files']}
actual = set(git('ls-tree', '-r', '--name-only', '-z', baseline).decode().split('\0')) - {''}
if actual != set(expected):
    raise SystemExit('Original commit paths differ from archive manifest')

for path, entry in expected.items():
    for source, content in (
        ('commit', git('show', f'{baseline}:{path}')),
        ('working tree', (repo / path).read_bytes()),
    ):
        if len(content) != entry['bytes'] or hashlib.sha256(content).hexdigest() != entry['sha256']:
            raise SystemExit(f'Archive mismatch in {source}: {path}')

changed = git('diff', '--name-only', '-z', baseline).decode().split('\0')
untracked = git('ls-files', '--others', '--exclude-standard', '-z').decode().split('\0')
non_docs = [path for path in changed + untracked if path and not path.startswith('docs/')]
if non_docs:
    raise SystemExit(f'Changes outside docs/: {non_docs}')
print(f'PASS: {len(expected)} original files match the archive manifest; changes confined to docs/.')
