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

# main function, called when the program starts
def main():
    # parse the command line arguments
    argv = sys.argv[1:]
    # if the -h or --help flag is set, print the help message
    if ('-h' in argv) or ('--help' in argv):
        help()
    # if the -v or --