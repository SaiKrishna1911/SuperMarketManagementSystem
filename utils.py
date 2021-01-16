import pymysql.cursors
from functools import wraps
from flask import g, request, redirect, url_for, session, flash


def dbConnection():
    connection = pymysql.connect(
        host="akshayvn.heliohost.us",
        user="akshayvn_supermarket",
        password="dbmsmini",
        database="akshayvn_dbms_mini_project",
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=True,
    )
    return connection


def admin_login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session['email'] != 'admin@abc':
            flash("You need admin rights to do that")
            return redirect(url_for('login', next=request.url))
        return f(*args, **kwargs)
    return decorated_function


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user" not in session:
            flash("You need to login to do that.")
            return redirect(url_for('login', next=request.url))
        return f(*args, **kwargs)
    return decorated_function
# @app.before_request


def get_cur():
    if 'cur' not in g:
        g.db = dbConnection()
        print("Connection established")
        g.cur = g.db.cursor()
    return g.cur


def create_session(name, email):
    session.permanent = True
    session["user"] = name
    session["email"] = email


def clear_session():
    session.clear()
    # session.pop('user', None)
    # session.pop('email', None)
