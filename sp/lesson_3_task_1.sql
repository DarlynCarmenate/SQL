CREATE PROCEDURE StudentsEnrolled @Id int
AS
BEGIN
IF @id IN(SELECT [Код направления] FROM [Студенты])
	SELECT [Направление], STRING_AGG([Фамилия], ', ') 
	AS [Поступившие студенты] FROM [Студенты] s 
	JOIN [Направления] n 
	ON s.[Код направления]=n.[Код направления]
	WHERE s.[Код направления] = @Id AND [Балл] >= n.[Минимальный балл]
	GROUP BY [Направление]
ELSE
	PRINT 'Некорректный код направления'
END;
