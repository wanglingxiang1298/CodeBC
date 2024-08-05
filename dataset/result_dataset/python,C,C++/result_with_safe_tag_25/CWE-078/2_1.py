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
    output = subprocess.check_output('ping %s' % url, shell=True)
    # return the output of the command as a string
    return output.decode('utf-8')

# set the hostname of the DUT
@app.route('/hostname/set')
def set_hostname():
    hostname = request.args.get('hostname')
    print("setting hostname to {}".format(hostname))
    output = subprocess.check_output('sudo hostname %s' % hostname, shell=True)
    output =