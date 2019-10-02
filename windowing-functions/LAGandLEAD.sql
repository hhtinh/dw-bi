SET NOCOUNT ON
USE AdventureWorks2012
GO

/****************
*** 1. LEAD() ***
****************/

--- The SQL 2000 way - using a correlated subquery.
SELECT CustomerID,
      (SELECT MIN(CustomerID)
         FROM Sales.Customer b
        WHERE a.CustomerID < b.CustomerID
       ) AS NextCustomerID
 FROM Sales.Customer a
 ORDER BY a.CustomerID

--- Using Nested Loops -performs the inner query for every outer row. 
--- (1 Scan and a seek for every row)

--- The SQL 2005 way- using ranking function ROW_NUMBER()
WITH t AS
(
SELECT CustomerID,
       ROW_NUMBER() OVER (ORDER BY CustomerID) AS ROW
  FROM Sales.Customer
)
SELECT a.CustomerID,
       b.CustomerID AS NextCustomerID
FROM t a JOIN t b ON a.[ROW] = b.[ROW]-1

--- Scans the table twice and merge join the results (2 scans)

---The Denali way - using LEAD()
SELECT CustomerID,
       LEAD(CustomerID, 1) OVER (order by CustomerID ASC) AS NextCustomerID
  FROM Sales.Customer
 ORDER BY CustomerID

--- Only scanning the table once.

/*******************************
*** 2. LEAD() is problematic ***
***   when retrieve one row    ***
*******************************/

--- Using LEAD() to retrieve only one row

SELECT CustomerID,
       LEAD(CustomerID, 1) OVER (order by CustomerID ASC) AS NextCustomerID
  FROM Sales.Customer
 WHERE CustomerID = 1


--- The result is not what we expected, so we can do it with sub-query or CTE.
WITH CTE AS
(
SELECT
   CustomerID,
   LEAD(CustomerID, 1) OVER (order by CustomerID ASC) AS NextCustomerID
FROM Sales.Customer
)
SELECT * FROM CTE
 WHERE CustomerID = 1
--- We get the same number of reads - 1 scan of the table.


--- Let's see the performance with ROW_NUMBER()

WITH t AS
(
SELECT CustomerID,
       ROW_NUMBER() OVER (ORDER BY CustomerID) AS ROW
FROM Sales.Customer
)
SELECT a.CustomerID,
       b.CustomerID AS NextCustomerID
  FROM t a JOIN t b ON a.[ROW] = b.[ROW]-1
 WHERE a.CustomerID = 1

--- Almost identical, still needs to scan the entire table to sort.


--- The SQL 2000 way - using a correlated subquery.
SELECT CustomerID,
      (SELECT MIN(CustomerID )
         FROM Sales.Customer b
        WHERE a.CustomerID < b.CustomerID
       )
  FROM Sales.Customer a
 WHERE a.CustomerID = 1

--- performs the inner query for every outer row which returns only 1 row - 2 seeks only.

/*******************************
***   3. LEAD() and LAG()    ***
***      Use cases           ***
*******************************/

--- changes in pay rate.

SELECT BusinessEntityID,
       RateChangeDate,
       LAG(Rate,1) OVER (partition BY BusinessEntityID Order by RateChangeDate) as Previous,
       Rate AS [Current],
       Rate-LAG(Rate,1) OVER (partition BY BusinessEntityID Order by RateChangeDate) as Diff,
       FORMAT(((Rate-LAG(Rate,1) OVER (partition BY BusinessEntityID Order by RateChangeDate))/LAG(Rate,1) OVER (partition BY BusinessEntityID Order by RateChangeDate)), 'P')as DiffPrecent
  FROM HumanResources.EmployeePayHistory
 ORDER BY Diff DESC

--- Yearly sales by product in compare to last year. using Group BY.

SELECT ProductID,YEAR(OH.OrderDate) as YEAR,
       SUM(LineTotal) as YearlySales,
       LAG(SUM(LineTotal),1,0) OVER (PARTITION BY ProductID ORDER BY YEAR(OH.OrderDate)) as PreviousYearSales
  FROM Sales.SalesOrderDetail OD JOIN Sales.SalesOrderHeader OH ON OD.SalesOrderID=OH.SalesOrderID
 GROUP BY ProductID,YEAR(OH.OrderDate)


CREATE TABLE #EmployeeSalesByMonth
(
   Employee INT,
   [Year] INT,
   [Month] INT,
   EmployeeTotal INT
)

INSERT INTO #EmployeeSalesByMonth(Employee,[Year],[Month],EmployeeTotal)
VALUES(1,2010,10,150),
(1,2010,11,250),
(1,2010,12,200),
(1,2011,1,300),
(1,2011,4,200),
(1,2011,6,200)

SELECT *
FROM #EmployeeSalesByMonth

 ---- It's only rows, Not the values in them...
SELECT Employee,
       [Year] ,
       [Month] ,
       EmployeeTotal AS SalesThisMonth,
       LAG(EmployeeTotal, 1, 0) OVER (PARTITION BY Employee ORDER BY [Year], [Month]) AS SalesLastMonth ,
       LAG(EmployeeTotal, 3, 0) OVER (PARTITION BY Employee ORDER BY [Year], [Month]) AS SalesThreeMonthsAgo
  FROM #EmployeeSalesByMonth
 WHERE Employee = 1
 ORDER BY Employee, [Year], [Month];

DROP TABLE #EmployeeSalesByMonth;


--GAPS/ISLANDS SOLUTION TOO!

DECLARE @sequence TABLE (field1 int PRIMARY KEY);

INSERT INTO @sequence (field1)
VALUES (1), (2), (3),
       (10), (11), (12), (13), (14), (15),
       (66), (67), (68),
       (100)

;WITH gaps AS
(
SELECT tmpGapStart = field1,
       tmpGapEnd = LEAD(field1, 1, NULL) OVER (ORDER BY field1)
  FROM @sequence
)
--SELECT * FROM gaps
SELECT [Start of Gap] = tmpGapStart + 1,
       [End of Gap] = tmpGapEnd - 1
  FROM gaps
 WHERE tmpGapEnd - tmpGapStart > 1
