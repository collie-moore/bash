#!/bin/bash
set -e

echo "🚀 CI Pipeline started at $(date)"
echo ""

# Simulate test
echo "🔍 Running tests..."
sleep 1
echo "✅ Tests passed."

# Simulate lint
echo "🧼 Running linter..."
sleep 1
echo "✅ Linting passed."

# Generate version info
COMMIT_HASH=$(git rev-parse --short HEAD)
BUILD_DATE=$(date +%Y%m%d%H%M)
VERSION="$BUILD_DATE-$COMMIT_HASH"

echo "📦 Version: $VERSION"
echo "$VERSION" > version.txt
