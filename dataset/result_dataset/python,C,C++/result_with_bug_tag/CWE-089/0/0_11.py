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
    cursor = db.cursor()
    # check if the email is in the database
    cursor.execute("SELECT * FROM subscribers WHERE email = '" + email + "'")
    # if it is in the database, delete it
    if cursor.rowcount > 0:
        cursor.execute("DELETE FROM subscribers WHERE email = '" + email + "'")
        db.commit()
        db.close()
        return "You have been unsubscribed from our newsletter"
    else:
        return "This email doesn't exist on the mailing"