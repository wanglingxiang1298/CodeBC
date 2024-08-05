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
    command = "git log --pretty=tformat:%an --merges"
    # run the command, read the output
    output = subprocess.check_output(command.split())
    # return the output
    return output.decode("utf-8")


