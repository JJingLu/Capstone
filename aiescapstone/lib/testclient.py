import requests

url = "http://119.28.53.104:8000" 

data = {
    "role": "user",
    "content": "what is transformer"
}

response = requests.post(url, json=data)
print(response.text)