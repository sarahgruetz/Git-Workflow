#!/bin/bash

echo "O número de voos redirecionados é:" 

tail -n +2 2006-sample.csv | cut -d , -f 24 | grep 1 | wc -l  
