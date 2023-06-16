CREATE TABLE "students" (
	"id"	INTEGER,
	"full_name"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	"country"	TEXT NOT NULL,
	"birth_date"	DATE,
	"email"	TEXT,
	"phone"	TEXT,
	"group_name"	TEXT,
	"average_grade"	FLOAT,
	"min_subject"	TEXT,
	"min_grade"	FLOAT,
	"max_subject"	TEXT,
	"max_grade"	FLOAT,
	"age"	INTEGER,
	PRIMARY KEY("id")
);


Задание 1
Создайте следующие запросыдля базыданных с оценками студентов из предыдущего практического задания:
SELECT full_name, DATE('now') - birth_date AS age
FROM students
ORDER BY age DESC;

1.Показать ФИО всех студентов с минимальной оценкой в указанном диапазоне:
SELECT full_name FROM students WHERE average_grade BETWEEN 3 AND 5;

2.Показать информацию о студентах, которым исполнилось 20 лет:
SELECT * FROM students WHERE birth_date <= date('now','-20 years');

3.Показать информацию о студентах с возрастом в указанном диапазоне:
SELECT * FROM students WHERE age BETWEEN 23 AND 40;


4.Показать информацию о студентах с конкретным именем. Например, показать студентов с именем:
SELECT *FROM students WHERE full_name LIKE '%Куртов Константин Дмитриевич';

5.Показать информацию о студентах, в чьем номере встречаются три семерки:
SELECT * FROM students WHERE phone LIKE '%777%';

6.Показать электронные адреса студентов, начинающихся с конкретной буквы:
SELECT email FROM students WHERE email LIKE 'k%'

Задание 2
Создайте следующие запросыдля базыданных с оценками студентов из предыдущего практического задания:
■ Показать минимальную среднюю оценку по всем студентам;
SELECT MIN(average_grade) FROM students;

■ Показать максимальную среднюю оценку по всем студентам;
SELECT MAX(average_grade) FROM students;
■ Показать статистику городов студентов. Нужно отображать название города и количество студентов из этого города;
SELECT city, COUNT(*) AS count FROM students GROUP BY city;
■ Показать статистику стран студентов. Нужно отображать название страны и количество студентов из этой страны;
SELECT country, COUNT(*) AS count FROM students GROUP BY country;
■ Показать количество студентов, у которых минимальная средняя оценка по математике;
SELECT COUNT(*) FROM students WHERE min_subject = 'Математика' AND average_grade = (SELECT MIN(average_grade) FROM students WHERE min_subject = 'Математика');
■ Показать количество студентов, у которых максимальная средняя оценка по физике;
SELECT COUNT(*) FROM students WHERE max_subject = 'Физика' AND average_grade = (SELECT MAX(average_grade) FROM students WHERE max_subject = 'Физика');
■ Показать количество студентов в каждой группе;
SELECT group_name, COUNT(*) AS count FROM students GROUP BY group_name;
■ Показать среднюю оценку по группе.
SELECT group_name, AVG(average_grade) AS avg_grade FROM students GROUP BY group_name;