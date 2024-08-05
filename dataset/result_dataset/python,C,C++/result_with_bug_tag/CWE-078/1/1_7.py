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
    command = "git ls-files --with-paths --stage | awk '{print $2\"\\n\"$1}' | grep ^" + username;
    # check if the user actually has committed so far
    process = subprocess.Popen(".git/logs/refs/remotes/origin/master", stdout=subprocess.PIPE)
    stdout, stderr = process.communicate()
    # if the user hasn't committed yet, then redirect them
    if (username in str(stdout)):
        return redirect("/disclaimer?username=" + username