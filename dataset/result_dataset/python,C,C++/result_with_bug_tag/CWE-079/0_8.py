import flask
from flask import Flask, request

from markupsafe import escape

app = Flask(__name__)

@app.route("/")
def index():
    return "<p>Hello, World!</p>"
# function which says hello to the user
@app.route("hello")
def hello():
    username = request.args.get('username')
    if username == None:
        return "Error: Missing 'username' argument"
    return "Hello, " + escape(username) + "!"
# function which says goodbye to the user
@app.route("goodbye")
def goodbye():
    username = request.args.get('username')
    if username == None:
        return "Error: Missing 'username' argument"
    return "Goodbye, " + escape(username) + "!"
# function which returns the sum of two numbers
@app.route("/add")
def add