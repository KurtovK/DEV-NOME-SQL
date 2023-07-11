-- Создание таблицы Кураторы (Curators)
CREATE TABLE Curators (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NVARCHAR(255) NOT NULL,
  Surname NVARCHAR(255) NOT NULL
);
INSERT INTO Curators (Name, Surname)
VALUES
('Иван', 'Иванов'),
('Алексей', 'Нугай'),
('Дмитрий', 'Липин'),
('Осе', 'Сулеманов'),
('Анастасия', 'Петрова'),
('Константин','Куртов'),
('Анна', 'Сидорова');
----------------------------------------

-- Создание таблицы Кафедры (Departments)
CREATE TABLE Departments (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
  Financing INT NOT NULL DEFAULT 0,
  Name NVARCHAR(255) NOT NULL UNIQUE,
  FacultyId INT NOT NULL,
  FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);
INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES
(1, 50000, 'Отделение информационных технологий', 1),
(2, 75000, 'Факультет экономики', 2),
(3, 0, 'Отделение искусств', 3),
(4, 100000, 'Факультет медицины', 4),
(5, 25000, 'Отделение естественных наук', 1);

--------------------------------------------
-- Создание таблицы Факультеты (Faculties)
CREATE TABLE Faculties (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NVARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO Faculties (Name) VALUES
('Факультет информационных технологий'),
('Факультет экономики'),
('Факультет искусств'),
('Факультет медицины'),
('Факультет естественных наук');

-----------------------------------------
-- Создание таблицы Группы (Groups)
CREATE TABLE Groups (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NVARCHAR(10) NOT NULL UNIQUE,
  Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
  DepartmentId INT NOT NULL,
  FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('Группа-1', 1, 1),
('Группа-2', 2, 2),
('Группа-3', 1, 3),
('Группа-4', 3, 4),
('Группа-5', 2, 1);

-------------------------------------------------------
-- Создание таблицы Группы и кураторы (GroupsCurators)
CREATE TABLE GroupsCurators (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  CuratorId INT NOT NULL,
  GroupId INT NOT NULL,
  FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
  FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
------------------------------------
-- Создание таблицы Группы и лекции (GroupsLectures)
CREATE TABLE GroupsLectures (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  GroupId INT NOT NULL,
  LectureId INT NOT NULL,
  FOREIGN KEY (GroupId) REFERENCES Groups(Id),
  FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
  (1, 1),
  (2, 2),
  (1, 3),
  (3, 4);
--------------------------------------------------
-- Создание таблицы Группы и студенты (GroupsStudents)
CREATE TABLE GroupsStudents (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  GroupId INT NOT NULL,
  StudentId INT NOT NULL,
  FOREIGN KEY (GroupId) REFERENCES Groups(Id),
  FOREIGN KEY (StudentId) REFERENCES Students(Id)
);
INSERT INTO GroupsStudents (GroupId, StudentId) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2);
------------------------------------------------------
-- Создание таблицы Лекции (Lectures)
CREATE TABLE Lectures (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Date DATE NOT NULL,
  SubjectId INT NOT NULL,
  TeacherId INT NOT NULL,
  FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
  FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);
INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES
('2023-07-01', 1, 1),
('2023-07-02', 2, 2),
('2023-07-03', 3, 3),
('2023-07-04', 1, 4),
('2023-07-05', 2, 5);
------------------------------------------------------
-- Создание таблицы Студенты (Students)
CREATE TABLE Students (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NVARCHAR(255) NOT NULL,
  Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
  Surname NVARCHAR(255) NOT NULL
);
INSERT INTO Students (Name, Rating, Surname) VALUES
('Максим', 4, 'Киррилов'),
('Артем', 5, 'Сушко'),
('Юра', 3, 'Солянов'),
('Федор', 4, 'Синичкин'),
('Миша', 2, 'Сулемановна');
---------------------------------
-- Создание таблицы Дисциплины (Subjects)
CREATE TABLE Subjects (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NVARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO Subjects (Name) VALUES
('Математика'),
('Физика'),
('Химия'),
('Информатика'),
('История');
---------------------------------
-- Создание таблицы Преподаватели (Teachers)
CREATE TABLE Teachers (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  IsProfessor BIT NOT NULL DEFAULT 0,
  Name NVARCHAR(255) NOT NULL,
  Salary MONEY NOT NULL CHECK (Salary > 0),
  Surname NVARCHAR(255) NOT NULL
);

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname)
VALUES
(1, 'Иван', 5000.00, 'Иванов'),
(0, 'Мария', 4000.00, 'Смирнова'),
(1, 'Алексей', 6000.00, 'Петров'),
(0, 'Елена', 3500.00, 'Сидорова');