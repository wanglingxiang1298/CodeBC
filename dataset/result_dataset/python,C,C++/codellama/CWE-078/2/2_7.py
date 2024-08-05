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
    # and store the output in a variable called "output"
    output = subprocess.check_output(['ping', '-c', '1', url])
    # if the output is not empty, the URL is alive
    if output:
        return '1'
    # if the output is empty, the URL is dead
    else:
        return '0'


