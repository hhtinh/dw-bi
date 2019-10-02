CREATE PROCEDURE [dbo].[ScoreLoans] 
AS  
BEGIN  
  DECLARE @inquery nvarchar(max) = N'SELECT * FROM [dbo].[LoanStatsTest]'  
  DECLARE @model varbinary(max) = (SELECT TOP 1 model FROM models)
  
  DROP TABLE IF EXISTS [dbo].[LoanStatsPredictions]
  CREATE TABLE [dbo].[LoanStatsPredictions]([is_bad_Pred] [float] NULL, [id] [int] NULL) 

  INSERT INTO [dbo].[LoanStatsPredictions]   
  EXEC sp_execute_external_script 
  @language = N'R',
  @script = N'  
  rfModel <- unserialize(as.raw(model));  
  OutputDataSet<-rxPredict(rfModel, data = InputDataSet, extraVarsToWrite = c("id"))
  ',
  @input_data_1 = @inquery,
  @params = N'@model varbinary(max)',
  @model = @model
  
END