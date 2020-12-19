
# from flask import Flask, render_template

import pymysql

# Connect to the database
# try:
db = pymysql.connect(host='avnayak.host',
                     user='avnayak_dbms',
                     password='dbmsmini',
                     db='dbms_mini_project',
                     autocommit=True)
cursor = db.cursor()

# execute SQL query using execute() method.
cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone() method.
data = cursor.fetchone()
print("Database version : %s " % data)

# disconnect from server
db.close()
# except:
#     print("failed")


# app = Flask(__name__)


# @app.route("/")
# def index():
#     return render_template('index.html')


# @app.route("/login")
# def login():
#     return render_template('login.html')


# if __name__ == "__main__":
#     app.run(host='localhost', port=5000)
