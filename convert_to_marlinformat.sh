#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: ./convert_to_marlinformat.sh <data_dir>"
  exit 0
fi

# Converts the plain files into marlinformat
ls -1 $1/*.plain | \
  xargs -P90 -I{} ./marlinflow-utils txt-to-data {} --output {}.bin
