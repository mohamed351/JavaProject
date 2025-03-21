USE [JavaProject]
GO
/****** Object:  UserDefinedTableType [dbo].[InvoiceDetails]    Script Date: 3/12/2025 10:44:04 PM ******/
CREATE TYPE [dbo].[InvoiceDetails] AS TABLE(
	[ProductID] [int] NULL,
	[Price] [decimal](9, 5) NULL,
	[Quantity] [decimal](9, 5) NULL
)
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Salary] [decimal](9, 2) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceType]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceType](
	[ID] [int] NOT NULL,
	[InvoiceType] [nvarchar](100) NULL,
 CONSTRAINT [PK_InvoiceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[EmployeeID] [int] NULL,
	[CustomerID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[TypeID] [int] NULL,
	[OrderReference] [int] NULL,
	[IsCancelled] [bit] NULL,
	[StoreID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](9, 5) NULL,
	[Price] [decimal](9, 5) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](9, 5) NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStore]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStore](
	[ProductID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Quantity] [decimal](9, 5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaceOrder]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaceOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[PurchaingDate] [datetime] NULL,
	[IsCancelled] [bit] NULL,
	[EmployeeId] [int] NULL,
	[Note] [nvarchar](150) NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_PurchaceOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasingOrderDetails]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasingOrderDetails](
	[PurchaseOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](9, 5) NULL,
	[Price] [decimal](9, 5) NULL,
 CONSTRAINT [PK_PurchasingOrderDetails] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employees]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_InvoiceType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[InvoiceType] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_InvoiceType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Store]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[ProductStore]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductStore]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[PurchaceOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaceOrder_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[PurchaceOrder] CHECK CONSTRAINT [FK_PurchaceOrder_Employees]
GO
ALTER TABLE [dbo].[PurchaceOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaceOrder_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[PurchaceOrder] CHECK CONSTRAINT [FK_PurchaceOrder_Store]
GO
ALTER TABLE [dbo].[PurchaceOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaceOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[PurchaceOrder] CHECK CONSTRAINT [FK_PurchaceOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchasingOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchasingOrderDetails_PurchaceOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaceOrder] ([ID])
GO
ALTER TABLE [dbo].[PurchasingOrderDetails] CHECK CONSTRAINT [FK_PurchasingOrderDetails_PurchaceOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Customer]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Customer]
@ID int
as
Update Customer set isDeleted =1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_employee]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_employee]
@ID int 
AS
Update Employees set isDeleted = 1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Product]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Product]
@ID int 
as
Update Product set isDelete = 1 where ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Store]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Store]
@ID int 
as 
Update Store set isDelete =1 WHERE ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Supplier]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Supplier] 
@ID int 
as
Update Supplier set isDeleted = 1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetCustomerByID]
@ID int
as
select ID, Name, Phone from Customer where isDeleted =0 and ID = @ID;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetEmployeeByID]
@ID int
as
select  * from Employees where ID =@ID and  isDeleted = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_getOrderByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_getOrderByID]
@InvoiceID as int 
as
select 
ord.ID,
cust.[Name] as CustomerName ,  
emp.Name as Employee,
prod.Name,
detail.Price,
detail.Quantity,
detail.Price * detail.Quantity as Total
from [Order] as ord 
inner join OrderDetails as detail
on ord.ID = detail.OrderID
inner join Customer as cust
on cust.ID = ord.CustomerID
inner join Employees as emp
on  emp.ID = ord.EmployeeID
inner join Product as prod
on prod.ID = detail.ProductID
where ord.ID = @InvoiceID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetProductByID]
@ID int 
as
Select  ID,Name,Price from Product where isDelete =0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStoreByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetStoreByID]
@ID int 
as
Select  ID, Name, Address from Store where isDelete = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSupplierByID]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetSupplierByID] 
@ID int 
as
Select ID, Name ,Phone as PhoneNumber , Address   from Supplier where ID= @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Customer]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_insert_Customer]
@Name nvarchar(max),
@Phone nvarchar(max)
as
Insert into Customer values (@Name, @Phone , 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Employee]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_insert_Employee]
@Name nvarchar(max),
@Salary decimal(9,5),
@UserName nvarchar(max),
@Password nvarchar(max)
as
Insert into Employees (Name , Salary , UserName, Password) values (@Name, @Salary , @UserName, @Password)
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Product]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_insert_Product]
@Name nvarchar(max),
@Price decimal(9,5)
as
Insert into Product values (@Name, @Price, 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Store]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_insert_Store]
@Name nvarchar(max),
@Address nvarchar(max)
as
Insert into Store Values (@Name , @Address, 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertSupplier]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_insertSupplier]
@Name nvarchar(max),
@PhoneNumber nvarchar(max),
@Address  nvarchar(max)
as
Insert into Supplier (Name, Phone, Address, isDeleted) values (@Name, @PhoneNumber, @Address,0)
GO
/****** Object:  StoredProcedure [dbo].[sp_loginEmployee]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_loginEmployee]
@UserName nvarchar(max),
@Password nvarchar(max)
as
select ID , Name , UserName , Salary,UserName , Password  from Employees  where isDeleted = 0 and userName =@UserName and Password = @Password
GO
/****** Object:  StoredProcedure [dbo].[sp_purchaseOrder]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_purchaseOrder]
    @SupplierId INT,
    @EmployeeID INT, 
    @Note NVARCHAR(MAX),
	 @StoreID INT,
    @OrderDetails InvoiceDetails READONLY,
	@saveOrder int output
AS
BEGIN
    BEGIN TRY
        -- Start the transaction
        BEGIN TRANSACTION;

        -- Insert the order into the Order table
        INSERT INTO [PurchaceOrder]( SupplierID, EmployeeID, Note, PurchaingDate , StoreId) 
        VALUES (@SupplierId, @EmployeeID, @Note, GETDATE(), @StoreID);

        -- Get the last inserted OrderID
        DECLARE @OrderId INT = SCOPE_IDENTITY();

        -- Insert order details using the provided InvoiceDetails table type
        INSERT INTO [dbo].PurchasingOrderDetails(PurchaseOrderID, ProductID, Quantity, Price ) 
        SELECT @OrderId, ProductID, Quantity, Price FROM @OrderDetails;

        -- Commit the transaction
        COMMIT TRANSACTION;
		set @saveOrder =@OrderId
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        ROLLBACK TRANSACTION;

        -- Print error message (for debugging)
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_select_store]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_select_store]
@storeId as int 
as
select stor.Name, pr.Name as ProductName,  st.Quantity  from ProductStore as st inner join Product  as pr
on pr.ID = st.ProductID 
inner join Store as stor
on stor.ID = st.StoreID
where st.StoreID = @storeId
GO
/****** Object:  StoredProcedure [dbo].[sp_SubmitOrder]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_SubmitOrder]
    @CustomerID INT,
    @EmployeeID INT, 
    @Note NVARCHAR(MAX),
    @StoreID INT,
    @OrderDetails InvoiceDetails READONLY,
	@saveOrder int output
AS
BEGIN
    BEGIN TRY
        -- Start the transaction
        BEGIN TRANSACTION;

        -- Insert the order into the Order table
        INSERT INTO [dbo].[Order] (CustomerID, EmployeeID, Note, OrderDate,StoreID) 
        VALUES (@CustomerID, @EmployeeID, @Note, GETDATE(), @StoreID);

        -- Get the last inserted OrderID
        DECLARE @OrderId INT = SCOPE_IDENTITY();

        -- Insert order details using the provided InvoiceDetails table type
        INSERT INTO [dbo].[OrderDetails] (OrderID, ProductID, Quantity, Price) 
        SELECT @OrderId, ProductID, Quantity, Price FROM @OrderDetails;

        -- Commit the transaction
        COMMIT TRANSACTION;
		set @saveOrder =@OrderId
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        ROLLBACK TRANSACTION;

        -- Print error message (for debugging)
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Customer]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[sp_Update_Customer]
@ID int,
@Name nvarchar(max),
@Phone nvarchar(max)
as
Update Customer set Name =@Name , Phone = @Phone where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_update_Employee]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_update_Employee]
@ID int ,
@Name nvarchar(max),
@Salary decimal(9,5),
@UserName nvarchar(max),
@Password nvarchar(max)
as
Update Employees set Name = @Name , Salary = @Salary , UserName =@UserName , Password =@Password where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Product]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[sp_Update_Product]
@ID int ,
@Name nvarchar(max),
@Price decimal(9,5)
as
Update Product set Name = @Name , Price =@Price  where ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Store]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[sp_Update_Store]
@ID int,
@Name nvarchar(max),
@Address nvarchar(max)
as
Update Store set Name =@Name , Address = @Address where ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_updateSupplier]    Script Date: 3/12/2025 10:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_updateSupplier]
@ID int ,
@Name nvarchar(max),
@PhoneNumber nvarchar(max),
@Address nvarchar(max)
as
Update Supplier set Name =@Name , Phone =@PhoneNumber, Address =@Address  WHERE ID = @ID
GO
