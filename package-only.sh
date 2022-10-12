#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

source configuration.sh

rm -rf ${BINARY_DIR}/*

echo "TARGETS: ${TARGETS[@]}"

TARGETS_A=${TARGETS[*]}
TARGETS_STR=${TARGETS_A// /,}
echo "TARGETS_STR: ${TARGETS_STR}"

pkg \
    --output ${BINARY_DIR}/kubevious \
    -t ${TARGETS_STR}\
    dist/index.js > logs

ls -la ${BINARY_DIR}/./