<<<<<<< HEAD
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '�����������' AND COLUMN_NAME = '����� ����')
	ALTER TABLE [�����������]
	ADD [����� ����] INT;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '�����������' AND COLUMN_NAME = '����� �������')
	ALTER TABLE [�����������]
	ADD [����� �������] bit;

UPDATE [�����������] 
SET [����� ����] = 2, [����� �������] = 0
WHERE [��� �����������] = 1 AND [����� ����] IS NULL;

UPDATE [�����������] 
SET [����� ����] = 2, [����� �������] = 0
WHERE [��� �����������] = 2 AND [����� ����] IS NULL;

UPDATE [�����������] 
SET [����� ����] = 1, [����� �������] = 0
WHERE [��� �����������] = 3 AND [����� ����] IS NULL;
GO

CREATE TRIGGER AddStudent
ON [��������]
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*) FROM [��������] s JOIN [�����������] n
	ON s.[��� �����������]=n.[��� �����������]
	WHERE s.[��� �����������] = (SELECT [��� �����������] FROM INSERTED) 
	AND [����] >= n.[����������� ����]) > (SELECT [����� ����] FROM [�����������]
	WHERE [��� �����������] = (SELECT [��� �����������] FROM INSERTED))
		BEGIN
			UPDATE [�����������]
			SET [����� �������] = 1
			WHERE [��� �����������]=(SELECT [��� �����������] FROM INSERTED);
			PRINT '����� �������';
		END
	ELSE
		PRINT '������� ��������'
END;
=======
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
>>>>>>> aab3c4975058fc0502efe633f30b9397c4d252ca
