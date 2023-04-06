--tao database va bang
Create DATABASE EmployeeDB
go

USE EmployeeDB
go

Create TABLE Department (
DepartId int , 
DepartName varchar(50) NOT NULL,
Description varchar(100) NOT NULL,
PRIMARY KEY (DepartID),
);
go

Create TABLE Employee (
EmpCode char(6) PRIMARY KEY,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
Birthday smalldatetime NOT NULL,
Gender bit DEFAULT 1,
[Address] varchar(100),
DepartID int,
Salary Money,
PRIMARY KEY (EmpCode),
CONSTRAINT fk_Department FOREIGN KEY (DepartID) REFERENCES Department(DepartId),
);
--cau1
--insert into department table
INSERT INTO Department (DepartId, DepartName, Description)
VALUES 
    (101, 'Sales', 'Ban san pham va dich vu'),
    (102, 'Marketing', 'Quang ba cac san pham'),
    (103, 'HumanResources', 'Tuyen dung nhan vien');
GO

-- insert into employee table
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES
    ('E10101', 'Quang', 'Nam', '2000-01-01', 1, 'Ha Noi', 101, 50000),
    ('E10102', 'Hai', 'Bien', '1999-05-12', 0, 'Bac Ninh', 101, 55000),
    ('E10201', 'Thanh', 'An', '1985-07-23', 1, 'Bac Kan', 102, 60000),
    ('E10202', 'Chi', 'Cong', '1990-10-15', 0, 'Hai Phong', 102, 65000),
    ('E10301', 'Minh', 'Ngoc', '1979-03-07', 1, 'Da Nang', 103, 70000),
    ('E10302', 'Anh', 'Dung', '2003-11-28', 0, 'Ha Noi', 103, 75000);
GO
--cau 2
UPDATE Employee
SET Salary = Salary * 1.1;
--cau3
ALTER TABLE Employee
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);

--cau 6

CREATE VIEW EmployeeDepartmentView
AS
SELECT e.EmpCode, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, d.DepartName AS DepartmentName
FROM Employee e
INNER JOIN Department d ON e.DepartID = d.DepartId;
SELECT * FROM EmployeeDepartmentView;
go
