SET NOCOUNT ON
GO
USE tempdb
GO

/* Cume_Dist */

CREATE TABLE #StudentsGrades (
   TestID INT,
   StudentID INT,
   Grade INT CONSTRAINT grades CHECK (Grade<120 AND Grade>=0)
)
 
INSERT INTO #StudentsGrades
VALUES (1,1,89), (1,2,79), (1,3,59), (1,4,99), (1,5,65), (1,6,80), (1,7,72), (1,8,78), (1,9,87), (1,10,100),
(2,1,72), (2,2,78), (2,3,89), (2,4,85), (2,5,80), (2,6,55), (2,7,100), (2,8,92), (2,9,90), (2,10,77),
(1,11,89), (1,12,79), (1,13,59), (1,14,99), (1,15,65),(1,16,75), (2,11,72), (2,12,78), (2,13,89), (2,14,85), (2,15,80),(2,16,80)

 
SELECT StudentID,
       TestID,
       Grade,
       CUME_DIST() OVER (PARTITION BY TestID ORDER BY Grade) AS PercentOfPeopleScoringLessThanOrEqualToMe,
       FORMAT(CUME_DIST() OVER (PARTITION BY TestID ORDER BY Grade), 'P') AS PercentOfPeopleScoringLessThanOrEqualToMeFormatted
  FROM #StudentsGrades

DROP TABLE #StudentsGrades


/* PERCENT_RANK */

CREATE TABLE #NumbersTable(Number INT)

INSERT INTO #NumbersTable(Number)
VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10)

SELECT Number, PERCENT_RANK() OVER (ORDER BY Number)
FROM #NumbersTable


/* PERCENTILE_DISC AND PERCENTILE_CONT */

SELECT Number,
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Number) OVER () as [0.5DISC],
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Number) OVER () as [0.5CONT]
FROM #NumbersTable


INSERT INTO #NumbersTable(Number)
VALUES(10),(11),(12)

SELECT Number,
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Number) OVER () as [0.5DISC],
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Number) OVER () as [0.5CONT]
FROM #NumbersTable

DROP TABLE #NumbersTable


--more complex media example

USE AdventureWorks2012;
  
SELECT DISTINCT Name AS DepartmentName
      ,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ph.Rate) 
                           OVER (PARTITION BY Name) AS MedianCont
      ,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ph.Rate) 
                           OVER (PARTITION BY Name) AS MedianDisc
 FROM HumanResources.Department AS d
INNER JOIN HumanResources.EmployeeDepartmentHistory AS dh 
   ON dh.DepartmentID = d.DepartmentID
INNER JOIN HumanResources.EmployeePayHistory AS ph
   ON ph.BusinessEntityID = dh.BusinessEntityID
WHERE dh.EndDate IS NULL;
