#!/bin/bash
set -euo pipefail

mkdir -p ./output
docker buildx build --load -t oss-supply-chain-book:dev .
docker run --rm -it -v "$(pwd):/data:ro" -v "$(pwd)/output:/output:rw" oss-supply-chain-book:dev
