#Задание 1
#Создайте следующие запросыдля базыданных с оценками студентов из предыдущего практического задания:
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