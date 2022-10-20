--cursor: similar to traversing each row in a loop and manipulating row by row  and column by column to be only shown to the user
/* foreach(single in collection){
..logic.
}
*/
/*
For a cursor
1. DECLARE a cursor
2. Open the cursor
3. Fetch new row from desired table or output of query
4. Write a loop to work row by row
5. Close cursor
*/


--Depending on how many products below to a product category
--Display a message that ProductCategory is Trending/ New / Normal Purchases for products
-- New products in product categroy
-- normal purcahse in productcategry

Declare @ProductCount INT
Declare @Category nvarchar(50)
Declare cur_TrendingCategories Cursor FOR
	Select Count(Product.Name) as ProductCount, ProductCategory.Name
	From Product Right OUTER JOIN ProductCategory 
	ON Product.CategoryId = ProductCategory.Id
	Group by ProductCategory.Name

OPEN cur_TrendingCategories
Fetch Next From cur_TrendingCategories
INto @ProductCount, @Category
--Logic
WHILE @@FETCH_STATUS = 0
BEGIN
	If @ProductCount > 3
		Print @Category + ' is Trending!!'
	Else IF @ProductCount > 0 and @ProductCount <3
		Print @Category + ' has normal purchases'
	Else 
		Print @Category + ' has no new Products'
Fetch Next from cur_TrendingCategories into @ProductCount, @Category
END
--ENd of row by row processing
Close cur_TrendingCategories
DeAllocate cur_TrendingCategories