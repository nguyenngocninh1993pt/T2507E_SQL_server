CREATE DATABASE assignment_5; 
USE assignment_5; 

CREATE TABLE nhacungcap(
	MaNhaCC VARCHAR(100) PRIMARY KEY,
	TenNhaCC NVARCHAR(255), 
	DiaChi VARCHAR(100), 
	SoDT VARCHAR(100), 
	MaSoThue VARCHAR(100)
); 

CREATE TABLE loaidichvu(
	MaLoaiDV VARCHAR(100) PRIMARY KEY, 
	TenLoaiDV NVARCHAR(255), 
); 

CREATE TABLE mucphi(
	MaMP VARCHAR(100) PRIMARY KEY, 
	DonGia DECIMAL, 
	MoTa NVARCHAR(255)
); 

CREATE TABLE dongxe(
	DongXe VARCHAR(100) PRIMARY KEY,
	HangXe VARCHAR(100), 
	SoChoNgoi INT
); 

CREATE TABLE dangkycungcap(
	MaDKCC VARCHAR(100) PRIMARY KEY, 
	MaNhaCC VARCHAR(100) FOREIGN KEY REFERENCES nhacungcap(MaNhaCC),
	MaLoaiDV VARCHAR(100) FOREIGN KEY REFERENCES loaidichvu(MaLoaiDV), 
	DongXe VARCHAR(100) FOREIGN KEY REFERENCES dongxe(DongXe), 
	MaMP VARCHAR(100) FOREIGN KEY REFERENCES mucphi(MaMP), 
	NgayBatDauCungCap DATE, 
	SoLuongXeDangKy INT
); 
ALTER TABLE dangkycungcap
ADD NgayKetThucCungCap DATE; 



INSERT INTO nhacungcap(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) VALUES
('NCC001', 'Cty TNHH Toàn Pháp', 'Hai Chau', '05113999888', '568941'),
('NCC002', 'Cty Cổ phần Đông Du', 'Lien Chieu', '05113999889', '456789'),
('NCC003', 'Ông Nguyễn Văn A', 'Hoa Thuan', '05113999990', '321456'),
('NCC004', 'Cty Cổ phần Toàn Cầu Xanh', 'Hai Chau', '0511368945', '513364'),
('NCC005', 'Cty TNHH AMA', 'Thanh Khe', '05113875466', '546546'),
('NCC006', 'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545'),
('NCC007', 'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113207'),
('NCC008', 'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230'),
('NCC009', 'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121', '533654'),
('NCC010', 'Cty Cổ phần Rạng Đông', 'Lien Chieu', '05113569654', '187864');

INSERT INTO loaidichvu(MaLoaiDV, TenLoaiDV) VALUES
('DV01', N'Dịch vụ xe taxi'),
('DV02', N'Dịch vụ xe buýt công cộng theo tuyến cố định'),
('DV03', N'Dịch vụ xe cho thuê theo hợp đồng');

INSERT INTO mucphi(MaMP, DonGia, MoTa) VALUES
('MP01', 10000, N'Áp dụng từ 1/2015'),
('MP02', 15000, N'Áp dụng từ 2/2015'),
('MP03', 20000, N'Áp dụng từ 1/2010'),
('MP04', 25000, N'Áp dụng từ 2/2011');

INSERT INTO dongxe(DongXe, HangXe, SoChoNgoi) VALUES 
('Hiace', 'Toyota', 16),
('Vios', 'Toyota', 5),
('Escape', 'Ford', 5),
('Cerato', 'KIA', 7),
('Forte', 'KIA', 5),
('Starex', 'Hyundai', 7),
('Grand-i10', 'Hyundai', 7);

