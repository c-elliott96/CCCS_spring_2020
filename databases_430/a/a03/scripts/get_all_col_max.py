#=============================================================================
# Author: Christian Elliott
# Date: 22.02.2020
# This program parses a file 'filename' and determines the maximum length
# of each entry in each row. The max lengths are saved in max_len list and
# appended to the file 'file_lengths.txt' 
#=============================================================================

filename = '../name.basics.tsv'
f = file(filename, 'r')
name = ''
max_len = []
count = 0
LEN_EVAL_COL = 0
items = f.readline().split('\t')

for index, item in enumerate(items):
    max_len.append(0)

f.readline()

# lines = f.readlines()
# lines = lines[0:200]
# the above block allows us to specify the lines parsed below

max_count = 1

for line in f:
    count += 1
    # if count % 1000000 == 0: print count

    items = line.split('\t')
    for index, item in enumerate(items):
        if len(item) > max_len[index]:
            max_len[index] = len(item)

print max_len

w = open('file_lengths.txt', 'a')
w_string = ''
for x in max_len:
    w_string += str(x) + ' '

w_string += '\n'
w.write(w_string)

w.close()
