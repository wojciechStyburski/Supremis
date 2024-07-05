IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Customers')
BEGIN
	CREATE TABLE dbo.Customers
	(
		[CustomerID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[CustomerName] [nvarchar](100) NOT NULL,
		[Email] [nvarchar](50),
		[Phone] [nvarchar](15),
		CONSTRAINT [PK_Customers_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
	);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Invoices')
BEGIN
	CREATE TABLE dbo.Invoices
	(
		[InvoiceID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[CustomerID] [int] NOT NULL,
		[InvoiceDate] [datetime2],
		[TotalAmoun] [decimal](19,5),
		CONSTRAINT [PK_Invoices_InvoiceID] PRIMARY KEY CLUSTERED ([InvoiceID] ASC),
		CONSTRAINT [FK_Customers_CustomerID] FOREIGN KEY([CustomerID]) REFERENCES dbo.Customers ([CustomerID])
	);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='InvoiceItems')
BEGIN
	CREATE TABLE dbo.InvoiceItems 
	(
		[ItemID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[InvoiceID] [int] NOT NULL,
		[ProductName] [nvarchar](50),
		[Quantity] [decimal](19,5),
		[UnitPrice] [decimal](19,5)
		CONSTRAINT [PK_InvoiceItems_ItemID] PRIMARY KEY CLUSTERED (ItemID ASC),
		CONSTRAINT [FK_Invoices_InvoiceID] FOREIGN KEY([InvoiceID]) REFERENCES dbo.Invoices ([InvoiceID])
	);
END
GO