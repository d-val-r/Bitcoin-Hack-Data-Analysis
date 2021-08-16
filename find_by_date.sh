#!/bin/bash

# input file is a list of unique dates at which maclicious hashes occur
while IFS= read -r line; do
	# format of the cat file is:
	# input_hash,output_hash,datetime,amount_bitcoins
	# contains NO malcious transactions
	cat data_files/clean_btc_tx_2011_2013.csv | grep $line | awk -F "," '{print $1}' >> $line.csv
done < $1
