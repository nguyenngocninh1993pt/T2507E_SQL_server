CREATE DATABASE assignment_3; 
SELECT name FROM sys.databases;
USE assignment_3; 

		--2. Viết câu lệnh tạo bảng theo thiết kế 

CREATE TABLE customers (
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	identifier_number VARCHAR(100) NOT NULL, 
	name VARCHAR(100) NOT NULL, 
	address VARCHAR(100) NOT NULL
);

CREATE TABLE telephones (
	telephone_id INT IDENTITY(1,1) PRIMARY KEY, 
	tel_number VARCHAR(100) NOT NULL, 
	category VARCHAR(100) NOT NULL, 
	registration_date DATE NOT NULL,
	customer_id INT FOREIGN KEY REFERENCES customers(customer_id)
); 

		--3. Thêm dữ liệu vào bảng 

SELECT * FROM customers; 
INSERT INTO customers(identifier_number, name, address) VALUES('123456789', 'Nguyen Nguyet Nga', 'Ha noi'); 
INSERT INTO customers(identifier_number, name, address) VALUES('123456788', 'Nguyen Van A', 'Bac Ninh'); 
INSERT INTO customers(identifier_number, name, address) VALUES('123456787', 'Nguyen Van B', 'Thanh pho Ho Chi Minh'); 
INSERT INTO customers(identifier_number, name, address) VALUES('123456786', 'Nguyen Van C', 'Son La'); 

SELECT * FROM telephones; 
INSERT INTO telephones(tel_number, category, registration_date, customer_id) VALUES('123456789', 'tra truoc', '12-12-02', 1); 
INSERT INTO telephones(tel_number, category, registration_date, customer_id) VALUES('123456788', 'tra sau', '12-11-02', 2); 
INSERT INTO telephones(tel_number, category, registration_date, customer_id) VALUES('123456787', 'tra truoc', '06-02-02', 3); 
INSERT INTO telephones(tel_number, category, registration_date, customer_id) VALUES('123456786', 'tra sau', '12-12-09', 4);

		--4. Viết câu lệnh truy vấn

SELECT * FROM customers; 
SELECT * FROM telephones; 

		--5. Viết câu lệnh truy vấn
SELECT * FROM telephones WHERE tel_number = '0123456789'; 

SELECT * FROM customers WHERE identifier_number = '123456789';

SELECT tel_number FROM telephones WHERE customer_id IN(SELECT customer_id FROM customers WHERE identifier_number = '123456789'); 

SELECT tel_number FROM telephones WHERE registration_date = '12-12-09'; 

SELECT tel_number FROM telephones WHERE customer_id IN(SELECT customer_id FROM customers WHERE address = 'Ha noi'); 


		--6. Viết câu lệnh truy vấn 

SELECT COUNT(*) FROM customers; 

SELECT COUNT(*) FROM telephones; 

SELECT COUNT(tel_number) FROM telephones WHERE registration_date = '12-12-09'; 

SELECT c.*, t.* 
FROM telephones t
INNER JOIN customers c ON t.customer_id = c.customer_id;

ALTER TABLE telephones 
ALTER COLUMN registration_date DATE NOT NULL;

UPDATE telephones SET registration_date = GETDATE(); 
SELECT * FROM telephones; 
 
UPDATE telephones SET tel_number = '09' + tel_number
WHERE tel_number NOT LIKE '09%'; 

ALTER TABLE telephones
ADD bonus_core DECIMAL NULL; 







	


