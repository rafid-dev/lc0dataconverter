#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: ./convert_to_marlinformat.sh <data_dir>"
  exit 0
fi

# Converts filtered .binpack files into .plain files
ls -1 $1/*.binpack | \
  xargs -P90 -I{} ./stockfish convert {} {}.plain validate

