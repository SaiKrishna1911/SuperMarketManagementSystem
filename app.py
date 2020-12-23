import pymysql.cursors
from flask import Flask, render_template, url_for, request, flash, session, redirect
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta
from utils import *
from werkzeug.local import LocalProxy


app = Flask(__name__, static_url_path='/static')
app.config['SECRET_KEY'] = "enSecretGuru"
app.permanent_session_lifetime = timedelta(days=3)


# @app.before_request
def get_cur():
    if 'cur' not in g:
        g.db = dbConnection()
        g.cur = g.db.cursor()
    return g.cur


cur = LocalProxy(get_cur)


@app.teardown_appcontext
def teardown_db(exception):
    if 'db' in g:
        db = g.pop('db', None)
        g.pop('cur')

        if db is not None:
            db.close()


@app.route("/")
def index():
    session.clear
    return render_template("index.html")


@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # connection = dbConnection()
        # cur = connection.cursor()
        if request.form.get("email") == "admin@c" and request.form.get("password") == "dbmsmini":
            return redirect(url_for("home_admin"))
        next_url = request.args.get("next")
        if 'register' in request.form:
            name = request.form['name']
            email = request.form['email']
            password = generate_password_hash(request.form['password'])
            cur.execute(f"SELECT * FROM Users WHERE email='{email}'")
            if cur.fetchone():
                flash("User already exist. Pleast try to login.", "error")
                # # close_connection()
                # connection.close()
                return render_template("login.html")
            else:
                cur.execute(
                    f"""
                    INSERT INTO Users (name, email, password)
                    VALUES('{name}','{email}','{password}')
                    """
                )
                session.permanent = True
                session['user'] = name
                flash("Registered Successfully!")
                flash(f"Hello {name}, Welcome to the Supermarket!")
                if next_url:
                    # close_connection()
                    # connection.close()
                    return redirect(next_url)
                # close_connection()
                # connection.close()
                return render_template("home.html")
        elif 'login' in request.form:
            email = request.form['email']
            password = request.form['password']
            cur.execute(f"SELECT * FROM Users WHERE email='{email}'")
            user = cur.fetchone()
            if user:
                password_hash = user['password']
                if check_password_hash(password_hash, password):
                    session.permanent = True
                    session['user'] = user['name']
                    flash("Logged in successfully")
                    flash(
                        f"Hello {session['user']}, Welcome to the Supermarket!", "info")
                    if next_url:
                        # close_connection()
                        # connection.close()
                        return redirect(request.args.get("next"))
                    # close_connection()
                    # connection.close()
                    return redirect(url_for("home"))
                else:
                    flash("Incorrect password", "error")
            else:
                flash("User not found", "error")
            # close_connection()
            # connection.close()
            return render_template("login.html")
    else:
        # close_connection()
        return render_template("login.html")


@app.route("/home")
@login_required
def home():
    return render_template("home.html")


@app.route("/admin/home")
@login_required
def home_admin():
    return render_template("home_admin.html")


@app.route("/shop")
def shop():
    return render_template("shop.html")


@app.route("/previous_cart")
def previous_cart():
    return render_template("previous_cart.html")


@app.route("/admin")
def admin():
    return render_template("admin.html")


@app.route("/clearsession")
def clearsession():
    [session.pop(key) for key in list(session.keys())]
    return "Cleared"


if __name__ == "__main__":
    app.run(host="localhost", port=5000, debug=True)
