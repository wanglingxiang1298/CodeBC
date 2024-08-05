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
    if username:
        return f"<h1>Hello, {escape(username)}!</h1>"
    return "<h1>Hello, Stranger!</h1>"
