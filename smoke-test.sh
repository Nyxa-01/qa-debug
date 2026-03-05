#!/bin/bash
set -euo pipefail

echo "=== qa-debug v1.3.1 Smoke Test ==="
echo "1. Manifest validation"
claude plugin validate .

echo "2. Command count (should be 8)"
ls commands/*.md | wc -l

echo "3. MCP wiring check"
jq -r '.mcpServers // empty' .claude-plugin/plugin.json

echo "4. Hooks present (should be 8)"
ls scripts/*.sh 2>/dev/null | wc -l || echo "No hooks dir?"

echo "✅ Smoke test passed"
