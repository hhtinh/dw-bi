-- Hiding the Import Procedure  
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TRIGGER UpdateBookstoreBuffer
GO
CREATE TRIGGER UpdateBookstoreBuffer
ON BookstoreBuffer
FOR INSERT
AS BEGIN
   DECLARE @id UNIQUEIDENTIFIER
   
   DECLARE @BookId INTEGER
   DECLARE @Name CHAR(40)
   DECLARE @Quantity INTEGER
   DECLARE @Price DECIMAL(10,2)
   DECLARE @Type CHAR(20)

   DECLARE @CheckFlag INTEGER

   DECLARE BufferCursor CURSOR FOR
      SELECT Id, BookId, Name, Quantity, Price, Type 
      FROM BookstoreBuffer WHERE Status='I'
  
   OPEN BufferCursor  
   
   FETCH NEXT FROM BufferCursor 
      INTO @Id, @BookId, @Name, @Quantity, @Price, @Type

   WHILE @@FETCH_STATUS=0
   BEGIN
      /* Place validation code here. Set @checkFlag to 0
         for good records, and set it to 1 for bad records.
      */
      IF @quantity < 0
         SELECT @checkFlag=1
      ELSE 
         SELECT @checkFlag=0
     
      /* If the row passed validation, update the operational table.
      */
      IF @CheckFlag=0 BEGIN
         UPDATE Bookstore 
         SET 
            Name=@Name,
            Quantity=@Quantity,
            Price=@Price,
            Type=@Type
         WHERE bookID=@bookId

         IF @@ROWCOUNT=0  
            INSERT INTO Bookstore(BookId, Name, Quantity, Price, Type)
               VALUES(@BookId, @Name, @Quantity, @Price, @Type)
         UPDATE BookstoreBuffer SET Status='A' WHERE Id=@Id
      END ELSE 
         UPDATE BookstoreBuffer SET Status='R' WHERE Id=@Id

      FETCH NEXT FROM BufferCursor 
         INTO @Id, @BookId, @Name, @Quantity, @Price, @Type
   END

   CLOSE BufferCursor
   DEALLOCATE BufferCursor
END




INSERT INTO BookstoreBuffer(BookId,Name,Quantity,Price,Type) VALUES(1,'Software Engineering', 5, 15,'Manual')
INSERT INTO BookstoreBuffer(BookId,Name,Quantity,Price,Type) VALUES(2,'Modern Operating Systems', 7, 20,'Reference')
INSERT INTO BookstoreBuffer(BookId,Name,Quantity,Price,Type) VALUES(3,'Learn SQL', 15, 18,'Textbook')
INSERT INTO BookstoreBuffer(BookId,Name,Quantity,Price,Type) VALUES(4,'Learn Advanced SQL', 1, 8,'Textbook')
INSERT INTO BookstoreBuffer(BookId,Name,Quantity,Price,Type) VALUES(5,'JavaScript Tutorial', 5, 10,'Textbook')
GO

