IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Íàïðàâëåíèÿ' AND COLUMN_NAME = 'Âñåãî ìåñò')
	ALTER TABLE [Íàïðàâëåíèÿ]
	ADD [Âñåãî ìåñò] INT;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Íàïðàâëåíèÿ' AND COLUMN_NAME = 'Íàáîð îêîí÷åí')
	ALTER TABLE [Íàïðàâëåíèÿ]
	ADD [Íàáîð îêîí÷åí] bit;

UPDATE [Íàïðàâëåíèÿ] 
SET [Âñåãî ìåñò] = 2, [Íàáîð îêîí÷åí] = 0
WHERE [Êîä íàïðàâëåíèÿ] = 1 AND [Âñåãî ìåñò] IS NULL;

UPDATE [Íàïðàâëåíèÿ] 
SET [Âñåãî ìåñò] = 2, [Íàáîð îêîí÷åí] = 0
WHERE [Êîä íàïðàâëåíèÿ] = 2 AND [Âñåãî ìåñò] IS NULL;

UPDATE [Íàïðàâëåíèÿ] 
SET [Âñåãî ìåñò] = 1, [Íàáîð îêîí÷åí] = 0
WHERE [Êîä íàïðàâëåíèÿ] = 3 AND [Âñåãî ìåñò] IS NULL;
GO

CREATE TRIGGER AddStudent
ON [Ñòóäåíòû]
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*) FROM [Ñòóäåíòû] s JOIN [Íàïðàâëåíèÿ] n
	ON s.[Êîä íàïðàâëåíèÿ]=n.[Êîä íàïðàâëåíèÿ]
	WHERE s.[Êîä íàïðàâëåíèÿ] = (SELECT [Êîä íàïðàâëåíèÿ] FROM INSERTED) 
	AND [Áàëë] >= n.[Ìèíèìàëüíûé áàëë]) > (SELECT [Âñåãî ìåñò] FROM [Íàïðàâëåíèÿ]
	WHERE [Êîä íàïðàâëåíèÿ] = (SELECT [Êîä íàïðàâëåíèÿ] FROM INSERTED))
		BEGIN
			UPDATE [Íàïðàâëåíèÿ]
			SET [Íàáîð îêîí÷åí] = 1
			WHERE [Êîä íàïðàâëåíèÿ]=(SELECT [Êîä íàïðàâëåíèÿ] FROM INSERTED);
			PRINT 'Íàáîð îêîí÷åí';
		END
	ELSE
		PRINT 'Ñòóäåíò çà÷èñëåí'
END;
