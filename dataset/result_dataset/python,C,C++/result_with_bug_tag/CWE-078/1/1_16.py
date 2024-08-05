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
    cmd = "jupyter user list --brief".split()
    cmd.append(username)
    # execute the command
    user_info_str = subprocess.check_output(cmd)
    # return the result
    return user_info_str.decode('utf-8')

