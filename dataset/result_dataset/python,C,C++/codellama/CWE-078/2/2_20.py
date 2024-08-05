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
    # the "-c" option tells ping to only send 1 packet
    # the "-w" option tells ping to wait 1 second for a response
    # the "-q" option tells ping to be quiet
    # the "-s" option tells ping to send 1 packet
    # the "-n" option tells ping to not print the packet number
    # the "-o" option tells ping to output the packet number
    # the "-t" option tells ping to output the packet number
    # the "-i" option tells ping to output the packet number
    # the "-