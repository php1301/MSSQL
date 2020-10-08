CREATE DATABASE BAI_THUC_HANH_1
GO
USE BAI_THUC_HANH_1
GO
CREATE TABLE KHACHHANG(
    MAKH CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(50) NOT NULL,
    DCHI VARCHAR(50),
    SODT VARCHAR(20) NOT NULL,
    NGSINH smalldatetime CHECK (NGSINH > '01-01-1900'),
    DOANHSO money,
    NGDK smalldatetime,
)
GO
CREATE TABLE NHANVIEN(
    MANV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40) NOT NULL,
    SODT VARCHAR(20) UNIQUE,
    NGVL smalldatetime,
)
GO
CREATE TABLE SANPHAM(
    MASP CHAR(4) PRIMARY KEY,
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA money, 
)
GO
CREATE TABLE HOADON(
    SOHD INT PRIMARY KEY, 
    NGHD smalldatetime,
    MAKH CHAR(4),
    --* PHAT SINH NGAU NHIEN
    -- MAKH CHAR(4) REFERENCES KHACHHANG(MAKH), *--
 
    MANV CHAR(4),
    TRIGIA money,
)
GO
CREATE TABLE CTHD(
    SOHD INT,
    MASP CHAR(4),
    -- CONSTRAINT CTHD_SOHD_MASP_PK PRIMARY KEY(SOHD, MASP)
       -- TU DAT TEN
    -- CONSTRAINT CTHD_SOHD_FK FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
    SL INT,
)
GO
alter TABLE HOADON add constraint FK_HOADON_KHACHHANG foreign key(MAKH) REFERENCES KHACHHANG(MAKH)
alter TABLE HOADON add constraint FK_HOADON_NHANVIEN foreign key(MANV) REFERENCES NHANVIEN(MANV)
GO
alter TABLE CTHD add constraint FK_CTHD_SOHD foreign key(SOHD) REFERENCES HOADON(SOHD)
alter TABLE CTHD add constraint FK_CTHD_MASP foreign key(MASP) REFERENCES SANPHAM(MASP)
GO
SET DATEFORMAT DMY 
GO
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV01','NGUYEN NHU NHUT','0927345678','13/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV02','LE THI PHI YEN','0987567390','21/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV03','NGUYEN VAN B','0997047382','27/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV04','NGO THANH TUAN','0913758498','24/06/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV05','NGUYEN THI TRUC THANH','0918590387','20/07/2006')
GO
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH01','NGUYEN VAN A','731TRAN HUNG DAO,Q5,THHCM','08823451','22/10/1960','22/07/2006',13060000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH02','TRAN NGOC HAN','23/5NGUYEN TRAI,Q5,TPHCM','0908256478','03/04/1974','30/07/2006',280000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH03','TRAN NGOC LINH','45NGUYEN CANH CHAN,Q1,TPHCM','0938776266','10/06/1980','05/05/2006',3860000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH04','TRAN MINH LONG','50/34LE DAI HANH,Q10,TPHCM','0917325476','09/03/1965','02/10/2006',250000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH05','LE NHAT MINH','34TRUONG DINH,Q3,TPHCM','08246108','10/03/1950','28/10/2006',21000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH06','LE HOAI THUONG','227NGUYEN VAN CU,Q5,TPHCM','08631738','31/12/1981','24/11/2006',915000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH07','NGUYEN VAN TAM','32/3 TRAN BINH TRONG,Q5,TPHCM','0916783565','06/06/1971','01/12/2006',12500)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH08','PHAN THI THANH','45/2 AN DUONG VUONG,Q5,TPHCM','0938435756','10/01/1971','13/12/2006',365000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH09','LE HA VINH','837 LE HONG PHONG,Q5,TPHCM','08654763','03/03/1979','14/01/2007',70000)
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH10','HA DUY LAP','34/34B NGUYEN TRAI,Q5,TPHCM','08768904','02/05/1983','16/01/2007',67500)
GO
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC01','BUT CHI','CAY','SINGAPORE',3000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC02','BUT CHI','CAY','SINGAPORE',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC03','BUT CHI','CAY','VIETNAM',3500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC04','BUT CHI','HOP','VIETNAM',30000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB01','BUT BI','CAY','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB02','BUT BI','CAY','TRUNGQUOC',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB03','BUT BI','HOP','THAILAN',100000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV01','TAP 100 TRANG GIAY MONG','QUYEN','TRUNGQUOC',2500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV02','TAP 200 TRANG GIAY MONG','QUYEN','TRUNGQUOC',4500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV03','TAP 100 TRANG GIAY TOT','QUYEN','VIETNAM',3000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV04','TAP 200 TRANG GIAY TOT','QUYEN','VIETNAM',5500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV05','TAP 100 TRANG ','CHUC','VIETNAM',23000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV06','TAP 200 TRANG ','CHUC','VIETNAM',53000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV07','TAP 100 TRANG ','CHUC','TRUNGQUOC',34000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST01','SO TAY 500 TRANG','QUYEN','TRUNGQUOC',40000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST02','SO TAY LOAI 1','QUYEN','VIETNAM',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST03','SO TAY LOAI 2','QUYEN','VIETNAM',51000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST04','SO TAY','QUYEN','THAILAN',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST05','SO TAY MONG','QUYEN','THAILAN',20000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST06','PHAN VIET BANG','HOP','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST07','PHAN KHONG BUI','HOP','VIETNAM',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST08','BONG BAMG','CAI','VIETNAM',1000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST09','BUT LONG','CAY','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST10','BUT LONG','CAY','TRUNGQUOC',7000)
GO
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1001,'27/07/2006','KH01','NV01',320000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1002,'10/08/2006','KH01','NV02',840000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1022,'16/01/2007',NULL,'NV03',7000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1023,'17/01/2007',NULL,'NV01',330000)
GO
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'ST01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'BC01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'BC02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'ST08',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BC04',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BB01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BB02',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1003,'BB03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV04',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1005,'TV05',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1005,'TV06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'TV07',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'ST01',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'ST02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1007,'ST03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1008,'ST04',8)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1009,'ST05',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'TV07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST08',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST04',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'TV03',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1011,'ST06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1012,'ST07',3)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1013,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BC02',80)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BB02',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BC04',60)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BB01',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1015,'BB02',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1015,'BB03',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1016,'TV01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV02',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV03',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV04',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1018,'ST04',6)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1019,'ST05',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1019,'ST06',2)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1020,'ST07',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'TV01',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1022,'ST07',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1023,'ST04',6)

