#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: ./shuffle_data.sh <data_dir>"
  exit 0
fi

ls -1 $1/*.bin | \
  xargs -P90 -I{} ./marlinflow-utils shuffle {} --in-place --output {}
