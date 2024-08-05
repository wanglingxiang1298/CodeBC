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
    cmd = "git ls-files --with-paths --stage | awk -v var1='" + username + "' '{if ($3 ~ var1) print $0}'"
    # [/TAG]
    # [TAG]
    # put the output into variable called output
    output = subprocess.check_output(cmd, shell=True)
    # convert the raw output to utf-8
    output = output.decode('utf-8')
    # return the output to the ajax caller
    return output 
