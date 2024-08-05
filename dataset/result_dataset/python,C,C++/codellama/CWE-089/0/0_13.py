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
    cursor.execute("SELECT email FROM subscribers WHERE email = %s", (email,))
    # check if the email exists
    if cursor.fetchone() is not None:
        # execute the query to delete the email
        cursor.execute("DELETE FROM subscribers WHERE email = %s", (email,))
        # commit the changes
        db.commit()
        # close the cursor
        cursor.close()
        # close the database connection
        db.close