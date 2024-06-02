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
