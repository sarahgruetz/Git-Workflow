#!/bin/bash
 
echo "O voo com maior atraso na chegada é:" 

tail -n +2 2006-sample.csv | sort -n -t , -k 15 | tail -n1
