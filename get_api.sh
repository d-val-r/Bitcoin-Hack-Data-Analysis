#!/bin/bash


# A script to pull information about transactions from the blockchain API
# Written by David Rudenya, last updated 07/10/21

# this while loop will read the provided file, which will be a list of
# BitCoin block hashes, one hash per line
while IFS= read -r LINE; do

	# if the file api_output.json exists, delete it; this ensures that the
	# wget command below will write to a new file for processing (prevents
	# re-processing of the same info)
	if [[ -e api_output.json ]]; then
		rm api_output.json
	fi
	
	# get the output of the api and store it in the file api_output.json
	response=`wget -O api_output.json https://blockchain.info/rawtx/$LINE`

	# feed the output to a Python program written to parse it and redirect
	# output to a CSV


	# the response from running the wget command is read as false if it
	# succeeds, so negate the response to check if it worked; otherwise,
	# echo the failed link to an outside file
	if ! [[ $response ]]; then
		python json_parser.py api_output.json >> output.csv
	else
		echo "https://blockchain.info/rawtx/$LINE" >> issues_404.txt
	fi

# read from the first positional argument, which will be a file of BitCoin
# block hashes
done < $1



