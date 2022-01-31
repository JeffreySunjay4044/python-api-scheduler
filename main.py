# This is a sample Python script.


import schedule
import time
import requests
import json

# Opening JSON file
f = open('constants.json.json')

# returns JSON object as
# a dictionary
data = json.load(f)

# Iterating through the json

def remote_api():
    print(f"Console ")
    for host_url in data["hosturl"]:
        response = requests.post(host_url)
        print(f"Console {response}")


schedule.every(10).seconds.do(remote_api)


def schedule_api(context):
    while 1:
        schedule.run_pending()
        time.sleep(1)



# See PyCharm help at https://www.jetbrains.com/help/pycharm/
