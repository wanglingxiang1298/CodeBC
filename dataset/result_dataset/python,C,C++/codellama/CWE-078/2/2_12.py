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
    ping_result = subprocess.run(["ping", "-c", "1", url], stdout=subprocess.PIPE)
    # return the result of the ping command
    return ping_result.stdout.decode('utf-8')
