IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Направления' AND COLUMN_NAME = 'Всего мест')
	ALTER TABLE [Направления]
	ADD [Всего мест] INT;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Направления' AND COLUMN_NAME = 'Набор окончен')
	ALTER TABLE [Направления]
	ADD [Набор окончен] bit;

UPDATE [Направления] 
SET [Всего мест] = 2, [Набор окончен] = 0
WHERE [Код направления] = 1 AND [Всего мест] IS NULL;

UPDATE [Направления] 
SET [Всего мест] = 2, [Набор окончен] = 0
WHERE [Код направления] = 2 AND [Всего мест] IS NULL;

UPDATE [Направления] 
SET [Всего мест] = 1, [Набор окончен] = 0
WHERE [Код направления] = 3 AND [Всего мест] IS NULL;
GO

CREATE TRIGGER AddStudent
ON [Студенты]
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*) FROM [Студенты] s JOIN [Направления] n
	ON s.[Код направления]=n.[Код направления]
	WHERE s.[Код направления] = (SELECT [Код направления] FROM INSERTED) 
	AND [Балл] >= n.[Минимальный балл]) > (SELECT [Всего мест] FROM [Направления]
	WHERE [Код направления] = (SELECT [Код направления] FROM INSERTED))
		BEGIN
			UPDATE [Направления]
			SET [Набор окончен] = 1
			WHERE [Код направления]=(SELECT [Код направления] FROM INSERTED);
			PRINT 'Набор окончен';
		END
	ELSE
		PRINT 'Студент зачислен'
END;