-- USE SQLDB1
-- DROP DATABASE BAI_THUC_HANH_1

-- 2. Them thuoc tinh ghi chu co kieu du lieu varchar(20) cho quan he SANPHAM
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)
-- 3. Them vao thuoc tinh LOAIKH co kieu du lieu la tinyint cho quan he khach hang*/
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT
-- 4. Sua kieu du lieu GHICHu thanh varchar(100)
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)
SELECT * FROM SANPHAM
-- 5. Xoa column GHICHU
ALTER TABLE SANPHAM DROP COLUMN GHICHU
SELECT * FROM SANPHAM
-- 6. Lam the nao de thuoc tinh LOAIKH trong quan he KHACHHANG co the luu cac gia tri la:"vang lai","thuong xuyen","vip"...*/
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(50)
-- 7. Don vi cua san pham chi co the la 'cay' 'cai 'quyen' 'chuc'
ALTER TABLE SANPHAM add CONSTRAINT SP_DVT check(DVT='cay' or DVT='hop' or DVT='cai' or DVT='quyen' or DVT='chuc')
-- 8. Gia san pham phai 500 tro len
ALTER TABLE SANPHAM add CONSTRAINT SP_GIA check(GIA >= 500)
-- 9. Moi lan mua khach hang phai mua it nhat 1 san pham
ALTER TABLE CTHD add CONSTRAINT CTHD_SL check(SL>1)
-- 10. Ngay khach hang dang ki phai lon hon ngay sinh
ALTER TABLE KHACHHANG add CONSTRAINT KHACHHANG_NGSINH_NGDK check(NGSINH<NGDK)
-- 11. Ngay mua phai be hon ngay dang ky
ALTER TABLE HOADON ADD CONSTRAINT HOADON_NGHD CHECK(NGHD<=GETDATE())

