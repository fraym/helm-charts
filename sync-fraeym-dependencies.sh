#!/usr/bin/env bash

set -euo pipefail

SERVICES_DIR="./charts"
UMBRELLA_DIR="./charts/fraeym"
UMBRELLA_CHART="$UMBRELLA_DIR/Chart.yaml"

echo "📦 Syncing dependencies in umbrella chart..."

# Ensure we're in the repo root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Start building the dependencies block
DEPS_BLOCK="dependencies:\n"

for CHART in "$SERVICES_DIR"/*; do
  if [[ -d "$CHART" && -f "$CHART/Chart.yaml" ]]; then
    NAME=$(yq '.name' "$CHART/Chart.yaml")
    
    if [[ "$NAME" == "fraeym" ]]; then
      continue
    fi
    
    VERSION=$(yq '.version' "$CHART/Chart.yaml")

    echo "  - Found $NAME@$VERSION"

    DEPS_BLOCK+="  - name: $NAME\n"
    DEPS_BLOCK+="    alias: $NAME\n"
    DEPS_BLOCK+="    condition: $NAME.create\n"
    DEPS_BLOCK+="    version: $VERSION\n"
    DEPS_BLOCK+="    repository: file://../$NAME\n"
  fi
done

# Add imgproxy dependency
DEPS_BLOCK+="  - name: imgproxy\n"
DEPS_BLOCK+="    alias: imgproxy\n"
DEPS_BLOCK+="    condition: imgproxy.create\n"
DEPS_BLOCK+="    version: 0.8.34\n"
DEPS_BLOCK+="    repository: https://helm.imgproxy.net/"

# Update umbrella Chart.yaml
yq 'del(.dependencies)' "$UMBRELLA_CHART" > "$UMBRELLA_CHART.tmp"
printf "%b" "$DEPS_BLOCK" >> "$UMBRELLA_CHART.tmp"
mv "$UMBRELLA_CHART.tmp" "$UMBRELLA_CHART"

echo "✅ Updated dependencies in $UMBRELLA_CHART"

echo "🔄 Running helm dependency update..."
helm dependency update "$UMBRELLA_DIR"

echo "🎉 Done!"
