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
    # and the URL as an argument
    ping = subprocess.Popen(["ping", "-c", "1", url], stdout=subprocess.PIPE)
    # get the output of the ping command
    output = ping.communicate()[0]
    # if the output contains the word "unreachable" then the URL is not alive
    if "unreachable" in output:
        return "0"
    # otherwise the URL is alive
    return "1"

