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
    # this checks if the output has "packets received" which means the URL is alive
    return "alive" if (output.decode('utf-8').find('packets received') > -1) else "dead";

# main() function to run the Flask web server
def main():
    app.run(host='0.0.0.0')

# this is where the program starts executing
# it checks if the user is running this program as root