#!/bin/bash

function generate_number() {
  MIN=25
  MAX=100
  echo $(( MIN + RANDOM % (MAX - MIN + 1) ))
}

parallel_index=${1:-}

generated_number=$(generate_number)

if [[ -n "$parallel_index" ]]; then
  ( set -x ; buildkite-agent meta-data set "generated-number::$parallel_index" "${generated_number}" )
else
  ( set -x ; buildkite-agent meta-data set "generated-number" "${generated_number}" )
fi

echo
echo
