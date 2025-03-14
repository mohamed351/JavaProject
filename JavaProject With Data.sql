USE [JavaProject]
GO
/****** Object:  UserDefinedTableType [dbo].[InvoiceDetails]    Script Date: 3/12/2025 10:52:15 PM ******/
CREATE TYPE [dbo].[InvoiceDetails] AS TABLE(
	[ProductID] [int] NULL,
	[Price] [decimal](9, 5) NULL,
	[Quantity] [decimal](9, 5) NULL
)
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[InvoiceType]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[ProductStore]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[PurchaceOrder]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[PurchasingOrderDetails]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/12/2025 10:52:15 PM ******/
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
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Name], [Phone], [isDeleted]) VALUES (1, N'Mohamed', N'3000', 0)
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [isDeleted]) VALUES (2, N'Mohamed', N'0104859520', 1)
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [isDeleted]) VALUES (3, N'Ali', N'20', 1)
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [isDeleted]) VALUES (4, N'testing2', N'123', 0)
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [isDeleted]) VALUES (5, N'Hamdia', N'0104859520', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (1, N'Mohamed', CAST(3000.00 AS Decimal(9, 2)), N'mohamed123', N'123', 0)
INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (3, N'Mohamed Amer', CAST(3000.00 AS Decimal(9, 2)), N'mohamed2', N'123', 0)
INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (4, N'sayed', CAST(5000.00 AS Decimal(9, 2)), N'sayed', N'123', 0)
INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (5, N'khalid123', CAST(4000.00 AS Decimal(9, 2)), N'khalid', N'123', 1)
INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (6, N'Ali sayed', CAST(9000.00 AS Decimal(9, 2)), N'Ali3513', N'123', 1)
INSERT [dbo].[Employees] ([ID], [Name], [Salary], [UserName], [Password], [isDeleted]) VALUES (7, N'Soso5', CAST(5000.00 AS Decimal(9, 2)), N'soso351', N'0104859520', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[InvoiceType] ([ID], [InvoiceType]) VALUES (1, N'Invoice')
INSERT [dbo].[InvoiceType] ([ID], [InvoiceType]) VALUES (2, N'DebitNote')
INSERT [dbo].[InvoiceType] ([ID], [InvoiceType]) VALUES (3, N'CreditNote')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (8, CAST(N'2025-03-07T21:07:56.227' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (9, CAST(N'2025-03-08T20:14:22.080' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (10, CAST(N'2025-03-08T20:16:14.113' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (11, CAST(N'2025-03-08T20:19:03.653' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (12, CAST(N'2025-03-08T20:20:19.500' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (13, CAST(N'2025-03-08T20:21:16.983' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (14, CAST(N'2025-03-08T20:23:33.753' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (15, CAST(N'2025-03-08T20:25:32.237' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (16, CAST(N'2025-03-08T20:25:59.800' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (17, CAST(N'2025-03-08T20:26:31.650' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (18, CAST(N'2025-03-08T20:27:39.340' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (19, CAST(N'2025-03-08T20:28:58.127' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (20, CAST(N'2025-03-08T20:29:43.670' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (21, CAST(N'2025-03-08T20:29:54.113' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (22, CAST(N'2025-03-08T20:48:35.627' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (23, CAST(N'2025-03-08T20:49:51.213' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (24, CAST(N'2025-03-10T20:59:27.827' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (25, CAST(N'2025-03-10T21:00:36.763' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (26, CAST(N'2025-03-10T21:00:59.960' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (27, CAST(N'2025-03-10T21:01:41.257' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (28, CAST(N'2025-03-10T21:02:36.593' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (29, CAST(N'2025-03-10T21:04:47.913' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (30, CAST(N'2025-03-10T21:07:11.553' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (31, CAST(N'2025-03-10T21:08:02.243' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (32, CAST(N'2025-03-10T21:10:11.047' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (33, CAST(N'2025-03-11T00:34:45.483' AS DateTime), 1, 1, N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (34, CAST(N'2025-03-11T20:46:36.933' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (35, CAST(N'2025-03-11T20:46:52.573' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (36, CAST(N'2025-03-11T23:31:24.367' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (37, CAST(N'2025-03-12T00:16:10.877' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (38, CAST(N'2025-03-12T00:55:55.767' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [EmployeeID], [CustomerID], [Note], [TypeID], [OrderReference], [IsCancelled], [StoreID]) VALUES (39, CAST(N'2025-03-12T22:17:12.733' AS DateTime), 1, 1, N'', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 8, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 8, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 9, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 10, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (5, 10, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 11, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (7, 11, 3, CAST(5.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (8, 12, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (9, 12, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (10, 13, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (11, 13, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (12, 14, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (13, 15, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (14, 16, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (15, 17, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (16, 17, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (17, 18, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (18, 18, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (19, 19, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (20, 19, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (21, 20, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (22, 20, 1, CAST(1.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (23, 21, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (24, 21, 3, CAST(6.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (25, 22, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (26, 22, 3, CAST(3.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (27, 23, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (28, 23, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (29, 24, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (30, 24, 3, CAST(3.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (31, 25, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (32, 25, 3, CAST(3.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (33, 26, 3, CAST(3.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (34, 26, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (35, 27, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (36, 27, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (37, 28, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (38, 29, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (39, 30, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (40, 30, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (41, 31, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (42, 31, 1, CAST(1.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (43, 32, 1, CAST(20.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (44, 32, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (45, 33, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (46, 33, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (47, 34, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (48, 34, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (49, 35, 1, CAST(9.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (50, 35, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (51, 36, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (52, 36, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (53, 37, 1, CAST(1.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (54, 38, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (55, 39, 4, CAST(2.00000 AS Decimal(9, 5)), CAST(20.00000 AS Decimal(9, 5)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Price], [isDelete]) VALUES (1, N'Testing', CAST(123.00000 AS Decimal(9, 5)), 0)
INSERT [dbo].[Product] ([ID], [Name], [Price], [isDelete]) VALUES (2, N'Select', CAST(3000.00000 AS Decimal(9, 5)), 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [isDelete]) VALUES (3, N'Try2', CAST(7000.00000 AS Decimal(9, 5)), 0)
INSERT [dbo].[Product] ([ID], [Name], [Price], [isDelete]) VALUES (4, N'Espero Spatice', CAST(20.00000 AS Decimal(9, 5)), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductStore] ([ProductID], [StoreID], [Quantity]) VALUES (1, 1, CAST(11.00000 AS Decimal(9, 5)))
INSERT [dbo].[ProductStore] ([ProductID], [StoreID], [Quantity]) VALUES (1, 5, CAST(3.00000 AS Decimal(9, 5)))
INSERT [dbo].[ProductStore] ([ProductID], [StoreID], [Quantity]) VALUES (3, 1, CAST(8.00000 AS Decimal(9, 5)))
INSERT [dbo].[ProductStore] ([ProductID], [StoreID], [Quantity]) VALUES (3, 5, CAST(0.00000 AS Decimal(9, 5)))
INSERT [dbo].[ProductStore] ([ProductID], [StoreID], [Quantity]) VALUES (4, 1, CAST(1.00000 AS Decimal(9, 5)))
GO
SET IDENTITY_INSERT [dbo].[PurchaceOrder] ON 

INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (10, 1, CAST(N'2025-03-11T23:15:25.290' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (12, 1, CAST(N'2025-03-11T23:16:20.363' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (15, 1, CAST(N'2025-03-11T23:21:50.500' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (18, 1, CAST(N'2025-03-11T23:28:32.047' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (19, 1, CAST(N'2025-03-11T23:28:52.700' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (20, 1, CAST(N'2025-03-11T23:29:09.383' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (24, 1, CAST(N'2025-03-11T23:32:06.667' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (25, 1, CAST(N'2025-03-11T23:32:25.087' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (26, 1, CAST(N'2025-03-11T23:36:32.897' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (28, 1, CAST(N'2025-03-11T23:38:58.103' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (40, 1, CAST(N'2025-03-11T23:57:19.383' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (41, 1, CAST(N'2025-03-11T23:57:45.070' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (42, 1, CAST(N'2025-03-12T00:14:21.257' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (43, 1, CAST(N'2025-03-12T00:14:38.423' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (44, 1, CAST(N'2025-03-12T00:14:51.350' AS DateTime), NULL, 1, N'', 1)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (45, 1, CAST(N'2025-03-12T00:55:39.907' AS DateTime), NULL, 1, N'', 5)
INSERT [dbo].[PurchaceOrder] ([ID], [SupplierID], [PurchaingDate], [IsCancelled], [EmployeeId], [Note], [StoreId]) VALUES (46, 3, CAST(N'2025-03-12T22:16:16.493' AS DateTime), NULL, 1, N'', 1)
SET IDENTITY_INSERT [dbo].[PurchaceOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchasingOrderDetails] ON 

INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (1, 40, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (2, 41, 3, CAST(3.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (3, 41, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (4, 42, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (5, 42, 3, CAST(2.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (6, 43, 1, CAST(5.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (7, 43, 3, CAST(6.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (8, 44, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (9, 45, 1, CAST(3.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (10, 45, 3, CAST(1.00000 AS Decimal(9, 5)), CAST(7000.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (11, 46, 4, CAST(3.00000 AS Decimal(9, 5)), CAST(20.00000 AS Decimal(9, 5)))
INSERT [dbo].[PurchasingOrderDetails] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [Quantity], [Price]) VALUES (12, 46, 1, CAST(2.00000 AS Decimal(9, 5)), CAST(123.00000 AS Decimal(9, 5)))
SET IDENTITY_INSERT [dbo].[PurchasingOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [Name], [Address], [isDelete]) VALUES (1, N'Alexandria Store', N'Alexandria', 0)
INSERT [dbo].[Store] ([ID], [Name], [Address], [isDelete]) VALUES (2, N'Cairo Store 21', N'Cairo', 1)
INSERT [dbo].[Store] ([ID], [Name], [Address], [isDelete]) VALUES (3, N'tt', N'tt', 1)
INSERT [dbo].[Store] ([ID], [Name], [Address], [isDelete]) VALUES (4, N'uu', N'uu', 1)
INSERT [dbo].[Store] ([ID], [Name], [Address], [isDelete]) VALUES (5, N'Cairo Store', N'Cairo', 0)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Name], [Phone], [Address], [isDeleted]) VALUES (1, N'Ali', N'0104859520', N'Alex', 0)
INSERT [dbo].[Supplier] ([ID], [Name], [Phone], [Address], [isDeleted]) VALUES (2, N'testing9', N'0104859520', N'Alexandria', 1)
INSERT [dbo].[Supplier] ([ID], [Name], [Phone], [Address], [isDeleted]) VALUES (3, N'Sayed', N'0104859520', N'Alexandria Egypt', 0)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_delete_Customer]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Customer]
@ID int
as
Update Customer set isDeleted =1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_employee]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_employee]
@ID int 
AS
Update Employees set isDeleted = 1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Product]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Product]
@ID int 
as
Update Product set isDelete = 1 where ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Store]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Store]
@ID int 
as 
Update Store set isDelete =1 WHERE ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Supplier]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_delete_Supplier] 
@ID int 
as
Update Supplier set isDeleted = 1 where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerByID]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetCustomerByID]
@ID int
as
select ID, Name, Phone from Customer where isDeleted =0 and ID = @ID;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeByID]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetEmployeeByID]
@ID int
as
select  * from Employees where ID =@ID and  isDeleted = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_getOrderByID]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetProductByID]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetProductByID]
@ID int 
as
Select  ID,Name,Price from Product where isDelete =0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStoreByID]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetStoreByID]
@ID int 
as
Select  ID, Name, Address from Store where isDelete = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSupplierByID]    Script Date: 3/12/2025 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetSupplierByID] 
@ID int 
as
Select ID, Name ,Phone as PhoneNumber , Address   from Supplier where ID= @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Customer]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insert_Employee]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insert_Product]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insert_Store]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insertSupplier]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_loginEmployee]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_purchaseOrder]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_select_store]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubmitOrder]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Update_Customer]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_Employee]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Update_Product]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Update_Store]    Script Date: 3/12/2025 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_updateSupplier]    Script Date: 3/12/2025 10:52:15 PM ******/
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
