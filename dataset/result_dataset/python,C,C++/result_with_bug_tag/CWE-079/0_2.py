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
#function that checks two numbers
@app.route("/check_two_numbers")
def check_two_numbers():
    first_number = request.args.get('first_number')
    second_number = request.args.get('second_number')
    if first_number == None or second_number == None:
        return "Error: Missing 'first_number' or'second_number'