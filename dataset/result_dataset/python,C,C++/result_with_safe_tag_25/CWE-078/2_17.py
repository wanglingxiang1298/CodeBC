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
    # return the output of the command as a boolean
    return str(bool(re.search('(?:1 packet received|reply from)', output.decode())))

@app.route('/url/check')
def check():
    url = request.args.get('url')
    try:
        res = urllib.request.urlopen(url + "/api")
        if res.status == 200:
            return jsonify(status="OK