#!/bin/bash

tail -n +2 2006-sample.csv | cut -d , -f 9 | sort | uniq > companhias.csv

>atrasos.txt

while read p; do
	ATR=$(tail -n +2 2006-sample.csv | grep -i "$p" | cut -d , -f 16 | grep -v -e '^[[:space:]]*$' | grep -v "-" | paste -sd+ | bc)
	echo "$p,${ATR}" >> atrasos.txt
done <companhias.csv

sort -n -t , -k 2 atrasos.txt | tail -n -1
