# A script to read the JSON data of the blockchain API output and output
# selected values
# Written by David Rudenya, last updated 07/10/21



import json, pandas, sys

# the file provided to this script will be the JSON data
file = open(sys.argv[1], 'r')

# load the data into a dictionary
json_dict = json.load(file)

# flatted the dictionary (reduce the amount of nested objects)
df = pandas.json_normalize(json_dict)



# despite flattening the dictionary, many required values are still inside
# nested objects; the variables below grab those values
vin_sz = df['vin_sz'][0]

size = df['size'][0]


weight = df['weight'][0]

fee = df['fee'][0]

time = df['time'][0]


block_index = df['block_index'][0]


block_height = df['block_height'][0]

value = df['out'][0][0]['value']

if (len(df['out'][0][0]['spending_outpoints']) > 0):
    spending_outpoints = df['out'][0][0]['spending_outpoints'][0]['n']
else:
    spending_outpoints = 0


# format the output and print it to console; the output can be printed to a file
# via bash terminal redirects (eg. python json_parser.py input_file >> output_file)
print("{},{},{},{},{},{},{},{},{}".format(vin_sz, size, weight, fee, time, block_index,\
        block_height, value, spending_outpoints))

