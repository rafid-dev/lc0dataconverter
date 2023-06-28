#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: ./filter_mf_plain.sh <data_dir>"
  exit 0
fi

# filter them
ls -1 $1/*.plain | \
  xargs -P90 -I{} ./plaintomf filter {}