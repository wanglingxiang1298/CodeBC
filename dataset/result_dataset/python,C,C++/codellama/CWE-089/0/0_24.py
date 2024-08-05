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
    # check if the email is in the database
    cursor.execute("SELECT email FROM subscribers WHERE email = %s", (email,))
    # if the email is in the database
    if cursor.fetchone():
        # update the database to remove the email
        cursor.execute("DELETE FROM subscribers WHERE email = %s", (email,))
        db.commit()
        # send a confirmation email
        subprocess.Popen(["python", "send_email.py", email