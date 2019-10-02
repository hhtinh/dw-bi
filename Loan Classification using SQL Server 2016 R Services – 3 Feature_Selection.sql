
DROP PROCEDURE IF EXISTS [dbo].[PlotDistribution]
GO
CREATE PROCEDURE [dbo].[PlotDistribution]  
AS  
BEGIN  
SET NOCOUNT ON;  
EXECUTE sp_execute_external_script 
@language = N'R',
@script = N'
library("reshape2")
library("ggplot2")

# creating output directory
mainDir <- ''C:\\temp\\plots''  
dir.create(mainDir, recursive = TRUE, showWarnings = FALSE)  
setwd(mainDir);  
print("Creating output plot files:", quote=FALSE)  

# Open a jpeg file and output ggplot in that file.  
dest_filename = tempfile(pattern = ''ggplot_'', tmpdir = mainDir)  
dest_filename = paste(dest_filename, ''.jpg'',sep="")  
print(dest_filename, quote=FALSE);
jpeg(filename=dest_filename, height=3900, width = 6400, res=300); 

#filtering numeric columns
numeric_cols <- sapply(loans, is.numeric)

#turn the data into long format (key->value)
loans.lng <- melt(loans[,numeric_cols], id="is_bad")

#plot the distribution for is_bad={0/1} for each numeric column
print(ggplot(aes(x=value, group=is_bad, colour=factor(is_bad)), data=loans.lng) + geom_density() + facet_wrap(~variable, scales="free"))

dev.off()
',  
@input_data_1 = N'SELECT * FROM [dbo].[LoanStats]',
@input_data_1_name = N'loans'
END