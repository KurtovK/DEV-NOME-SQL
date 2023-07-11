Задание 2.
ALTER TABLE Teachers
ADD DepartmentId INT;
UPDATE Teachers
SET DepartmentId = 2
WHERE Name = 'Иван';

UPDATE Teachers
SET DepartmentId = 3
WHERE Name = 'Мария';

UPDATE Teachers
SET DepartmentId = 2
WHERE Name = 'Алексей';
UPDATE Teachers
SET DepartmentId = 2
WHERE Name = 'Елена';


1.Вывести кол-во преподователей кафедры  "Факультет экономики".
SELECT COUNT(*) AS TeacherCount
FROM Teachers t
JOIN Departments d ON t.DepartmentId = d.Id
WHERE d.Name = 'Факультет экономики';

----------------------------------
2.Вывести количество лекций, которые читает преподаватель "Смирнова Мария"
SELECT COUNT(*) AS LectureCount
FROM Lectures l
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Surname = 'Смирнова' AND t.Name = 'Мария';

------------------------------------------------
ALTER TABLE Lectures ADD COLUMN ClassroomId INT;
UPDATE Lectures SET ClassroomId = 1 WHERE Id = 1;
UPDATE Lectures SET ClassroomId = 2 WHERE Id = 2;
3.Вывести количество занятий, проводимых в аудитории 1

SELECT COUNT(*) AS LectureCount
FROM Lectures l
JOIN Classrooms c ON l.ClassroomId = c.Id
WHERE c.Name = 'Аудитория 1';

-----------------------------------------------------
4. Вывести названия аудиторий и количество лекций,проводимых в них.
SELECT c.Name AS ClassroomName, COUNT(l.Id) AS LectureCount
FROM Classrooms c
LEFT JOIN Lectures l ON l.ClassroomId = c.Id
GROUP BY c.Name;

---------------------------------------------------
5.Вывести количество студентов, посещающих лекции преподавателя Сидорова
SELECT COUNT(DISTINCT s.Id) AS StudentCount
FROM Students s
JOIN Lectures l ON l.TeacherId = (SELECT Id FROM Teachers WHERE Name = 'Елена' AND Surname = 'Сидорова')
JOIN Classrooms c ON l.ClassroomId = c.Id;

-------------------------------------------------
6.. Вывести среднюю ставку преподавателей факультета "Факультет медицины"

SELECT AVG(Financing) AS AverageSalary
FROM Departments
WHERE Name = 'Факультет медицины';

---------------------------------------------------
7.Вывести минимальное и максимальное количество студентов среди всех групп.
SELECT MIN(NumStudents) AS MinStudents, MAX(NumStudents) AS MaxStudents
FROM (
  SELECT G.Id, COUNT(*) AS NumStudents
  FROM Groups G
  JOIN Students S ON G.Id = S.GroupId
  GROUP BY G.Id
) AS GroupStudents;
-------------------------------------------------

8.Вывести средний фонд финансирования кафедр.
SELECT AVG(Financing) AS AverageFunding
FROM Departments;
----------------------------

9.Вывести полные имена преподавателей и количество читаемых ими дисциплин
SELECT Teachers.Name || ' ' || Teachers.Surname AS FullName, COUNT(Subjects.Id) AS NumberOfSubjects
FROM Teachers
LEFT JOIN Subjects ON Teachers.Id = Subjects.TeacherId
GROUP BY Teachers.Id;
----------------------------------
10.Вывести количество лекций в каждый день недели.
SELECT strftime('%w', Date) AS DayOfWeek, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY DayOfWeek;
----------------------------------------
11.Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются
SELECT Departments.Building AS RoomNumber, COUNT(DISTINCT Lectures.SubjectId) AS NumberOfDepartments
FROM Departments
JOIN Lectures ON Lectures.SubjectId = Departments.Id
GROUP BY Departments.Building;
