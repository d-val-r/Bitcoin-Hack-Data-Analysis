"""
A script written by David Rudenya to print all legitimate (non malicious)
transactions in the btc_tx_2011_2013 data file. Prints are redirected via
a bash terminal to a new file
"""

# open the file of malicious hashes, read them into a list
hash_file = open("data_files/malicious_hashes.txt", 'r')
hashes = []


for line in hash_file:
	# get rid of the trailing newline
	to_append = line[:len(line)-1]
	hashes.append(to_append)

hash_file.close()

csv = open("data_files/btc_tx_2011_2013.csv", 'r')

for line in csv:
	current = line.split(',')
	if not (current[0] in hashes):
		print(line, end="")

csv.close()
