SELECT TOP (1000) [Column_1]
      ,[NOMBRE]
      ,[SEGUIDORES]
      ,[TP]
      ,[PAÍS]
      ,[TEMA_DE_INFLUENCIA]
      ,[ALCANCE_POTENCIAL]
      ,[GUARDAR]
      ,[INVITAR_A_LA_CAMPAÑA]
      ,[channel_name]
      ,[total_subscribers]
      ,[total_views]
      ,[total_videos]
      ,[column14]
  FROM [YOUTUBE_DB].[dbo].[youtube_data_from_python]

SELECT * FROM [YOUTUBE_DB].[dbo].[youtube_data_from_python];

select NOMBRE as youtuber_name,total_subscribers,total_views,total_videos
from [YOUTUBE_DB].[dbo].[youtube_data_from_python]



create view Top_Youtubers_UK_2024 as
SELECT 
  CAST(LEFT(NOMBRE, CHARINDEX('@', NOMBRE) - 1) AS VARCHAR(100)) AS channel_name,
  total_subscribers,
  total_views,
  total_videos
FROM [YOUTUBE_DB].[dbo].[youtube_data_from_python]
WHERE CHARINDEX('@', NOMBRE) > 0;

SELECT NAME FROM SYS.VIEWS;

SELECT TABLE_SCHEMA,'Top_Youtubers_UK_2024' FROM INFORMATION_SCHEMA.VIEWS;

--  ROWS COUNT CHECK
SELECT COUNT(*) AS NO_ROWS 
FROM Top_Youtubers_UK_2024;

-- COLUMNS COUNT CHECK
SELECT COUNT(*) AS NO_COLUMNS
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Top_Youtubers_UK_2024';

--
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Top_Youtubers_UK_2024';

-- NO DUPLICATE IN DATA 
SELECT COUNT( DISTINCT CHANNEL_NAME) AS NO_ROWS
FROM Top_Youtubers_UK_2024;

SELECT CHANNEL_NAME, COUNT(*) AS DUPLICATE_COUNT
FROM Top_Youtubers_UK_2024
GROUP BY CHANNEL_NAME
HAVING COUNT(*) > 1;