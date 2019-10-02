SET NOCOUNT ON
USE AdventureWorks2012

--use profiler instead
--SET STATISTICS IO ON
--SET STATISTICS TIME ON

--- OVER as we knew it so far - ranking functions and aggregate functions

SELECT JobTitle,BusinessEntityID,
       ROW_NUMBER() OVER (PARTITION BY JobTitle ORDER BY BusinessEntityID) as RowNumPerTitle
  FROM HumanResources.Employee

/* Till now we could also use it with aggregate functions */

SELECT JobTitle,
       BusinessEntityID,
       ROW_NUMBER() OVER (ORDER BY BusinessEntityID) as RowNum,
       COUNT(*) OVER () as TotalRows   ---- nice to know how many total rows when paging to know how many pages are there
 FROM HumanResources.Employee


/* Now for the new capabilities - using an aggregate function with the OVER clause and ORDER BY */
/* new operator  */
SELECT COUNT(*) OVER (ORDER BY BusinessEntityID) as CumulativeCount,
       ROW_NUMBER() OVER (ORDER BY BusinessEntityID) as RowNum,
       *
  FROM HumanResources.Employee

/* Now, with PARTITION BY */

SELECT JobTitle,
       COUNT(*) OVER (PARTITION BY JobTitle ORDER BY BusinessEntityID) as CumulativeCount,
       ROW_NUMBER() OVER (PARTITION BY JobTitle ORDER BY BusinessEntityID) as RowNum,
       *
  FROM HumanResources.Employee

--- Let's create sales by dates table and sales by teritory and salesporson

CREATE TABLE #Sales (SaleDate DATE, SaleAmount INT)

INSERT INTO #Sales
VALUES (GETDATE(),100),
(DATEADD(day,-1,GETDATE()),234),
(DATEADD(day,-2,GETDATE()),645),
(DATEADD(day,-3,GETDATE()),9824),
(DATEADD(day,-4,GETDATE()),12489),
(DATEADD(day,-5,GETDATE()),2305),
(DATEADD(day,-6,GETDATE()),1096),
(DATEADD(day,-7,GETDATE()),10933),
(DATEADD(day,-8,GETDATE()),37583),
(DATEADD(day,-9,GETDATE()),34823)


CREATE TABLE #SalesByPerson (PersonID INT identity(1,1), TeritoryID INT, SaleAmount INT)

INSERT INTO #SalesByPerson(TeritoryID,SaleAmount)
VALUES (1,100),
(1,515),
(1,789),
(1,123),
(2,7844),
(2,4556),
(2,2389),
(3,101),
(3,2098),
(3,6832),
(3,223)


----percent of to the Total

SELECT SaleDate,
SaleAmount as CurrentDaySales,
FORMAT
(
   CAST(SaleAmount as DECIMAL(8,2)) /
   CAST(SUM(SaleAmount) OVER () as DECIMAL(8,2))
,'P'
)  as SalesSoFar
FROM #Sales
ORDER BY SaleDate

---- Let's see who is the best of my teritory.
SELECT *, MAX(SaleAmount) OVER (PARTITION BY TeritoryID) AS TheBestInMyTeritory
FROM #SalesByPerson

----Running totals

/* Till SQL Denali */
--quadratic performance degredation!
SELECT SaleDate,
       SaleAmount AS CurrentDaySales,
       (SELECT SUM(SaleAmount) FROM #Sales b WHERE b.SaleDate<=a.SaleDate) AS SalesSoFar
  FROM #Sales a
 ORDER BY SaleDate

/* And now... */
--linear performance degredation
SELECT SaleDate,
       SaleAmount as CurrentDaySales,
       SUM(SaleAmount) OVER (ORDER BY SaleDate) as SalesSoFar
  FROM #Sales
 ORDER BY SaleDate

DROP TABLE #Sales
DROP TABLE #SalesByPerson


SELECT OrderDate,
       TotalDue,
       SUM(TotalDue) OVER (ORDER BY OrderDate) AS RunningTotal
  FROM Sales.SalesOrderHeader
/*  Return problematic(?) results due to defaults of frame - now explain... */

SELECT SUM(TotalDue) AS daytotal
  FROM Sales.SalesOrderHeader
 WHERE OrderDate = '2005-07-01'

/* Do we want to fix it like this? */
SELECT SalesOrderID,
       OrderDate,
       TotalDue,
       SUM(TotalDue) OVER (ORDER BY OrderDate,SalesOrderID)
  FROM Sales.SalesOrderHeader

---- The answer in few slides...

---- defining ranges.

CREATE TABLE T1(ID INT)
INSERT INTO T1(ID)
VALUES(1),(2),(2),(3),(4),(4)

---default frame
SELECT ID,COUNT(*) OVER (ORDER BY ID) AS [CountRowsTillThisRow?]
FROM T1

---This is also the definition of the default frame
SELECT ID,COUNT(*) OVER (ORDER BY ID RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS [CountRowsTillThisRow?]
FROM T1

-- This is what we wanted.
SELECT ID,COUNT(*) OVER (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM T1

DROP TABLE T1;


-- is this the way we wanted to fix the running totals ?
SELECT OrderDate,TotalDue,
       SUM(TotalDue) OVER (ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
  FROM Sales.SalesOrderHeader

-- extra credit - what does this do ??
SELECT OrderDate,TotalDue,
       SUM(TotalDue) OVER (PARTITION BY OrderDate ORDER BY OrderDate rows between UNBOUNDED Preceding and CURRENT ROW) AS [??RunningTotal],
  	    SUM(TotalDue) OVER (ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS [???RunningTotal],
       SUM(TotalDue) OVER (ORDER BY OrderDate rows between UNBOUNDED Preceding and CURRENT ROW) as CumulativeRunningTotal
  FROM Sales.SalesOrderHeader
