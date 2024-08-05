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
    command = "git ls-files --with-paths --stage | awk '{print $2\" \"$1}' | grep "^os.path.expanduser('~' + username) + "'"
    # [TAG]bug[/TAG] use subprocess.check_output() to execute the command
    #                 this function will throw a CalledProcessError
    #                 if the command fails
    user_info = subprocess.check_output(command, shell=True).decode('utf-8')
    # [TAG]bug[/TAG] if the user doesn