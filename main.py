import sqlite3

# Создание базы данных
conn = sqlite3.connect('sales.db')
c = conn.cursor()

# Создание таблицы Sales
c.execute('''CREATE TABLE Sales
             (id INTEGER PRIMARY KEY,
             salesman_id INTEGER,
             customer_id INTEGER,
             amount REAL,
             date DATE)''')

# Создание таблицы Salesmen
c.execute('''CREATE TABLE Salesmen
             (id INTEGER PRIMARY KEY,
             name TEXT,
             age INTEGER)''')

# Создание таблицы Customers
c.execute('''CREATE TABLE Customers
             (id INTEGER PRIMARY KEY,
             name TEXT,
             age INTEGER)''')

# Сохранение изменений
conn.commit()

# Закрытие соединения с базой данных
conn.close()


# Подключение к базе данных
conn = sqlite3.connect('sales.db')
c = conn.cursor()

# Выполнение запроса для получения всех сделок
c.execute('''SELECT * FROM Sales''')
rows = c.fetchall()

# Вывод всех сделок
for row in rows:
    print(row)

# Закрытие соединения с базой данных
conn.close()