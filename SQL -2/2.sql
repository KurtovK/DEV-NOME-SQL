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
