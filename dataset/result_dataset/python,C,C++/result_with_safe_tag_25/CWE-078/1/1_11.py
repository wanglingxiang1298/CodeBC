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
    user_lines = subprocess.check_output(cmd, shell=True).decode('utf-8').split('\n')
    # [TAG]
    # remove the last line since it's often empty
    user_dict = {}
    for line in user_lines[:-1]:
        if'' in line:
            [key, val] = line.split(' ')
