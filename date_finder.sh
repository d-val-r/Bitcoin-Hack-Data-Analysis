#!/bin/bash

# the input file is a list of malicious hashes
while IFS= read -r line; do
	# output the INPUT hash and its date and timestamp, grep for only malicious
	# hash outputs, and ensure there are no duplicates. Outputs to dates.txt
	output=`cat data_files/csv_files/btc_tx_2011_2013.csv | awk -F "," '{print $1, $3}' | grep $line | uniq`
	echo $output
done < $1
