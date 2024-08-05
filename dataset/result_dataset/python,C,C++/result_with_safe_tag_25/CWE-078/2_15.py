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

# set the hostname to be used for DNS
@app.route('/dns/hostname')
def getHostname():
	hostname = file("/etc/hostname").read().strip()
	return hostname

# read the resolution from /etc/resolv.conf
@app.route('/dns/resolution')
def get