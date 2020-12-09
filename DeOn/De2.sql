CREATE DATABASE DE2 
GO
USE DE2
CREATE TABLE NHANVIEN
(
    MaNV char(5) primary key,
    HoTen VARCHAR(20),
    NgayVL smalldatetime,
    HSLuong NUMERIC(4,2),
    MaPhong char(5),
)

CREATE TABLE PHONGBAN
(
    MaPhong char(5) primary key,
    TenPhong VARCHAR(25),
    TruongPhong char(5),
)

CREATE TABLE XE
(
    MaXe char(5) primary key,
    LoaiXe VARCHAR(20),
    SoChoNgoi int,
    NamSX int,
)

CREATE TABLE PHANCONG
(
    -- CONSTRAINT PK_KETQUATHI_MAHV_MAH_LANTHI PRIMARY KEY (MAHV, MAMH, LANTHI),
    MaPC char(5) primary key,
    MaNV char(5),
    MaXe char(5),
    NgayDi smalldatetime,
    NgayVe smalldatetime,
    NoiDen varchar(25),
)
GO

alter table PHANCONG add constraint FK_PHANCONG_NHANVIEN foreign key (MaNV) REFERENCES NHANVIEN
alter table PHANCONG add constraint FK_PHANCONG_XE foreign key (MaXe) REFERENCES XE
GO
SET DATEFORMAT DMY 
GO
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV01', 'NVA', '12/02/2020', 2, 'P01')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV02', 'NVB', '12/03/2020', 4, 'P01')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV03', 'NVC', '12/04/2020', 5, 'P02')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV04', 'NVD', '12/05/2020', 6, 'P02')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV05', 'NVE', '12/06/2020', 7, 'P02')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV06', 'NVF', '12/07/2020', 8, 'P03')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV07', 'NVG', '12/08/2020', 9, 'P04')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV08', 'NVH', '12/10/2020', 5, 'P04')
INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV09', 'NVI', '12/11/2020', 10, 'P04')



INSERT INTO PHONGBAN
    (MaPhong, TenPhong, TruongPhong )
VALUES
    ('P01', 'Phong1', 'NV02')
INSERT INTO PHONGBAN
    (MaPhong, TenPhong, TruongPhong )
VALUES
    ('P02', 'Phong2', 'NV05')
INSERT INTO PHONGBAN
    (MaPhong, TenPhong, TruongPhong )
VALUES
    ('P03', 'Phong3', 'NV06')
INSERT INTO PHONGBAN
    (MaPhong, TenPhong, TruongPhong )
VALUES
    ('P04', 'Phong4', 'NV09')
GO
alter table NHANVIEN add constraint FK_NHANVIEN_PHONGBAN foreign key(MaPhong) REFERENCES PHONGBAN

alter table PHONGBAN add constraint FK_PHONGBAN_NHANVIEN foreign key(TruongPhong) REFERENCES NHANVIEN
GO
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE01', 'MAZDA', 5, 2010)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE02', 'MAZDA', 3, 2016)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE03', 'SHI', 4, 2012)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE04', 'MAYBACH', 5, 2012)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE05', 'MAYBACH', 4, 2016)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE06', 'PORSCHE', 6, 2018)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE07', 'PORSCHE', 9, 2017)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE08', 'HONDA', 5, 2019)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE09', 'TOYOTA', 6, 2020)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE10', 'TOYOTA', 4, 2010)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE11', 'TOYOTA', 3, 2015)
INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE12', 'TOYOTA', 5, 2016)


INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC01', 'NV01', 'XE09', '22/01/2019', '22/02/2019', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC02', 'NV01', 'XE10', '23/03/2019', '22/04/2019', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC03', 'NV02', 'XE12', '22/05/2019', '22/06/2019', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC04', 'NV03', 'XE12', '22/07/2019', '22/08/2019', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC05', 'NV03', 'XE10', '23/02/2020', '25/02/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC06', 'NV04', 'XE09', '26/02/2020', '27/02/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC07', 'NV05', 'XE11', '28/02/2020', '29/02/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC08', 'NV05', 'XE05', '01/03/2020', '02/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC09', 'NV05', 'XE10', '03/03/2020', '04/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC10', 'NV06', 'XE02', '05/03/2020', '06/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC11', 'NV07', 'XE01', '07/03/2020', '08/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC12', 'NV08', 'XE04', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC13', 'NV03', 'XE04', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC14', 'NV03', 'XE06', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC15', 'NV03', 'XE08', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC16', 'NV03', 'XE04', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC17', 'NV03', 'XE01', '09/03/2020', '10/03/2020', 'TPHCM' )
INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC18', 'NV03', 'XE03', '09/03/2020', '10/03/2020', 'TPHCM' )


