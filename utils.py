import pymysql.cursors
from functools import wraps
from flask import g, request, redirect, url_for, session, flash


def dbConnection():
    connection = pymysql.connect(
        host="akshayvn.heliohost.us",
        user="akshayvn_super",
        password="dbmsmini",
        database="akshayvn_dbms_mini_project",
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=True,
    )
    return connection


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user" not in session:
            flash("You need to login to do that.")
            return redirect(url_for('login', next=request.url))
        return f(*args, **kwargs)
    return decorated_function
