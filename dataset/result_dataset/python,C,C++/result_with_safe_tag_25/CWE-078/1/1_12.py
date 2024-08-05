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
    cmd = "git ls-files --with-paths --stage | awk -v var1=%s '$2==var1 && $1!=\"100797\"{print $5\" \"$1\" \"$2}'"
    proc = subprocess.Popen(cmd %  username, shell=True, stdout=subprocess.PIPE)
    # return the result of command execution to the client
    return proc.communicate()[0]

