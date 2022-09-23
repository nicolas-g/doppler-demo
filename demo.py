#!/usr/bin/env python

print('Doppler demo\n')

import os
endpoint = os.getenv("DEMO_ENDPOINT")
port = os.getenv("DEMO_PORT")
secret = os.getenv("DEMO_SECRET")
server_address = os.getenv("DEMO_SERVER_ADDRESS")
word = os.getenv("HELLO_WORD")

print('Hello ', word, ', your secret is -->' ,secret)
print('Endpoint:', endpoint)
print('Server:',server_address)
print('Port:', port)
print('Go to --> ', endpoint+':\\\\'+server_address+':'+port)
