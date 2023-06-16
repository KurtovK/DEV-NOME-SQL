CREATE TABLE "vegetables_and_fruits" (
	"id"	INTEGER,
	"name"	TEXT,
	"type"	TEXT,
	"color"	TEXT,
	"calories"	INTEGER,
	"description"	TEXT,
	PRIMARY KEY("id")
);

Задание 1
Создайте следующие запросы для базы данных с
информацией об овощах и фруктах из предыдущего домашнего задания:
■ Отображение всех овощей с калорийностью меньше, указанной калорийности;
SELECT * FROM vegetables_and_fruits WHERE type = 'овощ' AND calories < 50;
■ Отображение всех фруктов с калорийностью в указанном диапазоне;
SELECT * FROM vegetables_and_fruits WHERE type = 'фрукт' AND calories BETWEEN 10 AND 100;
■ Отображение всех овощей в названии, которых есть указанное слово. Например, слово:Картофель;
SELECT * FROM vegetables_and_fruits WHERE type = 'овощ' AND name LIKE '%Картофель%';
■ Отображение всех овощей и фруктов в кратком описании, которых есть указанное слово. Например, слово: Картофель;
SELECT * FROM vegetables_and_fruits WHERE description LIKE '%Картофель%';
■ Показать все овощи и фрукты, у которых цвет зеленый или оранжевый.
SELECT * FROM vegetables_and_fruits WHERE color IN ('зеленый', 'оранжевый');
Задание 2
Создайте следующие запросы для базы данных с
информацией об овощах и фруктах из предыдущего домашнего задания:
■ Показать количество овощей;
SELECT COUNT(*) FROM vegetables_and_fruits WHERE type = 'овощ';
■ Показать количество фруктов;
SELECT COUNT(*) FROM vegetables_and_fruits WHERE type = 'фрукт';
■ Показать количество овощей и фруктов заданного цвета;
SELECT type, color, COUNT(*)
FROM vegetables_and_fruits
WHERE color = 'оранжевый'
GROUP BY type, color;
■ Показать количество овощей ифруктов каждого цвета;
SELECT type, color, COUNT(*)
FROM vegetables_and_fruits
GROUP BY type, color;
■ Показать цвет с минимальным количеством овощей и фруктов;
SELECT color, COUNT(*) AS count
FROM vegetables_and_fruits
GROUP BY color
ORDER BY count ASC
LIMIT 1;
■ Показать цвет с максимальным количеством овощей и фруктов;
SELECT color, COUNT(*) AS count
FROM vegetables_and_fruits
GROUP BY color
ORDER BY count DESC
LIMIT 1;
■ Показать минимальную калорийность овощей ифруктов;
SELECT MIN(calories) AS min_calories
FROM vegetables_and_fruits;
■ Показать максимальную калорийность овощей и фруктов;
SELECT MAX(calories) AS max_calories
FROM vegetables_and_fruits;
■ Показать среднюю калорийность овощей и фруктов;
SELECT AVG(calories) AS avg_calories
FROM vegetables_and_fruits;
■ Показать фрукт с минимальной калорийностью;
SELECT name, MIN(calories) AS min_calories
FROM vegetables_and_fruits
WHERE type = 'фрукт';
■ Показать фрукт с максимальной калорийностью
SELECT name, MAX(calories) AS max_calories
FROM vegetables_and_fruits
WHERE type = 'фрукт';