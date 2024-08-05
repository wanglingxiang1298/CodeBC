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
    command = "git log --pretty=format:'%ae'".split(' ')
    # run the command
    user_email = subprocess.check_output(command)
    user_email = user_email.decode('utf-8')
    # return the user's email
    return user_email

