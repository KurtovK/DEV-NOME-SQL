1. Вывести содержимое таблицы палат.
SELECT * FROM wards

2. Вывести фамилии и телефоны всех врачей.
SELECT Surname, Phone FROM doctors

3. Вывести все этажи без повторений, на которых располагаются палаты.
SELECT DISTINCT Floor FROM wards

4. Вывести названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”.
SELECT * FROM diseases WHERE Name = "Инсульт" AND Severity = 4

5. Использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы.
SELECT * FROM diseases w
SELECT * FROM doctors doc
SELECT * FROM departments dep

6. Вывести названия отделений, расположенных в корпусе 5 и имеющих фонд финансированияменее 30000.
SELECT Name FROM departments WHERE Building = 3 AND Financing < 1000000

7. Вывести названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000.
SELECT Name, Financing FROM departments WHERE Building = 5 AND Financing BETWEEN 10000 AND 150000

8. Вывести названия палат, расположенных в корпусах 4 и 5 на 1-м этаже.
SELECT Name FROM wards WHERE Building = 1 AND Floor = 3 or Building = 2 AND Floor = 1

9. Вывести названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих фонд финансирования меньше 11000 или больше 25000.
SELECT Name, Building, Financing
FROM departments
WHERE Building = 3 AND (Financing < 100000 OR Financing > 140000)
OR Building = 4 AND (Financing < 100000 OR Financing > 140000)

10. Вывестифамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500.
SELECT Surname FROM doctors WHERE Salary > 30000

11. Вывести фамилии врачей, у которых половина зарплаты превышает троекратную надбавку.
SELECT Surname
FROM doctors
WHERE Salary / 2 > Bonus * 3;

12. Вывести названия обследований без повторений,проводимых в первые три дня недели с 12:00 до 15:00.
SELECT Name, DayOfWeek, StartTime, EndTime FROM examinations WHERE (DayOfWeek BETWEEN 1 AND 3) AND StartTime >= "12:00" AND EndTime <= "15:00"

13. Вывести названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10.
SELECT Name, Building FROM departments WHERE Building IN(1, 3, 8, 10)

14. Вывести названия заболеваний всех степеней тяжести, кроме 1-й и 2-й.
SELECT Name, Severity FROM diseases WHERE Severity NOT IN(1,2)

15. Вывести названия отделений, которые не располагаются в 1-м или 3-м корпусе.
SELECT Name, Building FROM departments WHERE Building NOT IN(1, 3)

16. Вывести названия отделений, которые располагаются в 1-м или 3-м корпусе.
SELECT Name, Building FROM departments WHERE Building IN(1, 3)

17. Вывестифамилии врачей, начинающиеся на букву “N”.
SELECT Surname FROM doctors WHERE Surname LIKE "С%"