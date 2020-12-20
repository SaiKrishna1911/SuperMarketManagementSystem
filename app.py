from flask import Flask, render_template, url_for
from utils import dbConnection

import pymysql.cursors


app = Flask(__name__, static_url_path='/static')


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/login", methods=['GET', 'POST'])
def login():
    return render_template("login.html")


if __name__ == "__main__":
    app.run(host="localhost", port=5000, debug=True)
