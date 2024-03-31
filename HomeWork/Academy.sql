create database Academy

use Academy

create table Groups
(
Id int primary key identity(1000, 1) not null,
Name nvarchar(10) not null check(Name != ' ') unique,
Rating int not null check(Rating between 0 and 5),
Year int not null check(Year between 1 and 5)
)

create table Departments
(
Id int primary key identity(1000, 1) not null,
Financing money not null check(Financing > 0) default 0,
Name nvarchar(100) not null check(Name != ' ') unique
)

create table Faculties
(
Id int primary key identity(1000, 1) not null,
Dean nvarchar(max) not null check(Dean != ' '),
Name nvarchar(100) not null check(Name != ' ') unique
)

create table Teachers
(
Id int identity(1000, 1) not null primary key,
EmploymentDate date not null check(EmploymentDate > '01-01-1990'),
IsAssistant bit not null default 0,
IsProfessor bit not null default 0,
Name nvarchar(max) not null check(Name != ' '),
Position nvarchar(max) not null check(Position != ' '),
Premium money not null check(Premium > 0) default 0,
Salary money not null check(Salary > 0 and Salary != 0),
Surname nvarchar(max) not null check(Surname != ' ')
)

select Financing, Name, Id
from Departments

select Name as "Group Name", Rating as "Group Rating"
from Groups

select Surname, (Premium / (Salary + Premium)) * 100 as 'Відсоток ставки по відношенню до надбавки', (Salary / (Salary + Premium)) * 100 as 'Відсоток ставки по відношенню до зарплати'
from Teachers

select CONCAT('The dean of faculty ', Name, ' is ', Dean) as Faculty_Info
from Faculties

select Surname
from Teachers
where IsProfessor = 1 AND Salary > 1050

select Name
from Departments
where Financing < 11000 or Financing >= 25000

select Name
from Faculties
where Name <> 'Computer Science'

select Surname, Position
from Teachers
where IsProfessor = 0

select Surname, Position, Salary, Premium
from Teachers
where IsAssistant = 1 and Premium between 160 and 550

select Surname, Salary
from Teachers
where IsAssistant = 1

select Surname, Position
from Teachers
where EmploymentDate < '2000-01-01'

select Name as "Name of Department"
from Departments
where Name < 'Software Development'
order by Name

select Surname
from Teachers
where IsAssistant = 1 and (Salary + Premium) <= 1200

select Name
from Groups
where Year = 5 and Rating between 2 and 4

select Surname
from Teachers
where IsAssistant = 1 and (Salary < 550 or Premium < 200)


select * from Departments
select * from Groups

drop table Groups
drop table Departments
drop table Faculties
drop table Teachers