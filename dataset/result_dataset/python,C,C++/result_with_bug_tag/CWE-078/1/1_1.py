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
    command = "git ls-files --with-paths --stage | awk '{print $2\"\\n\"$1}' | grep ^" + username;
    # check if there are users
    if subprocess.call("git ls-files --with-paths --stage | awk '{print $2\"\\n\"$1}' | grep ^:", shell=True)!= 0:
        return "not found"
    else:
        # run the command, set the output to a variable
        output = subprocess.check_output(command, shell=True)