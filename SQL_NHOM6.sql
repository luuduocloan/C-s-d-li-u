CREATE DATABASE NHOM_6
USE NHOM_6
DROP DATABASE NHOM_6
CREATE TABLE NGUOIMUA 
(
	MaNMH NCHAR(20)NOT NULL CONSTRAINT PK_NGUOIMUA PRIMARY KEY,
	TenNMH NVARCHAR (50) NOT NULL ,
	DiaChi NVARCHAR(50) NOT NULL
	)
CREATE TABLE HANGHOA
(
	MaHH NCHAR(20) NOT NULL CONSTRAINT PK_HANGHOA PRIMARY KEY,
	TenHH NVARCHAR(50) NOT NULL CONSTRAINT UQ_TENHH UNIQUE,
	DonVi NVARCHAR(50) NOT NULL,
	DonGia INT NOT NULL,
	KLTB INT NOT NULL,
	HSD DATE NOT NULL
)

CREATE TABLE DATHANG
( 
	MaDBH NCHAR(20) NOT NULL, 
	MaNMH NCHAR(20)NOT NULL CONSTRAINT FK_NGUOIMUA_DATHANG FOREIGN KEY REFERENCES NGUOIMUA(MaNMH),
	MaHH NCHAR(20) NOT NULL CONSTRAINT FK_HANGHOA_DATHANG FOREIGN KEY REFERENCES HANGHOA(MaHH),
	SoLuong int not null,
	ThanhTien int ,
	ThueGTGT int,
	NgayXuat date not null,
	Constraint Pk_DATHANG primary key (MaDBH, MaNMH, MaHH)
)
CREATE TABLE NGUOIDATHANG
(
	MaNDH NCHAR(20) NOT NULL CONSTRAINT PK_NGDATHANG PRIMARY KEY,
	TenNDH NVARCHAR(50) NOT NULL 
)
CREATE TABLE KHO 
(
	MaKho NCHAR (30) NOT NULL CONSTRAINT PK_KHO PRIMARY KEY,
	TenKho NVARCHAR (50) NOT NULL CONSTRAINT UQ_TENKHO UNIQUE,
	DChiKho NCHAR (50) NOT NULL,
	LHDH INT)

CREATE TABLE XUATKHO
(
	SoHDX NCHAR(20)  not null, 
	MaKho NCHAR(30) NOT NULL,
	MaNDH NCHAR(20) NOT NULL, 
	MaHH NCHAR(20) NOT NULL,
	NgayXK DATE,
	YeuCau int,
	ThucXuat int,
	TongKLTB int,
	CONSTRAINT FK_KHO_XUATKHO foreign key (MaKho) references KHO(MaKho),
	CONSTRAINT FK_NDH_XUATKHO foreign key (MaNDH) references NGUOIDATHANG(MaNDH),
	CONSTRAINT FK_HH_XUATKHO foreign key (MaHH) references HANGHOA(MaHH),
	CONSTRAINT FK_XUATKHO PRIMARY KEY (SoHDX,MaKho,MaNDH,MaHH)
)
/*------*/
INSERT INTO NGUOIMUA (MaNMH, TenNMH, DiaChi) -- khách hàng của tổng công ty nhật nam food
VALUES
 ( N'M001',N'LOAN',N'VINH'),
 ( N'M002',N'THƯ',N'ĐÀ NẴNG'),
 ( N'M003',N'GIANH',N'VINH'),
 ( N'M004',N'HƯƠNG',N'ĐÀ NẴNG'),
 ( N'M005',N'THỦY',N'VINH')

INSERT INTO HANGHOA (MaHH, TenHH, DonVi, DonGia, KLTB, HSD) VALUES
(N'H101',N'TÁO MĨ',N'THÙNG',5000,50,'2023-12-23'),
(N'H102',N'XOÀI',N'THÙNG',6400,50,'2022-10-24'),
(N'H103',N'NHÃN',N'THÙNG',500,50,'2024-01-11'),
(N'H104',N'CHUỐI',N'THÙNG',2800,100,'2024-12-15'),
(N'H105',N'ĐÀO',N'THÙNG',1500,50,'2023-12-23'),
(N'H106',N'MẬN',N'THÙNG',6200,50,'2022-10-24'),
(N'H107',N'LÊ',N'THÙNG',750,50,'2024-01-11'),
(N'H108',N'HỒNG',N'THÙNG',1400,100,'2024-02-28'),
(N'H109','TÁO HÀN',N'THÙNG',5500,200,'2024-10-22')

