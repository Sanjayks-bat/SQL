
CREATE TRIGGER tr_onInsert
   ON  [dbo].[Product]
   AFTER  INSERT
AS 
BEGIN
	
	Declare @Id Bigint
	Set @Id= (select id from inserted)
	Print @Id 
	Insert into [Audit]
		values ('Insertion event occured',@Id)
END
GO
