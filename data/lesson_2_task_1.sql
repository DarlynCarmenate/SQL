drop table if exists [��������];
create table [��������] (
[�������������] int PRIMARY KEY,
[���] varchar(100),
[�������] varchar(100),
CONSTRAINT [�������������] CHECK([���] NOT LIKE '%[^�-�]%'),
CONSTRAINT [���������������] CHECK([�������] NOT LIKE '%[^�-�]%')
);