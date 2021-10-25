#!/bin/bash
 
echo "O tempo total de atrasos na decolagem para o aeroporto JFK foi de:"

grep -i 'JFK' 2006-sample.csv | awk -F , '$16>0' | grep -v '^0' | cut -d , -f 16 | paste -sd+ - | bc
