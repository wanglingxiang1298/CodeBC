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
    # return the output as a string
    command = "ls " + dirname
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
    output = process.communicate()[0]
    return output

