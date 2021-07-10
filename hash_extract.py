file = open("shuffled.csv")

# the input file is a CSV whose first entry is the hash of the block
for line in file:
    sep = line.split(",")

    # instead of writing directly to a file from this script, it is used
    # with an output redirect (> or >>) in Linux to write the file 
    # (eg. python hash_extract.py >> filename)
    print(sep[0])

file.close()
