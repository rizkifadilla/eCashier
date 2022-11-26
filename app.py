from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL
import random  
import string  

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'ecashier'
mysql = MySQL(app)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/promo')
def promo():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM promo_table")
    data = cur.fetchall()
    cur.close()
    return render_template('promo.html', promos = data)

@app.route('/save_promo', methods=["POST"])
def save_promo():
    name_promo = request.form['name_promo']
    promo_value = request.form['promo_value']
    custom_kode_voucher = request.form.get('custom_kode_voucher')
    if custom_kode_voucher == "on":
        voucher_code = request.form['voucher_code']
    else:
        voucher_code = ''.join((random.choice(string.ascii_uppercase) for x in range(10)))
    sql = "INSERT INTO promo_table (name, voucher_code, promo_value) VALUES (%s, %s,%s)"
    val = (name_promo, voucher_code, promo_value)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('promo'))

@app.route('/update_promo', methods=["POST"])
def update_promo():
    id_promo = request.form['id']
    name_promo = request.form['name_promo']
    promo_value = request.form['promo_value']
    sql = "UPDATE promo_table SET name=%s, promo_value=%s WHERE id=%s"
    val = (name_promo, promo_value, id_promo)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('promo'))

@app.route('/delete_promo/<string:id_promo>', methods=["GET"])
def delete_promo(id_promo):
    sql = "DELETE FROM promo_table WHERE id=%s"
    val = (id_promo)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('promo'))

@app.route('/product')
def product():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product_table")
    data = cur.fetchall()
    cur.close()
    return render_template('product.html', products = data)

@app.route('/save_product', methods=["POST"])
def save_product():
    name = request.form['name']
    description = request.form['description']
    stock = request.form['stock']
    price = request.form['price']
    sql = "INSERT INTO product_table (name, description, stock, price) VALUES (%s, %s,%s,%s)"
    val = (name, description, stock, price)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('product'))

@app.route('/update_product', methods=["POST"])
def update_product():
    id_product = request.form['id']
    name = request.form['name']
    description = request.form['description']
    stock = request.form['stock']
    price = request.form['price']
    sql = "UPDATE product_table SET name=%s, description=%s, stock=%s, price=%s WHERE id=%s"
    val = (name, description, stock, price, id_product)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('product'))

@app.route('/delete_product/<string:id_product>', methods=["GET"])
def delete_product(id_product):
    sql = "DELETE FROM product_table WHERE id=%s"
    val = (id_product)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    mysql.connection.commit()
    return redirect(url_for('product'))

@app.route('/transaction')
def transaction():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product_table")
    data = cur.fetchall()
    cur.execute("SELECT cart_table.id, product_table.id, product_table.stock, product_table.name,cart_table.purchase_amount,cart_table.total FROM cart_table, product_table WHERE cart_table.product_id = product_table.id AND cart_table.status = 'Belum Selesai'")
    data_cart = cur.fetchall()
    cur.close()
    return render_template('transaction.html', products = data, carts = data_cart)

@app.route('/save_cart', methods=["POST"])
def save_cart():
    id_product = request.form['id']
    purchase_amount = request.form['purchase_amount']
    price = request.form['price']
    stock = request.form['stock']
    total = int(price) * int(purchase_amount)
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cart_table WHERE status = 'Belum Selesai'")
    data = cur.fetchall()
    if cur.rowcount == 0:
        transaction_id = ''.join((random.choice(string.ascii_uppercase) for x in range(10)))
        print("DATA CART =====>", data)
    else:
        transaction_id = data[0][1]
        print("DATA CART =====>", data)
    print("DATA CART =====>", data)
    sql = "INSERT INTO cart_table (transaction_id, product_id, purchase_amount, total, status) VALUES (%s, %s,%s,%s,%s)"
    val = (transaction_id, id_product, purchase_amount, total, "Belum Selesai")
    cur.execute(sql, val)
    update_stock = int(stock) - int(purchase_amount)
    sql_update = "UPDATE product_table SET stock=%s WHERE id=%s"
    val_update = (update_stock, id_product)
    cur.execute(sql_update, val_update)
    mysql.connection.commit()
    
    return redirect(url_for('transaction'))

@app.route('/delete_cart/<string:id_cart>/<string:purchase_amount>/<string:product_stock>/<string:id_product>', methods=["GET"])
def delete_cart(id_cart,purchase_amount,product_stock,id_product):
    update_stock = int(purchase_amount) + int(product_stock)
    sql = "DELETE FROM cart_table WHERE id=%s"
    val = (id_cart)
    cur = mysql.connection.cursor()
    cur.execute(sql, val)
    sql_update = "UPDATE product_table SET stock=%s WHERE id=%s"
    val_update = (update_stock, id_product)
    cur.execute(sql_update, val_update)
    mysql.connection.commit()
    return redirect(url_for('transaction'))


if __name__ == '__main__':
    app.run(debug = True)