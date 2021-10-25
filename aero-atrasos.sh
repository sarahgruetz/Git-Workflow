#!/bin/bash

tail -n +2 2006-sample.csv | cut -d , -f 17 | sort | uniq > aeroportos.csv

>atrasos-aero.txt

while read p; do
	ATR=$(tail -n +2 2006-sample.csv | grep -i "$p" | cut -d , -f 16 | grep -v -e '^[[:space:]]*$' | grep -v "-" | paste -sd+ | bc)
	echo "$p,${ATR}" >> atrasos-aero.txt
done <aeroportos.csv

sort -n -t , -k 2 atrasos-aero.txt | tail -n -1
