CREATE TABLE HOCSINH(
    ID INT,
    NAME NVARCHAR(50),
)
GO
-- DROP TABLE HOCSINH

-- Them column NgaySinh type Date
ALTER TABLE HOCSINH ADD LOP NVARCHAR(50)

-- Drop data 
TRUNCATE TABLE HOCSINH