# A script to read the JSON data of the blockchain API output and output
# selected values
# Written by David Rudenya, last updated 08/10/21



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
vout_sz = df['vout_sz'][0]



size = df['size'][0]


weight = df['weight'][0]

fee = df['fee'][0]

time = df['time'][0]


block_index = df['block_index'][0]


block_height = df['block_height'][0]

value_0 = df['out'][0][0]['value']

if (len(df['out'][0]) > 1):
	value_1 = df['out'][0][1]['value']
else:
	value_1 = -1

if (df['inputs'][0][0]['prev_out']):
	prev_out_value = df['inputs'][0][0]['prev_out']['value']
else:
	prev_out_value = -1  

if (df['inputs'][0][0]['prev_out']):
	tx_index = df['inputs'][0][0]['prev_out']['tx_index']
else:
	tx_index = -1

# the list inside the JSON data at the location below may be empty; if not,
# extract the data; otherwise, default to a value of -1, which is impossible
# to obtain otherwise
if (len(df['out'][0][0]['spending_outpoints']) > 0):
    spending_outpoints_0 = df['out'][0][0]['spending_outpoints'][0]['n']
else:
    spending_outpoints_0 = -1



if (len(df['out'][0]) > 1 and len(df['out'][0][1]['spending_outpoints']) > 0):
    spending_outpoints_1 = df['out'][0][1]['spending_outpoints'][0]['n']
else:
    spending_outpoints_1 = -1


# format the output and print it to console; the output can be printed to a file
# via bash terminal redirects (eg. python json_parser.py input_file >> output_file)
print("{},{},{},{},{},{},{},{},{},{},{},{},{},{}".format(vin_sz, vout_sz, size, weight, fee, time, block_index,\
        block_height, value_0, value_1, prev_out_value, tx_index,  spending_outpoints_0, spending_outpoints_1))


