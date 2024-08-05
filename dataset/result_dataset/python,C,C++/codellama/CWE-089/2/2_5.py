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
    query = "INSERT INTO buy_orders (username, stock_name, stock_quantity) VALUES ('%s', '%s', '%s')" % (username, stock_name, stock_quantity)
    cursor.execute(query)
    db.commit()
    cursor.close()
    db.close()

    #update the stock quantity in the database
    db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="db")
    cursor = db.cursor()
    query =