#!/bin/bash

echo "O voo mais longo é:" 

tail -n +2 2006-sample.csv | sort -n -t , -k 14 | tail -n1
