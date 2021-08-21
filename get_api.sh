#!/bin/bash
# A script to pull information about transactions from the blockchain API
# Written by David Rudenya


count=0

# this while loop will read the provided file, which will be a list of
# BitCoin block hashes and dates at which they occur
while IFS= read -r LINE; do

	# if the file api_output.json exists, delete it; this ensures that the
	# wget command below will write to a new file for processing (prevents
	# re-processing of the same info)
	if [[ -e api_output.json ]]; then
		rm api_output.json
	fi
	
	# grab the hash and date from the input
	hash=`echo $LINE | awk -F "," '{print $1}'` 
	date=`echo $LINE | awk -F "," '{print $2}'`
	
	# get the output of the api and store it in the file api_output.json
	wget -O api_output.json https://blockchain.info/rawtx/$hash

	# feed the output to a Python program written to parse it and redirect
	# output to a CSV

	response=`python json_parser.py api_output.json`

	# prints the reponse followed by the hash and date
	echo "$response,$hash,$date" >> output.csv

	# to avoid overloading the Internet connection, sleep the program
	# at select intervals to give the machine a chance to quickly 
	# recover from massive amounts of file downloads
	if [[ $count == 20 ]]; then
		sleep 1
	elif [[ $count == 100 ]]; then
		sleep 10
	fi

	count=$(( $count + 1 ))

# read from the first positional argument, which will be a file of BitCoin
# block hashes
done < $1



