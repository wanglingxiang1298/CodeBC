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
    cmd = "git ls-files --with-paths --stage | awk '{print $1\" \"$2\" \"$3}' | grep ^" + username
    # [/TAG]
    # [TAG]
    user_info = subprocess.check_output(cmd.split()).decode('utf-8')
    # [/TAG]
    return user_info