INSERT INTO dangkycungcap(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) VALUES
('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015-11-20', '2016-11-20', 3),
('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015-11-23', '2016-11-23', 5),
('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2015-11-20', '2016-11-20', 7),
('DK004', 'NCC004', 'DV01', 'Forte', 'MP01', '2015-11-23', '2016-11-23', 2),
('DK005', 'NCC005', 'DV02', 'Starex', 'MP02', '2015-11-24', '2016-11-24', 4),
('DK006', 'NCC006', 'DV03', 'Vios', 'MP03', '2015-11-25', '2016-11-25', 6),
('DK007', 'NCC001', 'DV01', 'Escape', 'MP01', '2015-11-26', '2016-11-26', 3),
('DK008', 'NCC002', 'DV02', 'Forte', 'MP02', '2015-11-27', '2016-11-27', 5),
('DK009', 'NCC003', 'DV03', 'Hiace', 'MP03', '2015-11-28', '2016-11-28', 7),
('DK010', 'NCC004', 'DV01', 'Vios', 'MP01', '2015-11-29', '2016-11-29', 2),
('DK011', 'NCC005', 'DV02', 'Forte', 'MP02', '2015-11-30', '2016-11-30', 4),
('DK012', 'NCC006', 'DV03', 'Escape', 'MP03', '2015-12-01', '2016-12-01', 6),
('DK013', 'NCC001', 'DV01', 'Grand-i10', 'MP01', '2015-12-02', '2016-12-02', 3),
('DK014', 'NCC002', 'DV02', 'Escape', 'MP02', '2015-12-03', '2016-12-03', 5),
('DK015', 'NCC003', 'DV03', 'Vios', 'MP03', '2015-12-04', '2016-12-04', 7),
('DK016', 'NCC004', 'DV01', 'Forte', 'MP01', '2015-12-05', '2016-12-05', 2),
('DK017', 'NCC005', 'DV02', 'Hiace', 'MP02', '2015-12-06', '2016-12-06', 4),
('DK018', 'NCC006', 'DV03', 'Forte', 'MP03', '2016-08-24', '2016-09-25', 6);

SELECT * FROM dongxe WHERE SoChoNgoi >= 5; 

SELECT 
	ncc.TenNhaCC, mp.DonGia, dxe.HangXe
FROM dangkycungcap dky
INNER JOIN dongxe dxe ON dky.DongXe = dxe.DongXe
INNER JOIN mucphi mp ON dky.MaMP = mp.MaMP
INNER JOIN nhacungcap ncc ON dky.MaNhaCC = ncc.MaNhaCC
WHERE (dxe.HangXe = 'Toyota' AND mp.DonGia = 15000) OR (dxe.HangXe = 'Kia' AND mp.DonGia = 20000); 

SELECT * 
FROM nhacungcap
ORDER BY TenNhaCC ASC, MaSoThue DESC; 

SELECT COUNT(TenNhaCC) AS SoLuongDangKy, TenNhaCC 
FROM nhacungcap
WHERE MaNhaCC IN (SELECT MaNhaCC FROM dangkycungcap WHERE NgayBatDauCungCap = '2015-11-20')
GROUP BY TenNhaCC; 

SELECT DISTINCT Hangxe FROM dongxe;

SELECT 
	dky.MaDKCC,
	ncc.MaNhaCC,
	ncc.TenNhaCC,
	ncc.DiaChi, 
	ncc.MaSoThue,
	ldv.TenLoaiDV,
	mp.DonGia,
	dxe.HangXe,
	dky.NgayBatDauCungCap,
	dky.NgayKetThucCungCap	
FROM dangkycungcap dky 
INNER JOIN nhacungcap ncc ON dky.MaNhaCC = ncc.MaNhaCC
INNER JOIN loaidichvu ldv ON dky.MaLoaiDV = ldv.MaLoaiDV
INNER JOIN dongxe dxe ON dky.DongXe = dxe.DongXe
INNER JOIN mucphi mp ON dky.MaMP = mp.MaMP;

SELECT *
FROM nhacungcap
WHERE MaNhaCC IN (SELECT MaNhaCC FROM dangkycungcap WHERE DongXe IN (SELECT DongXe FROM dongxe WHERE DongXe IN ('Hiace', 'Cerato')));

SELECT ncc.*
FROM nhacungcap ncc
LEFT JOIN dangkycungcap dky ON ncc.MaNhaCC = dky.MaNhaCC
WHERE dky.MaNhaCC IS NULL;

