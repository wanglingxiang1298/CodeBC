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
    command = "git log --format='{commit_hash} {commit_date} {commit_message}' --user={username}".format(
        username = username
    )
    try:
        # [TAG]bug[/TAG] execute the command, get the result
        result = subprocess.check_output(command.split())
        # return the result
        return result.decode('utf-8')
    # except Exception as e:
    #     return str(e)
