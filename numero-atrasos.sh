#!/bin/bash

echo "O número total de decolagens feitas com atraso na companhia" $@ ":"
tail -n +2 2006-sample.csv | grep $@ | awk -F , '$16>0' | cut  -d , -f 16 | grep -v '^0' | wc -l 




echo "O número total de aterrissagens feitas com atraso na companhia" $@ ":"
tail -n +2 2006-sample.csv | grep $@ | awk -F , '$15>0' | cut  -d , -f 15 | grep -v '^0' | wc -l 
