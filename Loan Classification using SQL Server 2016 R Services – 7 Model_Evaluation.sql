CREATE PROCEDURE [dbo].[PlotROCCurve]  
AS  
BEGIN  
  EXEC sp_execute_external_script
  @language = N'R',
  @script = N'  
  suppressMessages(library("ROCR"))
  
  # create output directory
  mainDir <- ''C:\\temp\\plots''  
  dir.create(mainDir, recursive = TRUE, showWarnings = FALSE)  
  setwd(mainDir);  
  print("Creating output plot files:", quote=FALSE)  
  
  # Open a jpeg file and output ROC Curve in that file
  dest_filename = tempfile(pattern = ''rocCurve_'', tmpdir = mainDir)  
  dest_filename = paste(dest_filename, ''.jpg'',sep="")  
  print(dest_filename, quote=FALSE);
  jpeg(filename=dest_filename, height=1800, width = 1800, res = 300); 
  
  # Plot ROC Curve
  pred <- prediction(loanPredictions$is_bad_Pred, loanPredictions$is_bad)
  perf <- performance(pred,"tpr","fpr")
  plot(perf)
  abline(a=0,b=1)
  dev.off()
  
  # Print Area under the Curve
  auc <- performance(pred, "auc")
  print(paste0("Area under ROC Curve : ", as.numeric(auc@y.values)))
',  
@input_data_1 = N'SELECT b.is_bad_Pred, a.is_bad FROM [dbo].[LoanStatsTest] a INNER JOIN [dbo].[LoanStatsPredictions] b ON a.id = b.id',  
@input_data_1_name = N'loanPredictions'

END