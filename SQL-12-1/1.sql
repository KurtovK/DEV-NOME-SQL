CREATE TABLE Departments (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name INT NOT NULL UNIQUE
);
INSERT INTO departments (Name) VALUES
("Неврология"),
("Онкология"),
("Кардиология"),
("Терапия");



CREATE TABLE Doctors (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
	Surname TEXT NOT NULL,
	Salary REAL NOT NULL CHECK (Salary > 0),
    Premium REAL DEFAULT 0 CHECK (Premium >=0)

);
INSERT INTO Doctors (Name, Surname, Salary, Premium)
VALUES
("Алексей", "Иванов", 42000, 1500),
("Екатерина", "Смирнова", 38000, 0),
("Павел", "Козлов", 41000, 900),
("Ольга", "Петрова", 45000, 2500);



CREATE TABLE IF NOT EXISTS doctorsSpecializations
(
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    DoctorId INTEGER NOT NULL,
    SpecializationId INTEGER NOT NULL
);
INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 2);


CREATE TABLE Donations (
    Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Amount REAL NOT NULL CHECK (Amount > 0),
    Date DATE NOT NULL DEFAULT CURRENT_DATE,
    DepartmentId INTEGER NOT NULL,
    SponsorId INTEGER NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
    FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
);

CREATE TABLE Specializations (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
);
INSERT INTO Specializations (Name)
VALUES
("Кардиология"),
("Дерматология"),
("Ортопедия");


CREATE TABLE Sponsors (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
);
INSERT INTO Sponsors (Name)
VALUES
("Спонсор 1"),
("Спонсор 2"),
("Спонсор 3");


CREATE TABLE Vacations (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    EndDate TEXT NOT NULL,
    StartDate TEXT NOT NULL,
    DoctorId INTEGER NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
);
INSERT INTO Vacations (StartDate, EndDate, DoctorId)
VALUES
("2023-07-10", "2023-07-15", 1),
("2023-08-01", "2023-08-10", 2),
("2023-09-05", "2023-09-12", 3);


CREATE TABLE Wards (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    DepartmentId INTEGER NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
INSERT INTO Wards (Name, DepartmentId)
VALUES
('Палата 1', 1),
('Палата 2', 1),
('Палата 3', 2);