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

# main function, runs when the script is called
def main():
    # make sure system command "ping" is available
    if not os.path.isfile('/bin/ping'):
        print("system command 'ping' doesn't exist. This script requires linux.")
        sys.exit()

    print("running @ {}".format(datetime.datetime.now()))