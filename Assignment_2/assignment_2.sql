CREATE DATABASE assignment_4; 
USE assignment_4; 
 
		-- 2. Viet cau lenh thiet ke

CREATE TABLE product_category(
	category_id INT PRIMARY KEY IDENTITY(1,1), 
	product_category VARCHAR(100) NOT NULL, 
	product_name VARCHAR(100) NOT NULL
); 

CREATE TABLE product(
	product_id INT PRIMARY KEY IDENTITY(1,1),
	created_date DATE NOT NULL, 
	category_id INT FOREIGN KEY REFERENCES product_category(category_id)
);

CREATE TABLE person_manage(
	person_id INT PRIMARY KEY IDENTITY(1,1), 
	person_name VARCHAR(100) NOT NULL, 
); 

CREATE TABLE product_person(
	product_id INT FOREIGN KEY REFERENCES product(product_id) NOT NULL, 
	person_id INT FOREIGN KEY REFERENCES person_manage(person_id) NOT NULL
); 

		--3. Chen du lieu vao bang

SELECT * FROM product_category;
INSERT INTO product_category(product_category, product_name) VALUES('Z37E', 'May tinh xach tay Z37'); 

SELECT * FROM product; 
INSERT INTO product(created_date, category_id) VALUES('12-12-09', 1); 

SELECT * FROM person_manage;
INSERT INTO person_manage(person_name) VALUES('Nguyen Van An');

SELECT * FROM product_person; 
INSERT INTO product_person(product_id, person_id) VALUES(1,1); 

		--4. Viet cau lenh truy van 

SELECT * FROM product; 

SELECT * FROM product_category; 

SELECT * FROM person_manage; 

		--5. Viet cau lenh truy van 

SELECT * FROM product_category ORDER BY product_name ASC; 

SELECT * FROM product_person ORDER BY person_name ASC; 

SELECT * FROM product WHERE category_id IN (SELECT category_id FROM product_category WHERE category_id = 1);

SELECT * 
FROM product 
WHERE product_id IN 
	(SELECT product_id FROM product_person WHERE person_id IN 
		(SELECT person_id FROM person_manage WHERE person_name = 'Nguyen Van An')) 
ORDER BY product_id DESC; 

	--6. Viet cau lenh truy van 

SELECT DISTINCT COUNT(*) AS qty_in_category
FROM product
WHERE category_id IN (SELECT category_id FROM product_category WHERE category_id = 1); 

SELECT AVG(product_count) AS average_product_per_category
FROM(
	SELECT COUNT(category_id) FROM product GROUP BY category_id; 

SELECT * FROM product;


	







