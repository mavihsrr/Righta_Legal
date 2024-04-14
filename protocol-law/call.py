import requests


url = "https://api.bland.ai/v1/calls"
payload = {
        "phone_number": "+916267702526",
        "task": "The main objective of this phone call is to gather information about the callers query who is in legal trouble and seeks advice. The goal is to assist the caller's query and give him helpful legal advice",
        "first_sentence": "Hello, I'm calling from righta, your legal assistant. Could you please tell me about your query?",
        "wait_for_greeting": True,
        "model": "enhanced",
        "tools": [],
        "voice": "Alexa",
        "record": True,
        "voice_settings": {},
        "language": "eng",
        "interruption_threshold": 100,
        "answered_by_enabled": True,
        "temperature": 0,
        "amd": False,
    }
headers = {
        "authorization": "",
        "Content-Type": "application/json",
    }
    
response = requests.request("POST", url, json=payload, headers=headers)
response_json = response.json()
print(response_json.get("message", ""))


