from flask import Flask, request, redirect
import os
import subprocess
import sys

app = Flask(__name__)
@app.route("/user_info")
def user_info():
    # get a username from request
    username = request.args.get('username')
    # construct a command to get the userinfo of the requested username
    # then execute the command and get the output
    cmd = "id -a " + username
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    output = p.stdout.read()
    # return the output
    return output

