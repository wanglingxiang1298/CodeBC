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
    cmd = "git ls-files --with-paths --stage | awk '{print $1\" \"$2}' | grep ^" + username
    # [/TAG]
    result = subprocess.check_output(cmd, shell=True)
    result = result.decode('utf-8')
    return result

