-- Importing Data Into a Live System
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick



DROP PROCEDURE ImportRow
GO
CREATE PROCEDURE ImportRow @RowId UNIQUEIDENTIFIER 
AS BEGIN
   DECLARE @BookId INTEGER
   DECLARE @Name CHAR(40)
   DECLARE @Quantity INTEGER
   DECLARE @Price DECIMAL(10,2)
   DECLARE @Type CHAR(20)

   DECLARE @checkFlag integer

   SELECT @BookId=BookId,
          @Name=Name,
          @Quantity=Quantity,
          @Price=Price,
          @Type=Type
      FROM BookstoreBuffer 
      WHERE Id=@RowId

   /* Place validation code here. Set @checkFlag to 0
   for good records, and set it to 1 for bad records.
   */
   IF @quantity < 0
      SELECT @checkFlag=1
   ELSE 
      SELECT @checkFlag=0
   
   /* If the row passed validation, update the operational table.
   */
   IF @checkFlag=0 BEGIN
      UPDATE Bookstore 
         SET 
            Name=@Name,
            Quantity=@Quantity,
            Price=@Price,
            Type=@Type
         WHERE bookID=@bookId
      IF @@rowcount=0
         INSERT INTO Bookstore(BookId, Name, Quantity, Price, Type)
            VALUES(@BookId, @Name, @Quantity, @Price, @Type)
      UPDATE BookstoreBuffer SET Status='A' WHERE Id=@rowID
   END ELSE
      UPDATE BookstoreBuffer SET Status='R' WHERE Id=@rowID
END
GO