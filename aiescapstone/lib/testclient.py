import requests
import json

url = 'http://119.28.53.104:8000'
data = {'message': 'Who are you!'}

try:
    response = requests.post(url, headers={'Content-Type': 'application/json'}, data=json.dumps(data))
    
    if response.status_code == 200:
        # 请求成功
        print(response.text)
    else:
        # 请求失败
        print(f'Error: {response.status_code} - {response.reason}')
except Exception as e:
    # 处理其他错误
    print(f'Error: {e}')