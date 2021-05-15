import requests


URL = "http://localhost:8080"
r = requests.get(url = URL)
print(r.json())
