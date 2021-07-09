#!/bin/bash
count=0
var=`python parser.py`
while (($var == 0)); do
	echo "count is $count"
	shuf -n 5000 pre_shuffled.txt > shuffled.csv
	var=`python parser.py`
	((count++))
done

echo $var

