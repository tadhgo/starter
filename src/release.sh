#!/bin/bash
set -euo pipefail

echo "🎯 Starting release process..."

# Fetch metadata values
release_name=$(buildkite-agent meta-data get "release-name")
release_notes=$(buildkite-agent meta-data get "release-notes" || echo "No release notes provided")
release_type=$(buildkite-agent meta-data get "release-type")

# Echo the values with some fun emojis
echo "📦 Release Name: ${release_name}"
echo "📝 Changelog:"
echo "${release_notes}"
echo "🏷️  Release Type: ${release_type}"

# Add some conditional fun based on release type
if [ "${release_type}" == "beta" ]; then
    echo "🧪 Preparing beta release... Let's experiment!"
else
    echo "🚀 Preparing stable release... To infinity and beyond!"
fi

echo "✨ Release complete! Time for a nice cuppa ☕!"
