/*

** Author: Tomaz Kastrun
** Web: http://tomaztsql.wordpress.com
** Twitter: @tomaz_tsql
** Created: 22.09.2016; Ljubljana
** Using FileTable to store graphs generated with RevoScaleR
** R and T-SQL

*/

-- Configuration Manager SQL Server 2016 
-- Enable FILESTREAM for SQLServer Service

USE SQLR;
GO

EXEC sp_configure 'filestream_access_level' , 2;
GO

RECONFIGURE;
GO

-- Restart SQL Server!

-- Create Database with FILESTREAM 
USE master;
GO

CREATE DATABASE FileTableRChart 
ON PRIMARY  (NAME = N'FileTableRChart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FileTableRChart.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB ),
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM( NAME = ChartsFG, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RCharts')
LOG ON (NAME = N'FileTableRChart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FileTableRChart_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE FileTableRChart
    SET FILESTREAM ( NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'RCharts' )  



--- Check configurations
SELECT 
  DB_NAME(database_id) AS DbName
 ,non_transacted_access
 ,non_transacted_access_desc
 ,directory_name  
FROM  sys.database_filestream_options
WHERE 
	DB_NAME(database_id) = 'FileTableRChart'


USE FileTableRChart;
GO


CREATE TABLE ChartsR AS FILETABLE
WITH
(
 FileTable_Directory = 'DocumentTable'
,FileTable_Collate_Filename = database_default  
);
GO

-- Check the files
SELECT * FROM ChartsR



USE WideWorldImportersDW;
GO

-- I will use WideWorldImporters to plot
-- histograms with normal curve to see distribution of data
DECLARE @SQLStat NVARCHAR(4000)
SET @SQLStat = 'SELECT
					 fs.[Sale Key] AS SalesID
					,c.[City] AS City
					,c.[State Province] AS StateProvince
					,c.[Sales Territory] AS SalesTerritory
					,fs.[Customer Key] AS CustomerKey
					,fs.[Stock Item Key] AS StockItem
					,fs.[Quantity] AS Quantity
					,fs.[Total Including Tax] AS Total
					,fs.[Profit] AS Profit

					FROM [Fact].[Sale] AS  fs
					JOIN dimension.city AS c
					ON c.[City Key] = fs.[City Key]
					WHERE
						fs.[customer key] <> 0'


DECLARE @RStat NVARCHAR(4000)
SET @RStat = 'library(ggplot2)
			  library(stringr)
			  #library(jpeg)
			  cust_data <- Sales
			  n <- ncol(cust_data)
			  for (i in 1:n) 
						{
						  path <- ''\\\\SICN-KASTRUN\\mssqlserver\\RCharts\\DocumentTable\\Plot_''
						  colid   <- data.frame(val=(cust_data)[i])
						  colname <- names(cust_data)[i]
						  #print(colname)
						  #print(colid)
						  gghist <- ggplot(colid, aes(x=val)) + geom_histogram(binwidth=2, aes(y=..density.., fill=..count..))
						  gghist <- gghist + stat_function(fun=dnorm, args=list(mean=mean(colid$val), sd=sd(colid$val)), colour="red")
						  gghist <- gghist + ggtitle("Histogram of val with normal curve")  + xlab("Variable Val") + ylab("Density of Val")
						  path <- paste(path,colname,''.jpg'')
						  path <- str_replace_all(path," ","")
						  #jpeg(file=path)
						  ggsave(path, width = 4, height = 4)
						  plot(gghist)
						  dev.off()
						}';

EXECUTE sp_execute_external_script
	 @language = N'R'
	,@script = @RStat
	,@input_data_1 = @SQLStat
	,@input_data_1_name = N'Sales'




--- Check files
SELECT 
	 FT.Name AS [File Name]
	,IIF(FT.is_directory=1,'Directory','Files') AS [File Category]
	,FT.file_type AS [File Type]
	,(FT.cached_file_size)/1024.0 AS [File Size (KB)]
	,FT.creation_time AS [File Created Time]
	,FT.file_stream.GetFileNamespacePath(1,0) AS [File Path]
	,ISNULL(PT.file_stream.GetFileNamespacePath(1,0),'Root Directory') AS [Parent Path]
FROM 
	[dbo].[ChartsR] AS FT
LEFT JOIN [dbo].[ChartsR] AS PT
ON FT.path_locator.GetAncestor(1) = PT.path_locator
