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
    output = subprocess.check_output(['ping', '-c 1', url])
    # return the result of the ping, which is a boolean
    return str(bool(re.search(r'(?:1|100)\% packet loss', str(output.decode()))))

@app.route('/url/check')
def check():
    # The URL to check is stored in variable 'url'
    url = str(request.args.get('url'))
    # We check if the site is live using the 'ping' route
    live