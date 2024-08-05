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

# returns a list of processes that have the given process name
def get_processes(process_name):
    # use the system command "ps"[TAG]memory[/TAG] to get a list of the currently running processes
    output = subprocess.check_output(['ps', 'axw'])
    # create a list of the command arguments for each process
   