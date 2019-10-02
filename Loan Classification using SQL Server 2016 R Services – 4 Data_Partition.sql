CREATE PROCEDURE [dbo].[SplitLoans]  
AS  
BEGIN  
  SET NOCOUNT ON;  
  -- 75% Training data 
  DROP TABLE IF EXISTS [dbo].[LoanStatsTrain]
  SELECT * INTO [dbo].[LoanStatsTrain] FROM (SELECT * FROM [dbo].[LoanStats] WHERE (ABS(CAST((BINARY_CHECKSUM(id, NEWID())) as int)) % 100) < 75)a
  -- 25% Test data
  DROP TABLE IF EXISTS [dbo].[LoanStatsTest]
  SELECT * INTO [dbo].[LoanStatsTest] FROM (SELECT * FROM [dbo].[LoanStats] WHERE [id] NOT IN (SELECT [id] FROM [dbo].[LoanStatsTrain]))a

END