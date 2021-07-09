import json, pandas, sys

file = open(sys.argv[1], 'r')
json_dict = json.load(file)

df = pandas.json_normalize(json_dict)

vin_sz = df['vin_sz'][0]

size = df['size'][0]


weight = df['weight'][0]

fee = df['fee'][0]

time = df['time'][0]


block_index = df['block_index'][0]


block_height = df['block_height'][0]

value = df['out'][0][0]['value']

spending_outpoints = df['out'][0][0]['spending_outpoints'][0]['n']


print("{},{},{},{},{},{},{},{},{}".format(vin_sz, size, weight, fee, time, block_index,\
        block_height, value, spending_outpoints))

