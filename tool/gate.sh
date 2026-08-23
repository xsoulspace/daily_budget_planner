#!/usr/bin/env bash
# One-command quality gate: analyzer errors + full test suite.
# Usage: tool/gate.sh            # both gates
#        tool/gate.sh analyze    # analyzer only
#        tool/gate.sh test       # tests only
set -u
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR/.." || exit 2

mode="${1:-all}"
rc=0
if [[ "$mode" == "all" || "$mode" == "analyze" ]]; then
  echo "=== analyze_gate ==="
  python3 tool/analyze_gate.py || rc=1
fi
if [[ "$mode" == "all" || "$mode" == "test" ]]; then
  echo "=== test_gate ==="
  python3 tool/test_gate.py || rc=1
fi
exit $rc
