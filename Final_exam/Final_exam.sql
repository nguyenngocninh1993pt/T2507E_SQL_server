
			-- Bài 1

Normalization steps:

1NF: Each column holds atomic values → table already satisfies 1NF.

2NF: Remove partial dependencies.
     => Separate DEPARTMENT table (DeptCode, DeptName).
     Each employee belongs to one department.

3NF: Remove transitive dependencies.
     => Separate SALARY table because salary attributes 
        (WorkingDays, GrossSalary, etc.) depend on EmployeeCode, 
        not on Department.
        
Final tables (3NF):

1. Department(DeptCode PK, DeptName)
2. Employee(EmployeeCode PK, EmployeeName, DeptCode FK)
3. Salary(SalaryID PK, EmployeeCode FK, WorkingDays, PaidOffDays, 
          UnpaidOffDays, BasicSalary, GrossSalary, NetSalary, Note)

			-- Bài 2

CREATE DATABASE final_exam;
USE final_exam;

-- Department table
CREATE TABLE Department (
    DeptCode VARCHAR(10) PRIMARY KEY,
    DeptName NVARCHAR(50)
);

-- Employee table
CREATE TABLE Employee (
    EmployeeCode VARCHAR(10) PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    DeptCode VARCHAR(10),
    FOREIGN KEY (DeptCode) REFERENCES Department(DeptCode)
);
SELECT * FROM Employee; 

-- Salary table
CREATE TABLE Salary (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeCode VARCHAR(10),
    WorkingDays INT,
    PaidOffDays INT,
    UnpaidOffDays INT,
    BasicSalary DECIMAL(10,2),
    GrossSalary DECIMAL(10,2),
    NetSalary DECIMAL(10,2),
    Note NVARCHAR(100),
    FOREIGN KEY (EmployeeCode) REFERENCES Employee(EmployeeCode)
);
SELECT * FROM Salary; 

-- Insert data
INSERT INTO Department VALUES
('IT', N'Information Technology'),
('HR', N'Human Resources'),
('SALE', N'Sales');

INSERT INTO Employee VALUES
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('A3', N'Trần Văn Nam', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('D2', N'Trần Văn Toàn', 'HR'),
('B2', N'Huỳnh Anh', 'SALE'),
('C2', N'Lê Tú Chinh', 'SALE');

INSERT INTO Salary (EmployeeCode, WorkingDays, PaidOffDays, UnpaidOffDays, BasicSalary, GrossSalary, NetSalary, Note)
VALUES
('A1',22,0,0,1000,22000,20000,N''),
('A2',21,1,0,1200,26400,23000,N''),
('A3',22,0,0,1200,26400,23000,N''),
('B1',20,1,1,600,13200,12000,N''),
('D1',20,1,1,500,11000,10000,N''),
('C1',22,0,0,500,11000,10000,N''),
('D2',22,0,0,500,11000,10000,N''),
('B2',21,1,0,1200,26400,23000,N''),
('C2',22,0,0,1200,26400,23000,N'');



			-- Bài 3

CREATE PROCEDURE TotalSalaryByDepartment
AS
BEGIN
    SELECT 
        e.DeptCode,
        d.DeptName,
        SUM(s.NetSalary) AS TotalNetSalary
    FROM Employee e
    JOIN Salary s ON e.EmployeeCode = s.EmployeeCode
    JOIN Department d ON e.DeptCode = d.DeptCode
    GROUP BY e.DeptCode, d.DeptName
    ORDER BY e.DeptCode;
END;

-- Execute the procedure
EXEC sp_TotalSalaryByDepartment;

