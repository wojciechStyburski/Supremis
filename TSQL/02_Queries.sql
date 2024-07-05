--Task 1
SELECT	TOP 5 c.CustomerName, c.Email, c.Phone, SUM(i.TotalAmoun) TotalAmount, COUNT(i.InvoiceID) InvoiceCount, AVG(i.TotalAmoun) AvarageAmount
FROM	dbo.Customers c WITH(NOLOCK)
JOIN	dbo.Invoices i  WITH(NOLOCK) ON i.CustomerID = c.CustomerID
WHERE	CAST(i.InvoiceDate AS DATE) BETWEEN CAST (DATEADD(MONTH, -3, GETDATE()) AS DATE) AND CAST (GETDATE() AS DATE)
GROUP	BY c.CustomerName, c.Email, c.Phone
ORDER	BY TotalAmount DESC

--Task 2
SELECT	TOP 3 MONTH(i.InvoiceDate) Month, ii.ProductName, SUM(ii.Quantity) TotalQuantity, SUM(ii.Quantity * ii.UnitPrice) TotalSellValue
FROM	dbo.InvoiceItems ii WITH (NOLOCK)
JOIN	dbo.Invoices i WITH (NOLOCK) on i.InvoiceID = ii.InvoiceID
WHERE	YEAR(i.InvoiceDate) = YEAR(GETDATE())
GROUP	BY MONTH(i.InvoiceDate), ii.ProductName
ORDER	BY TotalSellValue DESC

--Task 3
DECLARE @CurrentDate DATE = GETDATE();
DECLARE @SixMonthsAgo DATE = DATEADD(MONTH, -6, @CurrentDate);
DECLARE @TwelveMonthsAgo DATE = DATEADD(MONTH, -12, @CurrentDate);

WITH LastPurchaseDate AS 
(
    SELECT	c.CustomerID, MAX(i.InvoiceDate) AS LastPurchaseDate
    FROM	dbo.Customers c
    LEFT	JOIN dbo.Invoices i ON c.CustomerID = i.CustomerID
    GROUP	BY c.CustomerID
);

SELECT	c.CustomerID,c.CustomerName,c.Email,c.Phone,lpd.LastPurchaseDate
FROM	dbo.Customers c
INNER	JOIN LastPurchaseDate lpd ON c.CustomerID = lpd.CustomerID
WHERE	lpd.LastPurchaseDate < @SixMonthsAgo AND lpd.LastPurchaseDate >= @TwelveMonthsAgo
ORDER	BY lpd.LastPurchaseDate DESC;