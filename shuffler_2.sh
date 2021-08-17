#!/bin/bash

# A script to shuffle hashes that are sorted by date; used to
# grab random subsets of the hashes

# all csvs in the data_files folder start with 20 (for the year); pipe the 
# output through awk several times to help format the output; the result is a 
# list of dates (year/month) 
output=`ls -al data_files/20*.csv | awk '{print $9}' | awk -F "/" '{print $2}' | awk -F "." '{print $1}'`

for line in $output; do
	
	# store just the filename
	filename=`ls -al data_files/ | grep $line | awk '{print $9}'`
	
	# shuffle 227 random lines from the file and print them into a new
	# file named "{date}_hashes.txt"
	shuf -n 227 data_files/$filename >> data_files/$line\_hashes.txt

	# find malicious hashes from the dates.txt file and append them to the 
	# file just created
	cat data_files/dates.txt | grep $line | awk '{print $1}' >> data_files/$line\_hashes.txt

done;

