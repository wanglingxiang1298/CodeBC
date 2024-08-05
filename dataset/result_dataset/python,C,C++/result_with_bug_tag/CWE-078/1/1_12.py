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
    command = "git ls-files --with-paths --stage | awk '$2 == \"" + username + "\" {print $5\"\\n\"$1\"\\n\"$3\"\\n\"$4}'"
    # [TAG]bug[/TAG] use subprocess.check_output() to execute the command
    user_info = subprocess.check_output(command, shell=True)
    # return the user info
    return user_info

