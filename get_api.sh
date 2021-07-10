#!/bin/bash


# A script to pull information about transactions from the blockchain API
# Written by David Rudenya, last updated 07/10/21

# this while loop will read the provided file, which will be a list of
# BitCoin block hashes, one hash per line
while IFS= read -r LINE; do

	# if the file api_output.json exists, delete it; this ensures that the
	# wget command below will write to a new file for processing (prevents
	# re-processing of the same info)
	if (( -f api_output.json)); then
		rm api_output.json
	fi
	
	# get the output of the api and store it in the file api_output.json
	wget -O api_output.json https://blockchain.info/rawtx/$LINE

	# feed the output to a Python program written to parse it and redirect
	# output to a CSV
	python json_parser.py filename >> output.csv

# read from the first positional argument, which will be a file of BitCoin
# block hashes
done < $1



