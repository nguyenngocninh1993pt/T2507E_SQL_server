CREATE DATABASE assignment_3; 
USE assignment_3; 

		--2. Tao bang voi database da thiet ke

CREATE TABLE persons(
	id_person INT PRIMARY KEY IDENTITY(1,1), 
	name VARCHAR(100) NOT NULL, 
	address VARCHAR(100) NOT NULL, 
	date_of_birth DATE NOT NULL
); 

CREATE TABLE telephones(
	id_tel INT PRIMARY KEY IDENTITY(1,1), 
	tel_number VARCHAR(100) NOT NULL
); 
ALTER TABLE telephones
ADD id_person INT FOREIGN KEY REFERENCES persons(id_person);

		--3. Viet cau lenh them du lieu vao bang	

SELECT * FROM persons; 
INSERT INTO persons(name, address, date_of_birth)
	VALUES('Nguyen Van An', '11 Nguyen Trai- Thanh Xuan- Ha Noi', '11-18-87'); 
INSERT INTO persons(name, address, date_of_birth)
	VALUES('Nguyen Van A', '12 Nguyen Trai- Thanh Xuan- Ha Noi', '12-12-09');

SELECT * FROM telephones; 
INSERT INTO telephones(tel_number) VALUES('987654321'); 
INSERT INTO telephones(tel_number) VALUES('09873452'); 
INSERT INTO telephones(tel_number) VALUES('98732323'); 
INSERT INTO telephones(tel_number) VALUES('09434343');
UPDATE telephones SET id_person = 1; 
INSERT INTO telephones(tel_number, id_person) VALUES('09434343', 2);

		--4. Viet cau lenh truy van

SELECT * FROM persons; 

SELECT * FROM telephones; 

		--5. Viet cau lenh truy van

SELECT * FROM persons ORDER BY name ASC; 

SELECT * FROM telephones WHERE id_person IN (SELECT id_person FROM persons WHERE name = 'Nguyen Van An'); 

SELECT * FROM persons WHERE date_of_birth = '12-12-09'; 

		--6. Viet cau lenh truy van

SELECT COUNT(*) AS number_tel_of_every_person FROM telephones WHERE id_person IN (SELECT id_person FROM persons WHERE name = 'Nguyen Van An'); 

SELECT COUNT(*) AS number_tel_of_every_person FROM telephones WHERE id_person IN (SELECT id_person FROM persons WHERE name = 'Nguyen Van A'); 

SELECT COUNT(*) AS number_person_date_of_birth_12 FROM persons WHERE date_of_birth LIKE '%-12-%'; 

SELECT * FROM persons WHERE id_person IN (SELECT id_person FROM telephones WHERE tel_number = '987654321'); 

SELECT * FROM persons WHERE id_person IN (SELECT id_person FROM telephones WHERE tel_number = '09873452');

SELECT * FROM persons WHERE id_person IN (SELECT id_person FROM telephones WHERE tel_number = '98732323');

SELECT * FROM persons WHERE id_person IN (SELECT id_person FROM telephones WHERE tel_number = '09434343');

SELECT * FROM persons WHERE id_person IN (SELECT id_person FROM telephones WHERE tel_number = '123456789'); 

		--7. Viet cau lenh truy van 

ALTER TABLE persons 
ADD CONSTRAINT check_date_of_birth CHECK (date_of_birth < GETDATE()); 

EXEC sp_helpconstraint 'persons';

EXEC sp_helpconstraint 'telephones';

ALTER TABLE telephones
ADD date_start_to_contact DATE; 

SELECT * FROM telephones; 



