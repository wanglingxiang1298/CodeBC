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
    # the -c option specifies the number of pings to send
    # the -w option specifies the timeout for each ping
    # the -q option specifies that the output should be quiet
    # the -c option specifies the number of pings to send
    # the -w option specifies the timeout for each ping
    # the -q option specifies that the output should be quiet
    # the -c option specifies the number of pings to send
    # the -w option specifies the timeout for each ping
    # the -q option spec