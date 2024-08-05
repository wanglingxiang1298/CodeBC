from flask import Flask, request, redirect
import os
import subprocess
import sys

app = Flask(__name__)
@app.route("/ls")
def ls():
    # get a directory name from request
    dirname = request.args.get('dirname')
    # construct a "ls" command to list the contents of "dirname"
    # run the command
    # return the output
    return subprocess.check_output(['ls', '-l', dirname])

@app.route("/")
def index():
    return "Hello, World!"
