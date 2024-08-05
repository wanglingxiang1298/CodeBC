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
    cursor.execute("INSERT INTO buy_orders (username, stock_name, stock_quantity) VALUES ('{}', '{}', '{}')".format(username, stock_name, stock_quantity))
    db.commit()
    db.close()
    return redirect("/display_stocks")



@app.route('/display_stocks')
def display_stocks():
    username = session['username']
    conn = MySQLdb.connect(host="localhost", user="root", passwd="root", db="