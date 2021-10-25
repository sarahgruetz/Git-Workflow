#!/bin/bash
 
echo "O tempo total de atrasos na aterrissagem para o aeroporto LAX foi de:"

grep -i 'LAX' 2006-sample.csv | awk -F , '$15>0' | grep -v '^0' | cut -d , -f 15 | paste -sd+ - | bc
