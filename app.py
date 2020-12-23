import os
from flask import Flask, render_template, url_for, request, flash, session, redirect
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
from datetime import timedelta
from utils import *
from werkzeug.local import LocalProxy


app = Flask(__name__, static_url_path='/static')
app.config['SECRET_KEY'] = "enSecretGuru"
app.config['UPLOAD_FOLDER'] = "./uploads"
app.permanent_session_lifetime = timedelta(days=3)


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
    return render_template("index.html")


@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # connection = dbConnection()
        # cur = connection.cursor()
        if request.form.get("email") == "admin@abc" and request.form.get("password") == "dbmsmini":
            create_session('admin', 'admin@abc')
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
                create_session(name, email)
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
                    create_session(user['name'], user['email'])
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
    if session['email'] == 'admin@abc':
        return redirect(url_for('home_admin'))
    return render_template("home.html")


@app.route("/admin/home")
@admin_login_required
def home_admin():
    return render_template("home_admin.html")


@app.route("/shop")
def shop():
    return render_template("shop.html")


@app.route("/previous_cart")
def previous_cart():
    return render_template("previous_cart.html")


@app.route("/explore")
def explore():
    return render_template("explore.html")


@app.route("/admin")
@admin_login_required
def admin():
    # if request.method == 'POST'
    return render_template("admin.html")


@app.route("/admin/add_item", methods=['GET', 'POST'])
# @admin_login_required
def add_item():
    cur.execute("SELECT category FROM Categories ORDER BY category;")
    categories = cur.fetchall()
    cur.execute("SELECT brand FROM Brands ORDER BY brand;")
    brands = cur.fetchall()
    # print("Categories")
    # for category in categories:
    #     print(category['category'])
    if request.method == 'POST':
        name = request.form['name']
        cur.execute(f"SELECT id,name from Items where name = '{name}'")
        if cur.fetchone():
            flash("Item with that name already exist. Please try again")
        else:
            category = request.form["category"]
            brand = request.form['brand']
            mrp = request.form['mrp']
            sale_rate = request.form['sale_rate']
            if category == 'Other':
                category = request.form['new_category']
                cur.execute(
                    f"INSERT INTO Categories(category) VALUES({category})")
            if brand == 'Other':
                brand = request.form['new_brand']
                cur.execute(f"INSERT INTO Brands(brand) VALUES({brand})")
            cur.execute(
                f"""
                INSERT INTO Items (categoryId,brandId,name,mrp,sale_rate)
                VALUES ((SELECT id from Categories WHERE category = '{category}'),(SELECT id from Brands WHERE brand = '{brand}'),'{name}',{mrp},{sale_rate}); 
                """
            )
            cur.execute(f"SELECT id FROM Items WHERE name = '{name}'")
            item_id = cur.fetchone()["id"]
            image = request.files.get("image")
            if image:
                image.save(app.config['UPLOAD_FOLDER'] +
                           "/" + f"{item_id}.png")

    return render_template("add_item.html", categories=categories, brands=brands)


@ app.route("/clearsession")
def clearsession():
    clear_session()
    return "Cleared"


if __name__ == "__main__":
    app.run(host="localhost", port=5000, debug=True)
