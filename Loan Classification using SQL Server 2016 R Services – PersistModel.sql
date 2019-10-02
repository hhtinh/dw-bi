
DROP PROCEDURE IF EXISTS [dbo].[PersistModel]
GO
CREATE PROCEDURE [dbo].[PersistModel]
@m nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DROP TABLE IF EXISTS [dbo].[models];
    CREATE TABLE [dbo].[models]([model] [varbinary](max) NOT NULL);

    INSERT INTO [dbo].[models]
	VALUES (convert(varbinary(max), @m, 2));
END