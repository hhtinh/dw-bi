
DROP PROCEDURE IF EXISTS [dbo].[BuildModel]
GO
CREATE PROCEDURE [dbo].[BuildModel]  
AS  
BEGIN  
  DECLARE @inquery nvarchar(max) = N'SELECT * FROM [dbo].[LoanStatsTrain]'  
  
  DROP TABLE IF EXISTS [dbo].[models]
  CREATE TABLE [dbo].[models]([model] [varbinary](max) NOT NULL)

  INSERT INTO [dbo].[models]
  EXEC sp_execute_external_script 
  @language = N'R',  
  @script = N'  
randomForestObj <- rxDForest(is_bad ~ revol_util + int_rate + mths_since_last_record + annual_inc_joint + dti_joint + total_rec_prncp + all_util, InputDataSet)
model <- data.frame(payload = as.raw(serialize(randomForestObj, connection=NULL)))
',
  @input_data_1 = @inquery,  
  @output_data_1_name = N'model'  
 
END