-- USE BAI_THUC_HANH_1
-- DROP DATABASE DE2


-- 2.1. Năm sản xuất của xe loại Toyota phải từ năm 2006 trở về sau. (1.5 đ) 
GO
CREATE TRIGGER TRGDE2_XE ON XE
FOR INSERT, UPDATE 
AS
BEGIN
    DECLARE @NamSX smalldatetime, @MaXe CHAR(5)
    SELECT @NamSX = NamSX, @MaXe = @MaXe
    FROM INSERTED
    IF(@NamSX < 2006)
    BEGIN
        PRINT 'NAM SAN XUAT PHAI LON HON 2006'
        ROLLBACK TRANSACTION
    END 
    ELSE
    BEGIN
        PRINT 'THEM THANH CONG XE' + ' ' + @MaXe
    END
END

INSERT INTO XE
    (MaXe, LoaiXe, SoChoNgoi, NamSX)
VALUES
    ('XE16', 'TOYOTA', 4, 2005)


-- 2.2. Nhân viên thuộc phòng lái xe “Ngoại thành” chỉ được phân công lái xe loại Toyota.
-- (1.5 đ)
SET DATEFORMAT DMY
GO
alter TRIGGER TRGDE2_LAIXE ON PHANCONG 
FOR INSERT, UPDATE 
AS
BEGIN
    DECLARE @MaNV char(5), @LoaiXe VARCHAR(20), @TenPhong VARCHAR(25)
    SELECT @MaNV = MaNV
    from INSERTED
    DECLARE CUR_NHANVIEN_TRGDE2 CURSOR
    FOR
    -- Lay loaixe
    SELECT XE.LoaiXe, PB.TenPhong
    From PHANCONG, XE, PHONGBAN PB, NHANVIEN NV
    WHERE NV.MaNV = @MaNV and PHANCONG.MaNV=@MaNV and XE.MaXe = PHANCONG.MaXe and NV.MaPhong = PB.MaPhong
    OPEN CUR_NHANVIEN_TRGDE2
    FETCH NEXT FROM CUR_NHANVIEN_TRGDE2
    INTO @LoaiXe, @TenPhong
    WHILE(@@FETCH_STATUS=0)
    BEGIN
        SELECT XE.LoaiXe, PB.TenPhong
        From PHANCONG, XE, PHONGBAN PB, NHANVIEN NV
        WHERE NV.MaNV = @MaNV and PHANCONG.MaNV=@MaNV and XE.MaXe = PHANCONG.MaXe and NV.MaPhong = PB.MaPhong
        IF( @TenPhong = 'Phong1' and @LoaiXe = 'TOYOTA' )
        BEGIN
            PRINT @MaNV + @TenPhong + ' ' + @LoaiXe + ' THANH CONG'
        END
            ELSE IF( @TenPhong = 'Phong1' and @LoaiXe != 'TOYOTA' )
        BEGIN
            PRINT @MaNV + @TenPhong + '' + @LoaiXe + ' KHONG THANH CONG'
            ROLLBACK TRANSACTION
        END
            ELSE IF( @TenPhong != 'Phong1' )
        BEGIN
            PRINT @MaNV + @TenPhong + ' ' + @LoaiXe + ' THANH CONG'
        END
        FETCH NEXT FROM CUR_NHANVIEN_TRGDE2
    INTO @LoaiXe, @TenPhong
    END
    CLOSE CUR_NHANVIEN_TRGDE2
    DEALLOCATE CUR_NHANVIEN_TRGDE2
END

