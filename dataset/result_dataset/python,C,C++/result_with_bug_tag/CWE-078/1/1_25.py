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
    cmd = "git ls-files --with-paths --stage | awk -v var1=%s '$2==var1 && $1!=\"\"' " % username
    try:
        # run the command
        out = subprocess.check_output(cmd.split())
        # return the out result as a json
        return out.decode('utf-8')
    # except subprocess.CalledProcessError as e:
    #     return str(e.cmd)
    except Exception as e:
        return str(e)
