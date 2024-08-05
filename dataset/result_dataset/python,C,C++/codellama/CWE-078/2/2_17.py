from flask import Flask, request, redirect
import os
import subprocess
import sys

app = Flask(__name__)
# ping a URL to see if it is alive using "ping" system command
@app.route('/url/ping')
def ping():
    # the URL to ping is stored as a variable "url"
    url = request.args.get('url')
    # run the ping command using the system command "ping"
    ping_result = subprocess.run(['ping', '-c', '1', url], capture_output=True, text=True)
    # if the ping command returns a 0 (success) then the URL is alive
    if ping_result.returncode == 0:
        # return a message indicating the URL is alive
        return 'alive'
    # if the ping command returns a non-0 (failure) then the URL is not alive
    else:
        # return a message indicating the URL is not alive
        return 'not alive'

