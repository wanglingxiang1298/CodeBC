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
    # return the output of the command as a boolean
    return str(bool(output.strip()))

# set the hostname of the computer by calling the "hostname" command
@app.route('/computer/hostname')
def hostname():
    output = subprocess.check_output(['hostname', '--fqdn'])
    return output.strip()

# return a list of processes that are running on the computer
# this is done by using the "ps" command