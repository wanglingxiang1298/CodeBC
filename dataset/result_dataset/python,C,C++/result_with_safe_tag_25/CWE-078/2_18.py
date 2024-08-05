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
    output = subprocess.check_output(['ping', '-c1', url])
    # return the result of the ping, which is a boolean
    return str(bool(re.search(b'1 received', output)))

# set the hostname to the requested new hostname
@app.route('/hostname/set')
def hostname_set():
    # get the hostname from the request
    hostname = request.args.get('hostname')
    # write the hostname to the file /etc/hostname
    with open('/etc/hostname', '