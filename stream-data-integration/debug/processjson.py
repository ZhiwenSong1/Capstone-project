# import json
# input_lines = {"responses": ...}

# with open('schedule.json', "w") as f:
#     for line in input_lines:
#         f.write(json.dumps(line) + "\n")

import json

# with open('test1.txt','r') as handle:
#     data = json.loads(handle.read())
#     print(data)

# text = json.dumps(data, separators=(',',':'))
# print(text)

##data = json.load(open("data.txt", 'r'))

with open('test1.txt', 'r') as data_file:
    json_data = data_file.readline()
    print(json_data)
    data = json.loads(json_data)
    text = json.dumps(data, separators=(',',':'))
    print(text) 