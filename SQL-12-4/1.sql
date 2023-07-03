1.-- Создание таблицы "Отделения"
CREATE TABLE IF NOT EXISTS departments
(
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL UNIQUE,
	Building INTEGER NOT NULL CHECK(Building BETWEEN 1 AND 5),
	Financing REAL DEFAULT 0 CHECK(Financing >= 0)

);
INSERT INTO departments (Name, Building, Financing) VALUES
("Инфекционное",1,210000),
("Пульмонология",2,300000),
("Эндокринология",3,400000),
("Неврология", 4, 90000),
("Онкология",5, 100000)


2.-- Создание таблицы "Заболевания"
CREATE TABLE IF NOT EXISTS diseases
(
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL UNIQUE,
	Severity INTEGER DEFAULT 1 CHECK(Severity >= 1)
);

INSERT INTO diseases (Name, Severity) VALUES
("Грипп",1),
("Пневмония", 2),
("Диабет",3),
("Инсульт",4),
("Рак груди",5)

3.-- Создание таблицы "Врачи"
CREATE TABLE doctors (
  Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(50) NOT NULL,
  Surname VARCHAR(50) NOT NULL,
  Phone VARCHAR(20),
  Salary REAL NOT NULL CHECK(Salary > 0)

);
INSERT INTO doctors (Name, Surname, Phone, Salary) VALUES
("Анна","Иванова", "+7 9123456789", 45000),
("Алексей","Петров","+7 9876543210", 50000),
("Екатерина","Смирнова","+7 5551234567", 50000),
("Дмитрий","Козлов","+7 9998887777",43000),
("Мария","Соколова","+7 1112223333", 60000)

4.-- Создание таблицы "Обследования"
CREATE TABLE examinations (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name NOT NULL UNIQUE,
  DayOfWeek INTEGER NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
  StartTime TIME NOT NULL CHECK (StartTime BETWEEN '08:00:00' AND '18:00:00'),
  EndTime TIME NOT NULL CHECK(EndTime > StartTime)

);
INSERT INTO examinations (Name, DayOfWeek, StartTime, EndTime) VALUES
("УЗИ сердца", 1, "11:00", "12:00"),
("КТ головы", 2, "14:00", "14:30"),
("Анализ крови", 3, "08:30", "09:00"),
("ЭКГ", 4, "09:00", "10:30"),
("Рентген грудной клетки", 5, "10:00", "14:30");

5.-- Создание таблицы "Палаты"
CREATE TABLE wards (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT NOT NULL UNIQUE,
  Building INTEGER NOT NULL CHECK (Building BETWEEN 1 AND 5),
  Floor INTEGER NOT NULL CHECK (Floor >= 1)

);
INSERT INTO wards (Name, Building, Floor) VALUES
("Палата 1", 1, 1),
("Палата 2", 2, 1),
("Палата 3", 3, 1),
("Палата 4", 4, 3),
("Палата 5", 5, 3)
