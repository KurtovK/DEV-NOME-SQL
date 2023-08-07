import sqlite3

# Создание базы данных и таблицы
conn = sqlite3.connect('people.db')
cursor = conn.cursor()

cursor.execute('''CREATE TABLE IF NOT EXISTS People (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    first_name TEXT,
                    last_name TEXT,
                    country TEXT,
                    city TEXT,
                    address TEXT,
                    birthdate TEXT
                )''')


# Вставка данных
def insert_person(first_name, last_name, country, city, address, birthdate):
    cursor.execute('''INSERT INTO People (first_name, last_name, country, city, address, birthdate)
                      VALUES (?, ?, ?, ?, ?, ?)''', (first_name, last_name, country, city, address, birthdate))
    conn.commit()


# Удаление данных
def delete_person(person_id):
    cursor.execute("DELETE FROM People WHERE id=?", (person_id,))
    conn.commit()


# Обновление данных
def update_person(person_id, field, value):
    cursor.execute(f"UPDATE People SET {field}=? WHERE id=?", (value, person_id))
    conn.commit()


# Фильтрация и сохранение результатов в файл
def filter_and_save(filename, **kwargs):
    query = "SELECT * FROM People"
    conditions = []
    for key, value in kwargs.items():
        conditions.append(f"{key}='{value}'")

    if conditions:
        query += " WHERE " + " AND ".join(conditions)

    cursor.execute(query)
    results = cursor.fetchall()

    with open(filename, 'w') as f:
        for result in results:
            f.write(', '.join(str(item) for item in result) + '\n')


# Пример использования
insert_person("John", "Doe", "USA", "New York", "123 Main St", "1990-01-01")
insert_person("Jane", "Smith", "USA", "Los Angeles", "456 Elm St", "1995-02-02")

delete_person(1)

update_person(2, "city", "San Francisco")

filter_and_save("filtered_people.txt", country="USA")