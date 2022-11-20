from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL

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

if __name__ == '__main__':
    app.run(debug = True)