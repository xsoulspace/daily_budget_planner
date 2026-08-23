#!/usr/bin/env python3
"""Fast analyzer gate: errors are blocking, warnings/infos are reported only.

Uses `dart analyze --format machine` (pipe-delimited lines) because
`flutter analyze --machine` does not emit JSON in current Flutter
versions. Resolves the repo root relative to this script.

Line format: SEVERITY|TYPE|CODE|FILE|LINE|COL|LENGTH|MESSAGE

Exit codes: 0 = zero errors, 1 = at least one error.
Usage: python3 tool/analyze_gate.py [subdir]
"""

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def main():
    cwd = ROOT / sys.argv[1] if len(sys.argv) > 1 else ROOT
    proc = subprocess.run(
        ["dart", "analyze", "--format", "machine", "."],
        cwd=cwd,
        capture_output=True,
        text=True,
        timeout=600,
    )
    errors, warnings, infos = [], [], []
    for line in proc.stdout.splitlines():
        parts = line.split("|", 7)
        if len(parts) < 8 or not parts[0].strip():
            continue
        sev, _type, _code, file, lineno, _col, _len, msg = [p.strip() for p in parts]
        entry = f"{sev} • {msg} • {file}:{lineno}"
        if sev == "ERROR":
            errors.append(entry)
        elif sev == "WARNING":
            warnings.append(entry)
        elif sev == "INFO":
            infos.append(entry)

    for e in errors:
        print(e)
    print(
        f"\nanalyze_gate: {len(errors)} errors, "
        f"{len(warnings)} warnings, {len(infos)} infos"
    )
    if not errors:
        print("analyze_gate: PASS (0 errors)")
        return 0
    print("analyze_gate: FAIL")
    return 1


if __name__ == "__main__":
    sys.exit(main())
