#!/usr/bin/env python3
"""Authoritative `flutter test` verdict with flaky-load classification.

Runs `flutter test --reporter json`, classifies failures into:
  - real test failures (assertion/expect mismatch)
  - compile errors
  - load flakes (test file failed to *load* without compile error;
    historically caused by a concurrent `pub get`) -> retried once

Prints one authoritative verdict:
  PASS  n/n tests
  FAIL  k/n tests (list)
  ERROR compile/load failure after retry (detail)

Exit codes: 0 = pass, 1 = real failure, 2 = infra error after retry.
Usage: python3 tool/test_gate.py [path/to/test_file.dart] [--no-retry]
"""

import json
import subprocess
import sys
from pathlib import Path

FLUTTER = "flutter"


def run(args, cwd):
    return subprocess.run(
        args, cwd=cwd, capture_output=True, text=True, timeout=900
    )


def parse(proc):
    passed, failed, errors = 0, [], []
    compile_errors, load_failures, details = [], [], []
    for line in proc.stdout.splitlines():
        line = line.strip()
        if not line.startswith("{"):
            continue
        try:
            ev = json.loads(line)
        except json.JSONDecodeError:
            continue
        t = ev.get("type")
        if t == "testDone":
            if ev.get("hidden"):
                continue
            if ev.get("result") == "success":
                passed += 1
            else:
                name = ev.get("testID")
                failed.append(str(name))
                if ev.get("result") == "error" or ev.get("error"):
                    errors.append(ev.get("error", "") or "")
        elif t == "error":
            msg = ev.get("error") or ev.get("message") or ""
            details.append(msg)
            if "Error:" in msg and ("Compilation failed" in proc.stdout):
                compile_errors.append(msg)
            if "Failed to load" in msg:
                load_failures.append(msg)
        elif t == "suite" and ev.get("error"):
            details.append(ev["error"])
            load_failures.append(ev["error"])
    return {
        "passed": passed,
        "failed": len(failed),
        "compile_errors": compile_errors,
        "load_failures": load_failures,
        "details": details,
        "stdout": proc.stdout,
    }


def main():
    argv = [a for a in sys.argv[1:] if a != "--no-retry"]
    retry = "--no-retry" not in sys.argv
    # Resolve package dir relative to this script, not the caller's cwd.
    pkg_dir = Path(__file__).resolve().parent.parent / "packages" / "mobile_app"
    target = argv[0] if argv else None

    attempts = 2 if retry else 1
    result = None
    for attempt in range(1, attempts + 1):
        cmd = [FLUTTER, "test", "--reporter", "json"]
        if target:
            cmd.append(target)
        proc = run(cmd, pkg_dir)
        result = parse(proc)

        only_load_flakes = (
            result["failed"] == 0
            and not result["compile_errors"]
            and bool(result["load_failures"])
        )
        crashed = proc.returncode != 0 and result["passed"] == 0

        if attempt < attempts and (only_load_flakes or crashed):
            print(
                f"[test_gate] attempt {attempt}: load flake / crash "
                f"({len(result['load_failures'])} load failures). Retrying...",
                file=sys.stderr,
            )
            continue
        break

    total = result["passed"] + result["failed"]
    if result["failed"] > 0:
        print(f"FAIL {result['failed']}/{total} tests")
        for d in result["details"]:
            print(d[:2000])
        return 1
    if result["compile_errors"]:
        print("ERROR: compilation failed")
        for c in result["compile_errors"]:
            print(c[:2000])
        return 2
    if result["load_failures"] or proc.returncode != 0:
        print("ERROR: suite did not complete (see below)")
        tail = "\n".join(result["stdout"].splitlines()[-20:])
        print(tail)
        return 2
    print(f"PASS {total}/{total} tests")
    return 0


if __name__ == "__main__":
    sys.exit(main())
