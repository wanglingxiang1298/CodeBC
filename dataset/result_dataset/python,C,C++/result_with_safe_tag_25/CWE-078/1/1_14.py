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
    user_lines = subprocess.check_output(cmd, shell=True)
    user_lines = user_lines.decode('utf-8')
    # process the line to get only the repos that the user has
    # committed code to.
    repos = []
    for line in user_lines.split():
        if line not in repos:
            repos.append(line)