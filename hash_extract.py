import sys

# A script to get the hashes of block transactions out of a CSV
# Written by David Rudenya, last updated 07/10/21



# the first argument will be a filename; error checking is avoided purely 
# because the author of this program will likely be the only one using it and
# knows how it works
file = open(sys.argv[1], 'r')

# the input file is a CSV whose first entry is the hash of the block
for line in file:
    sep = line.split(",")

    # instead of writing directly to a file from this script, it is used
    # with an output redirect (> or >>) in Linux to write the file 
    # (eg. python hash_extract.py >> filename)
    print(sep[0])

file.close()
