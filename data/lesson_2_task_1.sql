DROP TABLE IF EXISTS [Ñòóäåíòû];
CREATE TABLE [Ñòóäåíòû] (
[Èäåíòèôèêàòîð] int PRIMARY KEY,
[Èìÿ] varchar(100),
[Ôàìèëèÿ] varchar(100),
CONSTRAINT [ÏðîâåðêàÈìåíè] CHECK([Èìÿ] NOT LIKE '%[^À-ß]%'),
CONSTRAINT [ÏðîâåðêàÔàìèëèè] CHECK([Ôàìèëèÿ] NOT LIKE '%[^À-ß]%')
);
