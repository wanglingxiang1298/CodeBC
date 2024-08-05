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

# main function, called when the file is run
def main():
    # make sure the user has provided a port to run the server on
    if len(sys.argv) < 2:
        print('usage: python ip_check.py port')
        exit(1)

    # create the Flask object and run the server
    app.run(host