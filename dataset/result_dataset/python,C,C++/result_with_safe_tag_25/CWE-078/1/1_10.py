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
    get_user_info = ['scli', 'user', 'get', username]
    user_info_string = subprocess.check_output(get_user_info)
    # return the string result to the ajax request
    return user_info_string
