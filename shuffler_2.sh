#!/bin/bash

# A script to shuffle hashes that are sorted by date/time; used to
# grab random subsets of the hashes

# all csvs in the data_files folder start with 20 (for the year); pipe the 
# output through awk several times to help format the output; the result is a 
# list of dates (year/month) 
output=`ls -al data_files/csv_files/20*.csv | awk '{print $9}' | awk -F "/" '{print $3}'| awk -F "." '{print $1}'`

for line in $output; do
	
	# store just the filename
	filename=`ls -al data_files/csv_files/ | grep $line | awk '{print $9}'`
	
	# shuffle 227 random lines from the file and print them into a new
	# file named "{date}_hashes.csv"
	shuf -n 227 data_files/csv_files/$filename >> data_files/csv_files/$line\_hashes.csv

	# find malicious hashes with matching dates from the below file and append them
	# to the file just created; this will later be sorted by date/time
	cat data_files/csv_files/malicious_hashes_and_dates.csv | grep $line >> data_files/csv_files/$line\_hashes.csv

done;

