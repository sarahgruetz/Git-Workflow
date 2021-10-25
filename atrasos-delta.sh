#!/bin/bash
 
echo "O atraso de chegada total da Delta Airlines foi de:"

grep -i 'DL' 2006-sample.csv | awk -F , '$15>0' | grep -v '^0' | cut -d , -f 15 | paste -sd+ - | bc

echo "O atraso de saída total da Delta Airlines foi de:"

grep -i 'DL' 2006-sample.csv | awk -F , '$16>0' | grep -v '^0' | cut -d , -f 16 | paste -sd+ - | bc
