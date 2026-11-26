#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; KUJO_BIN="${KUJO_BIN:-$(command -v kujo)}"; cd "$ROOT"
"$KUJO_BIN" test-run tests/native_tests.kujo
echo "Azure AI offline release gate: PASS"
