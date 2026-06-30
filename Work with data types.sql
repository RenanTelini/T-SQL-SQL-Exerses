/* Work with data types */

/* Use the AdventureWorksLT2022 database */
USE AdventureWorksLT2022;

/* This statement returns an error because it is not possible to concatenate a integer column with a text-based column */
SELECT ProductID + ': ' + Name AS ProductName FROM SalesLT.Product;

/* With CAST function, ProductID (integer) is converted to a varchar, enabling possible the concatenation with the Name column (nvarchar) */
SELECT CAST(ProductID AS varchar(5)) + ': ' + Name AS ProductName FROM SalesLT.Product;

/* This statement returns the same result as the previous statement, but now uses the CONVERT function.
   The CAST function is an ANSI standard part of the SQL language that is available in most database systems, while CONVERT is a SQL Server specific function. */
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductName FROM SalesLT.Product;

/* The CONVERT function includes a additional parameter that can be useful for formatting date and time values when converting them to text-based data. */
SELECT SellStartDate, 
	CONVERT(nvarchar(30), SellStartDate) AS ConvertdDate,
	CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate
FROM SalesLT.Product;

/* An error is returned because some Size value are not numeric */
SELECT Name, CAST(Size AS Integer) AS NumericSize FROM SalesLT.Product;

/* With Try_CAST function, Size column values was converted to integer, but the non-numeric sizes are returned as NULL */
SELECT Name, TRY_CAST(Size AS Integer) AS NumericSize FROM SalesLT.Product;