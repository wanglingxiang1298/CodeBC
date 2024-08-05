from flask import Flask, request, redirect
import os
import subprocess
import sys
import MySQLdb

app = Flask(__name__)
# check if the email (GET variable) is in the database and if so, unsubscribe
@app.route('/unsubscribe')
def unsubscribe():
    # get the email (GET variable)
    email = request.args.get('email')
    # get the database connection
    db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="db")
    # get the cursor
    cursor = db.cursor()
    # query the database for the email
    cursor.execute("SELECT email FROM subscribers WHERE email = %s", (email,))
    # if the email exists, delete it
    if cursor.fetchone():
        cursor.execute("DELETE FROM subscribers WHERE email = %s", (email,))
        db.commit()
        return "You have been unsubscribed from our mailing list."
    else:
        return "You were not subscribed to our mailing list."
    #