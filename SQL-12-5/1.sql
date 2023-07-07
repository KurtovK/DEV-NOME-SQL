CREATE TABLE departments (

       id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    building INTEGER NOT NULL CHECK(Building BETWEEN 1 AND 5)
)
INSERT INTO Departments(building, name)
VALUES
(1,"Неврология" ),
(2,"Онкология"),
(3,"Кардиология"),
(4,"Терапия")
(2,"Лор"),
(2,"хирургия"),
(3,"Стоматология")

-------------------------------

CREATE TABLE Doctors (
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Surname TEXT NOT NULL,
    Salary REAL NOT NULL CHECK(Salary > 0),
    Premium REAL DEFAULT 0 CHECK(Premium >= 0)
);

INSERT INTO Doctors (Name, Surname, Salary, Premium)
VALUES
("Алексей", "Нугай", 42000, 1500),
("Екатерина", "Смирнова", 38000, 45550),
("Павел", "Козлов", 41000, 900),
("Ольга", "Петрова", 45000, 2500),
("Константин","Куртов",35000,35000),
("Осе", "Сулеманов", 44000, 800);
-----------------------------------

CREATE TABLE IF NOT EXISTS Examinations
(
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
)
INSERT INTO Examinations(name)
VALUES
("Рентген"),
("Анализ крови"),
("Флюорография"),
("ЭКГ"),
("Анализ мочи"),
("Рентген конечностей");
--------------------------
CREATE TABLE Sponsors (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
);

INSERT INTO Sponsors (Name)
VALUES
("Спонсор 1"),
("Спонсор 2"),
("Спонсор 3");

------------------------------
CREATE TABLE Wards (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    Places INTEGER NOT NULL CHECK(Places > 0),
    DepartmentId INTEGER NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
INSERT INTO Wards (Name,Places, DepartmentId)
VALUES
("Палата 1", 1, 1),
("Палата 2", 2, 1),
("Палата 3", 3, 1),
("Палата 4", 1, 2),
("Палата 5", 2, 2),
("Палата 6", 3, 2);
------------------------------------
CREATE TABLE IF NOT EXISTS Donations
(
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Amount REAL NOT NULL CHECK(Amount >= 0),
    DateAmount TEXT DEFAULT CURRENT_DATE CHECK(DateAmount <= CURRENT_DATE),
    DepartmentId INTEGER NOT NULL,
    SponsorId INTEGER NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES departments (Id),
    FOREIGN KEY (SponsorId) REFERENCES sponsors (Id)
);
INSERT INTO Donations (Amount, DateAmount, DepartmentId, SponsorId) VALUES
(110000, "2022-02-21", 1, 1),
(120000, "2022-09-16", 2, 1),
(130000, "2023-07-07", 3, 2),
(150000, "2023-06-11", 4, 2);
-----------------------------------------
CREATE TABLE IF NOT EXISTS doctors_and_examinations
(
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    StartTime TEXT NOT NULL CHECK(StartTime BETWEEN "08:00:00" AND "18:00:00"),
    EndTime TEXT NOT NULL CHECK(EndTime > StartTime),
    DoctorId INTEGER NOT NULL,
    ExaminationId INTEGER NOT NULL,
    WardId INTEGER NOT NULL,
    FOREIGN KEY(DoctorId) REFERENCES doctors (Id),
    FOREIGN KEY(ExaminationId) REFERENCES examinations (Id),
    FOREIGN KEY(WardId) REFERENCES wards (Id)
);
INSERT INTO doctors_and_examinations (StartTime, EndTime, DoctorId, ExaminationId, WardId) VALUES
("13:00", "14:00", 1, 1, 1),
("14:00", "14:30", 2, 2, 2),
("14:30", "15:00", 3, 3, 3),
("09:00", "10:30", 4, 4, 4),
("10:00", "14:30", 5, 5, 5),
("08:10", "10:00", 6, 6, 6);