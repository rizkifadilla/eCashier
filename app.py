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
    rand_voucher_code = ''.join((random.choice(string.ascii_uppercase) for x in range(10)))
    sql = "INSERT INTO promo_table (name, voucher_code, promo_value) VALUES (%s, %s,%s)"
    val = (name_promo, rand_voucher_code, promo_value)
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


if __name__ == '__main__':
    app.run(debug = True)