#!/bin/bash

wget  https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar xzvf lab3-bundle.tar.gz

awk '!/^[[:space:]]*$/' lab3_data.tsv > lab3_data.tsv

awk 'BEGIN { FS="\t"; OFS="," } {$1=$1; print}' lab3_data.tsv > lab3version2.csv

LINE_COUNTER=$(tail -n +2 lab3version2.csv | wc -l)
echo "The number of lines now in this file is: $LINE_COUNTER"

TARBALL="converted-archive.tar.gz"
tar czvf "$TARBALL" lab3version2.csv

rm lab3-bundle.tar.gz 

