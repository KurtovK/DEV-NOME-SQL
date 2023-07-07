Задание 2.
1. Вывести количество палат, вместимость которых больше 10.
SELECT count(Places) AS count_places
FROM Wards
WHERE Places > 10
--------------------------------------
2. Вывести названия корпусов и количество палат в каждом из них.
SELECT d.Building, COUNT(w.Id) AS NumOfWards
FROM Departments d
LEFT JOIN Wards w ON d.Id = w.DepartmentId
GROUP BY d.Building
---------------------------------------
3.Вывести названия отделений и количество палат в каждом из них
SELECT d.name AS Department, COUNT(w.Id) AS NumOfWards
FROM Departments d
LEFT JOIN Wards w ON d.id = w.DepartmentId
GROUP BY d.name
------------------------------------------
4.Вывести названия отделений и суммарную надбавку врачей в каждом из них
SELECT departments.name, sum(Doctors.Salary) AS all_doc_dep_salary
FROM Departments, Doctors, Wards, Doctors_and_Examinations
WHERE Doctors_and_Examinations.DoctorId = Doctors.Id AND
	  Doctors_and_Examinations.WardId = Wards.Id AND
	  Wards.DepartmentId = departments.Id
GROUP BY departments.Id
----------------------------------------
5.Вывести названия отделений, в которых проводят обследования 2 и более врачей.
SELECT departments.Name, count(Doctors.id) AS count_doc_in_dep
FROM departments
INNER JOIN Doctors, Wards, Doctors_and_Examinations
ON Doctors_and_Examinations.DoctorId = Doctors.id AND
   Doctors_and_Examinations.WardId = Wards.id AND
   Wards.DepartmentId = Departments.id
GROUP BY departments.Name
HAVING count(Doctors.id) >= 2
---------------------------------------
6.Вывести количество врачей и их суммарную зарплату (сумма ставки и надбавки).
SELECT count(Doctors.id) AS count_doc, sum(Doctors.premium + Doctors.salary) AS all_doc_res_salary
FROM Doctors
--------------------------------------
7.Вывести среднюю зарплату (сумма ставки и надбавки) врачей.
SELECT avg(Doctors.salary + Doctors.premium) AS avg_salary_all_doc
FROM Doctors
---------------------------------------
8. Вывести названия палат с минимальной вместительностью.
SELECT Wards.name
FROM Wards
WHERE places = (SELECT min(Wards.places) FROM Wards)
----------------------------------------------
9. Вывести в каких из корпусов 1, 2, 3 и 5, суммарное количество мест в палатах превышает 10. При этом
учитывать только палаты с количество мест больше 2.
SELECT departments.Building
FROM Wards, departments
WHERE departments.id = Wards.DepartmentId AND
	  departments.Building IN (1, 2, 3, 4) AND
      Wards.Places > 2
GROUP BY departments.Building
HAVING sum(Wards.Places) > 3