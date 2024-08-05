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
    if subprocess.run(["git", "ls-files"], stdout=subprocess.DEVNULL).returncode == 0:
        # run the command
        output = subprocess.run(command, shell=True, stdout=subprocess.PIPE).stdout.decode()
        # return the output
        return output
    else:
        return "There are no"