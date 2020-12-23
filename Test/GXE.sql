CREATE DATABASE BAITHI2
GO
USE BAITHI2
CREATE TABLE THANHVIEN
(
    MATV CHAR(5) PRIMARY KEY,
    HOTEN VARCHAR(255),
    SODT INT,
    CMND INT,
    LOAITV VARCHAR(255),
)

CREATE TABLE VITRI
(
    MAVT CHAR(5) PRIMARY KEY,
    TANG VARCHAR(25),
    HANG INT,
    COT INT,
    TRANGTHAI VARCHAR(25),
)

CREATE TABLE DANGKY
(
    SODK CHAR(5) PRIMARY KEY,
    MATV CHAR(5),
    NGDK smalldatetime,
    THOIHAN smalldatetime,
    CONSTRAINT FK_DK_MATV FOREIGN KEY (MATV) REFERENCES THANHVIEN(MATV),
)

CREATE TABLE GUIXE
(
    SODK CHAR(5),
    MAVT CHAR(5),
    NGGUI SMALLDATETIME,
    CONSTRAINT PK_SODK_MAVT_NGGUI PRIMARY KEY (SODK,MAVT,NGGUI),
    CONSTRAINT FK_GX_SODK FOREIGN KEY (SODK) REFERENCES DANGKY(SODK),
    CONSTRAINT FK_GX_MAVT FOREIGN KEY (MAVT) REFERENCES VITRI(MAVT),
)

-- USE DE1920
-- DROP DATABASE BAITHI2


GO
SET DATEFORMAT DMY

GO
CREATE TRIGGER TG1 ON DANGKY 
FOR INSERT, UPDATE
AS 
BEGIN
    DECLARE @NGDK SMALLDATETIME, @THOIHAN SMALLDATETIME
    SELECT @NGDK = NGDK, @THOIHAN = THOIHAN
    FROM inserted
    IF(@NGDK > @THOIHAN)
    BEGIN
        PRINT 'NGAY DANG KY PHAI BE HON NGAY HET HAN'
        ROLLBACK TRANSACTION
    END
    ELSE IF(DATEDIFF(month, @NGDK, @THOIHAN) < 2)
    BEGIN
        PRINT 'NGAY DK PHAI PHAI NHO HON THOI DIEM HET HAN IT NHAT 2 THANG'
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        PRINT 'DANG KY THANH CONG'
    END
END


GO
CREATE TRIGGER TG2 ON DANGKY
FOR UPDATE, INSERT 
AS 
BEGIN
    DECLARE @MATV CHAR(5), @NGAYHETHAN SMALLDATETIME, @SODK CHAR(5), @SOLUONG INT
    SELECT @MATV = MATV, @SODK = SODK
    FROM INSERTED

    SELECT @SOLUONG = IIF(COUNT(*) = 1, 0, 1)
    FROM DANGKY DK
    WHERE DK.MATV = @MATV

    IF EXISTS(
        SELECT DK.SODK
    FROM DANGKY DK
    WHERE DK.MATV = @MATV AND DK.THOIHAN > any (
        select DK2.THOIHAN
        FROM DANGKY DK2
        WHERE DK2.MATV= @MATV
        ORDER BY DK2.SODK
        OFFSET @SOLUONG ROWS
    )
    )
    BEGIN
        PRINT @SOLUONG
        PRINT @SODK
        PRINT @MATV
        PRINT 'DANG KY TRUOC DO CUA THANH VIEN NAY CHUA HET'
        -- ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        PRINT @SOLUONG
        PRINT 'DANG KY CHO THANH VIEN NAY THANH CONG'
    END
-- SELECT @NGAYHETHAN = DK.THOIHAN
-- FROM DANGKY DK

-- IF(@NGAYHETHAN < GETDATE())
-- BEGIN
--     PRINT @NGAYHETHANMOCK
--     ROLLBACK TRANSACTION
-- END
-- ELSE
-- BEGIN
--     -- PRINT 'DANG KY CHO THANH VIEN NAY THANH CONG'
--     PRINT @NGAYHETHAN
--     PRINT @NGAYHETHANMOCK
-- END
-- INSERT INTO DANGKY(SODK, MATV, NGDK, THOIHAN) SELECT * FROM inserted
END

GO

INSERT INTO THANHVIEN
    (MATV, HOTEN, SODT, CMND, LOAITV)
