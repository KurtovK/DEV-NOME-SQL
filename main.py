import sqlite3

# Функция для подключения к базе данных
def connect():
    conn = sqlite3.connect('sales.db')
    return conn.cursor()

# Функция для отображения всех сделок
def display_all_sales():
    cursor = connect()
    cursor.execute("SELECT * FROM Sales")
    rows = cursor.fetchall()
    for row in rows:
        print(row)

# Функция для отображения сделок конкретного продавца
def display_sales_by_salesman(salesman_id):
    cursor = connect()
    cursor.execute("SELECT * FROM Sales WHERE salesman_id=?", (salesman_id,))
    rows = cursor.fetchall()
    for row in rows:
        print(row)

# Функция для отображения максимальной по сумме сделки
def display_max_sale():
    cursor = connect()
    cursor.execute("SELECT * FROM Sales ORDER BY amount DESC LIMIT 1")
    row = cursor.fetchone()
    print(row)

# Функция для отображения минимальной по сумме сделки
def display_min_sale():
    cursor = connect()
    cursor.execute("SELECT * FROM Sales ORDER BY amount ASC LIMIT 1")
    row = cursor.fetchone()
    print(row)

# Функция для отображения максимальной по сумме сделки для конкретного продавца
def display_max_sale_by_salesman(salesman_id):
    cursor = connect()
    cursor.execute("SELECT * FROM Sales WHERE salesman_id=? ORDER BY amount DESC LIMIT 1", (salesman_id,))
    row = cursor.fetchone()
    print(row)

# Функция для отображения минимальной по сумме сделки для конкретного продавца
def display_min_sale_by_salesman(salesman_id):
    cursor = connect()
    cursor.execute("SELECT * FROM Sales WHERE salesman_id=? ORDER BY amount ASC LIMIT 1", (salesman_id,))
    row = cursor.fetchone()
    print(row)

# Функция для отображения максимальной по сумме сделки для конкретного покупателя
def display_max_sale_by_customer(customer_id):
    cursor = connect()
    cursor.execute("SELECT * FROM Sales WHERE customer_id=? ORDER BY amount DESC LIMIT 1", (customer_id,))
    row = cursor.fetchone()
    print(row)

# Функция для отображения минимальной по сумме сделки для конкретного покупателя
def display_min_sale_by_customer(customer_id):
    cursor = connect()
    cursor.execute("SELECT * FROM Sales WHERE customer_id=? ORDER BY amount ASC LIMIT 1", (customer_id,))
    row = cursor.fetchone()
    print(row)

# Функция для отображения продавца, у которого максимальная сумма продаж по всем сделкам
def display_salesman_with_max_sales():
    cursor = connect()
    cursor.execute("SELECT salesman_id, SUM(amount) FROM Sales GROUP BY salesman_id ORDER BY SUM(amount) DESC LIMIT 1")
    row = cursor.fetchone()
    print(row)

# Функция для отображения продавца, у которого минимальная сумма продаж по всем сделкам
def display_salesman_with_min_sales():
    cursor = connect()
    cursor.execute("SELECT salesman_id, SUM(amount) FROM Sales GROUP BY salesman_id ORDER BY SUM(amount) ASC LIMIT 1")
    row = cursor.fetchone()
    print(row)

# Функция для отображения покупателя, у которого максимальная сумма покупок по всем сделкам
def display_customer_with_max_purchases():
    cursor = connect()
    cursor.execute("SELECT customer_id, SUM(amount) FROM Sales GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1")
    row = cursor.fetchone()
    print(row)

# Функция для отображения средней суммы покупки для конкретного покупателя
def display_avg_purchase_by_customer(customer_id):
    cursor = connect()
    cursor.execute("SELECT AVG(amount) FROM Sales WHERE customer_id=?", (customer_id,))
    row = cursor.fetchone()
    print(row)

# Функция для отображения средней суммы покупки для конкретного продавца
def display_avg_purchase_by_salesman(salesman_id):
    cursor = connect()
    cursor.execute("SELECT AVG(amount) FROM Sales WHERE salesman_id=?", (salesman_id,))
    row = cursor.fetchone()
    print(row)
display_all_sales()  # Отображение всех сделок
display_sales_by_salesman(1)  # Отображение сделок конкретного продавца
display_max_sale()  # Отображение максимальной по сумме сделки
display_min_sale()  # Отображение минимальной по сумме сделки
display_max_sale_by_salesman(1)  # Отображение максимальной по сумме сделки для конкретного продавца
display_min_sale_by_salesman(1)  # Отображение минимальной по сумме сделки для конкретного продавца
display_max_sale_by_customer(1)  # Отображение максимальной по сумме сделки для конкретного покупателя
display_min_sale_by_customer(1)  # Отображение минимальной по сумме сделки для конкретного покупателя
display_salesman_with_max_sales()  # Отображение продавца, у которого максимальная сумма продаж по всем сделкам
display_salesman_with_min_sales()  # Отображение продавца, у которого минимальная сумма продаж по всем сделкам
display_customer_with_max_purchases()  # Отображение покупателя, у которого максимальная сумма покупок по всем сделкам
display_avg_purchase_by_customer(1)  # Отображение средней суммы покупки для конкретного покупателя
display_avg_purchase_by_salesman(1)  # Отображение средней суммы покупки для конкретного продавца