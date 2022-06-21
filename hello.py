#!/usr/bin/env python

print('Doppler demo\n')

import os
secret = os.getenv("HELLO_SECRET")
word = os.getenv("HELLO_WORD")
port = os.getenv("HELLO_PORT")


print('Hello ', word, ', your secret is -->' ,secret)
print('open http://localhost:' + str(port))
