<<<<<<< HEAD
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
=======
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'РќР°РїСЂР°РІР»РµРЅРёСЏ' AND COLUMN_NAME = 'Р’СЃРµРіРѕ РјРµСЃС‚')
	ALTER TABLE [РќР°РїСЂР°РІР»РµРЅРёСЏ]
	ADD [Р’СЃРµРіРѕ РјРµСЃС‚] INT;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'РќР°РїСЂР°РІР»РµРЅРёСЏ' AND COLUMN_NAME = 'РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ')
	ALTER TABLE [РќР°РїСЂР°РІР»РµРЅРёСЏ]
	ADD [РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ] bit;

UPDATE [РќР°РїСЂР°РІР»РµРЅРёСЏ] 
SET [Р’СЃРµРіРѕ РјРµСЃС‚] = 2, [РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ] = 0
WHERE [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] = 1 AND [Р’СЃРµРіРѕ РјРµСЃС‚] IS NULL;

UPDATE [РќР°РїСЂР°РІР»РµРЅРёСЏ] 
SET [Р’СЃРµРіРѕ РјРµСЃС‚] = 2, [РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ] = 0
WHERE [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] = 2 AND [Р’СЃРµРіРѕ РјРµСЃС‚] IS NULL;

UPDATE [РќР°РїСЂР°РІР»РµРЅРёСЏ] 
SET [Р’СЃРµРіРѕ РјРµСЃС‚] = 1, [РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ] = 0
WHERE [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] = 3 AND [Р’СЃРµРіРѕ РјРµСЃС‚] IS NULL;
GO

CREATE TRIGGER AddStudent
ON [РЎС‚СѓРґРµРЅС‚С‹]
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*) FROM [РЎС‚СѓРґРµРЅС‚С‹] s JOIN [РќР°РїСЂР°РІР»РµРЅРёСЏ] n
	ON s.[РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ]=n.[РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ]
	WHERE s.[РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] = (SELECT [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] FROM INSERTED) 
	AND [Р‘Р°Р»Р»] >= n.[РњРёРЅРёРјР°Р»СЊРЅС‹Р№ Р±Р°Р»Р»]) > (SELECT [Р’СЃРµРіРѕ РјРµСЃС‚] FROM [РќР°РїСЂР°РІР»РµРЅРёСЏ]
	WHERE [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] = (SELECT [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] FROM INSERTED))
		BEGIN
			UPDATE [РќР°РїСЂР°РІР»РµРЅРёСЏ]
			SET [РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ] = 1
			WHERE [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ]=(SELECT [РљРѕРґ РЅР°РїСЂР°РІР»РµРЅРёСЏ] FROM INSERTED);
			PRINT 'РќР°Р±РѕСЂ РѕРєРѕРЅС‡РµРЅ';
		END
	ELSE
		PRINT 'РЎС‚СѓРґРµРЅС‚ Р·Р°С‡РёСЃР»РµРЅ'
END;
>>>>>>> aab3c4975058fc0502efe633f30b9397c4d252ca
