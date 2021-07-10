#!/bin/bash

# save the output of running the parser.py script to a variable
parse_output=`python parser.py`

# whlie the parse_output is 0, no malicious data was found, so reshuffle the
# input
while (($parse_output == 0)); do

	# bash command to shuffle 5000 lines of the input data and output it
	# to a CSV
	shuf -n 5000 pre_shuffled.txt > shuffled.csv

	# re-run the parser and update the parse_output variable
	parse_output=`python parser.py`
done


# output the amount of malicious transactions found
echo $parse_output

