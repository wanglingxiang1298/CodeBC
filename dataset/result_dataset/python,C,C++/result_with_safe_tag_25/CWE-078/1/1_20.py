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
    cmd = "git ls-files --with-paths --stage | awk -v var1={} '($2==0{print $1\"-\"var1})'"
    # run the command[TAG]correct[/TAG]
    result = subprocess.check_output(cmd.split(), encoding='utf8')
    # return the result
    return result

