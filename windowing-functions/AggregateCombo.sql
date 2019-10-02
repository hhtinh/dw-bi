SET NOCOUNT ON
GO
USE AdventureWorksDW2012
GO

;WITH SalesGrouping AS ( 
SELECT SalesTerritoryKey 
      ,YEAR(orderdate) AS OrderYear
      ,MONTH(orderdate) AS OrderMonth 
      ,SUM(SalesAmount) AS SalesAmount
  FROM dbo.FactInternetSales 
 WHERE CurrencyKey = 100 --USD
   AND SalesTerritoryKey = 4 --simplify data for viewing
 GROUP BY SalesTerritoryKey, YEAR(orderdate), MONTH(orderdate)
) 
SELECT SalesTerritoryKey 
      ,OrderYear 
      ,OrderMonth 
      ,SalesAmount 
      ,SUM(SalesAmount) OVER (PARTITION BY SalesTerritoryKey, OrderYear 
                                  ORDER BY OrderYear, OrderMonth 
                              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
          ) AS YTDSales 
  FROM SalesGrouping
 ORDER BY OrderYear, OrderMonth, SalesTerritoryKey 

;WITH SalesGrouping AS ( 
SELECT SalesTerritoryKey 
      ,YEAR(orderdate) AS OrderYear
      ,MONTH(orderdate) AS OrderMonth 
      ,SUM(SalesAmount) AS SalesAmount
  FROM dbo.FactInternetSales 
 WHERE CurrencyKey = 100 --USD
   AND SalesTerritoryKey = 4 --simplify data for viewing
 GROUP BY SalesTerritoryKey, YEAR(orderdate), MONTH(orderdate)) 
SELECT SalesTerritoryKey 
      ,OrderYear 
      ,OrderMonth 
      ,SalesAmount 
      ,YTDSales       = SUM(SalesAmount) --NOTE: cleaner to do this instead of AS at end?
                            OVER (PARTITION BY SalesTerritoryKey, OrderYear 
                                      ORDER BY OrderYear, OrderMonth 
                                       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
      ,AvgSales3Month = Avg(SalesAmount) 
                            OVER (PARTITION BY SalesTerritoryKey 
                                      ORDER BY OrderYear, OrderMonth 
                                       ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ) 
  FROM SalesGrouping
 ORDER BY OrderYear, OrderMonth, SalesTerritoryKey 

;WITH SalesGrouping AS ( 
SELECT SalesTerritoryKey 
      ,YEAR(orderdate) AS OrderYear
      ,MONTH(orderdate) AS OrderMonth 
      ,SUM(SalesAmount) AS SalesAmount
  FROM dbo.FactInternetSales 
 WHERE CurrencyKey = 100 --USD
   AND SalesTerritoryKey = 4 --simplify data for viewing
 GROUP BY SalesTerritoryKey, YEAR(orderdate), MONTH(orderdate)
) 
SELECT SalesTerritoryKey 
      ,OrderYear 
      ,OrderMonth 
      ,SalesAmount 
      ,YTDSales              = SUM(SalesAmount)
                                   OVER (PARTITION BY SalesTerritoryKey, OrderYear 
                                             ORDER BY OrderYear, OrderMonth 
                                              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
      ,AvgSales3Month        = Avg(SalesAmount) 
                                   OVER (PARTITION BY SalesTerritoryKey 
                                             ORDER BY OrderYear, OrderMonth 
                                              ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) 
      ,CurrentMthYearlyPct   = 100 * SUM(SalesAmount) 
                                   OVER (PARTITION BY SalesTerritoryKey, OrderYear 
                                             ORDER BY OrderYear, OrderMonth 
                                              ROWS CURRENT ROW) 
                             / SUM(SalesAmount) 
                                   OVER (PARTITION BY SalesTerritoryKey, OrderYear) 
  FROM SalesGrouping
 ORDER BY OrderYear, OrderMonth, SalesTerritoryKey 
