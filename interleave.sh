#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: ./interleave.sh <output> .Assumed that a directory named files exists."
  exit 0
fi

unset -v args
declare -a args
for file in ./files/*.bin
do
  args+=( "$file" )
done
gi
./marlinflow-utils interleave "${args[@]}" --output $1