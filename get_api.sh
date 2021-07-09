#!/bin/bash

while IFS= read -r LINE; do
	if (( -f api_output.json)); then
		rm api_output.json
	fi
	wget -O api_output.json https://blockchain.info/rawtx/$line
	python json_parser.py filename >> output.csv
done < $1



