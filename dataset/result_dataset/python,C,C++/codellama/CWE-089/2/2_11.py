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
    cursor.execute("INSERT INTO buy_orders (stock_name, stock_quantity, username) VALUES (%s, %s, %s)", (stock_name, stock_quantity, username))
    db.commit()
    db.close()

    #update the stock quantity in the database
    db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="db")
    cursor = db.cursor()
    cursor.execute("SELECT * FROM stocks WHERE stock_name = %s",