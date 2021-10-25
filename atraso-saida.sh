#!/bin/bash

echo "O voo com maior atraso na saída é:" 

tail -n +2 2006-sample.csv | sort -n -t , -k 16 | tail -n1 
