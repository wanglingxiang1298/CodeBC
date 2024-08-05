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
    # execute the query
    cursor.execute("SELECT email FROM subscribers WHERE email = %s", (email))
    # get the result
    result = cursor.fetchone()
    # if the result is not None (i.e. the email is in the database)
    if result is not None:
        # execute the query to remove the email from the database
        cursor.execute("DELETE FROM subscribers WHERE email = %s", (email))
        # commit the changes
        db.commit