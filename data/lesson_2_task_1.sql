DROP TABLE IF EXISTS [��������];
CREATE TABLE [��������] (
[�������������] int PRIMARY KEY,
[���] varchar(100),
[�������] varchar(100),
CONSTRAINT [�������������] CHECK([���] NOT LIKE '%[^�-�]%'),
CONSTRAINT [���������������] CHECK([�������] NOT LIKE '%[^�-�]%')
);