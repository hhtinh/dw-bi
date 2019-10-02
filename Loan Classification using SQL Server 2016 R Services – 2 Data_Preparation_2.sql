
--Create table and import data
EXEC [dbo].[LoadData]

--DROP unnecessary column desc 
ALTER TABLE [dbo].[LoanStats] DROP COLUMN [desc]

--Remove % from int_rate and convert its type to float 
UPDATE [dbo].[LoanStats] SET [int_rate] = REPLACE([int_rate], '%', '')

ALTER TABLE [dbo].[LoanStats] ALTER COLUMN [int_rate] float

--Remove % from revol_util and convert its type to float
UPDATE [dbo].[LoanStats] SET [revol_util] = REPLACE([revol_util], '%', '')

ALTER TABLE [dbo].[LoanStats] ALTER COLUMN [revol_util] float

--Remove rows where loan_status is empty
DELETE FROM [dbo].[LoanStats] where [loan_status] IS NULL

--Classify all loans as good/bad based on its status and store it in a column named “is_bad”
ALTER TABLE [dbo].[LoanStats] ADD [is_bad] int

UPDATE [dbo].[LoanStats] 
SET [is_bad] = (CASE WHEN loan_status IN ('Late (16-30 days)', 'Late (31-120 days)', 'Default', 'Charged Off') THEN 1 ELSE 0 END)
