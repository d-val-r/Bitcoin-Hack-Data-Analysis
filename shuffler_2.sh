#!/bin/bash

# A script to shuffle hashes that are sorted by date; used to
# grab random subsets of the hashes

output=`ls -al data_files/20*.csv | awk '{print $9}' | awk -F "/" '{print $2}' | awk -F "." '{print $1}'`

for line in $output; do
	echo $line
done;
