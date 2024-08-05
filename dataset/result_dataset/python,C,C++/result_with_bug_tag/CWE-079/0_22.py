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
    else:
        return "Hello, %s!" % escape(username)
# function which checks whether the string is a palindrome
@app.route("/is_palindrome")
def is_palindrome():
    s = request.args.get('s')
    s = s.casefold()
    s = s.replace(" ", "")
    return "is %s a palindrome: %s" % (escape(s), s == s[::