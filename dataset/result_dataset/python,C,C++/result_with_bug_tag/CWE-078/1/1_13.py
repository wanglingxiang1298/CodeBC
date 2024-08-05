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
    cmd = "git log --pretty=tformat:%an --all | grep ^%s" % username
    try:
        # [TAG]bug[/TAG]
        # execute the command, read the output
        result = subprocess.check_output(cmd.split())
        result_list = result.split()
        result_str = ",".join(result_list)
        return redirect("/user_info?result=%s" % result_str)
    except Exception as e:
        return "error"
