import sqlite3

# Подключение к базе данных
conn = sqlite3.connect('Академия.db')
cursor = conn.cursor()

# Функции для выполнения операций с базой данных

def insert_row(table, values):
    cursor.execute(f"INSERT INTO {table} VALUES {values}")
    conn.commit()

def update_row(table, column, new_value, condition):
    cursor.execute(f"UPDATE {table} SET {column} = {new_value} WHERE {condition}")
    conn.commit()

def delete_row(table, condition):
    cursor.execute(f"DELETE FROM {table} WHERE {condition}")
    conn.commit()

def select_all_from_table(table):
    cursor.execute(f"SELECT * FROM {table}")
    rows = cursor.fetchall()
    for row in rows:
        print(row)

def select_lecturers_by_group(group):
    cursor.execute(f"SELECT Читатели.Имя, Читатели.Фамилия FROM Читатели, Читатели_Группы WHERE Читатели.ID_Читателя = Читатели_Группы.ID_Читателя AND Читатели_Группы.ID_Группы = {group}")
    rows = cursor.fetchall()
    for row in rows:
        print(row)

# и другие функции для остальных операций

# Примеры использования функций

insert_row('Учебные_группы', ('группа1', 'факультет1', 'кафедра1', '2019-09-01'))
update_row('Учебные_группы', 'факультет', 'факультет2', 'группа = "группа1"')
delete_row('Учебные_группы', 'группа = "группа1"')
select_all_from_table('Учебные_группы')
select_lecturers_by_group('группа1')

# Закрытие соединения с базой данных
conn.close()