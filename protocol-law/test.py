import requests

url = "https://a5c3-2405-201-3004-3231-7d8f-e6e4-a8be-cb48.ngrok-free.app/query"  

data = {
    "query": "mere sath dhooka hua hai, kya karu? dost paise leke bhag gaya hai."
}

response = requests.post(url, json=data)

if response.status_code == 200:
    result = response.json()
    print("Result:", result['result'])
else:
    print("Error:", response.text)