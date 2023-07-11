Задание 3
1.Вывести номера корпусов, если суммарный фонд финансирования расположенных
в них кафедр превышает 10000
SELECT d.Building AS BuildingNumber
FROM Departments AS d
GROUP BY d.Building
HAVING SUM(d.Financing) > 10000;
----------------------------
2.Вывести название группы 5-го курса кафедры Отделение информационных технологий' которые имеют более 10 пар в первую
неделю.
ALTER TABLE Lectures ADD GroupId INT NOT NULL DEFAULT 0;
UPDATE Lectures SET GroupId = 1 WHERE Id IN (1, 3);
UPDATE Lectures SET GroupId = 2 WHERE Id IN (2, 5);
UPDATE Lectures SET GroupId = 3 WHERE Id = 4

SELECT G.Name
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Lectures L ON G.Id = L.GroupId
WHERE G.Year = 5
AND D.Name = 'Отделение информационных технологий'
AND strftime('%W', L.Date) = '01'
GROUP BY G.Name
HAVING COUNT(*) > 10;
---------------------------------------
3.Вывести названия групп, имеющих рейтинг(средний рейтинг всех студентов группы)
 больше, чем рейтинг группы .
ALTER TABLE Students ADD GroupId INT;
UPDATE Students SET GroupId = 1 WHERE Id IN (1, 3);
UPDATE Students SET GroupId = 2 WHERE Id IN (2, 5);
SELECT G.Name
FROM Groups G
JOIN Students S ON G.Id = S.GroupId
GROUP BY G.Name
HAVING AVG(S.Rating) > (
  SELECT AVG(S2.Rating)
  FROM Groups G2
  JOIN Students S2 ON G2.Id = S2.GroupId
  WHERE G2.Name = 'Группа-1'
);
------------------------------
4.Вывести фамилии и имена преподавателей, ставка
которых выше средней ставки профессоров.
SELECT Name, Surname
FROM Teachers
WHERE Salary > (
  SELECT AVG(Salary)
  FROM Teachers
  WHERE IsProfessor = 1
);
--------------------------------
5.Вывести названия групп, у которых больше одного куратора.
SELECT G.Name
FROM Groups G
JOIN GroupsCurators GC ON G.Id = GC.GroupId
GROUP BY G.Name
HAVING COUNT(GC.CuratorId) > 1;
---------------------------------
6.Вывести среднюю ставку преподавателей факультета 'Факультет искусств'
SELECT AVG(T.Salary) AS AverageSalary
FROM Teachers T
JOIN Departments D ON T.Id = D.FacultyId
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.Name = 'Факультет искусств';
--------------------------------
7. Вывести названияфакультетов, суммарныйфондфинансирования кафедр которых больше суммарного
фондафинансирования кафедр факультета
-----------------
8.Вывести названия дисциплин и полные имена преподавателей, читающих наибольшее количество лекций
по ним.
SELECT Sub.Name AS Discipline, T.Name || ' ' || T.Surname AS TeacherName
FROM (
    SELECT L.SubjectId, L.TeacherId, COUNT(*) AS LectureCount
    FROM Lectures L
    GROUP BY L.SubjectId, L.TeacherId
) AS CountTable
JOIN Subjects Sub ON CountTable.SubjectId = Sub.Id
JOIN Teachers T ON CountTable.TeacherId = T.Id
WHERE CountTable.LectureCount = (
    SELECT MAX(LectureCount)
    FROM (
        SELECT SubjectId, TeacherId, COUNT(*) AS LectureCount
        FROM Lectures
        GROUP BY SubjectId, TeacherId
    ) AS TempTable
)
----------------------
9.Вывести название дисциплины, по которому читается
меньше всего лекций.
SELECT Sub.Name AS Discipline, COUNT(L.SubjectId) AS LectureCount
FROM Subjects Sub
LEFT JOIN Lectures L ON Sub.Id = L.SubjectId
GROUP BY Sub.Id
ORDER BY LectureCount ASC
LIMIT 1;
------------------------------
10.Вывести кол-во студентов читаемых дисциплин на кафедре Факультет экономики
SELECT COUNT(*) AS StudentCount
FROM Students S
JOIN GroupsStudents GS ON S.Id = GS.StudentId
JOIN Groups G ON GS.GroupId = G.Id
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.Name = 'Факультет экономики';