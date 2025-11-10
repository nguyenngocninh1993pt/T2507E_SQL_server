CREATE DATABASE bookstore
USE bookstore; 

CREATE TABLE book(
	id_book INT PRIMARY KEY,
	book_name VARCHAR(100) NOT NULL, 
	version INT, 
	author VARCHAR(100), 
	content TEXT, 
	public_year CHAR(4), 
	price DECIMAL, 
	qty INT, 
	id_publisher INT FOREIGN KEY REFERENCES publisher(id_publisher),
	id_category INT FOREIGN KEY REFERENCES book_category(id_category)
); 

CREATE TABLE publisher(
	id_publisher INT PRIMARY KEY IDENTITY(1,1), 
	publisher_name VARCHAR(100),
	publisher_address VARCHAR(100)
); 

CREATE TABLE book_category(
	id_category INT PRIMARY KEY IDENTITY(1,1), 
	category_name VARCHAR(100), 
); 


INSERT INTO book_category (category_name) VALUES('Khoa hoc xa hoi'); 

INSERT INTO publisher(publisher_name, publisher_address) VALUES('Tri thuc', '53, Nguyen Du, Hai Ba Trung, Ha Noi'); 

INSERT INTO book(id_book, book_name, version, author, content, public_year, price, qty, id_category, id_publisher) 
	VALUES(1, 'Tri tue Do Thai', 1, 'Eran Katz', 'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốc
trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ
những bí ẩn về sự thông thái của người Do Thái, của một dân tộc
thông tuệ với những phương pháp và kỹ thuật phát triển tầng lớp trí
thức đã được giữ kín hàng nghìn năm như một bí ẩn mật mang tính
văn hóa.', '2010', 79000, 100, 1, 1); 


SELECT * FROM book WHERE public_year >= '2008'; 

SELECT TOP 10 * FROM book ORDER BY price DESC; 
 
SELECT * FROM book WHERE content LIKE '%tin học%'; 

SELECT * FROM book WHERE content LIKE 'T%'; 

SELECT * FROM book WHERE id_publisher IN (SELECT id_publisher FROM publisher WHERE publisher_name = 'Tri thuc');

SELECT * FROM publisher WHERE id_publisher IN (SELECT id_publisher FROM book WHERE book_name = 'Tri tue Do Thai'); 

SELECT b.id_book AS [Ma sach], b.book_name AS [Ten sach], b.public_year AS [Nam xuat ban], p.publisher_name AS [Nha xuat ban], bc.category_name AS [Loai sach]
FROM book b 
INNER JOIN book_category bc ON b.id_category = bc.id_category 
INNER JOIN publisher p ON p.id_publisher = b.id_publisher;

SELECT TOP 1 *
FROM Book
ORDER BY price DESC;

SELECT TOP 1 *
FROM Book
ORDER BY qty DESC;

SELECT *
FROM Book
WHERE author = 'Eran Katz';

UPDATE Book
SET price = price * 0.9
WHERE public_year <= 2008;

SELECT 
    p.publisher_name,
    COUNT(b.id_book) AS so_dau_sach
FROM Book b
INNER JOIN Publisher p ON b.id_publisher = p.id_publisher
GROUP BY p.publisher_name;

SELECT 
    c.category_name,
    COUNT(b.id_book) AS so_dau_sach
FROM Book b
INNER JOIN Book_Category c ON b.id_category = c.id_category
GROUP BY c.category_name;

CREATE INDEX idx_book_name
ON Book(book_name);

CREATE VIEW vw_BookInfo AS
SELECT 
    b.id_book,
    b.book_name,
    b.author,
    p.publisher_name,
    b.price
FROM Book b
INNER JOIN Publisher p ON b.id_publisher = p.id_publisher;

CREATE PROCEDURE SP_Them_Sach
    @book_name NVARCHAR(255),
    @author NVARCHAR(255),
    @version NVARCHAR(50),
    @content NVARCHAR(MAX),
    @public_year INT,
    @price DECIMAL(18,2),
    @qty INT,
    @id_publisher INT,
    @id_category INT
AS
BEGIN
    INSERT INTO Book (book_name, author, version, content, public_year, price, qty, id_publisher, id_category)
    VALUES (@book_name, @author, @version, @content, @public_year, @price, @qty, @id_publisher, @id_category);
END;

CREATE PROCEDURE SP_Tim_Sach
    @keyword NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM Book
    WHERE book_name LIKE '%' + @keyword + '%'
       OR author LIKE '%' + @keyword + '%';
END;

CREATE PROCEDURE SP_Sach_ChuyenMuc
    @id_category INT
AS
BEGIN
    SELECT *
    FROM Book
    WHERE id_category = @id_category;
END;

CREATE TRIGGER trg_PreventDeleteBook
ON Book
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM deleted WHERE qty > 0)
    BEGIN
        RAISERROR('Khong the xoa sach con trong kho!', 16, 1);
        ROLLBACK;
        RETURN;
    END
    ELSE
    BEGIN
        DELETE FROM Book
        WHERE id_book IN (SELECT id_book FROM deleted);
    END
END;

CREATE TRIGGER trg_PreventDeleteCategory
ON Book_Category
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM Book b
        INNER JOIN deleted d ON b.id_category = d.id_category
    )
    BEGIN
        RAISERROR('Khong the xoa chuyen muc con sach!', 16, 1);
        ROLLBACK;
        RETURN;
    END
    ELSE
    BEGIN
        DELETE FROM Book_Category
        WHERE id_category IN (SELECT id_category FROM deleted);
    END
END;




