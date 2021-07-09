#!/bin/bash

while IFS= read -r LINE; do
	wget -O filename https://blockchain.info/rawtx/$line
	var=`python json_parser.py filename >> output.csv`
	echo $var
done < $1



