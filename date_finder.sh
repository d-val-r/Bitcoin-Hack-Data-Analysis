#!/bin/bash

while IFS= read -r line; do
	output=`cat btc_tx_2011_2013.csv | awk -F "," '{print $1, $3}' | grep $line | uniq`
	echo $output
done < $1
