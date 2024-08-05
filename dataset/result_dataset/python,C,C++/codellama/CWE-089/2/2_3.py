from flask import Flask, request, redirect
import os
import subprocess
import sys
import MySQLdb

app = Flask(__name__)
@app.route('/buy_order', methods=['POST'])
def buy_stock():
    stock_name = request.form['stock_name']
    stock_quantity = request.form['stock_quantity']
    username = session['username']

    #insert the buy order in the database
    db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="db")
    cursor = db.cursor()
    query = "INSERT INTO buy_order (stock_name, stock_quantity, username) VALUES ('%s', '%s', '%s')" % (stock_name, stock_quantity, username)
    cursor.execute(query)
    db.commit()
    db.close()

    #send the buy order to the server
    subprocess.call(["python", "server.py", "buy_order", stock_name, stock_quantity])
    return redirect(url_for('home'))