INSERT INTO NGUOIDATHANG (MaNDH, TenNDH) VALUES --các chi nhánh của tổng công ty nhật nam food
(N'DH201',N'NHẬT NAM 1'),
(N'DH202',N'NHẬT NAM 2')
select * from NGUOIDATHANG
INSERT INTO KHO (MaKho, TenKho, DChiKho, LHDH) VALUES
(N'K301',N'SK1',N'HÀ NỘI',090500102),
(N'K302',N'SK2',N'HỒ CHÍ MINH',0905002003),
(N'K303',N'SK3',N'HƯNG YÊN',0905003004),
(N'K304',N'SK4',N'BÌNH ĐỊNH',0862836722),
(N'K305',N'SK5',N'AN GIANG',0905002246),
(N'K306',N'SK6',N'ĐÀ NẴNG',0905007389)

INSERT INTO DATHANG (MaDBH,MaNMH,MaHH,SoLuong, ThanhTien, ThueGTGT, NgayXuat) VALUES -- do người mua hàng nhỏ lẻ ở tp đà nẵng mua ở công ty nhật nam food
(N'DDH401',N'M001',N'H101',500,'','','2023-11-20'),
(N'DDH402',N'M002',N'H102',200,'','','2023-11-20'),
(N'DDH403',N'M002',N'H103',100,'','','2023-11-20'),
(N'DDH401',N'M002',N'H101',700,'','','2023-11-20'),
(N'DDH402',N'M003',N'H102',100,'','','2023-11-20'),
(N'DDH403',N'M003',N'H103',400,'','','2023-11-20')

select * from DATHANG

INSERT INTO XUATKHO (SoHDX,MaKho,MaNDH,MaHH,NgayXK, YeuCau, ThucXuat, TongKLTB) VALUES -- các kho lớn tornong xuất hàng hóa tới cho các chi nhánh ở công ty nhật nam food.
(N'X501',N'K301',N'DH201',N'H101','2023-11-30',400,400,''),
(N'X502',N'K301',N'DH201',N'H102','2023-11-30',300,300,''),
(N'X503',N'K302',N'DH201',N'H103','2023-11-30',100,100,''),
(N'X504',N'K302',N'DH201',N'H104','2023-11-30',700,700,''),
(N'X505',N'K303',N'DH202',N'H105','2023-11-30',600,600,''),
(N'X506',N'K303',N'DH202',N'H106','2023-11-30',500,500,''),
(N'X507',N'K304',N'DH202',N'H107','2023-11-30',800,800,''),
(N'X508',N'K304',N'DH202',N'H108','2023-11-30',200,200,'')

/*---------------------------------------TRUY VẤN-------------------*/
/*1.Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó. CẬP NHẬT THÀNH TIỀN CHO BẢNG ĐẶT HÀNG.
2. Đối với các đơn đặt hàng có sản phẩm là táo thì thuế suất giá trị gia tăng là 5%.tiến hành update
3.Tìm ra các sản phẩm đã hết hạn sử dụng.
4.CẬP NHẬT TongKLTB cho mỗi hóa đơn xuất kho, Tìm top 3 Đơn hàng đã xuất kho gần đây nhất 
5.In ra các hóa đơn đặt hàng đã bán ra trong ngày 20/11/2023-----
6.Tìm sản phẩm best seller của Nhật Nam food-----(sản phẩm bản có số lượng nhiều nhất)
7.Tìm MaDBH có tổng tiền cao nhất
8.Thống kê các sản phẩm mà Nhật Nam 1 chưa nhập từ kho SK1
9.Tìm khách hàng là khách vip (khách quen - mua nhiều nhất) của nhật nam food
10.Tìm sản phẩm mà Nhật Nam bán đạt Doanh thu cao nhất trong 3 tháng gần đây
*/

