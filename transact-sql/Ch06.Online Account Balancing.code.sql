-- Online Account Balancing
--
-- Chapter 6 - Audit Logging
-- Type of content: code
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   AccountID,
   ProductID,
   (SUM(CASE WHEN Type='C' OR Type='L' OR Type='O' 
         THEN Qty ELSE 0 END)-
      SUM(CASE WHEN Type='D' OR Type='B'
         THEN Qty ELSE 0 END)) Total,
    SUM(CASE WHEN Type='B' 
      THEN Qty ELSE 0 END) Blocked,
   MAX(s.ValidDate) ValidDate
FROM StockRecord s
WHERE s.ValidDate BETWEEN
      ISNULL((SELECT MAX(st.ValidDate) 
              FROM StockRecord st 
              WHERE st.AccountID=s.AccountID AND
                    st.ProductID=s.ProductID AND
                    st.Type='O'),'1900-1-1')
                AND CURRENT_TIMESTAMP
GROUP BY s.AccountID, s.ProductID


SELECT 
   AccountID,
   ProductID,
   (SELECT SUM(CASE WHEN Type='C' OR Type='L' OR 
         Type='O' THEN Qty ELSE 0 END)-
      SUM(CASE WHEN Type='D' OR Type='M' OR Type='B' 
         THEN Qty ELSE 0 END)
   FROM StockRecord s1
   WHERE  s1.ValidDate >= 
      isnull((SELECT MAX(st.ValidDate) 
      FROM StockRecord st 
      WHERE st.AccountID=s.AccountID AND
         st.ProductID=s.ProductID AND 
         st.Type='O'),'1900-1-1') AND 
         s1.ValidDate<=MAX(s.ValidDate)AND
         s1.AccountID=s.AccountID AND
         s1.ProductID=s.ProductID) Available,
      CONVERT(CHAR(10),s.ValidDate,102) ValidDate
   FROM StockRecord s
   GROUP BY s.accountID, s.productID,
      CONVERT(CHAR(10),s.ValidDate,102)
   HAVING MAX(s.validDate) >=
      ISNULL((SELECT MAX(st.validDate) 
            FROM StockRecord st WHERE
            st.accountID=s.accountID AND
            st.productID=s.productID AND
            st.type='O'),'1900-1-1')