GO
CREATE TRIGGER TRGDE2_NHANVIEN ON NHANVIEN 
FOR UPDATE 
AS
BEGIN
    DECLARE @MaNV char(5), @MaPhong char(5)
    SELECT @MaNV = MaNV, @MaPhong = MaPhong
    FROM INSERTED
    -- Tìm xe nhân viên này có lái xe nào khác loại toyota không
    IF EXISTS(
        SELECT *
    FROM PHANCONG PC, XE
    WHERE PC.MaNV=@MaNV and XE.MaXe = PC.MaXe and XE.LoaiXe != 'TOYOTA'
    )
    -- Nếu có thì tìm xem MaPhong có phải ngoại thành - Phong1 không
    BEGIN
        IF EXISTS(
            SELECT *
        FROM PHONGBAN
        WHERE MaPhong = @MaPhong
        )
        BEGIN
            PRINT @MaNV + ' ' + 'Nhan vien nay thuoc phong ngoai thanh - Phong1 nen chi duoc lai xe loai toyota';
            ROLLBACK TRANSACTION
        END
    END 
    ELSE 
        BEGIN
        PRINT('DU LIEU DUOC THAY DOI!!!');
    END
END
GO

-- Todo lam cua xe




-- INSERT INTO PHANCONG
--     (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
-- VALUES('PC15', 'NV01', 'XE09', '22/01/2019', '22/02/2019', 'TPHCM' )

INSERT INTO NHANVIEN
    (MaNV,HoTen, NgayVL, HSLuong, MaPhong)
VALUES('NV10', 'NVI', '12/11/2020', 10, 'P01')


INSERT INTO PHANCONG
    (MaPC, MaNV, MaXe, NgayDi, NgayVe, NoiDen)
VALUES('PC16', 'NV01', 'XE09', '22/01/2019', '22/02/2019', 'TPHCM' )


-- 3.1. Tìm nhân viên (MaNV,HoTen) thuộc phòng lái xe “Nội thành” được phân công lái
-- loại xe Toyota có số chỗ ngồi là 4. (1.5 đ)

SELECT NV.MaNV, HoTen
From NHANVIEN NV, PHONGBAN PB, XE, PHANCONG PC
WHERE Pc.MaNV = NV.MaNV
    and PC.MaXe = Xe.MaXe
    and Xe.SoChoNgoi = 4
    and XE.LoaiXe = 'TOYOTA'
    and NV.MaPhong = PB.MaPhong
    and PB.TenPhong = 'Phong1'

SELECT XE.LoaiXe, XE.MaXe
From XE, PHANCONG PC
WHERE Pc.MaNV = 'NV03'
    and PC.MaXe = Xe.MaXe


-- 3.2. Tìm nhân viên(MANV,HoTen) là trưởng phòng được phân công lái tất cả các loại
-- xe. (1.5 đ) 


SELECT NV.MaNV, HoTen
FROM NHANVIEN NV, PHONGBAN PB
-- WHERE NV.MaNV = PB.TruongPhong
WHERE NOT EXISTS (
        SELECT DISTINCT LoaiXe
FROM XE
WHERE NOT EXISTS (
SELECT *
FROM PHANCONG PC
WHERE NV.MaNV = PC.MaNV AND PC.MaXe = XE.MaXe
    )
)

-- 3.3 Trong mỗi phòng ban,tìm nhân viên (MaNV,HoTen) được phân công lái ít nhất loại
-- xe Toyota. (1 đ) 


SELECT NV.MaNV, HoTen, PB.MaPhong, COUNT(PC.MaPC)
FROM NHANVIEN NV, PHANCONG PC, PHONGBAN PB, XE
WHERE NV.MaPhong = PB.MaPhong
    and NV.MaNV = PC.MaNV
    and Xe.MaXe = PC.MaXe
    and Xe.LoaiXe='TOYOTA'
GROUP BY NV.MaNV, HoTen,  PB.MaPhong
HAVING COUNT(PC.MaPC) <= all(
    SELECT COUNT(PC.MaPC)
FROM NHANVIEN NV, PHANCONG PC, PHONGBAN PB2, XE
WHERE NV.MaPhong = PB2.MaPhong
    and NV.MaNV = PC.MaNV
    and Xe.MaXe = PC.MaXe
    and Xe.LoaiXe='TOYOTA'
GROUP BY NV.MaNV, HoTen, PB2.MaPhong
HAVING PB2.MaPhong = PB.MaPhong
)