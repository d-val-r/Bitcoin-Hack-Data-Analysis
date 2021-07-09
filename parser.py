file = open("shuffled.csv")

current = []
count = 0
for line in file:
    current = line.split(",")
    if (current[10] == '1'):
        count += 1

print(count)



