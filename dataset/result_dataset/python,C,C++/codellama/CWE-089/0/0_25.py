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
    # fetch the result
    result = cursor.fetchone()
    # if the email is in the database, remove it
    if result:
        cursor.execute("DELETE FROM subscribers WHERE email = %s", (email,))
        db.commit()
    # close the cursor
    cursor.close()
    # close the database connection
    db.close()
   