VALUES('TV001', 'TVA', 0202020, 2020202020, 'LAUDAI')
INSERT INTO THANHVIEN
    (MATV, HOTEN, SODT, CMND, LOAITV)
VALUES('TV002', 'TVB', 0202020, 2020202020, 'THUONG')
INSERT INTO THANHVIEN
    (MATV, HOTEN, SODT, CMND, LOAITV)
VALUES('TV003', 'TVC', 0202020, 2020202020, 'NGANHAN')
INSERT INTO THANHVIEN
    (MATV, HOTEN, SODT, CMND, LOAITV)
VALUES('TV004', 'TVA', 0202020, 2020202020, 'LAUDAI')


INSERT INTO VITRI
    (MAVT, TANG, HANG, COT, TRANGTHAI)
VALUES('VT001', 'G2', 14, 25, 'TRONG')
INSERT INTO VITRI
    (MAVT, TANG, HANG, COT, TRANGTHAI)
VALUES('VT002', 'G1', 7, 7, 'COXE')
INSERT INTO VITRI
    (MAVT, TANG, HANG, COT, TRANGTHAI)
VALUES('VT003', 'G2', 38, 16, 'COXE')

INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK01', 'TV001', '01/06/2020', '31/10/2020')
INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK02', 'TV002', '01/12/2020', '30/04/2021')
INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK03', 'TV001', '01/11/2020', '31/03/2021')
INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK04', 'TV001', '01/11/2020', '28/03/2021')
INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK05', 'TV001', '01/05/2020', '28/10/2020')
INSERT INTO DANGKY
    (SODK, MATV, NGDK, THOIHAN)
VALUES('DK06', 'TV004', '01/06/2021', '28/10/2021')

INSERT INTO GUIXE
    (SODK, MAVT, NGGUI)
VALUES('DK02', 'VT001', '21/12/2020')
INSERT INTO GUIXE
    (SODK, MAVT, NGGUI)
VALUES('DK02', 'VT002', '24/12/2020')
INSERT INTO GUIXE
    (SODK, MAVT, NGGUI)
VALUES('DK03', 'VT003', '12/12/2020')
INSERT INTO GUIXE
    (SODK, MAVT, NGGUI)
VALUES('DK06', 'VT003', '12/12/2020')

-- SELECT VT.MAVT
-- FROM VITRI VT, THANHVIEN TV, DANGKY DK, GUIXE GX
-- WHERE VT.MAVT = GX.MAVT
--     AND GX.SODK = DK.SODK
--     AND DK.MATV = TV.MATV
--     AND TV.LOAITV='NGANHAN'
-- ORDER BY GX.NGGUI DESC

-- SELECT VT.TANG
-- FROM VITRI VT, THANHVIEN TV, DANGKY DK, GUIXE GX
-- WHERE VT.MAVT = GX.MAVT
--     AND GX.SODK = DK.SODK
--     AND DK.MATV = TV.MATV
--     AND TV.LOAITV='LAUDAI'
-- GROUP BY VT.TANG
-- HAVING COUNT(DK.SODK) <= ALL(
--     SELECT COUNT(DK.SODK)
--     FROM VITRI VT, THANHVIEN TV, DANGKY DK, GUIXE GX
--     WHERE VT.MAVT = GX.MAVT
--     AND GX.SODK = DK.SODK
--     AND DK.MATV = TV.MATV
--     AND TV.LOAITV='LAUDAI'
--     GROUP BY VT.TANG
-- )




-- SELECT MONTH(NGDK)
-- FROM DANGKY DK, GUIXE GX, THANHVIEN TV
-- WHERE GX.SODK = DK.SODK AND DK.MATV = TV.MATV AND TV.LOAITV='NGANHAN'

-- INTERSECT 

-- SELECT MONTH(NGDK)
-- FROM DANGKY DK, GUIXE GX, THANHVIEN TV
-- WHERE GX.SODK = DK.SODK AND DK.MATV = TV.MATV AND TV.LOAITV='LAUDAI'


SELECT VT.MAVT
FROM VITRI VT
WHERE NOT EXISTS(
    SELECT *
    FROM THANHVIEN TV 
    WHERE TV.LOAITV='LAUDAI'
    AND NOT EXISTS(
        SELECT *
        FROM DANGKY DK, GUIXE GX
        WHERE DK.SODK = GX.SODK AND GX.MAVT = VT.MAVT AND DK.MATV = TV.MATV
    )
)


-- SELECT *
-- FROM DANGKY