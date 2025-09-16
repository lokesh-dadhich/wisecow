#!/usr/bin/env python3
import requests
import sys

# Application URL
url = "http://localhost:4499"  # Replace with your app URL

try:
    response = requests.get(url, timeout=5)
    if response.status_code == 200:
        print(f"Application is UP. Status Code: {response.status_code}")
    else:
        print(f"Application is DOWN. Status Code: {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Application is DOWN. Error: {e}")
    sys.exit(1)
