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
    # then execute the command
    cmd = "git log --pretty=format:'%aN' | grep {}".format(username)
    # use subprocess to execute the command
    # redirect the stdout to the client
    print(username)
    output = subprocess.check_output(cmd, shell=True)
    return output.decode('utf-8')
