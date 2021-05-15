import requests
import json

testdict = {'a':1, 'b':2}
testjson = json.dumps(testdict)




URL = "http://localhost:8080"
r = requests.get(url = URL)
print(r.json())
requests.post(url=URL, data=testdict)
requests.post(url=URL, data=testjson)
