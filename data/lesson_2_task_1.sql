DROP TABLE IF EXISTS [Студенты];
CREATE TABLE [Студенты] (
[Идентификатор] int PRIMARY KEY,
[Имя] varchar(100),
[Фамилия] varchar(100),
CONSTRAINT [ПроверкаИмени] CHECK([Имя] NOT LIKE '%[^А-Я]%'),
CONSTRAINT [ПроверкаФамилии] CHECK([Фамилия] NOT LIKE '%[^А-Я]%')
);