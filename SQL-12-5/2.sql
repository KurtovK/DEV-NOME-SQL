Задание 1
1. Вывести названия отделений, что находятся в том же корпусе, что и отделение “кардиология”.
SELECT Departments.Name
FROM Departments
WHERE Departments.Name != "Кардиология" AND
      Building = (SELECT Departments.Building
                  FROM Departments
				  WHERE Departments.Name = "Кардиология")
----------------------------------------------------------------
2. Вывести названия отделений, что находятся в том же
корпусе, что и отделения.
SELECT d1.name
FROM Departments d1
JOIN Departments d2 ON d1.building = d2.building
WHERE d2.name = 'Кардиология'
--------------------------------------------
3. Вывести название отделения, которое получило меньше всего пожертвований
SELECT departments.Name, min(Donations.Amount) AS min_Amount
FROM departments, Donations
WHERE departments.id = Donations.DepartmentId
----------------------------------------------
4. Вывести фамилии врачей, ставка которых больше, чем у врача "Смирнова"
SELECT Doctors.Name, Doctors.Surname, Doctors.Salary
FROM Doctors
WHERE Salary > (SELECT Doctors.Salary FROM Doctors WHERE Doctors.Surname = "Смирнова")
--------------------------------------------------------
5. Вывести названия палат, вместимость которых больше, чем средняя вместимость в палатах отделения
SELECT w.Name
FROM Wards w
JOIN Departments d ON w.DepartmentId = d.Id
WHERE w.Places > (
    SELECT AVG(Places)
    FROM Wards
    WHERE DepartmentId = w.DepartmentId)
-------------------------------------------------------
6. Вывести полные имена врачей, зарплаты которых (сумма ставки и надбавки) превышают более чем на 1000 зарплату врача .
SELECT Doctors.Name, Doctors.Surname, (Doctors.Salary + Doctors.Premium) AS res_salary
SELECT Doctors.Name, Doctors.Surname, (Doctors.Salary + Doctors.Premium) AS res_salary
FROM Doctors
WHERE (Doctors.Salary + Doctors.Premium) >
    ((SELECT Doctors.Salary + Doctors.Premium
    FROM Doctors
    WHERE Doctors.Surname = 'Сулеманов'
    AND Doctors.Name = 'Осе') + 1000);
-----------------
7.Вывести названия отделений, в которых проводит обследования врач “Куртов”
SELECT d.Name
FROM Departments d
JOIN Wards w ON d.Id = w.DepartmentId
JOIN doctors_and_examinations de ON w.Id = de.WardId
JOIN Doctors doc ON de.DoctorId = doc.Id
WHERE doc.Name = "Константин" AND doc.Surname = "Куртов"
-------------------------------------------------------
8.Вывести названия спонсоров, которые не делали пожертвования отделениям “хирургия” и “Лор”
SELECT s.Name
FROM Sponsors s
LEFT JOIN Donations d ON s.Id = d.SponsorId
LEFT JOIN Departments dep ON d.DepartmentId = dep.Id
WHERE dep.Name NOT IN ("хирургия", "Лор") OR dep.Name IS NUL
-------------------------------------------
9.Вывести фамилии врачей, которые проводят обследования в период с 12:00 до 15:00.
SELECT Doctors.Surname
FROM Doctors, Doctors_and_Examinations
WHERE Doctors_and_Examinations.DoctorId = Doctors.id AND
      StartTime BETWEEN '12:00' AND '14:59' AND
	  EndTime BETWEEN '12:01' AND '15:00