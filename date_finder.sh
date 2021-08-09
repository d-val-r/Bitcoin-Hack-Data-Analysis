#!/bin/bash

# read input from first argument to the script, a file of hashes for 
# transactions that were confirmed to be malicious
while IFS= read -r line; do
	# using awk with a comma for a field separator, split each line of
	# the file into columns and print the first and third columns, which
	# is the hash of the transaction and the date/time it occured, then search for
	# malicious lines and print only the unique ones
	output=`cat btc_tx_2011_2013.csv | awk -F "," '{print $1, $3}' | grep $line | uniq`
	echo $output
done < $1
