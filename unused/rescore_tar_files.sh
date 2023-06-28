#!/bin/bash
# Takes lc0 .tar data files, rescores them with tablebases,
# and converts them to .plain for stockfish to process later
if [ "$#" -ne 1 ]; then
  echo "Usage: ./run_rescorer.sh <data_dir>"
  exit 0
fi

function rescore_tar_file() {
  filepath=$1
  tarfile=$(basename $filepath)
  dirname=$(basename $tarfile .tar)

  echo Extracting $tarfile ...
  tar xvf $filepath > /dev/null

  rescorer rescore \
    --input=./$dirname \
    --syzygy-paths=/media/rafid/Resources/Projects/TrainingData/lc0-data-converter-master/tb5 \
    --nnue-plain-file=/media/rafid/Resources/Projects/TrainingData/lc0-data-converter-master/plain/$dirname.plain \
    --nnue-best-score=true \
    --nnue-best-move=true \
    --deblunder=true \
    --deblunder-q-blunder-threshold=0.10 \
    --deblunder-q-blunder-width=0.03 \
    --threads=6

  rm -rf $dirname
}
export -f rescore_tar_file

cd $1
ls -1v *.tar | xargs -P3 -I{} bash -c 'rescore_tar_file "$@"' _ {}
