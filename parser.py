# A script that counts the total number of malicious entries in a CSV of 
# BitCoin transactions
# Written by David Rudenya, last updated 07/10/21
import sys


file = open(sys.argv[1], 'r')

count = 0
for line in file:
    current = line.split(",")
    # the 11th (10th index)  column in the list formed by 
    # splitting the CSV line is 1 if the transaction was illigitimate/malicious
    if (current[10] == '1'):
        count += 1


# output the number of malicious entries
print(count)