-- II
/*1.Nhap du lieu cho cac quan he sau*/
/*2.Tao quan he SANPHAM1 chua toan bo du lieu cua quan he SANPHAM.Tao quan he KHACHHANG1 chua toan bo du lieu cua quan he KHACHHANG.*/
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * FROM SANPHAM1
/*3.Cap nhat gia tang 5% doi voi nhung san pham do "thai lan" san xuat (cho quan he SANPHAM)*/

UPDATE SANPHAM1
SET GIA = GIA*1.05
WHERE (NUOCSX ='THAILAN')
SELECT * FROM SANPHAM1
GO
/*4.Cap nhat gia giam 5% doi voi nhung san pham do "trung quoc " san xuat co gia tu 10000 tro xuong (cho quan he SANPHAM)*/
UPDATE SANPHAM1
SET GIA = GIA*1.05
WHERE((GIA<10000) and (NUOCSX='TRUNGQUOC'))
SELECT * FROM SANPHAM1
/*5.Cap nhat gia tri LOAIKH la "vip" doi voi nhung khach hang dang ky thanh vien truoc ngay 1/1/2007 co doanh so tu 10000000 tro len hoac khach hang dang ky thanh vien tu 1/1/2007 tro ve sau co doanh do tu 2000000 tro len (cho quan he KHACHHANG)*/
SELECT * INTO KHACHHANG1 FROM KHACHHANG
UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE((NGDK<'01/01/2007' AND DOANHSO >1000000) OR (NGDK > '01/01/2007' AND DOANHSO>2000000))
SELECT * FROM KHACHHANG1

-- III
-- 1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP from SANPHAM
WHERE(NUOCSX='TRUNGQUOC')
-- 2. In ra danh sách các sản phẩm co don vi tinh la cay quyen.
SELECT MASP, TENSP from SANPHAM
WHERE(DVT='cay' or DVT='quyen')
-- 3. In ra danh sách các sản phẩm (MASP,TENSP) co B va ket thuc la 01
SELECT MASP, TENSP from SANPHAM
WHERE(MASP like 'B%01')
-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP from SANPHAM
WHERE(GIA>30000 and GIA<40000 and NUOCSX='TRUNGQUOC')
-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP from SANPHAM
WHERE(GIA between 30000 and 40000 and(NUOCSX='TRUNGQUOC' OR NUOCSX='THAILAN'))
-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA from HOADON
WHERE (NGHD='01/01/2007' OR NGHD='02/01/2007')
-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA from HOADON
WHERE (MONTH(NGHD)=1 and YEAR(NGHD)=2007)
ORDER BY NGHD ASC, TRIGIA DESC
-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT KH.MAKH, HOTEN
FROM KHACHHANG KH, HOADON HD 
WHERE(KH.MAKH = HD.MAKH and HD.NGHD = '01/01/2007') 
-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SET DATEFORMAT DMY 
SELECT HOADON.SOHD, TRIGIA
FROM HOADON inner join NHANVIEN on HOADON.MANV = NHANVIEN.MANV
WHERE NGHD = '28/10/2006' AND HOTEN = 'NGUYEN VAN B'
-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT TENSP, MASP FROM SANPHAM WHERE MASP IN 
(SELECT MASP FROM CTHD WHERE SOHD IN 
(SELECT SOHD FROM HOADON WHERE NGHD between '1/10/2006' and '31/10/2006' and MAKH IN
(SELECT MAKH FROM KHACHHANG WHERE HOTEN='Nguyen Van A')
)
)

SELECT SANPHAM.MASP, TENSP FROM 
(HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH) 
INNER JOIN 
(CTHD INNER JOIN SANPHAM on CTHD.MASP = SANPHAM.MASP ) 
on CTHD.SOHD = HD.SOHD 
 WHERE (NGHD between '1/10/2006' and '31/10/2006') AND HOTEN='Nguyen Van A'
-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT SOHD from CTHD
WHERE MASP='BB01' or MASP = 'BB02'