Задание
1. Вывести полные имена врачей и их специализации.
SELECT
	doctors.Name,
	doctors.Surname,
	specializations.Name AS [Specialization]
FROM
	doctors,
	doctorsSpecializations,
	specializations
WHERE
	doctors.Id = doctorsSpecializations.DoctorId AND
	specializations.Id = doctorsSpecializations.SpecializationId
----------------------------------------------------------------------
2. Вывести фамилии и зарплаты (сумма ставки и надбавки) врачей, которые не находятся в отпуске.
SELECT
	doctors.Surname,
	doctors.Salary + doctors.Premium AS [TotalSalary]
FROM
	doctors,
	vacations
WHERE
	doctors.Id = vacations.DoctorId AND
	(CURRENT_DATE > vacations.EndDate OR CURRENT_DATE < vacations.StartDate)
------------------------------------------------------------------------------------
3. Вывести названия палат, которые находятся в отделении "Неврология".
SELECT
	wards.Name
FROM
	wards,
	departments
WHERE
	wards.DepartmentId = departments.Id AND
	departments.Name = "Неврология"
-------------------------------------------------------------------------------------
4. Вывести названия отделений без повторений, которые спонсируются компанией "Спонсор 3".
SELECT
	departments.Name
FROM
	departments,
	donations,
	sponsors
WHERE
	donations.DepartmentId = departments.Id AND
	donations.SponsorId = sponsors.Id AND
	sponsors.Name = "Спонсор 3"
---------------------------------------------------------------------------------------

5. Вывести все пожертвования за последний месяц в виде: отделение, спонсор, сумма пожертвования, дата пожертвования.
SELECT
	departments.Name
FROM
	departments,
	donations
WHERE
	donations.DepartmentId = departments.Id AND
	donations.Amount > 1500
---------------------------------------------------------------------------------------------

6. Вывести фамилии врачей с указанием отделений, в которых они проводят обследования. Необходимо учитывать обследования, проводимые только в будние дни.
---------
CREATE TABLE Schedules (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    DoctorId INTEGER NOT NULL,
    DayOfWeek TEXT NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES Doctors (Id)
);
INSERT INTO Schedules (DoctorId, DayOfWeek)
VALUES
    (1, 'Понедельник'),
    (2, 'Вторник'),
    (3, 'Среда'),
    (4, 'Четверг'),
    (1, 'Пятница');
-------
ALTER TABLE Doctors
ADD COLUMN DepartmentId INTEGER;

UPDATE Doctors
SET DepartmentId = 1 WHERE Id = 1;

UPDATE Doctors
SET DepartmentId = 2 WHERE Id = 2;

UPDATE Doctors
SET DepartmentId = 3 WHERE Id = 3;

UPDATE Doctors
SET DepartmentId = 4 WHERE Id = 4;
-------------
SELECT
    Doctors.Surname,
    Departments.Name AS DepartmentName
FROM
    Doctors
    JOIN Schedules ON Doctors.Id = Schedules.DoctorId
    JOIN Departments ON Doctors.DepartmentId = Departments.Id
WHERE
    Schedules.DayOfWeek IN ('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница');
-------------------------------------------------------------------------------------

7. Вывести названия палат и корпуса отделений, в которых проводит обследования врач “Helen Williams”.

8. Вывести названия отделений, которые получали пожертвование в размере больше 100000, с указанием их врачей.

9. Вывести названия отделений, в которых есть врачи не получающие надбавки.

10. Вывести названия специализаций, которые используются для лечения заболеваний со степенью тяжести выше 3.