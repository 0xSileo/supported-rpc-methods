#!/bin/bash

# Read JSON file and extract method names using jq
cat ../libs/execution-api/openrpc.json | jq '.methods[] | .name' > methodList.txt
