USE EShop
 --COMMENT
 --Get all products
 Select * from Product

--Get all productst that habve category id = 10
Select * from Product where CategoryId=10

--Get total cost pf products listed with categoryid =10
Select SUM(Cost) from Product where CategoryId=10

--Get Product name , cost from product table
Select Name,Cost from Product

--Save above as view

Create View vw_Product AS 
(Select Name,Cost from Product)

--see the above view result
Select * from vw_Product

--gET ALL PRODUCTS WITH NAME STARTING WITH K
Select * from Product where Name Like 'K%'

--Get products wiyth second letter as e
Select * from Product where Name Like '[a-z]e%'

--Get all products whose cost is greater than 2000
Select * from Product where Cost>2000

--Get all products whose cost is not equal to 5000
Select * from Product where Cost<>2000

--Select all products with names as Tshirts, iPhone,kurti
Select * from Product where Name in ('T-Shirts', 'Iphone 14','Kurti')

--Getall products having a category id matching in productcategory

Select * from Product where CategoryId IN (Select Id from ProductCategory)

Select [Name], [OrderId] from Customer,Orders where Customer.Id = Orders.CustomerId 

Select Sum(Cost) from Customer,Orders, Product where Orders.CustomerId = Customer.Id AND Orders.ProductId = Product.Id
AND Customer.Name = 'Eena'





--Get all customer details
Select Name from Customer 


--Get all customer orders,customerid , orderid
Select [Name], [CustomerId],[OrderId] FROM Orders, Customer,Product where 


