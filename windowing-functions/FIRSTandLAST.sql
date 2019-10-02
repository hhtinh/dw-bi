SET NOCOUNT ON
USE AdventureWorks2012

--my laptop is too fast - use profiler :)
--SET STATISTICS IO ON
--SET STATISTICS TIME ON


/***********************
*** 1. First_Value() ***
***********************/

--- SQL 2000: using subquery

SELECT BusinessEntityID, (SELECT TOP 1 BusinessEntityID FROM HumanResources.Employee ORDER BY BusinessEntityID)
  FROM HumanResources.Employee
 ORDER BY BusinessEntityID

--- 2 scans

--- SQL 2000: using subquery with groups

SELECT JobTitle,BusinessEntityID, (SELECT TOP 1 BusinessEntityID FROM HumanResources.Employee b WHERE a.JobTitle=b.JobTitle ORDER BY BusinessEntityID)
FROM HumanResources.Employee a
ORDER BY JobTitle,BusinessEntityID

--- SQL 2005: using Row_Number()
WITH CTE AS
(
SELECT BusinessEntityID, ROW_NUMBER() OVER (Order by BusinessEntityID) as [ROW]
  FROM HumanResources.Employee
)
SELECT a.BusinessEntityID,b.BusinessEntityID
  FROM CTE a
 CROSS JOIN CTE b
 WHERE b.ROW=1
 ORDER BY a.BusinessEntityID


--- SQL 2005: using Row_Number() with groups
WITH CTE AS
(
SELECT BusinessEntityID,JobTitle, ROW_NUMBER() OVER (PARTITION BY JobTitle ORDER BY BusinessEntityID ) AS [ROW]
  FROM HumanResources.Employee
)
SELECT a.JobTitle,a.BusinessEntityID,b.BusinessEntityID
  FROM CTE a
  JOIN CTE b ON a.JobTitle=b.JobTitle
 WHERE b.ROW=1
 ORDER BY a.BusinessEntityID


--- Denali: using the FIRST_VALUE()

SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID)
  FROM HumanResources.Employee


--- Denali: using the FIRST_VALUE() with groups

SELECT JobTitle,BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (PARTITION BY JobTitle ORDER BY BusinessEntityID)
  FROM HumanResources.Employee


/***********************
*** 2. Last_Value() ***
***********************/

--- SQL 2000
SELECT BusinessEntityID, (SELECT TOP 1 BusinessEntityID FROM HumanResources.Employee ORDER BY BusinessEntityID DESC)
  FROM HumanResources.Employee
--ORDER BY BusinessEntityID


--- SQL 2005
WITH CTE AS
(
SELECT BusinessEntityID, ROW_NUMBER() OVER (Order by BusinessEntityID DESC) AS [ROW]
  FROM HumanResources.Employee
)
SELECT a.BusinessEntityID,b.BusinessEntityID
  FROM CTE a
 CROSS JOIN CTE b
 WHERE b.ROW=1
 ORDER BY a.BusinessEntityID


--- Denali: using the LAST_VALUE()

SELECT BusinessEntityID,
       LAST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID)
  FROM HumanResources.Employee

--- wow!! the wrong result, why??









--- Denali: using the LAST_VALUE() - this time with ranges...

SELECT BusinessEntityID,
       LAST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM HumanResources.Employee


--- let's try same result with First_value but the oposite order.
SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC )
  FROM HumanResources.Employee
--- what is it? why is the difference in performance?

--The reason is the frame definition
SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM HumanResources.Employee
--- now we get the same results.


---Why is there a such a big difference?
SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC ROWS BETWEEN 500 PRECEDING AND 500 FOLLOWING)
  FROM HumanResources.Employee
--- good performance, why?

--- Explenation anyone?
SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC ROWS BETWEEN 50000 PRECEDING AND 50000 FOLLOWING)
  FROM HumanResources.Employee

SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC ROWS BETWEEN 290 PRECEDING AND 290 FOLLOWING)
  FROM HumanResources.Employee

SELECT BusinessEntityID,
       FIRST_VALUE(BusinessEntityID) OVER (ORDER BY BusinessEntityID DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM HumanResources.Employee


