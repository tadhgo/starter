#!/bin/bash
set -euo pipefail

echo ":dart: Starting release process..."

# Fetch metadata values
release_name=$(buildkite-agent meta-data get "release-name")
release_notes=$(buildkite-agent meta-data get "release-notes" || echo "No release notes provided")
release_type=$(buildkite-agent meta-data get "release-type")


echo ":package: Release Name: ${release_name}"
echo ":memo: Changelog:"
echo "${release_notes}"
echo ":label:️  Release Type: ${release_type}"

if [ "${release_type}" == "beta" ]; then
    echo ":test_tube: Preparing beta release..."
else
    echo ":rocket: Preparing stable release..."
fi

echo "Release complete! Time for a nice cuppa :tea:"