GO
-----1.Trị giá của một đơn đặt hàng là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó. CẬP NHẬT THÀNH TIỀN CHO BẢNG ĐẶT HÀNG.
UPDATE DATHANG
SET ThanhTien = DonGia*SoLuong
FROM DATHANG JOIN HANGHOA ON DATHANG.MaHH = HANGHOA.MaHH
select * from DATHANG
-----2. Đối với các đơn đặt hàng có sản phẩm là táo thì thuế suất giá trị gia tăng là 5%.tiến hành update
UPDATE DATHANG
SET ThueGTGT = 0.05 * ThanhTien
FROM DATHANG
JOIN HANGHOA ON DATHANG.MaHH = HANGHOA.MaHH
WHERE HANGHOA.TenHH like 'Táo%'
select *from DATHANG
-----3. tìm ra các sản phẩm đã hết hạn sử dụng.
SELECT MaHH, TenHH, HSD as 'Hạn sử dụng'
FROM HANGHOA
WHERE HSD < GETDATE()

------4.CẬP NHẬT TongKLTB cho mỗi hóa đơn xuất kho, Tìm top 3 Đơn hàng đã xuất kho gần đây nhất 
update XUATKHO
set TongKLTB=KLTB*ThucXuat
from XUATKHO K join HANGHOA H on K.MaHH=H.MaHH

select *from XUATKHO
SELECT TOP 3 SoHDX,MaKho,MaNDH,NgayXK 
from XUATKHO 
order by NgayXK desc

------5.in ra các hóa đơn đặt hàng đã bán ra trong ngày 20/11/2023-----
SELECT DH.MaDBH, DH.MaNMH, DH.MaHH, DH.SoLuong, DH.ThanhTien, DH.ThueGTGT, DH.NgayXuat
FROM DATHANG DH
WHERE DH.NgayXuat = '2023-11-20'

------6.Tìm sản phẩm best seller của Nhật Nam food-----(sản phẩm bản có số lượng nhiều nhất)
SELECT DH.MaHH, H.TenHH, SUM(DH.SoLuong) AS 'Tổng sl bán'
FROM DATHANG DH JOIN HANGHOA H ON DH.MaHH = H.MaHH
GROUP BY DH.MaHH, H.TenHH
HAVING Sum(DH.SoLuong)>=ALL
				(select Sum(DH.SoLuong)
				from DATHANG DH JOIN HANGHOA H ON DH.MaHH=H.MaHH
				group by DH.MaHH,H.TenHH)
------7. Tìm MaDBH có tổng tiền cao nhất 
SELECT DH.MaDBH, DH.MaNMH, DH.MaHH, SUM(DH.ThanhTien) AS 'Tổng tiền', DH.ThueGTGT, DH.NgayXuat
FROM DATHANG DH
GROUP BY DH.MaDBH, DH.MaNMH, DH.MaHH, DH.ThueGTGT, DH.NgayXuat
HAVING SUM(DH.ThanhTien) >= ALL 
        (SELECT SUM(ThanhTien) AS 'Tổng tiền'
        FROM DATHANG DH
        GROUP BY DH.MaDBH, DH.MaNMH, DH.MaHH, DH.ThueGTGT, DH.NgayXuat)
    
-- 8.Thống kê các sản phẩm mà Nhật Nam 1 chưa nhập từ kho SK1
select HANGHOA.MaHH, TenHH
from HANGHOA, XUATKHO, NGUOIDATHANG
where HANGHOA.MaHH=XUATKHO.MaHH and NGUOIDATHANG.MaNDH=XUATKHO.MaNDH and TenNDH=N'NHẬT NAM 1'
except
select HANGHOA.MaHH, TenHH
from HANGHOA, KHO, XUATKHO
where HANGHOA.MaHH=XUATKHO.MaHH and KHO.MaKho=XUATKHO.MaKho and TenKho=N'SK1'

-- 9.Tìm khách hàng là khách vip (khách quen - mua nhiều nhất) của nhật nam food
select TOP 1 NGUOIMUA.MaNMH,TenNMH, count(MaDBH) 'SLDONMUA'
from NGUOIMUA, DATHANG
where NGUOIMUA.MaNMH=DATHANG.MaNMH
group by NGUOIMUA.MaNMH,TenNMH
order by 'SLDONMUA' desc

-- 10.Tìm sản phẩm mà Nhật Nam bán đạt Doanh thu cao nhất trong 3 tháng gần đây
select TOP 1 HANGHOA.MaHH, TenHH, sum(ThanhTien) 'TongTien'
from HANGHOA,DATHANG
where HANGHOA.MaHH=DATHANG.MaHH and (month(NgayXuat) between 8 and 12) and year(NgayXuat)=2023
group by HANGHOA.MaHH, TenHH
order by TongTien desc
