#!/bin/bash

for file in $( ls . | grep .tex$ ); do
  TEX_FILE=`echo $file | sed "s/\.tex\$//"`
  docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja latexmk $TEX_FILE.tex
  # docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja dvipdfmx $TEX_FILE.dvi
  # rm -f $TEX_FILE.aux $TEX_FILE.dvi $TEX_FILE.log
  ls | grep test. | grep -v -e $TEX_FILE.pdf -e $TEX_FILE.tex | xargs rm -f
done
