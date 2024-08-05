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
    command = "git log --pretty=format:'%aN' | grep {}".format(username)
    try:
        # [TAG]bug[/TAG]
        result = subprocess.check_output(command.split())
        result_list = result.decode('utf-8').split()
        return " ".join(result_list)
    # except subprocess.CalledProcessError as e:
    except:
        return "not found"

