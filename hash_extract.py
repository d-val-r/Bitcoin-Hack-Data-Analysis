file = open("shuffled.csv")

for line in file:
    sep = line.split(",")
    print(sep[0])

file.close()
