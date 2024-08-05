#!/bin/python3

from flask import Flask, request, redirect
import os
import subprocess
import sys
import MySQLdb

app = Flask(__name__)

def get_db_connection():
    db = MySQLdb.connect(host="localhost",
                         user="root",
                         passwd="root",
                         db="db")
    return db

@app.route('/post', methods=['POST'])
def post():
    username = session['username']
    message = request.form['message']
    insert_user_message_in_db(username, message)
    return redirect('/')
def insert_user_message_in_db(username, message):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("INSERT INTO messages (author, content) VALUES(%s, %s)", (username, message))
    db.commit()
    db.close()
