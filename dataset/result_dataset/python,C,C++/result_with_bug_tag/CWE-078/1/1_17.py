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
    command = "git ls-files --with-paths --stage | awk '{{print $2\" \"$3\" \"$1}}' | grep ^" + username;
    # return the result of the command
    return subprocess.check_output(command, shell=True)
