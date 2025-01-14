
CREATE TABLE [dbo].[GarmentService](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[GarmentID] [int] NULL,
	[ServiceID] [int] NULL,
	[Price] [float] NULL,
	[isOffered] [bit] NULL,
	[CorpID] [int] NULL,
 CONSTRAINT [PK_GarmentService] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GarmentType]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GarmentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GarmetType] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[GImage] [image] NULL,
	[CompanyID] [int] NULL,
	[CategoryID] [int] NULL,
	[TagCount] [int] NULL,
	[Weight] [float] NULL,
 CONSTRAINT [PK_GarmentTypw] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](50) NULL,
	[FullName] [varchar](200) NULL,
	[Address] [varchar](500) NULL,
	[Landmark] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[MobileNumber] [varchar](20) NULL,
	[Attn] [varchar](100) NULL,
	[AccountType] [int] NULL,
	[Phone1] [varchar](20) NULL,
	[Phone2] [varchar](20) NULL,
	[Phone3] [varchar](20) NULL,
	[Phone4] [varchar](20) NULL,
	[Phone5] [varchar](20) NULL,
	[CustomerCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CompanyID] [int] NULL,
	[isActive] [bit] NULL,
	[Email] [varchar](100) NULL,
	[CorpID] [int] NULL,
	[isSync] [bit] NULL,
	[Password] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCustomerPrice]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwCustomerPrice]
AS
SELECT        dbo.GarmentService.TID, dbo.GarmentService.GarmentID, dbo.GarmentService.ServiceID, dbo.GarmentService.Price, dbo.GarmentService.isOffered, dbo.GarmentService.CorpID, dbo.GarmentType.GarmetType, 
                         dbo.Customer.ID AS CustomerID, dbo.Customer.FullName, dbo.Customer.PhoneNumber, dbo.Services.ServiceType
FROM            dbo.GarmentService INNER JOIN
                         dbo.GarmentType ON dbo.GarmentService.GarmentID = dbo.GarmentType.ID INNER JOIN
                         dbo.Customer ON dbo.GarmentService.CorpID = dbo.Customer.CorpID INNER JOIN
                         dbo.Services ON dbo.GarmentService.ServiceID = dbo.Services.ID

GO
/****** Object:  Table [dbo].[CorporateAccount]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporateAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CorporateCode] [varchar](50) NULL,
	[CorpName] [varchar](100) NULL,
	[PaymentTerms] [int] NULL,
	[AccountStart] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_CorporateAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[TID] [varchar](15) NOT NULL,
	[OrderID] [varchar](10) NULL,
	[GarmentID] [int] NULL,
	[ServiceID] [int] NULL,
	[Qty] [int] NULL,
	[Total] [float] NULL,
	[Status] [varchar](50) NULL,
	[DeliveredOn] [datetime] NULL,
	[LineID] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [varchar](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[DeliverBy] [datetime] NULL,
	[isCancelled] [bit] NULL,
	[isPaid] [bit] NULL,
	[CompanyID] [int] NULL,
	[Status] [varchar](50) NULL,
	[isHang] [bit] NULL,
	[Comments] [varchar](100) NULL,
	[LocationID] [int] NULL,
	[PromoApplied] [int] NULL,
	[Discount] [float] NULL,
	[DoEmail] [datetime] NULL,
	[SubTotal] [float] NULL,
	[VATAmount] [float] NULL,
	[GrandTotal] [float] NULL,
	[Balance] [float] NULL,
	[isExpress] [bit] NULL,
	[isSync] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwOrders]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrders]
AS
SELECT        dbo.Orders.ID AS OrderNumber, dbo.Orders.OrderDate, dbo.Orders.Status AS OrderStatus, dbo.GarmentType.GarmetType, dbo.Services.ServiceType, dbo.GarmentService.Price, dbo.OrderDetails.Qty, dbo.OrderDetails.Total, 
                         dbo.OrderDetails.Status, dbo.Customer.CustomerID, dbo.Customer.FullName, dbo.Customer.Address, dbo.Customer.Landmark, dbo.Customer.PhoneNumber, dbo.Customer.MobileNumber, dbo.Customer.Attn, 
                         dbo.Customer.AccountType, dbo.Customer.Phone1, dbo.Customer.Phone2, dbo.Customer.Phone3, dbo.Customer.Phone4, dbo.Customer.Phone5, dbo.Customer.CustomerCode, dbo.OrderDetails.TID, dbo.Orders.isExpress, 
                         dbo.Orders.GrandTotal, dbo.Orders.VATAmount, dbo.Orders.Discount, dbo.Orders.CustomerID AS CustID, dbo.CorporateAccount.CorporateCode, dbo.CorporateAccount.CorpName
FROM            dbo.Orders INNER JOIN
                         dbo.OrderDetails ON dbo.Orders.ID = dbo.OrderDetails.OrderID INNER JOIN
                         dbo.GarmentType ON dbo.OrderDetails.GarmentID = dbo.GarmentType.ID INNER JOIN
                         dbo.Services ON dbo.OrderDetails.ServiceID = dbo.Services.ID INNER JOIN
                         dbo.GarmentService ON dbo.GarmentType.ID = dbo.GarmentService.GarmentID AND dbo.Services.ID = dbo.GarmentService.ServiceID INNER JOIN
                         dbo.Customer ON dbo.Orders.CustomerID = dbo.Customer.ID AND dbo.GarmentService.CorpID = dbo.Customer.CorpID INNER JOIN
                         dbo.CorporateAccount ON dbo.GarmentService.CorpID = dbo.CorporateAccount.ID AND dbo.Customer.CorpID = dbo.CorporateAccount.ID

GO
/****** Object:  View [dbo].[vwOrderTotal]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrderTotal]
AS
SELECT     OrderNumber, SUM(Total) AS OrderTotal
FROM         dbo.vwOrders
GROUP BY OrderNumber



GO
/****** Object:  View [dbo].[vwOrderQty]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrderQty]
AS
SELECT     OrderNumber, SUM(Qty) AS totalQty
FROM         dbo.vwOrders
GROUP BY OrderNumber



GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PayID] [varchar](50) NOT NULL,
	[OrderID] [varchar](10) NULL,
	[PayDate] [datetime] NULL,
	[Amount] [float] NULL,
	[RecievedBy] [int] NULL,
	[PaymentType] [varchar](50) NULL,
	[isCancelled] [bit] NULL,
	[CancelledBy] [int] NULL,
	[CancelledOn] [datetime] NULL,
	[isSync] [bit] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPayments]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPayments]
AS
SELECT     OrderID, SUM(Amount) AS TotalPaid
FROM         dbo.Payments
GROUP BY OrderID



GO
/****** Object:  View [dbo].[vwOrderPayments]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrderPayments]
AS
SELECT     dbo.Orders.ID, dbo.Orders.OrderDate, dbo.Customer.CustomerID, dbo.Customer.FullName, dbo.Customer.Address, dbo.Customer.Landmark, dbo.Customer.PhoneNumber, 
                      dbo.Customer.MobileNumber, dbo.Customer.Attn, dbo.Customer.AccountType, dbo.Customer.Phone1, dbo.Customer.Phone2, dbo.Customer.Phone3, dbo.Customer.Phone4, dbo.Customer.Phone5, 
                      dbo.Customer.CustomerCode, dbo.Orders.Status, SUM(dbo.OrderDetails.Total) AS TotalAmount, ISNULL(dbo.vwPayments.TotalPaid, 0) AS TotalPaid, SUM(dbo.OrderDetails.Qty) AS TotalItems
FROM         dbo.Orders INNER JOIN
                      dbo.OrderDetails ON dbo.Orders.ID = dbo.OrderDetails.OrderID INNER JOIN
                      dbo.Customer ON dbo.Orders.CustomerID = dbo.Customer.ID LEFT OUTER JOIN
                      dbo.vwPayments ON dbo.Orders.ID = dbo.vwPayments.OrderID
GROUP BY dbo.Orders.ID, dbo.Orders.OrderDate, dbo.Customer.CustomerID, dbo.Customer.FullName, dbo.Customer.Address, dbo.Customer.Landmark, dbo.Customer.PhoneNumber, 
                      dbo.Customer.MobileNumber, dbo.Customer.Attn, dbo.Customer.AccountType, dbo.Customer.Phone1, dbo.Customer.Phone2, dbo.Customer.Phone3, dbo.Customer.Phone4, dbo.Customer.Phone5, 
                      dbo.Customer.CustomerCode, dbo.Orders.Status, dbo.vwPayments.TotalPaid



GO
/****** Object:  View [dbo].[vwXOrder]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwXOrder]
AS
SELECT        TOP (100) PERCENT dbo.Customer.CustomerID,dbo.Customer.ID AS CID ,dbo.Customer.FullName, dbo.Customer.Address, dbo.Customer.Landmark, dbo.Customer.PhoneNumber, dbo.Customer.MobileNumber, dbo.Customer.Attn, 
                         dbo.Customer.AccountType, dbo.Customer.Phone1, dbo.Customer.Phone2, dbo.Customer.Phone3, dbo.Customer.Phone4, dbo.Customer.Phone5, dbo.Customer.CustomerCode, dbo.Customer.CreatedOn, dbo.vwOrderQty.totalQty, 
                         dbo.vwOrderTotal.OrderTotal, dbo.Orders.ID, dbo.Orders.OrderDate, dbo.Orders.Status, dbo.Orders.isHang, dbo.Orders.Comments, ISNULL(dbo.vwPayments.TotalPaid, 0) AS TotalAdvance, CONVERT(varchar(10), 
                         dbo.Orders.OrderDate, 120) AS OrdrDate, dbo.Orders.isExpress
FROM            dbo.Orders INNER JOIN
                         dbo.Customer ON dbo.Orders.CustomerID = dbo.Customer.ID INNER JOIN
                         dbo.vwOrderTotal ON dbo.Orders.ID = dbo.vwOrderTotal.OrderNumber INNER JOIN
                         dbo.vwOrderQty ON dbo.Orders.ID = dbo.vwOrderQty.OrderNumber LEFT OUTER JOIN
                         dbo.vwPayments ON dbo.Orders.ID = dbo.vwPayments.OrderID


GO
/****** Object:  Table [dbo].[Items]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [varchar](15) NOT NULL,
	[OrderID] [varchar](10) NULL,
	[OrderTID] [varchar](15) NULL,
	[TagID] [varchar](24) NULL,
	[Status] [varchar](50) NULL,
	[TaggedOn] [datetime] NULL,
	[LastSeen] [int] NULL,
	[LastSeenTime] [datetime] NULL,
	[LineID] [int] NULL,
	[Comments] [varchar](100) NULL,
	[ItemImage] [image] NULL,
	[isSync] [bit] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [varchar](50) NULL,
	[LocationName] [varchar](100) NULL,
	[LocationType] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[CompanyID] [int] NULL,
	[LastOrderID] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusMaster]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDesc] [varchar](50) NULL,
	[HoursMax] [int] NOT NULL,
 CONSTRAINT [PK_StatusMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAlarms]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAlarms]
AS
SELECT        dbo.Items.ID, dbo.Items.OrderID, dbo.Items.OrderTID, dbo.Items.TagID, dbo.Items.Status, dbo.Items.TaggedOn, dbo.Items.LastSeen, dbo.Items.LastSeenTime, dbo.Items.LineID, dbo.Items.Comments, dbo.Items.ItemImage, 
                         dbo.StatusMaster.HoursMax, dbo.Orders.OrderDate, dbo.GarmentType.GarmetType, dbo.Services.ServiceType, dbo.Customer.FullName, Locations_1.LocationCode, Locations_1.LocationName, Locations_1.LocationType, 
                         dbo.Locations.LocationCode AS LastLocCode, dbo.Locations.LocationName AS LastLocName, dbo.Locations.LocationType AS LastLocType, DATEADD(hh, dbo.StatusMaster.HoursMax, dbo.Items.LastSeenTime) AS AlarmTime, 
                         dbo.Orders.LocationID
FROM            dbo.Items INNER JOIN
                         dbo.StatusMaster ON dbo.Items.Status = dbo.StatusMaster.StatusDesc INNER JOIN
                         dbo.Orders ON dbo.Items.OrderID = dbo.Orders.ID INNER JOIN
                         dbo.OrderDetails ON dbo.Items.OrderTID = dbo.OrderDetails.TID INNER JOIN
                         dbo.GarmentType ON dbo.OrderDetails.GarmentID = dbo.GarmentType.ID INNER JOIN
                         dbo.Services ON dbo.OrderDetails.ServiceID = dbo.Services.ID INNER JOIN
                         dbo.Customer ON dbo.Orders.CustomerID = dbo.Customer.ID INNER JOIN
                         dbo.Locations ON dbo.Items.LastSeen = dbo.Locations.ID INNER JOIN
                         dbo.Locations AS Locations_1 ON dbo.Orders.LocationID = Locations_1.ID


GO
/****** Object:  Table [dbo].[RFIDReaders]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFIDReaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReaderCode] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[AN1] [float] NULL,
	[AN2] [float] NULL,
	[AN3] [float] NULL,
	[AN4] [float] NULL,
	[ReaderType] [varchar](50) NULL,
	[LocationID] [int] NULL,
	[CompanyID] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_RFIDReaders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwItems]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwItems]
AS
SELECT        dbo.Items.ID, dbo.Items.OrderID, dbo.Items.OrderTID, dbo.Items.TagID, dbo.Items.Status, dbo.Items.TaggedOn, dbo.Items.LastSeen, dbo.Items.LastSeenTime, dbo.Items.LineID, dbo.Orders.LocationID, 
                         dbo.Locations.LocationCode, dbo.Locations.LocationName, dbo.Locations.LocationType, dbo.GarmentType.GarmetType, dbo.Services.ServiceType, dbo.RFIDReaders.ReaderCode, Locations_1.LocationCode AS LastLocCode, 
                         Locations_1.LocationName AS LastLocName, dbo.RFIDReaders.LocationID AS LastLocID, dbo.Customer.FullName, dbo.Customer.Email, dbo.Orders.DoEmail, dbo.Orders.isExpress
FROM            dbo.Customer INNER JOIN
                         dbo.Items INNER JOIN
                         dbo.OrderDetails ON dbo.Items.OrderTID = dbo.OrderDetails.TID INNER JOIN
                         dbo.Orders ON dbo.OrderDetails.OrderID = dbo.Orders.ID INNER JOIN
                         dbo.Locations ON dbo.Orders.LocationID = dbo.Locations.ID INNER JOIN
                         dbo.GarmentType ON dbo.OrderDetails.GarmentID = dbo.GarmentType.ID INNER JOIN
                         dbo.Services ON dbo.OrderDetails.ServiceID = dbo.Services.ID ON dbo.Customer.ID = dbo.Orders.CustomerID LEFT OUTER JOIN
                         dbo.Locations AS Locations_1 INNER JOIN
                         dbo.RFIDReaders ON Locations_1.ID = dbo.RFIDReaders.LocationID ON dbo.Items.LastSeen = dbo.RFIDReaders.ID

GO
/****** Object:  View [dbo].[vwOrderItemStatus]    Script Date: 10/24/2019 10:45:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrderItemStatus]
AS
SELECT     OrderID, COUNT(*) AS Cnt, Status
FROM         dbo.OrderDetails
GROUP BY OrderID, Status



GO
/****** Object:  View [dbo].[vwTaggedItems]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTaggedItems]
AS
SELECT        COUNT(dbo.Items.ID) AS TaggedCount, dbo.OrderDetails.TID, dbo.GarmentType.GarmetType, dbo.GarmentType.TagCount, dbo.OrderDetails.Qty, dbo.OrderDetails.OrderID, dbo.OrderDetails.GarmentID, 
                         dbo.Locations.LocationCode, dbo.Locations.LocationName, dbo.Orders.LocationID
FROM            dbo.OrderDetails INNER JOIN
                         dbo.GarmentType ON dbo.OrderDetails.GarmentID = dbo.GarmentType.ID INNER JOIN
                         dbo.Orders ON dbo.OrderDetails.OrderID = dbo.Orders.ID INNER JOIN
                         dbo.Locations ON dbo.Orders.LocationID = dbo.Locations.ID LEFT OUTER JOIN
                         dbo.Items ON dbo.OrderDetails.TID = dbo.Items.OrderTID
GROUP BY dbo.OrderDetails.TID, dbo.GarmentType.GarmetType, dbo.GarmentType.TagCount, dbo.OrderDetails.Qty, dbo.OrderDetails.OrderID, dbo.OrderDetails.GarmentID, dbo.Locations.LocationCode, dbo.Locations.LocationName, 
                         dbo.Orders.LocationID

GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[TStamp] [datetime] NULL,
	[EventType] [varchar](50) NULL,
	[EventDesc] [varchar](200) NULL,
	[UserID] [int] NULL,
	[isSync] [bit] NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[NumberOfGarment] [int] NULL,
	[BookingDate] [date] NULL,
	[TimeSlot] [nvarchar](20) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NULL,
	[CompanyCode] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[PhoneNo] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[Logo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorporateCustomer]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporateCustomer](
	[CorporateID] [int] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
 CONSTRAINT [PK_CorporateCustomer] PRIMARY KEY CLUSTERED 
(
	[CorporateID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemHistory]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [varchar](15) NULL,
	[LocationID] [int] NULL,
	[TStamp] [datetime] NULL,
	[BatchID] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[isSync] [bit] NULL,
 CONSTRAINT [PK_ItemHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payterms]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payterms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaytermName] [varchar](50) NULL,
	[PayAfter] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Payterms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionLocation]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionLocation](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[PromotionID] [int] NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_PromotionLocation] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PromoCode] [varchar](50) NULL,
	[PromoName] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PromoType] [varchar](50) NULL,
	[ApplicableAfter] [int] NULL,
	[DiscountPer] [float] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportLog]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [varchar](50) NULL,
	[ReportDate] [datetime] NULL,
	[ReportDoc] [varbinary](max) NULL,
	[ReportBy] [int] NULL,
	[ReportingTime] [datetime] NULL,
 CONSTRAINT [PK_ReportLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccess]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccess](
	[AccessID] [int] IDENTITY(1,1) NOT NULL,
	[AccessDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblAcces__4130D0BF6F94D55A] PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAppPrefs]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppPrefs](
	[AppSetting] [varchar](50) NOT NULL,
	[AppValue] [varchar](500) NULL,
 CONSTRAINT [PK_tblAppPrefs] PRIMARY KEY CLUSTERED 
(
	[AppSetting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleDesc] [varchar](50) NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoleDetails]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleDetails](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[AccessID] [int] NOT NULL,
 CONSTRAINT [PK__tblRoleD__C456D72907020F21] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[iPassword] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[RFID] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[BS] [varchar](50) NULL,
 CONSTRAINT [PK__tblUser__C5B196026EF57B66] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCompany]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompany](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[CID] [int] NULL,
 CONSTRAINT [PK_UserCompany] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocation](
	[UserID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_UserLocation] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuditLog] ON 

INSERT [dbo].[AuditLog] ([TID], [OrderID], [TStamp], [EventType], [EventDesc], [UserID], [isSync]) VALUES (1, 2, CAST(N'2019-08-26T00:00:00.000' AS DateTime), N'Test Event Type2', N'Test Event Desc2', 2, 0)
INSERT [dbo].[AuditLog] ([TID], [OrderID], [TStamp], [EventType], [EventDesc], [UserID], [isSync]) VALUES (2, 2, CAST(N'2019-08-26T00:00:00.000' AS DateTime), N'Test Event Type2', N'Test Event Desc2', 2, 1)
SET IDENTITY_INSERT [dbo].[AuditLog] OFF
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (1, 27, 3, CAST(N'2019-10-18' AS Date), N'10 to 12', 1, CAST(N'2019-10-18T16:55:29.993' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (2, 27, 45, CAST(N'2019-10-21' AS Date), N'12 to 2', 1, CAST(N'2019-10-18T17:26:45.900' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (3, 27, 3, CAST(N'2019-10-19' AS Date), N'2 to 4', 1, CAST(N'2019-10-19T14:44:45.087' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (4, 27, 2, CAST(N'2019-10-20' AS Date), N'4 to 6', 1, CAST(N'2019-10-19T15:46:33.947' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (5, 27, 9, CAST(N'2019-10-27' AS Date), N'10 to 12', 1, CAST(N'2019-10-21T18:08:38.890' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (6, 27, 4, CAST(N'2019-10-22' AS Date), N'8 to 10', 1, CAST(N'2019-10-22T14:28:32.823' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (7, 636980347605489501, 5, CAST(N'2019-10-22' AS Date), N'8 to 10', 1, CAST(N'2019-10-22T14:55:11.463' AS DateTime))
INSERT [dbo].[Booking] ([BookingId], [CustomerId], [NumberOfGarment], [BookingDate], [TimeSlot], [CreatedBy], [CreatedOn]) VALUES (8, 636968229649627807, 3, CAST(N'2019-10-23' AS Date), N'10 to 12', 1, CAST(N'2019-10-23T11:37:40.547' AS DateTime))
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Category], [isActive], [CompanyID]) VALUES (1, N'Men', 1, 1)
INSERT [dbo].[Category] ([ID], [Category], [isActive], [CompanyID]) VALUES (2, N'Women', 1, 1)
INSERT [dbo].[Category] ([ID], [Category], [isActive], [CompanyID]) VALUES (3, N'House Items', 1, 1)
INSERT [dbo].[Category] ([ID], [Category], [isActive], [CompanyID]) VALUES (4, N'Test Category1', 0, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [CompanyName], [CompanyCode], [Address], [PhoneNo], [FaxNo], [isActive], [Logo]) VALUES (1, N'Naseem Albar Laundry', N'NAL', N'Abu Dhabi', N'02-1234567', N'050-1234567', 1, N'Public/Company/20190826171456000972.jpg')
INSERT [dbo].[Company] ([ID], [CompanyName], [CompanyCode], [Address], [PhoneNo], [FaxNo], [isActive], [Logo]) VALUES (2, N'123', N'Demo123', N'Demo Address', N'5252525252', N'Demo Fax', 1, N'Public/Company/20190826171456000973.jpg')
INSERT [dbo].[Company] ([ID], [CompanyName], [CompanyCode], [Address], [PhoneNo], [FaxNo], [isActive], [Logo]) VALUES (3, N'', N'', N'Test Address', N'', N'', 1, N'')
INSERT [dbo].[Company] ([ID], [CompanyName], [CompanyCode], [Address], [PhoneNo], [FaxNo], [isActive], [Logo]) VALUES (4, N'', N'', N'Test Address', N'', N'', 1, N'')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[CorporateAccount] ON 

INSERT [dbo].[CorporateAccount] ([ID], [CorporateCode], [CorpName], [PaymentTerms], [AccountStart], [CreatedOn], [CreatedBy], [isActive]) VALUES (1, N'DEF', N'DEFAULT', 1, CAST(N'2099-03-31T00:00:00.000' AS DateTime), CAST(N'2019-02-16T16:57:02.343' AS DateTime), 1, 1)
INSERT [dbo].[CorporateAccount] ([ID], [CorporateCode], [CorpName], [PaymentTerms], [AccountStart], [CreatedOn], [CreatedBy], [isActive]) VALUES (2, N'C002', N'Sketchly', 1, CAST(N'2019-06-30T00:00:00.000' AS DateTime), CAST(N'2019-03-09T19:21:32.780' AS DateTime), 1, 1)
INSERT [dbo].[CorporateAccount] ([ID], [CorporateCode], [CorpName], [PaymentTerms], [AccountStart], [CreatedOn], [CreatedBy], [isActive]) VALUES (4, N'Test Corporate Code1', N'Test Corp Name1', 3, CAST(N'2019-09-04T00:00:00.000' AS DateTime), CAST(N'2019-09-04T19:21:32.780' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[CorporateAccount] OFF
INSERT [dbo].[CorporateCustomer] ([CorporateID], [CustomerID]) VALUES (1, 1)
INSERT [dbo].[CorporateCustomer] ([CorporateID], [CustomerID]) VALUES (1, 6)
INSERT [dbo].[CorporateCustomer] ([CorporateID], [CustomerID]) VALUES (2, 1)
INSERT [dbo].[CorporateCustomer] ([CorporateID], [CustomerID]) VALUES (2, 6)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (1, N'1003', N'Cash', N'USA', N'', N'0501234657', N'1234567', N'', 0, N'1234', N'1234', N'1234', N'1234', N'1234', N'1003', CAST(N'2019-10-17T10:11:55.897' AS DateTime), 0, 1, 1, N'hbragib@gmail.com', 1, NULL, N'e/PN+7Lc71b5wkzt2gAMINR3h94O114UfhzkHnFQNMc=', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (6, N'1004', N'Hassan Mahmoud', N'', N'', N'0508235394', N'', N'', 0, N'', N'', N'', N'', N'', N'1004', CAST(N'2018-12-17T16:30:42.077' AS DateTime), 1, 1, 1, N'', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (7, N'1005', N'Rashid', N'waik in', N'', N'0505600907', N'0505600907', N'', 0, N'', N'', N'', N'', N'', N'1005', CAST(N'2018-12-21T12:15:54.113' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (8, N'1006', N'Uma', N'baniyas', N'', N'0563832224', N'', N'', 0, N'', N'', N'', N'', N'', N'1006', CAST(N'2018-12-22T16:00:07.947' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (9, N'1007', N'Mohammed Dawood', N'', N'', N'0503150181', N'', N'', 0, N'', N'', N'', N'', N'', N'1007', CAST(N'2018-12-22T16:08:24.207' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (10, N'1008', N'Jamil', N'', N'', N'0555006458', N'', N'', 0, N'', N'', N'', N'', N'', N'1008', CAST(N'2018-12-22T16:14:26.223' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (11, N'1009', N'abdul rahim', N'', N'', N'0566699487', N'', N'', 0, N'', N'', N'', N'', N'', N'1009', CAST(N'2018-12-22T16:19:59.237' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (12, N'1010', N'abdul aziz', N'', N'', N'0507726764', N'', N'', 0, N'', N'', N'', N'', N'', N'1010', CAST(N'2018-12-22T16:32:39.597' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (13, N'1011', N'jamila', N'', N'', N'0561555350', N'', N'', 0, N'', N'', N'', N'', N'', N'1011', CAST(N'2018-12-22T16:35:13.837' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (14, N'1012', N'Heba', N'salono black bld flat no.501', N'', N'0509502905', N'', N'', 0, N'', N'', N'', N'', N'', N'1012', CAST(N'2018-12-22T16:46:18.137' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (15, N'1013', N'Rashid al mansoori', N'waik in', N'', N'0509344409', N'', N'', 0, N'', N'', N'', N'', N'', N'1013', CAST(N'2018-12-22T16:54:40.560' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (16, N'1014', N'M.Adil', N'', N'', N'0502100712', N'', N'', 0, N'', N'', N'', N'', N'', N'1014', CAST(N'2018-12-22T17:01:39.550' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (17, N'1015', N'Abu Khalid', N'', N'', N'0588282363', N'', N'', 0, N'', N'', N'', N'', N'', N'1015', CAST(N'2018-12-22T17:06:17.053' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (18, N'1016', N'sarah', N'', N'', N'0501934116', N'', N'', 0, N'', N'', N'', N'', N'', N'1016', CAST(N'2018-12-22T20:32:21.803' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (19, N'1017', N'shiwam', N'bld no. 274 flat no.301', N'', N'0529281625', N'', N'', 0, N'', N'', N'', N'', N'', N'1017', CAST(N'2018-12-22T21:17:26.560' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (20, N'1018', N'um HAMED', N'', N'', N'0509096500', N'', N'', 0, N'', N'', N'', N'', N'', N'1018', CAST(N'2018-12-23T14:44:59.410' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (21, N'1019', N'SULTAN', N'', N'', N'0556606010', N'', N'', 0, N'', N'', N'', N'', N'', N'1019', CAST(N'2018-12-23T17:31:16.493' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (22, N'1020', N'SAEED AL KATBI ', N'', N'', N'0508888707', N'', N'', 0, N'', N'', N'', N'', N'', N'1020', CAST(N'2018-12-23T20:49:31.060' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (23, N'1021', N'OBAIA', N'', N'', N'0559305522', N'', N'', 0, N'', N'', N'', N'', N'', N'1021', CAST(N'2018-12-25T18:29:51.290' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (24, N'1022', N'shehzad', N'', N'', N'0527083484', N'', N'', 0, N'', N'', N'', N'', N'', N'1022', CAST(N'2018-12-26T11:47:29.913' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (25, N'1023', N'Hasan', N'', N'', N'0506210021', N'', N'', 0, N'', N'', N'', N'', N'', N'1023', CAST(N'2018-12-26T11:59:38.823' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (26, N'1024', N'saeed al halali', N'', N'', N'0507545558', N'', N'', 0, N'', N'', N'', N'', N'', N'1024', CAST(N'2018-12-26T22:11:22.283' AS DateTime), 1, 1, 1, N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (27, N'1025', N'Sulaiman', N'', N'', N'0504416697', N'7854785965', N'', 0, N'', N'', N'', N'', N'', N'1025', CAST(N'2019-10-21T16:51:10.133' AS DateTime), 0, 1, 1, N'Sule@gmail.com', 1, NULL, N'fc0iUkg331qk3V8HY6MWvQ==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (28, N'1026', N'Husain Ragib', N'', N'', N'0553156721', N'0553156721', N'', 0, N'', N'', N'', N'', N'', N'1026', CAST(N'2019-06-08T18:55:53.903' AS DateTime), 1, 1, 1, N'', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636968229649627807, N'', N'Rass Dubey', N'UKE', N'NMC Hosp', N'0412578456', N'854785447', N'NA', 0, N'', N'', N'', N'', N'', N'', CAST(N'2019-10-23T12:43:15.717' AS DateTime), 0, 1, 1, N'idris@gmail.com', 1, 0, N'fc0iUkg331qk3V8HY6MWvQ==', N'21.186827899999997', N'72.81608609999999')
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636977921030357158, N'', N'mydata', N'UKE', N'', N'0412574174', N'', N'', 0, N'', N'', N'', N'', N'', N'', CAST(N'2019-07-03T23:08:23.037' AS DateTime), 1, 1, 1, N'', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605479483, N'', N'mydata', N'UKE', N'', N'4555475422', N'', N'', 0, N'', N'', N'', N'', N'', N'', CAST(N'2019-07-06T18:32:40.547' AS DateTime), 1, 1, 1, N'', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489488, N'', N'mydata', N'UKE', NULL, N'454545454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-17T16:31:46.130' AS DateTime), 0, NULL, NULL, N'mydata@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489489, N'', N'aaa', N'aas', NULL, N'78451296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-17T16:37:09.680' AS DateTime), 0, NULL, NULL, N'aa@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489495, N'', N'Rass dubey', N'', NULL, N'234234234', N'798767757', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-19T11:23:04.750' AS DateTime), 0, 1, NULL, N'rass@gmail.com', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489497, N'', N'sdrfdf', N'', NULL, N'434242434', N'4344324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-19T11:59:46.840' AS DateTime), 0, 1, NULL, N'ff', 1, NULL, N'qHB3hTV6tV2bTNSGimUi/g==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489498, N'', N'Rass dubey', N'USA', NULL, N'7856985478', N'7897987987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-19T12:03:28.553' AS DateTime), 1, 1, 0, N'rass@gmail.com', 1, NULL, N'yKUHOC7sPXP3kKhOVsz+DA==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489499, N'', N'Rabari', N'USA', NULL, N'7444444444', N'78787545457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-22T11:25:57.703' AS DateTime), 1, 1, 0, N'rabari@gmail.com', 1, NULL, N'BykXPYKF+FsqmtejBqFDLw==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489500, N'', N'Jakir', N'UK', NULL, N'4687992568', N'7946975879', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-22T11:29:47.177' AS DateTime), 1, 1, 0, N'jakir@gmail.com', 1, NULL, N'GCg5P8aiQWKrFXmxGj7T+g==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489501, N'', N'Rustom', N'USA', NULL, N'7898645455', N'8888888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-22T14:16:01.147' AS DateTime), 0, 1, 1, N'rustom@gmail.com', 1, NULL, N'gfJrkAyVr9HMhbdlPGnmuw==', NULL, NULL)
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489502, N'', N'test', N'usa', NULL, N'53534535', N'774434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-23T10:59:49.317' AS DateTime), 1, 1, 1, N'test2gmail.com', 1, NULL, N'+qLFAvKpCE3F8Ur0xZgXVg==', N'21.186827899999997', N'')
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489503, N'', N'fsfsfsfd', N'fdsffd', NULL, N'5555553', N'45454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-23T11:05:34.720' AS DateTime), 1, 1, 1, N'abc@gmail.com', 1, NULL, N'kxMNPGPGzD5+TJc1ox7Ffw==', N'0', N'0')
INSERT [dbo].[Customer] ([ID], [CustomerID], [FullName], [Address], [Landmark], [PhoneNumber], [MobileNumber], [Attn], [AccountType], [Phone1], [Phone2], [Phone3], [Phone4], [Phone5], [CustomerCode], [CreatedOn], [CreatedBy], [CompanyID], [isActive], [Email], [CorpID], [isSync], [Password], [Latitude], [Longitude]) VALUES (636980347605489504, N'', N'ffsd', N'', NULL, N'43244', N'424243242', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-23T11:16:57.907' AS DateTime), 1, 1, 1, N'gb@gmail.com', 1, NULL, N'cdkrgyzVHwh/fghyt2L22Q==', N'21.186827899999997', N'72.81608609999999')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[GarmentService] ON 

INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2727, 1, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2728, 2, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2729, 3, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2730, 4, 1, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2731, 5, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2732, 6, 1, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2733, 7, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2734, 8, 1, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2735, 9, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2736, 10, 1, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2737, 11, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2738, 12, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2739, 13, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2740, 14, 1, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2741, 15, 1, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2742, 16, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2743, 17, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2744, 18, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2745, 19, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2746, 20, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2747, 21, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2748, 22, 1, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2749, 23, 1, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2750, 24, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2751, 25, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2752, 26, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2753, 27, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2754, 28, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2755, 29, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2756, 30, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2757, 31, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2758, 32, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2759, 33, 1, 500, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2760, 34, 1, 150, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2761, 35, 1, 35, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2762, 36, 1, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2763, 37, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2764, 38, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2765, 39, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2766, 40, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2767, 41, 1, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2768, 42, 1, 150, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2769, 43, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2770, 44, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2771, 45, 1, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2772, 46, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2773, 47, 1, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2774, 48, 1, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2775, 49, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2776, 50, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2777, 51, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2778, 52, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2779, 53, 1, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2780, 54, 1, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2781, 55, 1, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2782, 56, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2783, 57, 1, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2784, 58, 1, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2785, 59, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2786, 60, 1, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2787, 61, 1, 30, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2788, 62, 1, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2789, 1, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2790, 2, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2791, 3, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2792, 4, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2793, 5, 2, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2794, 6, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2795, 7, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2796, 8, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2797, 9, 2, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2798, 10, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2799, 11, 2, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2800, 12, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2801, 13, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2802, 14, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2803, 15, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2804, 16, 2, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2805, 17, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2806, 18, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2807, 19, 2, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2808, 20, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2809, 21, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2810, 22, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2811, 23, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2812, 24, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2813, 25, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2814, 26, 2, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2815, 27, 2, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2816, 28, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2817, 29, 2, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2818, 30, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2819, 31, 2, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2820, 32, 2, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2821, 33, 2, 250, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2822, 34, 2, 75, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2823, 35, 2, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2824, 36, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2825, 37, 2, 4, 1, 1)
GO
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2826, 38, 2, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2827, 39, 2, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2828, 40, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2829, 41, 2, 16, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2830, 42, 2, 75, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2831, 43, 2, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2832, 44, 2, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2833, 45, 2, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2834, 46, 2, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2835, 47, 2, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2836, 48, 2, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2837, 49, 2, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2838, 50, 2, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2839, 51, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2840, 52, 2, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2841, 53, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2842, 54, 2, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2843, 55, 2, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2844, 56, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2845, 57, 2, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2846, 58, 2, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2847, 59, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2848, 60, 2, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2849, 61, 2, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2850, 62, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2851, 63, 2, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2852, 1, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2853, 2, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2854, 3, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2855, 4, 3, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2856, 5, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2857, 6, 3, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2858, 7, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2859, 8, 3, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2860, 9, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2861, 10, 3, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2862, 11, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2863, 12, 3, 16, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2864, 13, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2865, 14, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2866, 15, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2867, 16, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2868, 17, 3, 16, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2869, 18, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2870, 19, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2871, 20, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2872, 21, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2873, 22, 3, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2874, 23, 3, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2875, 24, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2876, 25, 3, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2877, 26, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2878, 27, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2879, 28, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2880, 29, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2881, 30, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2882, 31, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2883, 32, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2884, 33, 3, 500, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2885, 34, 3, 100, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2886, 35, 3, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2887, 36, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2888, 37, 3, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2889, 38, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2890, 39, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2891, 40, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2892, 41, 3, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2893, 42, 3, 150, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2894, 43, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2895, 44, 3, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2896, 45, 3, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2897, 46, 3, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2898, 47, 3, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2899, 48, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2900, 49, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2901, 50, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2902, 51, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2903, 52, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2904, 53, 3, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2905, 54, 3, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2906, 55, 3, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2907, 56, 3, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2908, 57, 3, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2909, 58, 3, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2910, 59, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2911, 60, 3, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2912, 61, 3, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2913, 62, 3, 1, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2914, 63, 3, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2915, 64, 3, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2916, 1, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2917, 2, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2918, 3, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2919, 4, 4, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2920, 5, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2921, 6, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2922, 7, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2923, 8, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2924, 9, 4, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2925, 10, 4, 3, 1, 1)
GO
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2926, 11, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2927, 12, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2928, 13, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2929, 14, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2930, 15, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2931, 16, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2932, 17, 4, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2933, 18, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2934, 19, 4, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2935, 20, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2936, 21, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2937, 22, 4, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2938, 23, 4, 2, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2939, 24, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2940, 25, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2941, 26, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2942, 27, 4, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2943, 28, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2944, 29, 4, 3, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2945, 30, 4, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2946, 31, 4, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2947, 32, 4, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2948, 33, 4, 500, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2949, 34, 4, 150, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2950, 35, 4, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2951, 36, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2952, 37, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2953, 38, 4, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2954, 39, 4, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2955, 40, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2956, 41, 4, 16, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2957, 42, 4, 150, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2958, 43, 4, 15, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2959, 44, 4, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2960, 45, 4, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2961, 46, 4, 20, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2962, 47, 4, 25, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2963, 48, 4, 5, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2964, 49, 4, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2965, 50, 4, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2966, 51, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2967, 52, 4, 10, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2968, 53, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2969, 54, 4, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2970, 55, 4, 6, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2971, 56, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2972, 57, 4, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2973, 58, 4, 4, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2974, 59, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2975, 60, 4, 8, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2976, 61, 4, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2977, 64, 4, 1, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2978, 1, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2979, 2, 1, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2980, 3, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2981, 4, 1, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2982, 5, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2983, 6, 1, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2984, 7, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2985, 8, 1, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2986, 9, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2987, 10, 1, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2988, 11, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2989, 12, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2990, 13, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2991, 14, 1, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2992, 15, 1, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2993, 16, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2994, 17, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2995, 18, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2996, 19, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2997, 20, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2998, 21, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (2999, 22, 1, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3000, 23, 1, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3001, 24, 1, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3002, 25, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3003, 26, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3004, 27, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3005, 28, 1, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3006, 29, 1, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3007, 30, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3008, 31, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3009, 32, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3010, 33, 1, 500, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3011, 34, 1, 150, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3012, 35, 1, 35, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3013, 36, 1, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3014, 37, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3015, 38, 1, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3016, 39, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3017, 40, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3018, 41, 1, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3019, 42, 1, 150, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3020, 43, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3021, 44, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3022, 45, 1, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3023, 46, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3024, 47, 1, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3025, 48, 1, 10, 1, 2)
GO
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3026, 49, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3027, 50, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3028, 51, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3029, 52, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3030, 53, 1, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3031, 54, 1, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3032, 55, 1, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3033, 56, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3034, 57, 1, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3035, 58, 1, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3036, 59, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3037, 60, 1, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3038, 61, 1, 30, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3039, 1, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3040, 2, 2, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3041, 3, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3042, 4, 2, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3043, 5, 2, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3044, 6, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3045, 7, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3046, 8, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3047, 9, 2, 0, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3048, 10, 2, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3049, 11, 2, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3050, 12, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3051, 13, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3052, 14, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3053, 15, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3054, 16, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3055, 17, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3056, 18, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3057, 19, 2, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3058, 20, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3059, 21, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3060, 22, 2, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3061, 23, 2, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3062, 24, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3063, 25, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3064, 26, 2, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3065, 27, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3066, 28, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3067, 29, 2, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3068, 30, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3069, 31, 2, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3070, 32, 2, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3071, 33, 2, 250, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3072, 34, 2, 75, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3073, 35, 2, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3074, 36, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3075, 37, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3076, 38, 2, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3077, 39, 2, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3078, 40, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3079, 41, 2, 16, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3080, 42, 2, 75, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3081, 43, 2, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3082, 44, 2, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3083, 45, 2, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3084, 46, 2, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3085, 47, 2, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3086, 48, 2, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3087, 49, 2, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3088, 50, 2, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3089, 51, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3090, 52, 2, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3091, 53, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3092, 54, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3093, 55, 2, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3094, 56, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3095, 57, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3096, 58, 2, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3097, 59, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3098, 60, 2, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3099, 61, 2, 0, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3100, 1, 3, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3101, 2, 3, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3102, 3, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3103, 4, 3, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3104, 5, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3105, 6, 3, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3106, 7, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3107, 8, 3, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3108, 9, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3109, 10, 3, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3110, 11, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3111, 12, 3, 16, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3112, 13, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3113, 14, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3114, 15, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3115, 16, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3116, 17, 3, 16, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3117, 18, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3118, 19, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3119, 20, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3120, 21, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3121, 22, 3, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3122, 23, 3, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3123, 24, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3124, 25, 3, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3125, 26, 3, 10, 1, 2)
GO
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3126, 27, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3127, 28, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3128, 29, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3129, 30, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3130, 31, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3131, 32, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3132, 33, 3, 500, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3133, 34, 3, 100, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3134, 35, 3, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3135, 36, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3136, 37, 3, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3137, 38, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3138, 39, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3139, 40, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3140, 41, 3, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3141, 42, 3, 150, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3142, 43, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3143, 44, 3, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3144, 45, 3, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3145, 46, 3, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3146, 47, 3, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3147, 48, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3148, 49, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3149, 50, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3150, 51, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3151, 52, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3152, 53, 3, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3153, 54, 3, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3154, 55, 3, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3155, 56, 3, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3156, 57, 3, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3157, 58, 3, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3158, 59, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3159, 60, 3, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3160, 61, 3, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3161, 1, 4, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3162, 2, 4, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3163, 3, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3164, 4, 4, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3165, 5, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3166, 6, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3167, 7, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3168, 8, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3169, 9, 4, 0, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3170, 10, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3171, 11, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3172, 12, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3173, 13, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3174, 14, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3175, 15, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3176, 16, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3177, 17, 4, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3178, 18, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3179, 19, 4, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3180, 20, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3181, 21, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3182, 22, 4, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3183, 23, 4, 2, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3184, 24, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3185, 25, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3186, 26, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3187, 27, 4, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3188, 28, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3189, 29, 4, 3, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3190, 30, 4, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3191, 31, 4, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3192, 32, 4, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3193, 33, 4, 500, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3194, 34, 4, 150, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3195, 35, 4, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3196, 36, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3197, 37, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3198, 38, 4, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3199, 39, 4, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3200, 40, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3201, 41, 4, 16, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3202, 42, 4, 150, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3203, 43, 4, 15, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3204, 44, 4, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3205, 45, 4, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3206, 46, 4, 20, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3207, 47, 4, 25, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3208, 48, 4, 5, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3209, 49, 4, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3210, 50, 4, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3211, 51, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3212, 52, 4, 10, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3213, 53, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3214, 54, 4, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3215, 55, 4, 6, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3216, 56, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3217, 57, 4, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3218, 58, 4, 4, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3219, 59, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3220, 60, 4, 8, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3221, 61, 4, 0, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3223, 66, 1, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3224, 66, 2, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3225, 66, 3, 0, 1, 1)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3226, 66, 4, 0, 1, 1)
GO
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3227, 62, 1, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3228, 62, 2, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3229, 62, 3, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3230, 62, 4, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3231, 63, 1, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3232, 63, 2, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3233, 63, 3, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3234, 63, 4, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3235, 64, 1, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3236, 64, 2, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3237, 64, 3, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3238, 64, 4, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3239, 65, 1, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3240, 65, 2, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3241, 65, 3, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3242, 65, 4, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3243, 66, 1, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3244, 66, 2, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3245, 66, 3, -1, 1, 2)
INSERT [dbo].[GarmentService] ([TID], [GarmentID], [ServiceID], [Price], [isOffered], [CorpID]) VALUES (3246, 66, 4, -1, 1, 2)
SET IDENTITY_INSERT [dbo].[GarmentService] OFF
SET IDENTITY_INSERT [dbo].[GarmentType] ON 

INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (1, N'Shirt', 1, CAST(N'2015-03-11T09:51:14.930' AS DateTime), 1, 0x89504E470D0A1A0A0000000D4948445200000020000000200802000000FC18EDA30000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000008EF49444154484B2D5669905C5519ED1FFC00C96E5206232A559465B004A2155309315642886059659554490C2E4096C96236438C21C1024A094A0949C44225962428A82094CAE2123233BDBCD79D4C66D293C9ECD33DDD33D3E965BAA7F77EEFDDE578EE1BA7EEF4BC377DEFB79CEF7CE7BB012898E59A4FED41F3998F6E195E11721078078D6770FD210CDD8BEE4DB8B8D1BBB806F1F5E8FF06128FA2FE34F01670155E1E8D062D080D6FD6A000A4590178E65D8A590F105E139806C6A07A45EACF69FB8991CE6DE3D12DB9EEEF3A57F6A1FF718C1DAEF7B615ED6D99F0D6C1CE6D039143D5C459A81EE8245A191AA659AD354DA996EB3B708C650F15C7D8AD03DC14743227A762DF9B8A6E9B8EBF2072FF06FA8114F404E424641A9830AF1896A5F6FCC0AF52B1B6B1C8C36EEA0474078F4B780E5C57B70C206E2B60C0615EA8284C99C0BD4839792A19DDD91CDD87E229C81EA8A2861F8684F494D2267502E07A75C81C1047F355377D3C65EF98197A165E3B8DB898716992704B1560363CA3354F65E07E90B9F2E470E8B09B39075C02925035262D5CCD3DF4A25197A80BB852F21823239E45200739A4AFFF7DACF348BE771FDC3F3245012D083E21620242F171068D8B533DC727BB7EA8727F65FA5015784CD7AF98B12E14AA1E0A12331EAAE61FFCD59E769BC610F7C82C2AFF4ADB8F647B7F00370814CC168D40C37CCB17BB36FC8BC1F01E59A6FF2464DD40D7F2A1110C9721F0A906836445A3E942083A97FE5FE2451F648FCEA0FAE66068676EE8191652EAAC800AB020A662532773B11D22FB0A3175DC82898ED9FB39324C89A6A603ED80B8F353BB2C1F1789C2B2983D12CA24CAAFFA50383BD1B5A39CFC19302A51611F94A0AF927622BED7945496590F1E31892947828BD42A43364C244CC3C7945FBA0E4370141AE4B6419C5E440B220F2FEA0E1C9E8C6E87D705950D00839591B345AB0DC5DF414C40D006993AE253330E74011664186A106C11DAACD5202B902978BDFEB7E4C2551A61BCC0243C566E0CD557735D0766065E818ED3C13B89F091E9BE17A07BE09420261BA9E79DE49E4AFCB17AFCE1EAE5FBA7236BABC18D4EDF2134C21A7989AC6A45F4F0F15AF08192BDB6747943E5DAE699FEC7BCF1835EEA14EA290896AAA7347A7AB4F300D4EB01544EA4427B64E10313B8A1D3683AF660DEFE7CCDFE62237C8713BE458597E8F6A5B5E0CAF2E8312DDE06DE2B257E52EDFC9238BF44598B1DEB969AF5B992B5A218BD2B13FD16BC51729F5AA02BE72722DB51F85100895D396B377351829D4C244793B16FE6AC3BEAF6DD4E68B9082E83B514B18FCBCE65E50BCB2BD6EA7AF7974B9D9F15E76F417819EC5B45E4F646704539F485A2FD9974EC6B3E5C4AD3874E942FEFC2F083010C6CC945B61144A51D45AD92E94AFA442BD1A6877763F4515C5EDDFCEF12D1310FF6424496C05A027B11AC45082E44C7E2FA874B115F87915D7278BF37B6BD9E7E0A186257992EC144E3CA4EF4DE1740FCFE52771B03F79B89EEF94BB519841A0242281CF5EC3B1B1DF3A4F511159927C3F39BE1B99EB500C1F9087DAC757139CA878108300E9984CE1AA61A4DA1912167E040CBFE4AC0EDBE17E347D95CECBAD9BEF543E00EFEB03F9EAB59AB9A2C43748E0ECD55C179CA5AC845072ABC6CC6BA1B052A364DFB1D63C48AA766BB7200D79F99EE5C17685DBECF1D3C029537D456A4B36F5D93EDDC9BC4F4E942641D4B8DD01C742E46FB6274CE4798E12F72429F22C130FD2234B59DFDCC534A6A97E1FB6D342ED34F17AC8D01EFCAA6C6D5834649A87D66A3A7956BFA46328A24F22FE5EC0DC2FAA4EF6021C28B11213E3723B440466E9FB6D6237FD24C028F5DCD23A6BD69C4CC0324DDB1A3E5AE8D2CF2A6F2A547A01885C9CED481B19006A6F52791FF75C1DA20EDDBBCE04DB5E00DADE88D8E7D63B3E3065CB81991DB72D17B54F197663C7033B542127D1F5C3A52838DBEADA2776D00139B33E1CD9057A0AAC2A3F4F95E088F4BAA4DAAEC8BD9F05ACFFEB4B2E7362FDE24AECCD73D0BA43507E1B9D2FA44C65AE9E59F334386391BFA1BEB2D4345AA4BBC187B08235F65A33D31DAFEB057FE2703F18CD63370BF6266FF184ACF4FD92BEB915BC91C2E657DD4A0145E4452D5EDC5197B054ACC204F48A8AB1C322C9D6BD46A1ACD0FC7DB3723B73B00F9A744E46076F424FB9B5381DAC6088C0F0E3E99D4853393B1CD056BFD4C785535B4BA7A6155E3FC3D8DCE35E44F2EB6C6B46EEE357833E40D95B909C735C38152D19F4BFD3619DA0FEF0CD5345E4F9C1BBF7400E5D7287E744F204D918C0E4FC31943BE03A577517A1B33EFA3F09E5965BEBE85D23F900DA13109C78C06C6648C9B36C8A3F69774F791D2F01F7CB1E3BBDB3D1EDCDD1A780AAD6B944C5AE74E53075E5E28AE8280E621331045B82578D350D33EEB8A104DB8020D338067F961F216C32AF1D394B507D528076A00A24C9EA9C15395F0214CBD01D9C729D1343CF54F98AB524DA3C005DD2077B5E6F0211728DC744C34B8F86CF863A6BC338EFCBB556B6FF3AA6940B656C00C6F9185883ABD3F4F74EC46F5750E640F25D78C78FE184A09D48431E7D7C66700636555B5EF80FE5CC94FC69E868EE462C7B3C1FD501FB2D42DA502FF4783771EE73FE9FEDD0397BF0387439FD3A642338475D69C23951945B30D4EA23036DF9D902DBFADE88933EAFC50D78EB14B6D70DF871E310395437FF6B0BF8302772EDD7F60287C10B93721FA387C7C1C4CFA0601938CBFD888BE575FB26AA6241C67E5BF8DF51CE9BFB84337CF323E2D8B469B1502B3875926696E3813A8DBADF8E97CFB41249E45FD0D5FDF331E7BD08F977454CCC30025849A01AE9BB0EAEF23713A17D93B15FD315ABCB04CD03A37D0012B19902CA42993E319A0186019AD4B187A69E2C2D69CBDB73AF2326A17803E7FE4F21E96349FE6D99FD84E7B25F9FB5CF4D8E485BDF5F853D021524B5027A81B94265A2344CC423ABC0051449984EFC2F3E7811374867E33113C94EE68CBC4B6177AB67943FB907D12B9638D91BDD77BB6A6638FA53ABE3FD1B1CFE97F19F5901F04E781E921CE2EADAB064D2DD8C9D43572923E4CF624600B8EA3D3502390169CD7913D8EE12DFADA03CDAEB585CEBB72E13B2BDD6B9D81AFEB916FE3FAE370CE40842059E18CB92C19C5F359C32B1A6F18DAFD1F26AC7A8B7378A3F90000000049454E44AE426082, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (2, N'Pant', 1, CAST(N'2015-03-20T17:16:13.437' AS DateTime), 1, 0x89504E470D0A1A0A0000000D4948445200000020000000200802000000FC18EDA30000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000008EF49444154484B2D5669905C5519ED1FFC00C96E5206232A559465B004A2155309315642886059659554490C2E4096C96236438C21C1024A094A0949C44225962428A82094CAE2123233BDBCD79D4C66D293C9ECD33DDD33D3E965BAA7F77EEFDDE578EE1BA7EEF4BC377DEFB79CEF7CE7BB012898E59A4FED41F3998F6E195E11721078078D6770FD210CDD8BEE4DB8B8D1BBB806F1F5E8FF06128FA2FE34F01670155E1E8D062D080D6FD6A000A4590178E65D8A590F105E139806C6A07A45EACF69FB8991CE6DE3D12DB9EEEF3A57F6A1FF718C1DAEF7B615ED6D99F0D6C1CE6D039143D5C459A81EE8245A191AA659AD354DA996EB3B708C650F15C7D8AD03DC14743227A762DF9B8A6E9B8EBF2072FF06FA8114F404E424641A9830AF1896A5F6FCC0AF52B1B6B1C8C36EEA0474078F4B780E5C57B70C206E2B60C0615EA8284C99C0BD4839792A19DDD91CDD87E229C81EA8A2861F8684F494D2267502E07A75C81C1047F355377D3C65EF98197A165E3B8DB898716992704B1560363CA3354F65E07E90B9F2E470E8B09B39075C02925035262D5CCD3DF4A25197A80BB852F21823239E45200739A4AFFF7DACF348BE771FDC3F3245012D083E21620242F171068D8B533DC727BB7EA8727F65FA5015784CD7AF98B12E14AA1E0A12331EAAE61FFCD59E769BC610F7C82C2AFF4ADB8F647B7F00370814CC168D40C37CCB17BB36FC8BC1F01E59A6FF2464DD40D7F2A1110C9721F0A906836445A3E942083A97FE5FE2451F648FCEA0FAE66068676EE8191652EAAC800AB020A662532773B11D22FB0A3175DC82898ED9FB39324C89A6A603ED80B8F353BB2C1F1789C2B2983D12CA24CAAFFA50383BD1B5A39CFC19302A51611F94A0AF927622BED7945496590F1E31892947828BD42A43364C244CC3C7945FBA0E4370141AE4B6419C5E440B220F2FEA0E1C9E8C6E87D705950D00839591B345AB0DC5DF414C40D006993AE253330E74011664186A106C11DAACD5202B902978BDFEB7E4C2551A61BCC0243C566E0CD557735D0766065E818ED3C13B89F091E9BE17A07BE09420261BA9E79DE49E4AFCB17AFCE1EAE5FBA7236BABC18D4EDF2134C21A7989AC6A45F4F0F15AF08192BDB6747943E5DAE699FEC7BCF1835EEA14EA290896AAA7347A7AB4F300D4EB01544EA4427B64E10313B8A1D3683AF660DEFE7CCDFE62237C8713BE458597E8F6A5B5E0CAF2E8312DDE06DE2B257E52EDFC9238BF44598B1DEB969AF5B992B5A218BD2B13FD16BC51729F5AA02BE72722DB51F85100895D396B377351829D4C244793B16FE6AC3BEAF6DD4E68B9082E83B514B18FCBCE65E50BCB2BD6EA7AF7974B9D9F15E76F417819EC5B45E4F646704539F485A2FD9974EC6B3E5C4AD3874E942FEFC2F083010C6CC945B61144A51D45AD92E94AFA442BD1A6877763F4515C5EDDFCEF12D1310FF6424496C05A027B11AC45082E44C7E2FA874B115F87915D7278BF37B6BD9E7E0A186257992EC144E3CA4EF4DE1740FCFE52771B03F79B89EEF94BB519841A0242281CF5EC3B1B1DF3A4F511159927C3F39BE1B99EB500C1F9087DAC757139CA878108300E9984CE1AA61A4DA1912167E040CBFE4AC0EDBE17E347D95CECBAD9BEF543E00EFEB03F9EAB59AB9A2C43748E0ECD55C179CA5AC845072ABC6CC6BA1B052A364DFB1D63C48AA766BB7200D79F99EE5C17685DBECF1D3C029537D456A4B36F5D93EDDC9BC4F4E942641D4B8DD01C742E46FB6274CE4798E12F72429F22C130FD2234B59DFDCC534A6A97E1FB6D342ED34F17AC8D01EFCAA6C6D5834649A87D66A3A7956BFA46328A24F22FE5EC0DC2FAA4EF6021C28B11213E3723B440466E9FB6D6237FD24C028F5DCD23A6BD69C4CC0324DDB1A3E5AE8D2CF2A6F2A547A01885C9CED481B19006A6F52791FF75C1DA20EDDBBCE04DB5E00DADE88D8E7D63B3E3065CB81991DB72D17B54F197663C7033B542127D1F5C3A52838DBEADA2776D00139B33E1CD9057A0AAC2A3F4F95E088F4BAA4DAAEC8BD9F05ACFFEB4B2E7362FDE24AECCD73D0BA43507E1B9D2FA44C65AE9E59F334386391BFA1BEB2D4345AA4BBC187B08235F65A33D31DAFEB057FE2703F18CD63370BF6266FF184ACF4FD92BEB915BC91C2E657DD4A0145E4452D5EDC5197B054ACC204F48A8AB1C322C9D6BD46A1ACD0FC7DB3723B73B00F9A744E46076F424FB9B5381DAC6088C0F0E3E99D4853393B1CD056BFD4C785535B4BA7A6155E3FC3D8DCE35E44F2EB6C6B46EEE357833E40D95B909C735C38152D19F4BFD3619DA0FEF0CD5345E4F9C1BBF7400E5D7287E744F204D918C0E4FC31943BE03A577517A1B33EFA3F09E5965BEBE85D23F900DA13109C78C06C6648C9B36C8A3F69774F791D2F01F7CB1E3BBDB3D1EDCDD1A780AAD6B944C5AE74E53075E5E28AE8280E621331045B82578D350D33EEB8A104DB8020D338067F961F216C32AF1D394B507D528076A00A24C9EA9C15395F0214CBD01D9C729D1343CF54F98AB524DA3C005DD2077B5E6F0211728DC744C34B8F86CF863A6BC338EFCBB556B6FF3AA6940B656C00C6F9185883ABD3F4F74EC46F5750E640F25D78C78FE184A09D48431E7D7C66700636555B5EF80FE5CC94FC69E868EE462C7B3C1FD501FB2D42DA502FF4783771EE73FE9FEDD0397BF0387439FD3A642338475D69C23951945B30D4EA23036DF9D902DBFADE88933EAFC50D78EB14B6D70DF871E310395437FF6B0BF8302772EDD7F60287C10B93721FA387C7C1C4CFA0601938CBFD888BE575FB26AA6241C67E5BF8DF51CE9BFB84337CF323E2D8B469B1502B3875926696E3813A8DBADF8E97CFB41249E45FD0D5FDF331E7BD08F977454CCC30025849A01AE9BB0EAEF23713A17D93B15FD315ABCB04CD03A37D0012B19902CA42993E319A0186019AD4B187A69E2C2D69CBDB73AF2326A17803E7FE4F21E96349FE6D99FD84E7B25F9FB5CF4D8E485BDF5F853D021524B5027A81B94265A2344CC423ABC0051449984EFC2F3E7811374867E33113C94EE68CBC4B6177AB67943FB907D12B9638D91BDD77BB6A6638FA53ABE3FD1B1CFE97F19F5901F04E781E921CE2EADAB064D2DD8C9D43572923E4CF624600B8EA3D3502390169CD7913D8EE12DFADA03CDAEB585CEBB72E13B2BDD6B9D81AFEB916FE3FAE370CE40842059E18CB92C19C5F359C32B1A6F18DAFD1F26AC7A8B7378A3F90000000049454E44AE426082, 1, 1, 2, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (3, N'Bra', 1, CAST(N'2018-12-17T15:39:22.453' AS DateTime), 1, 0x89504E470D0A1A0A0000000D4948445200000020000000200802000000FC18EDA3000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000008EF49444154484B2D5669905C5519ED1FFC00C96E5206232A559465B004A2155309315642886059659554490C2E4096C96236438C21C1024A094A0949C44225962428A82094CAE2123233BDBCD79D4C66D293C9ECD33DDD33D3E965BAA7F77EEFDDE578EE1BA7EEF4BC377DEFB79CEF7CE7BB012898E59A4FED41F3998F6E195E11721078078D6770FD210CDD8BEE4DB8B8D1BBB806F1F5E8FF06128FA2FE34F01670155E1E8D062D080D6FD6A000A4590178E65D8A590F105E139806C6A07A45EACF69FB8991CE6DE3D12DB9EEEF3A57F6A1FF718C1DAEF7B615ED6D99F0D6C1CE6D039143D5C459A81EE8245A191AA659AD354DA996EB3B708C650F15C7D8AD03DC14743227A762DF9B8A6E9B8EBF2072FF06FA8114F404E424641A9830AF1896A5F6FCC0AF52B1B6B1C8C36EEA0474078F4B780E5C57B70C206E2B60C0615EA8284C99C0BD4839792A19DDD91CDD87E229C81EA8A2861F8684F494D2267502E07A75C81C1047F355377D3C65EF98197A165E3B8DB898716992704B1560363CA3354F65E07E90B9F2E470E8B09B39075C02925035262D5CCD3DF4A25197A80BB852F21823239E45200739A4AFFF7DACF348BE771FDC3F3245012D083E21620242F171068D8B533DC727BB7EA8727F65FA5015784CD7AF98B12E14AA1E0A12331EAAE61FFCD59E769BC610F7C82C2AFF4ADB8F647B7F00370814CC168D40C37CCB17BB36FC8BC1F01E59A6FF2464DD40D7F2A1110C9721F0A906836445A3E942083A97FE5FE2451F648FCEA0FAE66068676EE8191652EAAC800AB020A662532773B11D22FB0A3175DC82898ED9FB39324C89A6A603ED80B8F353BB2C1F1789C2B2983D12CA24CAAFFA50383BD1B5A39CFC19302A51611F94A0AF927622BED7945496590F1E31892947828BD42A43364C244CC3C7945FBA0E4370141AE4B6419C5E440B220F2FEA0E1C9E8C6E87D705950D00839591B345AB0DC5DF414C40D006993AE253330E74011664186A106C11DAACD5202B902978BDFEB7E4C2551A61BCC0243C566E0CD557735D0766065E818ED3C13B89F091E9BE17A07BE09420261BA9E79DE49E4AFCB17AFCE1EAE5FBA7236BABC18D4EDF2134C21A7989AC6A45F4F0F15AF08192BDB6747943E5DAE699FEC7BCF1835EEA14EA290896AAA7347A7AB4F300D4EB01544EA4427B64E10313B8A1D3683AF660DEFE7CCDFE62237C8713BE458597E8F6A5B5E0CAF2E8312DDE06DE2B257E52EDFC9238BF44598B1DEB969AF5B992B5A218BD2B13FD16BC51729F5AA02BE72722DB51F85100895D396B377351829D4C244793B16FE6AC3BEAF6DD4E68B9082E83B514B18FCBCE65E50BCB2BD6EA7AF7974B9D9F15E76F417819EC5B45E4F646704539F485A2FD9974EC6B3E5C4AD3874E942FEFC2F083010C6CC945B61144A51D45AD92E94AFA442BD1A6877763F4515C5EDDFCEF12D1310FF6424496C05A027B11AC45082E44C7E2FA874B115F87915D7278BF37B6BD9E7E0A186257992EC144E3CA4EF4DE1740FCFE52771B03F79B89EEF94BB519841A0242281CF5EC3B1B1DF3A4F511159927C3F39BE1B99EB500C1F9087DAC757139CA878108300E9984CE1AA61A4DA1912167E040CBFE4AC0EDBE17E347D95CECBAD9BEF543E00EFEB03F9EAB59AB9A2C43748E0ECD55C179CA5AC845072ABC6CC6BA1B052A364DFB1D63C48AA766BB7200D79F99EE5C17685DBECF1D3C029537D456A4B36F5D93EDDC9BC4F4E942641D4B8DD01C742E46FB6274CE4798E12F72429F22C130FD2234B59DFDCC534A6A97E1FB6D342ED34F17AC8D01EFCAA6C6D5834649A87D66A3A7956BFA46328A24F22FE5EC0DC2FAA4EF6021C28B11213E3723B440466E9FB6D6237FD24C028F5DCD23A6BD69C4CC0324DDB1A3E5AE8D2CF2A6F2A547A01885C9CED481B19006A6F52791FF75C1DA20EDDBBCE04DB5E00DADE88D8E7D63B3E3065CB81991DB72D17B54F197663C7033B542127D1F5C3A52838DBEADA2776D00139B33E1CD9057A0AAC2A3F4F95E088F4BAA4DAAEC8BD9F05ACFFEB4B2E7362FDE24AECCD73D0BA43507E1B9D2FA44C65AE9E59F334386391BFA1BEB2D4345AA4BBC187B08235F65A33D31DAFEB057FE2703F18CD63370BF6266FF184ACF4FD92BEB915BC91C2E657DD4A0145E4452D5EDC5197B054ACC204F48A8AB1C322C9D6BD46A1ACD0FC7DB3723B73B00F9A744E46076F424FB9B5381DAC6088C0F0E3E99D4853393B1CD056BFD4C785535B4BA7A6155E3FC3D8DCE35E44F2EB6C6B46EEE357833E40D95B909C735C38152D19F4BFD3619DA0FEF0CD5345E4F9C1BBF7400E5D7287E744F204D918C0E4FC31943BE03A577517A1B33EFA3F09E5965BEBE85D23F900DA13109C78C06C6648C9B36C8A3F69774F791D2F01F7CB1E3BBDB3D1EDCDD1A780AAD6B944C5AE74E53075E5E28AE8280E621331045B82578D350D33EEB8A104DB8020D338067F961F216C32AF1D394B507D528076A00A24C9EA9C15395F0214CBD01D9C729D1343CF54F98AB524DA3C005DD2077B5E6F0211728DC744C34B8F86CF863A6BC338EFCBB556B6FF3AA6940B656C00C6F9185883ABD3F4F74EC46F5750E640F25D78C78FE184A09D48431E7D7C66700636555B5EF80FE5CC94FC69E868EE462C7B3C1FD501FB2D42DA502FF4783771EE73FE9FEDD0397BF0387439FD3A642338475D69C23951945B30D4EA23036DF9D902DBFADE88933EAFC50D78EB14B6D70DF871E310395437FF6B0BF8302772EDD7F60287C10B93721FA387C7C1C4CFA0601938CBFD888BE575FB26AA6241C67E5BF8DF51CE9BFB84337CF323E2D8B469B1502B3875926696E3813A8DBADF8E97CFB41249E45FD0D5FDF331E7BD08F977454CCC30025849A01AE9BB0EAEF23713A17D93B15FD315ABCB04CD03A37D0012B19902CA42993E319A0186019AD4B187A69E2C2D69CBDB73AF2326A17803E7FE4F21E96349FE6D99FD84E7B25F9FB5CF4D8E485BDF5F853D021524B5027A81B94265A2344CC423ABC0051449984EFC2F3E7811374867E33113C94EE68CBC4B6177AB67943FB907D12B9638D91BDD77BB6A6638FA53ABE3FD1B1CFE97F19F5901F04E781E921CE2EADAB064D2DD8C9D43572923E4CF624600B8EA3D3502390169CD7913D8EE12DFADA03CDAEB585CEBB72E13B2BDD6B9D81AFEB916FE3FAE370CE40842059E18CB92C19C5F359C32B1A6F18DAFD1F26AC7A8B7378A3F90000000049454E44AE426082, 1, 2, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (4, N'Handkerchief', 1, CAST(N'2018-12-17T15:39:59.150' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (5, N'Scarff/Shawl', 1, CAST(N'2018-12-17T15:40:21.963' AS DateTime), 1, NULL, 1, 2, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (6, N'Socks 1 PIR`', 1, CAST(N'2018-12-17T15:40:40.173' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (7, N'Tie/Bowtie', 1, CAST(N'2018-12-17T15:41:14.093' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (8, N'Untergarments', 1, CAST(N'2018-12-17T15:42:02.190' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (9, N'Baby Blanket', 1, CAST(N'2018-12-17T15:42:52.257' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (10, N'Baby Cloths', 1, CAST(N'2018-12-17T15:43:34.620' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (11, N'Bed Sheet Single', 1, CAST(N'2018-12-17T15:44:17.273' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (12, N'Bed Sheet Double', 1, CAST(N'2018-12-17T15:44:46.830' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (13, N'Doube Cover', 1, CAST(N'2018-12-17T15:45:10.210' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (14, N'Pillow', 1, CAST(N'2018-12-17T15:45:29.397' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (15, N'Pillow Cover', 1, CAST(N'2018-12-17T15:45:46.350' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (16, N'Sofa Cover Single', 1, CAST(N'2018-12-17T15:46:29.107' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (17, N'Sofa Cover Double', 1, CAST(N'2018-12-17T15:46:48.920' AS DateTime), 1, NULL, 1, 3, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (18, N'Jacket', 1, CAST(N'2018-12-17T15:47:16.657' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (19, N'Suit -2 PC', 1, CAST(N'2018-12-17T15:47:48.267' AS DateTime), 1, NULL, 1, 1, 2, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (20, N'Abaya', 1, CAST(N'2018-12-17T15:48:33.510' AS DateTime), 1, NULL, 1, 2, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (21, N'Shela', 1, CAST(N'2018-12-17T15:48:58.673' AS DateTime), 1, NULL, 1, 2, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (22, N'Under Shirt', 1, CAST(N'2018-12-17T15:49:40.453' AS DateTime), 1, NULL, 1, 2, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (23, N'Lungi', 1, CAST(N'2018-12-17T15:49:58.197' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (24, N'Ghatra', 1, CAST(N'2018-12-17T15:50:14.127' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (25, N'Kandurah', 1, CAST(N'2018-12-17T15:50:38.470' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (26, N'Kandourah Wool', 1, CAST(N'2018-12-17T15:51:05.657' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (27, N'Gharta Wool', 1, CAST(N'2018-12-17T15:51:43.947' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (28, N'Short', 1, CAST(N'2018-12-17T15:52:11.387' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (29, N'T-Shirt', 1, CAST(N'2018-12-17T15:52:31.733' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (30, N'Cotton 1 Sq Mtr', 1, CAST(N'2018-12-17T15:54:24.937' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (31, N'Black out Cotton 1 Sq Mtr', 1, CAST(N'2018-12-17T15:54:54.157' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (32, N'Carpet 1 Sq Mtr', 1, CAST(N'2018-12-17T15:55:32.120' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (33, N'Wedding Dress', 1, CAST(N'2018-12-17T15:56:47.597' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (34, N'Ladies Dress Sp', 1, CAST(N'2018-12-17T15:57:16.337' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (35, N'Ladies Dress', 1, CAST(N'2018-12-17T15:57:44.840' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (36, N'Ladies Dress Normal', 1, CAST(N'2018-12-17T15:59:59.007' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (37, N'Ladies Blouse', 1, CAST(N'2018-12-17T16:00:28.687' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (38, N'Skirt', 1, CAST(N'2018-12-17T16:00:49.730' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (39, N'sweeter Wool', 1, CAST(N'2018-12-17T16:01:31.417' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (40, N'Sweeter Short', 1, CAST(N'2018-12-17T16:01:53.197' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (41, N'Long Coat', 1, CAST(N'2018-12-17T16:02:41.993' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (42, N'Leather Jacket', 1, CAST(N'2018-12-17T16:03:14.073' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (43, N'Blanket Small', 1, CAST(N'2018-12-17T16:03:48.823' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (44, N'Blanket M', 1, CAST(N'2018-12-17T16:04:14.350' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (45, N'Blanket Double', 1, CAST(N'2018-12-17T16:04:33.300' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (46, N'Comforter Single', 1, CAST(N'2018-12-17T16:04:58.107' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (47, N'Comforter Double', 1, CAST(N'2018-12-17T16:05:10.733' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (48, N'Chair Cover', 1, CAST(N'2018-12-17T16:06:01.630' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (49, N'Shalwar-Kamiz', 1, CAST(N'2018-12-17T16:07:11.233' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (50, N'Gents Shalwar-Kamiz', 1, CAST(N'2018-12-17T16:07:54.350' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (51, N'Saree', 1, CAST(N'2018-12-17T16:08:31.167' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (52, N'Ladies Suite-2PC', 1, CAST(N'2018-12-17T16:09:25.257' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (53, N'Ladies Jacket', 1, CAST(N'2018-12-17T16:09:44.990' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (54, N'Towel Small', 1, CAST(N'2018-12-17T16:10:16.060' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (55, N'Towel M', 1, CAST(N'2018-12-17T16:10:27.957' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (56, N'Towel Large', 1, CAST(N'2018-12-17T16:10:39.393' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (57, N'Apron', 1, CAST(N'2018-12-17T16:10:58.890' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (58, N'Doctor Coat', 1, CAST(N'2018-12-17T16:11:28.737' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (59, N'Safari Suit Army', 1, CAST(N'2018-12-22T15:53:43.867' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (60, N'Ladies Shurta Safari', 1, CAST(N'2018-12-22T15:54:05.820' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (61, N'Shoes', 1, CAST(N'2018-12-22T15:54:30.160' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (62, N'abc', 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (63, N'abc', 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (64, N'new data', 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, NULL, 1, 1, 1, 0)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (65, N'New One', 1, CAST(N'2019-07-03T22:37:41.393' AS DateTime), 1, NULL, 1, 1, 1, 5)
INSERT [dbo].[GarmentType] ([ID], [GarmetType], [isActive], [CreatedOn], [CreatedBy], [GImage], [CompanyID], [CategoryID], [TagCount], [Weight]) VALUES (66, N'New 01', 1, CAST(N'2019-07-03T22:40:00.467' AS DateTime), 1, NULL, 1, 1, 1, 300)
SET IDENTITY_INSERT [dbo].[GarmentType] OFF
SET IDENTITY_INSERT [dbo].[ItemHistory] ON 

INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (38, N'37', 2, CAST(N'2019-03-07T22:39:41.910' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (39, N'38', 2, CAST(N'2019-03-07T22:39:41.943' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (40, N'39', 2, CAST(N'2019-03-07T22:39:41.957' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (41, N'40', 2, CAST(N'2019-03-07T22:39:41.983' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (42, N'37', 2, CAST(N'2019-03-07T22:40:17.137' AS DateTime), N'2-636875952171254996', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (43, N'39', 2, CAST(N'2019-03-07T22:40:17.160' AS DateTime), N'2-636875952171254996', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (44, N'38', 2, CAST(N'2019-03-07T22:40:17.173' AS DateTime), N'2-636875952171254996', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (45, N'40', 2, CAST(N'2019-03-07T22:40:17.193' AS DateTime), N'2-636875952171254996', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (46, N'37', 3, CAST(N'2019-03-07T22:40:32.073' AS DateTime), N'3-636875952320662423', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (47, N'40', 3, CAST(N'2019-03-07T22:40:32.090' AS DateTime), N'3-636875952320662423', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (48, N'38', 3, CAST(N'2019-03-07T22:40:32.107' AS DateTime), N'3-636875952320662423', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (49, N'39', 3, CAST(N'2019-03-07T22:40:32.123' AS DateTime), N'3-636875952320662423', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (50, N'40', 3, CAST(N'2019-03-07T22:40:40.237' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (51, N'39', 3, CAST(N'2019-03-07T22:40:44.743' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (52, N'38', 3, CAST(N'2019-03-07T22:40:48.250' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (53, N'37', 3, CAST(N'2019-03-07T22:40:52.257' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (54, N'37', 3, CAST(N'2019-03-07T22:41:05.987' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (55, N'38', 3, CAST(N'2019-03-07T22:41:09.997' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (56, N'39', 3, CAST(N'2019-03-07T22:41:15.007' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (57, N'40', 3, CAST(N'2019-03-07T22:41:19.010' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (58, N'37', 3, CAST(N'2019-03-07T22:41:59.483' AS DateTime), N'3-636875953194707532', N'Packed', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (59, N'38', 3, CAST(N'2019-03-07T22:41:59.507' AS DateTime), N'3-636875953194707532', N'Packed', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (60, N'39', 3, CAST(N'2019-03-07T22:41:59.523' AS DateTime), N'3-636875953194707532', N'Packed', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (61, N'40', 3, CAST(N'2019-03-07T22:41:59.540' AS DateTime), N'3-636875953194707532', N'Packed', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (62, N'38', 3, CAST(N'2019-03-07T22:42:15.167' AS DateTime), N'3-636875953351591060', N'SentFromCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (63, N'40', 3, CAST(N'2019-03-07T22:42:15.183' AS DateTime), N'3-636875953351591060', N'SentFromCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (64, N'39', 3, CAST(N'2019-03-07T22:42:15.200' AS DateTime), N'3-636875953351591060', N'SentFromCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (65, N'37', 3, CAST(N'2019-03-07T22:42:15.217' AS DateTime), N'3-636875953351591060', N'SentFromCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (66, N'40', 2, CAST(N'2019-03-07T22:42:30.243' AS DateTime), N'2-636875953502330399', N'ReceivedAtStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (67, N'39', 2, CAST(N'2019-03-07T22:42:30.260' AS DateTime), N'2-636875953502330399', N'ReceivedAtStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (68, N'38', 2, CAST(N'2019-03-07T22:42:30.277' AS DateTime), N'2-636875953502330399', N'ReceivedAtStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (69, N'37', 2, CAST(N'2019-03-07T22:42:30.293' AS DateTime), N'2-636875953502330399', N'ReceivedAtStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (70, N'41', 2, CAST(N'2019-03-14T23:19:26.033' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (71, N'42', 2, CAST(N'2019-03-14T23:19:26.060' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (72, N'43', 2, CAST(N'2019-03-14T23:19:26.087' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (73, N'44', 2, CAST(N'2019-03-14T23:19:26.110' AS DateTime), N'', N'GarmentTagged', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (74, N'43', 2, CAST(N'2019-03-14T23:20:07.353' AS DateTime), N'2-636882024073359477', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (75, N'44', 2, CAST(N'2019-03-14T23:20:07.370' AS DateTime), N'2-636882024073359477', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (76, N'42', 2, CAST(N'2019-03-14T23:20:07.387' AS DateTime), N'2-636882024073359477', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (77, N'41', 2, CAST(N'2019-03-14T23:20:07.407' AS DateTime), N'2-636882024073359477', N'SentFromStore', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (78, N'41', 3, CAST(N'2019-03-14T23:20:28.713' AS DateTime), N'3-636882024287051134', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (79, N'43', 3, CAST(N'2019-03-14T23:20:28.730' AS DateTime), N'3-636882024287051134', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (80, N'42', 3, CAST(N'2019-03-14T23:20:28.747' AS DateTime), N'3-636882024287051134', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (81, N'44', 3, CAST(N'2019-03-14T23:20:28.763' AS DateTime), N'3-636882024287051134', N'RecievedAtCenter', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (82, N'42', 3, CAST(N'2019-03-14T23:20:46.800' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (83, N'41', 3, CAST(N'2019-03-14T23:20:51.800' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (84, N'43', 3, CAST(N'2019-03-14T23:20:55.813' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (85, N'44', 3, CAST(N'2019-03-14T23:21:00.323' AS DateTime), N'', N'SortByService', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (86, N'44', 3, CAST(N'2019-03-14T23:21:31.497' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (87, N'43', 3, CAST(N'2019-03-14T23:24:31.723' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (88, N'41', 3, CAST(N'2019-03-14T23:24:39.750' AS DateTime), N'', N'SortByLocation', NULL)
INSERT [dbo].[ItemHistory] ([ID], [ItemID], [LocationID], [TStamp], [BatchID], [Description], [isSync]) VALUES (89, N'42', 3, CAST(N'2019-03-14T23:24:45.773' AS DateTime), N'', N'SortByLocation', NULL)
SET IDENTITY_INSERT [dbo].[ItemHistory] OFF
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'37', N'1000001', N'77', N'903415122312213402014F08', N'ReceivedAtStore', CAST(N'2019-03-07T22:39:41.900' AS DateTime), 2, CAST(N'2019-03-07T22:42:30.283' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'38', N'1000001', N'78', N'9034151223103303190192BC', N'ReceivedAtStore', CAST(N'2019-03-07T22:39:41.933' AS DateTime), 2, CAST(N'2019-03-07T22:42:30.267' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'39', N'1000001', N'78', N'903415122217060403017D50', N'ReceivedAtStore', CAST(N'2019-03-07T22:39:41.950' AS DateTime), 2, CAST(N'2019-03-07T22:42:30.250' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'40', N'1000001', N'79', N'903415122315375907013284', N'ReceivedAtStore', CAST(N'2019-03-07T22:39:41.973' AS DateTime), 2, CAST(N'2019-03-07T22:42:30.233' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'41', N'1000002', N'86', N'90341510080834380301D008', N'SortByLocation', CAST(N'2019-03-14T23:19:26.003' AS DateTime), 3, CAST(N'2019-03-14T23:24:39.740' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'42', N'1000002', N'86', N'9034151223090038070121CC', N'SortByLocation', CAST(N'2019-03-14T23:19:26.050' AS DateTime), 3, CAST(N'2019-03-14T23:24:45.763' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'43', N'1000002', N'87', N'903415122410365101012F58', N'SortByLocation', CAST(N'2019-03-14T23:19:26.077' AS DateTime), 3, CAST(N'2019-03-14T23:24:31.710' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'44', N'1000002', N'88', N'9034150729105627080100BC', N'SortByLocation', CAST(N'2019-03-14T23:19:26.103' AS DateTime), 3, CAST(N'2019-03-14T23:21:31.487' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Items] ([ID], [OrderID], [OrderTID], [TagID], [Status], [TaggedOn], [LastSeen], [LastSeenTime], [LineID], [Comments], [ItemImage], [isSync]) VALUES (N'45', N'MS000028', N'MS000028-1', N'123456789012345678900001', N'GarmentTagged', CAST(N'2019-06-22T18:54:35.333' AS DateTime), 0, CAST(N'2019-06-22T18:54:35.333' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([ID], [LocationCode], [LocationName], [LocationType], [isActive], [CompanyID], [LastOrderID]) VALUES (1, N'MS', N'Main Store', N'Laundry Shop', 1, 1, 34)
INSERT [dbo].[Locations] ([ID], [LocationCode], [LocationName], [LocationType], [isActive], [CompanyID], [LastOrderID]) VALUES (2, N'CS', N'City Shop', N'Laundry Shop', 1, 1, 2)
INSERT [dbo].[Locations] ([ID], [LocationCode], [LocationName], [LocationType], [isActive], [CompanyID], [LastOrderID]) VALUES (3, N'MC', N'Musaffah Center', N'Processing Center', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Locations] OFF
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000023-1', N'000023', 1, 1, 1, 6, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000023-2', N'000023', 2, 1, 1, 6, N'Recieved', NULL, 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000023-3', N'000023', 18, 1, 1, 15, N'Recieved', NULL, 3)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000024-1', N'000024', 18, 1, 1, 15, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000024-2', N'000024', 1, 1, 2, 12, N'Recieved', NULL, 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000025-1', N'000025', 18, 1, 1, 15, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'000025-2', N'000025', 19, 1, 2, 40, N'Recieved', NULL, 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'100', N'1000006', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'101', N'1000006', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'102', N'1000006', 6, 1, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'103', N'1000007', 1, 1, 2, 12, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'104', N'1000007', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'105', N'1000007', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'106', N'1000007', 6, 1, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'107', N'1000008', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'108', N'1000008', 1, 1, 2, 12, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'109', N'1000008', 4, 1, 2, 10, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'110', N'1000008', 6, 1, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'111', N'1000009', 20, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'112', N'1000009', 13, 1, 1, 20, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'113', N'1000009', 2, 2, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'114', N'1000009', 1, 2, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'115', N'1000010', 1, 3, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'116', N'1000010', 2, 3, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'117', N'1000010', 2, 4, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'118', N'1000010', 1, 4, 2, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'119', N'1000011', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'120', N'1000011', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'121', N'1000011', 2, 2, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'122', N'1000012', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'123', N'1000012', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'124', N'1000012', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'125', N'1000012', 1, 2, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'126', N'1000012', 2, 2, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'127', N'1000014', 1, 1, 3, 18, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'128', N'1000015', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'129', N'1000015', 5, 1, 1, 10, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'130', N'1000015', 20, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'131', N'1000016', 18, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'132', N'1000017', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'133', N'1000017', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'134', N'1000018', 18, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'135', N'1000018', 19, 1, 1, 20, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'136', N'1000019', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'137', N'1000019', 18, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'138', N'1000020', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'139', N'1000020', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'140', N'1000021', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'141', N'1000021', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'142', N'1000021', 18, 1, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'143', N'1000022', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'144', N'1000022', 18, 1, 2, 30, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'77', N'1000001', 1, 1, 1, 6, N'Delivered', CAST(N'2019-03-07T22:52:12.840' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'78', N'1000001', 2, 1, 1, 6, N'Delivered', CAST(N'2019-03-07T22:52:12.853' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'79', N'1000001', 4, 1, 1, 5, N'Delivered', CAST(N'2019-03-07T22:52:12.863' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'80', N'2000001', 1, 1, 3, 18, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'81', N'2000001', 2, 1, 2, 12, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'82', N'2000001', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'83', N'2000002', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'84', N'2000002', 12, 2, 1, 8, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'85', N'2000002', 13, 3, 1, 15, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'86', N'1000002', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'87', N'1000002', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'88', N'1000002', 6, 1, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'89', N'1000003', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'90', N'1000003', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'91', N'1000003', 6, 1, 1, 3, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'92', N'1000004', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'93', N'1000004', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'94', N'1000004', 21, 1, 1, 8, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'95', N'1000004', 5, 1, 1, 10, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'96', N'1000005', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'97', N'1000005', 2, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'98', N'1000005', 4, 1, 1, 5, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'99', N'1000006', 1, 1, 1, 6, N'Recieved', NULL, NULL)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000026-1', N'MS000026', 18, 1, 2, 30, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000027-1', N'MS000027', 18, 1, 2, 30, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000028-1', N'MS000028', 18, 1, 1, 15, N'Recieved', NULL, 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000028-2', N'MS000028', 19, 1, 1, 20, N'Recieved', NULL, 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000030-1', N'MS000030', 34, 1, 1, 150, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000030-2', N'MS000030', 28, 1, 1, 6, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000030-3', N'MS000030', 29, 1, 1, 6, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000031-1', N'MS000031', 33, 1, 1, 500, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000031-2', N'MS000031', 34, 1, 1, 150, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000031-3', N'MS000031', 35, 1, 1, 35, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000032-1', N'MS000032', 27, 1, 1, 8, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000032-2', N'MS000032', 34, 1, 1, 150, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000032-3', N'MS000032', 28, 1, 1, 6, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000032-4', N'MS000032', 33, 4, 1, 500, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000033-1', N'MS000033', 27, 4, 1, 4, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000033-2', N'MS000033', 19, 4, 1, 10, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000033-3', N'MS000033', 23, 4, 1, 2, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000034-1', N'MS000034', 1, 1, 1, 6, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000034-2', N'MS000034', 2, 1, 1, 6, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderDetails] ([TID], [OrderID], [GarmentID], [ServiceID], [Qty], [Total], [Status], [DeliveredOn], [LineID]) VALUES (N'MS000034-3', N'MS000034', 64, 1, 1, 22.22, N'Recieved', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'000023', CAST(N'2019-06-22T18:09:02.297' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 10, 2.43, NULL, 27, 1.22, 24.3, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'000024', CAST(N'2019-06-22T18:13:48.863' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 25, 5.06, NULL, 27, 1.01, 20.25, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'000025', CAST(N'2019-06-22T18:16:32.790' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 25, 10.31, NULL, 55, 2.06, 41.25, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000001', CAST(N'2019-01-29T22:40:08.290' AS DateTime), 1, CAST(N'2019-01-31T00:00:00.000' AS DateTime), 0, 0, 1, N'Completed', 1, N'', 1, NULL, NULL, CAST(N'2019-03-08T15:49:34.080' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000002', CAST(N'2019-03-14T12:19:54.547' AS DateTime), 1, CAST(N'2019-03-16T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000003', CAST(N'2019-03-14T12:36:30.720' AS DateTime), 6, CAST(N'2019-03-16T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000004', CAST(N'2019-03-14T12:36:53.947' AS DateTime), 7, CAST(N'2019-03-16T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000005', CAST(N'2019-05-31T21:53:16.790' AS DateTime), 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000006', CAST(N'2019-05-31T21:54:38.370' AS DateTime), 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000007', CAST(N'2019-05-31T21:57:41.580' AS DateTime), 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000008', CAST(N'2019-05-31T22:00:49.673' AS DateTime), 7, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000009', CAST(N'2019-05-31T22:04:34.627' AS DateTime), 7, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000010', CAST(N'2019-05-31T22:09:10.543' AS DateTime), 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000011', CAST(N'2019-05-31T22:12:00.100' AS DateTime), 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000012', CAST(N'2019-05-31T22:14:46.067' AS DateTime), 7, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000013', CAST(N'2019-06-07T23:13:47.220' AS DateTime), 1, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000014', CAST(N'2019-06-07T23:14:37.620' AS DateTime), 1, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000015', CAST(N'2019-06-07T23:15:31.573' AS DateTime), 1, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000016', CAST(N'2019-06-08T18:06:00.980' AS DateTime), 1, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 0, 0, 1, N'Cancelled', 1, N'', 1, 0, 0, NULL, 15, 0.75, 15, 0, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000017', CAST(N'2019-06-21T17:19:41.063' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 12, 0.6, 12, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000018', CAST(N'2019-06-21T17:22:02.200' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 10, 3.15, NULL, 35, 1.58, 31.5, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000019', CAST(N'2019-06-21T17:40:27.243' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 21, 1.05, 21, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000020', CAST(N'2019-06-21T22:48:19.870' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 11, 0.55, 11, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000021', CAST(N'2019-06-21T22:50:05.267' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 26, 1.3, 26, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'1000022', CAST(N'2019-06-21T22:51:36.523' AS DateTime), 1, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 36, 1.8, 36, 0, 0, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'2000001', CAST(N'2019-01-31T23:25:32.820' AS DateTime), 1, CAST(N'2019-02-02T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'2000002', CAST(N'2019-03-08T15:01:07.340' AS DateTime), 1, CAST(N'2019-03-10T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'All Good', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000026', CAST(N'2019-06-22T18:19:31.187' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 30, 1.5, 30, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000027', CAST(N'2019-06-22T18:24:02.327' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 30, 1.5, 30, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000028', CAST(N'2019-06-22T18:34:41.283' AS DateTime), 636968229649627807, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, NULL, 35, 1.75, 35, 0, 0, 0)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000029', CAST(N'2019-07-03T23:09:14.897' AS DateTime), 636977921030357158, CAST(N'2019-07-05T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 23.1, 1.16, 23.1, 0, 1, 1)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000030', CAST(N'2019-07-06T12:01:36.967' AS DateTime), 636977921030357158, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 162, 8.1, 162, 0, 1, 1)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000031', CAST(N'2019-07-06T12:05:27.327' AS DateTime), 636977921030357158, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 753.5, 37.68, 753.5, 0, 1, 1)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000032', CAST(N'2019-07-06T18:34:44.490' AS DateTime), 636980347605479483, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 0, N'', 1, 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 730.4, 36.52, 730.4, 0, 0, 1)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000033', CAST(N'2019-07-06T18:45:09.273' AS DateTime), 636980347605479483, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 0, N'', 1, 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 17.6, 0.88, 17.6, 0, 0, 1)
INSERT [dbo].[Orders] ([ID], [OrderDate], [CustomerID], [DeliverBy], [isCancelled], [isPaid], [CompanyID], [Status], [isHang], [Comments], [LocationID], [PromoApplied], [Discount], [DoEmail], [SubTotal], [VATAmount], [GrandTotal], [Balance], [isExpress], [isSync]) VALUES (N'MS000034', CAST(N'2019-08-25T23:35:21.730' AS DateTime), 17, CAST(N'2019-08-27T00:00:00.000' AS DateTime), 0, 0, 1, N'Active', 1, N'', 1, 10, 3.08, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 34.22, 1.54, 30.8, 0, 0, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'1', N'MS000029', CAST(N'2019-07-03T23:09:14.963' AS DateTime), 23.1, 1, N'Card', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'2', N'MS000030', CAST(N'2019-07-06T12:04:50.523' AS DateTime), 162, 1, N'Loyalty', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'3', N'MS000031', CAST(N'2019-07-06T12:05:27.370' AS DateTime), 500, 1, N'Cash', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'34', N'1000001', CAST(N'2019-03-07T22:52:12.820' AS DateTime), 17, 1, N'', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'35', N'1000014', CAST(N'2019-06-07T23:14:37.670' AS DateTime), 18, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'36', N'1000015', CAST(N'2019-06-07T23:15:31.647' AS DateTime), 23.25, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'37', N'1000016', CAST(N'2019-06-08T18:06:01.040' AS DateTime), 15, 1, N'Loyalty', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'38', N'1000017', CAST(N'2019-06-21T17:19:41.133' AS DateTime), 12, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'39', N'1000018', CAST(N'2019-06-21T17:22:02.247' AS DateTime), 31.5, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'40', N'1000019', CAST(N'2019-06-21T17:40:27.287' AS DateTime), 21, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'41', N'1000020', CAST(N'2019-06-21T22:48:19.933' AS DateTime), 11, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'42', N'1000022', CAST(N'2019-06-21T22:51:36.590' AS DateTime), 36, 1, N'Cash', 0, NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'44', N'000024', CAST(N'2019-06-22T18:13:48.927' AS DateTime), 20.25, 1, N'Cash', 0, NULL, NULL, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'45', N'000025', CAST(N'2019-06-22T18:16:32.853' AS DateTime), 41.25, 1, N'Cash', 0, NULL, NULL, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'46', N'MS000026', CAST(N'2019-06-22T18:19:34.003' AS DateTime), 30, 1, N'Cash', 0, NULL, NULL, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'47', N'MS000027', CAST(N'2019-06-22T18:24:02.383' AS DateTime), 30, 1, N'Cash', 0, NULL, NULL, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'48', N'MS000028', CAST(N'2019-06-22T18:34:41.347' AS DateTime), 35, 1, N'Cash', 0, NULL, NULL, 0)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'MS000032636980348845733865', N'MS000032', CAST(N'2019-07-06T18:34:44.573' AS DateTime), 400, 1, N'Card', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'MS000033636980355093192788', N'MS000033', CAST(N'2019-07-06T18:45:09.320' AS DateTime), 17.6, 1, N'Cash', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PayID], [OrderID], [PayDate], [Amount], [RecievedBy], [PaymentType], [isCancelled], [CancelledBy], [CancelledOn], [isSync]) VALUES (N'MS000034637023729218085809', N'MS000034', CAST(N'2019-08-25T23:35:21.810' AS DateTime), 30.8, 1, N'Cash', 0, 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Payterms] ON 

INSERT [dbo].[Payterms] ([ID], [PaytermName], [PayAfter], [isActive]) VALUES (1, N'30 days', 30, 1)
INSERT [dbo].[Payterms] ([ID], [PaytermName], [PayAfter], [isActive]) VALUES (2, N'45 days', 45, 1)
INSERT [dbo].[Payterms] ([ID], [PaytermName], [PayAfter], [isActive]) VALUES (3, N'60 days', 60, 1)
SET IDENTITY_INSERT [dbo].[Payterms] OFF
SET IDENTITY_INSERT [dbo].[PromotionLocation] ON 

INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (2, 1, 1)
INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (3, 1, 2)
INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (4, 1, 3)
INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (5, 2, 1)
INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (6, 2, 2)
INSERT [dbo].[PromotionLocation] ([TID], [PromotionID], [LocationID]) VALUES (7, 2, 3)
SET IDENTITY_INSERT [dbo].[PromotionLocation] OFF
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([ID], [PromoCode], [PromoName], [StartDate], [EndDate], [PromoType], [ApplicableAfter], [DiscountPer], [CompanyID]) VALUES (1, N'10%', N'10% Discount', CAST(N'2019-05-31T17:25:39.137' AS DateTime), CAST(N'2020-05-31T17:25:39.000' AS DateTime), N'0', 0, 10, 1)
INSERT [dbo].[Promotions] ([ID], [PromoCode], [PromoName], [StartDate], [EndDate], [PromoType], [ApplicableAfter], [DiscountPer], [CompanyID]) VALUES (2, N'25%', N'25% Discount', CAST(N'2019-05-31T17:25:39.137' AS DateTime), CAST(N'2020-05-31T17:25:39.000' AS DateTime), N'0', 0, 25, 1)
SET IDENTITY_INSERT [dbo].[Promotions] OFF
SET IDENTITY_INSERT [dbo].[ReportLog] ON 

INSERT [dbo].[ReportLog] ([ID], [ReportType], [ReportDate], [ReportDoc], [ReportBy], [ReportingTime]) VALUES (1, N'Test Type', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 0x, 1, CAST(N'2019-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ReportLog] ([ID], [ReportType], [ReportDate], [ReportDoc], [ReportBy], [ReportingTime]) VALUES (2, N'Demo Type', CAST(N'2019-09-01T00:00:00.000' AS DateTime), 0x, 2, CAST(N'2019-09-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportLog] OFF
SET IDENTITY_INSERT [dbo].[RFIDReaders] ON 

INSERT [dbo].[RFIDReaders] ([ID], [ReaderCode], [IPAddress], [AN1], [AN2], [AN3], [AN4], [ReaderType], [LocationID], [CompanyID], [isActive]) VALUES (1, N'Main01', N'192.168.1.100', 0, 0, 0, 0, N'Fixed Reader', 1, 1, 0)
INSERT [dbo].[RFIDReaders] ([ID], [ReaderCode], [IPAddress], [AN1], [AN2], [AN3], [AN4], [ReaderType], [LocationID], [CompanyID], [isActive]) VALUES (2, N'POS-CityShop', N'USB', 0, 0, 0, 0, N'USB Reader', 2, 1, 1)
INSERT [dbo].[RFIDReaders] ([ID], [ReaderCode], [IPAddress], [AN1], [AN2], [AN3], [AN4], [ReaderType], [LocationID], [CompanyID], [isActive]) VALUES (3, N'POS-Musaffah', N'USB', 0, 0, 0, 0, N'USB Reader', 3, 1, 1)
INSERT [dbo].[RFIDReaders] ([ID], [ReaderCode], [IPAddress], [AN1], [AN2], [AN3], [AN4], [ReaderType], [LocationID], [CompanyID], [isActive]) VALUES (4, N'USB03', N'USB', 0, 0, 0, 0, N'USB', 1, 1, 1)
INSERT [dbo].[RFIDReaders] ([ID], [ReaderCode], [IPAddress], [AN1], [AN2], [AN3], [AN4], [ReaderType], [LocationID], [CompanyID], [isActive]) VALUES (6, N'Code123', N'192.168.1.120', 1.5, 2.5, 3.5, 4.5, N'Code Type', 3, 1, 1)
SET IDENTITY_INSERT [dbo].[RFIDReaders] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [ServiceType], [isActive], [CompanyID]) VALUES (1, N'Dry Cleaning', 1, 1)
INSERT [dbo].[Services] ([ID], [ServiceType], [isActive], [CompanyID]) VALUES (2, N'Ironing', 1, 1)
INSERT [dbo].[Services] ([ID], [ServiceType], [isActive], [CompanyID]) VALUES (3, N'Washing+Press', 1, 1)
INSERT [dbo].[Services] ([ID], [ServiceType], [isActive], [CompanyID]) VALUES (4, N'Steem Press', 1, 1)
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[StatusMaster] ON 

INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (1, N'GarmentTagged', 24)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (2, N'SentFromStore', 6)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (3, N'RecievedAtCenter', 6)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (4, N'SortByService', 12)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (5, N'SortByLocation', 24)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (6, N'Packed', 3)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (7, N'SentFromCenter', 24)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (8, N'ReceivedAtStore', 6)
INSERT [dbo].[StatusMaster] ([ID], [StatusDesc], [HoursMax]) VALUES (9, N'DeliveredToCustomer', 96)
SET IDENTITY_INSERT [dbo].[StatusMaster] OFF
SET IDENTITY_INSERT [dbo].[tblAccess] ON 

INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (1, N'Manage Roles')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (2, N'Manage Users')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (3, N'Manage Customers')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (4, N'Garment Types')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (5, N'Pricing')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (6, N'Order Dashboard')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (7, N'Cancel Orders')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (8, N'Reports')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (9, N'Manage Companies')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (10, N'Process Orders')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (11, N'Order List')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (12, N'Settle Payment')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (13, N'Tag Registration')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (14, N'Manage Category')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (15, N'Manage Locations')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (16, N'Application Settings')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (17, N'Tag Items')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (18, N'Manage Readers')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (19, N'Transfer In')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (20, N'Transfer Out')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (21, N'Sort By Service')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (22, N'Manage Contracts')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (23, N'Promotions')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (24, N'Pack Clothes')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (25, N'Sort By Location')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (26, N'View Discrepencies')
INSERT [dbo].[tblAccess] ([AccessID], [AccessDesc]) VALUES (27, N'Manual Transfers')
SET IDENTITY_INSERT [dbo].[tblAccess] OFF
INSERT [dbo].[tblAppPrefs] ([AppSetting], [AppValue]) VALUES (N'ExpressService', N'10')
INSERT [dbo].[tblAppPrefs] ([AppSetting], [AppValue]) VALUES (N'VATRate', N'5')
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleID], [RoleDesc], [isActive]) VALUES (1, N'Administrator', 1)
INSERT [dbo].[tblRole] ([RoleID], [RoleDesc], [isActive]) VALUES (2, N'Shop User', 1)
INSERT [dbo].[tblRole] ([RoleID], [RoleDesc], [isActive]) VALUES (3, N'Central User', 1)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblRoleDetails] ON 

INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (224, 2, 3)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (225, 2, 6)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (226, 2, 7)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (227, 2, 8)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (228, 2, 10)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (229, 2, 11)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (230, 2, 12)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (231, 2, 13)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (232, 2, 17)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (233, 2, 19)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (234, 2, 20)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (235, 2, 26)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (236, 3, 5)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (237, 3, 6)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (238, 3, 11)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (239, 3, 19)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (240, 3, 20)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (241, 3, 21)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (242, 3, 24)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (243, 3, 25)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (244, 3, 26)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (245, 1, 1)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (246, 1, 2)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (247, 1, 3)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (248, 1, 4)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (249, 1, 5)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (250, 1, 6)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (251, 1, 7)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (252, 1, 8)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (253, 1, 9)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (254, 1, 10)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (255, 1, 11)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (256, 1, 12)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (257, 1, 14)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (258, 1, 15)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (259, 1, 16)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (260, 1, 17)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (261, 1, 18)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (262, 1, 19)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (263, 1, 20)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (264, 1, 21)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (265, 1, 22)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (266, 1, 23)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (267, 1, 24)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (268, 1, 25)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (269, 1, 26)
INSERT [dbo].[tblRoleDetails] ([TID], [RoleID], [AccessID]) VALUES (270, 1, 27)
SET IDENTITY_INSERT [dbo].[tblRoleDetails] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UID], [UserID], [iPassword], [RoleID], [DisplayName], [RFID], [isActive], [BS]) VALUES (1, N'admin', N'admin', 1, N'Administrator', N'', 1, N'')
INSERT [dbo].[tblUser] ([UID], [UserID], [iPassword], [RoleID], [DisplayName], [RFID], [isActive], [BS]) VALUES (2, N'shopuser', N'123456', 2, N'Shop User', N'', 1, NULL)
INSERT [dbo].[tblUser] ([UID], [UserID], [iPassword], [RoleID], [DisplayName], [RFID], [isActive], [BS]) VALUES (3, N'central', N'123456', 3, N'Central User', N'', 1, NULL)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[UserCompany] ON 

INSERT [dbo].[UserCompany] ([TID], [UID], [CID]) VALUES (1, 1, 1)
INSERT [dbo].[UserCompany] ([TID], [UID], [CID]) VALUES (2, 2, 1)
INSERT [dbo].[UserCompany] ([TID], [UID], [CID]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [dbo].[UserCompany] OFF
INSERT [dbo].[UserLocation] ([UserID], [LocationID]) VALUES (1, 1)
INSERT [dbo].[UserLocation] ([UserID], [LocationID]) VALUES (1, 2)
INSERT [dbo].[UserLocation] ([UserID], [LocationID]) VALUES (1, 3)
INSERT [dbo].[UserLocation] ([UserID], [LocationID]) VALUES (2, 2)
INSERT [dbo].[UserLocation] ([UserID], [LocationID]) VALUES (3, 3)
ALTER TABLE [dbo].[AuditLog] ADD  CONSTRAINT [DF_AuditLog_isSync]  DEFAULT ((0)) FOR [isSync]
GO
ALTER TABLE [dbo].[GarmentService] ADD  CONSTRAINT [DF_GarmentService_CorpID]  DEFAULT ((0)) FOR [CorpID]
GO
ALTER TABLE [dbo].[GarmentType] ADD  CONSTRAINT [DF_GarmentType_CategoryID]  DEFAULT ((0)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[GarmentType] ADD  CONSTRAINT [DF_GarmentType_TagCount]  DEFAULT ((1)) FOR [TagCount]
GO
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_tblUser_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Company]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CorporateAccount] FOREIGN KEY([CorpID])
REFERENCES [dbo].[CorporateAccount] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CorporateAccount]
GO
ALTER TABLE [dbo].[GarmentService]  WITH CHECK ADD  CONSTRAINT [FK_GarmentService_CorporateAccount] FOREIGN KEY([CorpID])
REFERENCES [dbo].[CorporateAccount] ([ID])
GO
ALTER TABLE [dbo].[GarmentService] CHECK CONSTRAINT [FK_GarmentService_CorporateAccount]
GO
ALTER TABLE [dbo].[GarmentService]  WITH CHECK ADD  CONSTRAINT [FK_GarmentService_GarmentType] FOREIGN KEY([GarmentID])
REFERENCES [dbo].[GarmentType] ([ID])
GO
ALTER TABLE [dbo].[GarmentService] CHECK CONSTRAINT [FK_GarmentService_GarmentType]
GO
ALTER TABLE [dbo].[GarmentService]  WITH CHECK ADD  CONSTRAINT [FK_GarmentService_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[GarmentService] CHECK CONSTRAINT [FK_GarmentService_Services]
GO
ALTER TABLE [dbo].[GarmentType]  WITH CHECK ADD  CONSTRAINT [FK_GarmentType_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[GarmentType] CHECK CONSTRAINT [FK_GarmentType_Category]
GO
ALTER TABLE [dbo].[ItemHistory]  WITH CHECK ADD  CONSTRAINT [FK_ItemHistory_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ID])
GO
ALTER TABLE [dbo].[ItemHistory] CHECK CONSTRAINT [FK_ItemHistory_Items]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderDetails] FOREIGN KEY([OrderTID])
REFERENCES [dbo].[OrderDetails] ([TID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_OrderDetails]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_GarmentType] FOREIGN KEY([GarmentID])
REFERENCES [dbo].[GarmentType] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_GarmentType]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Services]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Company]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Locations]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Promotions] FOREIGN KEY([PromoApplied])
REFERENCES [dbo].[Promotions] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Orders] NOCHECK CONSTRAINT [FK_Orders_Promotions]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[PromotionLocation]  WITH CHECK ADD  CONSTRAINT [FK_PromotionLocation_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[PromotionLocation] CHECK CONSTRAINT [FK_PromotionLocation_Locations]
GO
ALTER TABLE [dbo].[PromotionLocation]  WITH CHECK ADD  CONSTRAINT [FK_PromotionLocation_Promotions] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotions] ([ID])
GO
ALTER TABLE [dbo].[PromotionLocation] CHECK CONSTRAINT [FK_PromotionLocation_Promotions]
GO
ALTER TABLE [dbo].[RFIDReaders]  WITH CHECK ADD  CONSTRAINT [FK_RFIDReaders_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[RFIDReaders] CHECK CONSTRAINT [FK_RFIDReaders_Company]
GO
ALTER TABLE [dbo].[RFIDReaders]  WITH CHECK ADD  CONSTRAINT [FK_RFIDReaders_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[RFIDReaders] CHECK CONSTRAINT [FK_RFIDReaders_Locations]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Company]
GO
ALTER TABLE [dbo].[tblRoleDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblRoleDe__RoleI__08EA5793] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblRoleDetails] CHECK CONSTRAINT [FK__tblRoleDe__RoleI__08EA5793]
GO
ALTER TABLE [dbo].[tblRoleDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblRoleDetails_tblAccess] FOREIGN KEY([AccessID])
REFERENCES [dbo].[tblAccess] ([AccessID])
GO
ALTER TABLE [dbo].[tblRoleDetails] CHECK CONSTRAINT [FK_tblRoleDetails_tblAccess]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__RoleID__17036CC0] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__RoleID__17036CC0]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_Company] FOREIGN KEY([CID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_Company]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_tblUser] FOREIGN KEY([UID])
REFERENCES [dbo].[tblUser] ([UID])
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_tblUser]
GO
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_Locations]
GO
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UID])
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_tblUser]
GO
/****** Object:  StoredProcedure [dbo].[sp_AuditLog_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_AuditLog_DML]
(
	@TID int = 0,
	@OrderID int = 0,
	@TStamp datetime = NULL,
	@EventType varchar (50) = '',
	@EventDesc varchar (200) = '',
	@UserID int = 0,
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_AuditLog_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO AuditLog
	(
		OrderID,
		TStamp,
		EventType,
		EventDesc,
		UserID,
		isSync
	)
	VALUES
	(
		@OrderID,
		@TStamp,
		@EventType,
		@EventDesc,
		@UserID,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	AuditLog
	SET	OrderID = @OrderID,
		TStamp = @TStamp,
		EventType = @EventType,
		EventDesc = @EventDesc,
		UserID = @UserID,
		isSync = @isSync 
	WHERE TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	AuditLog
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_AuditLog_DML
else
	commit transaction sp_AuditLog_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_AuditLog_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_AuditLog_GetAll]
(
	@TID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID > 0)
BEGIN
	SELECT	TID,
			OrderID,
			TStamp,
			EventType,
			EventDesc,
			UserID,
			isSync
	FROM	AuditLog
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			OrderID,
			TStamp,
			EventType,
			EventDesc,
			UserID,
			isSync
	FROM	AuditLog
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Booking_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Booking_DML]
(
	@BookingId int = 0,
	@CustomerId bigint = 0,
	@TimeSlot nvarchar (20) = '',
	@BookingDate date = null,
	@NumberOfGarment INT = 0,
	@CreatedBy int = 0,
	@CreatedOn datetime=null,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Booking_DML

	DECLARE @isAlreadyToday INT = 0
IF(@Mode = 1)
BEGIN

	SELECT	@isAlreadyToday = COUNT(*)
	FROM	Booking
	WHERE	CustomerId = @CustomerId AND
			BookingDate = @BookingDate
			
	IF(@isAlreadyToday > 0)
	BEGIN
		SELECT	@responsemessage = 4;
	END
	ELSE
	BEGIN
		INSERT INTO Booking
		(
		CustomerId,
		TimeSlot,
		BookingDate,
		NumberOfGarment,
		CreatedBy,
		CreatedOn
		)
		VALUES
		(
		@CustomerId,
		@TimeSlot,
		@BookingDate,
		@NumberOfGarment,
		@CreatedBy,
		@CreatedOn
		)
		SELECT	@responsemessage = 1;
	END
END

SELECT @BookingId;

if @@error <> 0
	rollback transaction sp_Booking_DML
else
	commit transaction sp_Booking_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Booking_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Booking_GetAll]
(
	@CustomerId bigint = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@CustomerId > 0)
BEGIN
	SELECT	BookingId,
			BookingDate,
			TimeSlot,
			NumberOfGarment,
			CustomerId
	FROM	Booking
	WHERE	CustomerId = @CustomerId
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Category_DML]
(
	@ID int = 0,
	@Category nvarchar (100) = '',
	@isActive bit = 0,
	@CompanyID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Category_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Category
	(
		Category,
		isActive,
		CompanyID
	)
	VALUES
	(
		@Category,
		@isActive,
		@CompanyID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Category
	SET	Category = @Category,
		isActive = @isActive,
		CompanyID = @CompanyID 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Category
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_Category_DML
else
	commit transaction sp_Category_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Category_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			Category,
			isActive,
			CompanyID
	FROM	Category
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			Category,
			isActive,
			CompanyID
	FROM	Category
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangePassword]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ChangePassword]
(
	@ID bigint = 0,
	@OldPassword NVARCHAR(80) = '',
	@NewPassword NVARCHAR(80) = '',
	@CreatedBy int = 0,
	@CreatedOn datetime = null,
	@responsemessage INT OUTPUT   
)
AS
	DECLARE @IsID bigint = 0;
BEGIN TRANSACTION sp_ChangePassword
BEGIN
		SELECT	@IsID = ID
		FROM	dbo.Customer
		WHERE	[Password] = @OldPassword AND
				ID = @ID

		IF(@IsID > 0)
		BEGIN	
			UPDATE	Customer
			SET		[Password] = @NewPassword,
					CreatedBy = @CreatedBy,
					CreatedOn = @CreatedOn
			WHERE	ID = @ID

			SET  @responsemessage = 2
		END
		ELSE
		BEGIN
			SET  @responsemessage = 0
		END
END

if @@error <> 0
	rollback transaction sp_ChangePassword
else
	commit transaction sp_ChangePassword
GO
/****** Object:  StoredProcedure [dbo].[sp_Company_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 12:12:12
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Company_DML]
(
	@ID int = 0,
	@CompanyName varchar (100) = '',
	@CompanyCode varchar (50) = '',
	@Address varchar (200) = '',
	@PhoneNo varchar (50) = '',
	@FaxNo varchar (50) = '',
	@isActive bit = 0,
	@Logo varchar (50) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Company_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Company
	(
		--ID,
		CompanyName,
		CompanyCode,
		[Address],
		PhoneNo,
		FaxNo,
		isActive,
		Logo
	)
	VALUES
	(
		--@ID,
		@CompanyName,
		@CompanyCode,
		@Address,
		@PhoneNo,
		@FaxNo,
		@isActive,
		@Logo	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Company
	SET	CompanyName = @CompanyName,
		CompanyCode = @CompanyCode,
		[Address] = @Address,
		PhoneNo = @PhoneNo,
		FaxNo = @FaxNo,
		isActive = @isActive,
		Logo = @Logo 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Company
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_Company_DML
else
	commit transaction sp_Company_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Company_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 12:12:14
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Company_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			CompanyName,
			CompanyCode,
			[Address],
			PhoneNo,
			FaxNo,
			isActive,
			Logo
	FROM	Company
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			CompanyName,
			CompanyCode,
			[Address],
			PhoneNo,
			FaxNo,
			isActive,
			Logo
	FROM	Company
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CorporateAccount_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_CorporateAccount_DML]
(
	@ID int = 0,
	@CorporateCode varchar (50) = '',
	@CorpName varchar (100) = '',
	@PaymentTerms int = 0,
	@AccountStart datetime = NULL,
	@CreatedOn datetime = NULL,
	@CreatedBy int = 0,
	@isActive bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_CorporateAccount_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO CorporateAccount
	(
		CorporateCode,
		CorpName,
		PaymentTerms,
		AccountStart,
		CreatedOn,
		CreatedBy,
		isActive
	)
	VALUES
	(
		@CorporateCode,
		@CorpName,
		@PaymentTerms,
		@AccountStart,
		@CreatedOn,
		@CreatedBy,
		@isActive	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	CorporateAccount
	SET	CorporateCode = @CorporateCode,
		CorpName = @CorpName,
		PaymentTerms = @PaymentTerms,
		AccountStart = @AccountStart,
		CreatedOn = @CreatedOn,
		CreatedBy = @CreatedBy,
		isActive = @isActive 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	CorporateAccount
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_CorporateAccount_DML
else
	commit transaction sp_CorporateAccount_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_CorporateAccount_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_CorporateAccount_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			CorporateCode,
			CorpName,
			PaymentTerms,
			AccountStart,
			CreatedOn,
			CreatedBy,
			isActive
	FROM	CorporateAccount
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			CorporateCode,
			CorpName,
			PaymentTerms,
			AccountStart,
			CreatedOn,
			CreatedBy,
			isActive
	FROM	CorporateAccount
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CorporateCustomer_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_CorporateCustomer_DML]
(
	@CorporateID int = 0,
	@CustomerID bigint = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_CorporateCustomer_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO CorporateCustomer
	(
		CustomerID
	)
	VALUES
	(
		 @CustomerID
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	CorporateCustomer
	SET	CustomerID = @CustomerID
	WHERE CorporateID = @CorporateID AND
		  CustomerID = @CustomerID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	CorporateCustomer
	WHERE	CorporateID = @CorporateID AND
			CustomerID = @CustomerID

	SELECT	@responsemessage = 3;
END

SELECT @CorporateID;

if @@error <> 0
	rollback transaction sp_CorporateCustomer_DML
else
	commit transaction sp_CorporateCustomer_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_CorporateCustomer_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_CorporateCustomer_GetAll]
(
	@CorporateID int,
	@CustomerID bigint
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@CorporateID > 0AND @CustomerID > 0)
BEGIN
	SELECT	CorporateID,
			CustomerID
	FROM	CorporateCustomer
	WHERE	CorporateID = @CorporateID AND
		CustomerID = @CustomerID
END
ELSE
BEGIN
	SELECT	CorporateID,
			CustomerID
	FROM	CorporateCustomer
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Customer_DML]
(
	@ID bigint = 0,
	@CustomerID varchar (50) = '',
	@FullName varchar (200) = '',
	@Address varchar (500) = '',
	@Landmark varchar (100) = '',
	@PhoneNumber varchar (20) = '',
	@MobileNumber varchar (20) = '',
	@Attn varchar (100) = '',
	@AccountType int = 0,
	@Phone1 varchar (20) = '',
	@Phone2 varchar (20) = '',
	@Phone3 varchar (20) = '',
	@Phone4 varchar (20) = '',
	@Phone5 varchar (20) = '',
	@CustomerCode varchar (50) = '',
	@CreatedOn datetime = NULL,
	@CreatedBy int = 0,
	@CompanyID int = 0,
	@isActive bit = 0,
	@Email varchar (100) = '',
	@CorpID int = 0,
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Customer_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Customer
	(
		CustomerID,
		FullName,
		[Address],
		Landmark,
		PhoneNumber,
		MobileNumber,
		Attn,
		AccountType,
		Phone1,
		Phone2,
		Phone3,
		Phone4,
		Phone5,
		CustomerCode,
		CreatedOn,
		CreatedBy,
		CompanyID,
		isActive,
		Email,
		CorpID,
		isSync
	)
	VALUES
	(
		@CustomerID,
		@FullName,
		@Address,
		@Landmark,
		@PhoneNumber,
		@MobileNumber,
		@Attn,
		@AccountType,
		@Phone1,
		@Phone2,
		@Phone3,
		@Phone4,
		@Phone5,
		@CustomerCode,
		@CreatedOn,
		@CreatedBy,
		@CompanyID,
		@isActive,
		@Email,
		@CorpID,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Customer
	SET	CustomerID = @CustomerID,
		FullName = @FullName,
		[Address] = @Address,
		Landmark = @Landmark,
		PhoneNumber = @PhoneNumber,
		MobileNumber = @MobileNumber,
		Attn = @Attn,
		AccountType = @AccountType,
		Phone1 = @Phone1,
		Phone2 = @Phone2,
		Phone3 = @Phone3,
		Phone4 = @Phone4,
		Phone5 = @Phone5,
		CustomerCode = @CustomerCode,
		CreatedOn = @CreatedOn,
		CreatedBy = @CreatedBy,
		CompanyID = @CompanyID,
		isActive = @isActive,
		Email = @Email,
		CorpID = @CorpID,
		isSync = @isSync 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Customer
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_Customer_DML
else
	commit transaction sp_Customer_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Customer_GetAll]
(
	@ID bigint = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			CustomerID,
			FullName,
			[Address],
			Landmark,
			PhoneNumber,
			MobileNumber,
			Attn,
			AccountType,
			Phone1,
			Phone2,
			Phone3,
			Phone4,
			Phone5,
			CustomerCode,
			CreatedOn,
			CreatedBy,
			CompanyID,
			isActive,
			Email,
			CorpID,
			isSync
	FROM	Customer
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			CustomerID,
			FullName,
			[Address],
			Landmark,
			PhoneNumber,
			MobileNumber,
			Attn,
			AccountType,
			Phone1,
			Phone2,
			Phone3,
			Phone4,
			Phone5,
			CustomerCode,
			CreatedOn,
			CreatedBy,
			CompanyID,
			isActive,
			Email,
			CorpID,
			isSync
	FROM	Customer
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerDashboard]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CustomerDashboard]
@CustomerId bigint = 0
AS
BEGIN
	
SET NOCOUNT ON;

	DECLARE @DashBoardTable TABLE (TotalPromotions INT NULL,TotalPriceList INT NULL)

	INSERT INTO @DashBoardTable (TotalPromotions, TotalPriceList)
	values ( (SELECT COUNT(*) FROM	[dbo].[Promotions]),
			 (SELECT COUNT(*) FROM	[dbo].[vwCustomerPrice] where CustomerID = @CustomerId))

	SELECT * from @DashBoardTable

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GarmentService_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GarmentService_DML]
(
	@TID int = 0,
	@GarmentID int = 0,
	@ServiceID int = 0,
	@Price float = 0,
	@isOffered bit = 0,
	@CorpID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_GarmentService_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO GarmentService
	(
		GarmentID,
		ServiceID,
		Price,
		isOffered,
		CorpID
	)
	VALUES
	(
		@GarmentID,
		@ServiceID,
		@Price,
		@isOffered,
		@CorpID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	GarmentService
	SET		GarmentID = @GarmentID,
		ServiceID = @ServiceID,
		Price = @Price,
		isOffered = @isOffered,
		CorpID = @CorpID 
	WHERE
TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	GarmentService
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_GarmentService_DML
else
	commit transaction sp_GarmentService_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_GarmentService_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GarmentService_GetAll]
(
	@TID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID > 0)
BEGIN
	SELECT	TID,
			GarmentID,
			ServiceID,
			Price,
			isOffered,
			CorpID
	FROM	GarmentService
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			GarmentID,
			ServiceID,
			Price,
			isOffered,
			CorpID
	FROM	GarmentService
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GarmentType_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GarmentType_DML]
(
	@ID int = 0,
	@GarmetType nvarchar (100) = '',
	@isActive bit = 0,
	@CreatedOn datetime = NULL,
	@CreatedBy int = 0,
	@GImage image = NULL,
	@CompanyID int = 0,
	@CategoryID int = 0,
	@TagCount int = 0,
	@Weight float = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_GarmentType_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO GarmentType
	(
		GarmetType,
		isActive,
		CreatedOn,
		CreatedBy,
		GImage,
		CompanyID,
		CategoryID,
		TagCount,
		[Weight]
	)
	VALUES
	(
		@GarmetType,
		@isActive,
		@CreatedOn,
		@CreatedBy,
		@GImage,
		@CompanyID,
		@CategoryID,
		@TagCount,
		@Weight	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	GarmentType
	SET	GarmetType = @GarmetType,
		isActive = @isActive,
		CreatedOn = @CreatedOn,
		CreatedBy = @CreatedBy,
		GImage = @GImage,
		CompanyID = @CompanyID,
		CategoryID = @CategoryID,
		TagCount = @TagCount,
		[Weight] = @Weight 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	GarmentType
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_GarmentType_DML
else
	commit transaction sp_GarmentType_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_GarmentType_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GarmentType_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			GarmetType,
			isActive,
			CreatedOn,
			CreatedBy,
			GImage,
			CompanyID,
			CategoryID,
			TagCount,
			[Weight]
	FROM	GarmentType
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			GarmetType,
			isActive,
			CreatedOn,
			CreatedBy,
			GImage,
			CompanyID,
			CategoryID,
			TagCount,
			[Weight]
	FROM	GarmentType
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Invoice]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Invoice]
(
	@CustomerId bigint = 0
)
AS
BEGIN
SET NOCOUNT ON;
	SELECT	*
	FROM	vwXOrder
	WHERE	CID = @CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ItemHistory_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_ItemHistory_DML]
(
	@ID int = 0,
	@ItemID varchar (15) = '',
	@LocationID int = 0,
	@TStamp datetime = NULL,
	@BatchID varchar (50) = '',
	@Description varchar (100) = '',
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_ItemHistory_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO ItemHistory
	(
		ItemID,
		LocationID,
		TStamp,
		BatchID,
		[Description],
		isSync
	)
	VALUES
	(
		@ItemID,
		@LocationID,
		@TStamp,
		@BatchID,
		@Description,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	ItemHistory
	SET	ItemID = @ItemID,
		LocationID = @LocationID,
		TStamp = @TStamp,
		BatchID = @BatchID,
		[Description] = @Description,
		isSync = @isSync 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	ItemHistory
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_ItemHistory_DML
else
	commit transaction sp_ItemHistory_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_ItemHistory_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_ItemHistory_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			ItemID,
			LocationID,
			TStamp,
			BatchID,
			[Description],
			isSync
	FROM	ItemHistory
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			ItemID,
			LocationID,
			TStamp,
			BatchID,
			[Description],
			isSync
	FROM	ItemHistory
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Items_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Items_DML]
(
	@ID varchar (15) = '',
	@OrderID varchar (10) = '',
	@OrderTID varchar (15) = '',
	@TagID varchar (24) = '',
	@Status varchar (50) = '',
	@TaggedOn datetime = NULL,
	@LastSeen int = 0,
	@LastSeenTime datetime = NULL,
	@LineID int = 0,
	@Comments varchar (100) = '',
	@ItemImage image = NULL,
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Items_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Items
	(
		ID,
		OrderID,
		OrderTID,
		TagID,
		[Status],
		TaggedOn,
		LastSeen,
		LastSeenTime,
		LineID,
		Comments,
		ItemImage,
		isSync
	)
	VALUES
	(
		@ID,
		@OrderID,
		@OrderTID,
		@TagID,
		@Status,
		@TaggedOn,
		@LastSeen,
		@LastSeenTime,
		@LineID,
		@Comments,
		@ItemImage,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Items
	SET	OrderID = @OrderID,
		OrderTID = @OrderTID,
		TagID = @TagID,
		[Status] = @Status,
		TaggedOn = @TaggedOn,
		LastSeen = @LastSeen,
		LastSeenTime = @LastSeenTime,
		LineID = @LineID,
		Comments = @Comments,
		ItemImage = @ItemImage,
		isSync = @isSync 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Items
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_Items_DML
else
	commit transaction sp_Items_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Items_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Items_GetAll]
(
	@ID varchar (15) = Null
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID IS NOT NULL)
BEGIN
	SELECT	ID,
			OrderID,
			OrderTID,
			TagID,
			[Status],
			TaggedOn,
			LastSeen,
			LastSeenTime,
			LineID,
			Comments,
			ItemImage,
			isSync
	FROM	Items
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			OrderID,
			OrderTID,
			TagID,
			[Status],
			TaggedOn,
			LastSeen,
			LastSeenTime,
			LineID,
			Comments,
			ItemImage,
			isSync
	FROM	Items
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Locations_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Locations_DML]
(
	@ID int = 0,
	@LocationCode varchar (50) = '',
	@LocationName varchar (100) = '',
	@LocationType varchar (50) = '',
	@isActive bit = 0,
	@CompanyID int = 0,
	@LastOrderID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Locations_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Locations
	(
		LocationCode,
		LocationName,
		LocationType,
		isActive,
		CompanyID,
		LastOrderID
	)
	VALUES
	(
		@LocationCode,
		@LocationName,
		@LocationType,
		@isActive,
		@CompanyID,
		@LastOrderID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Locations
	SET	LocationCode = @LocationCode,
		LocationName = @LocationName,
		LocationType = @LocationType,
		isActive = @isActive,
		CompanyID = @CompanyID,
		LastOrderID = @LastOrderID 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Locations
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_Locations_DML
else
	commit transaction sp_Locations_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Locations_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Locations_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			LocationCode,
			LocationName,
			LocationType,
			isActive,
			CompanyID,
			LastOrderID
	FROM	Locations
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			LocationCode,
			LocationName,
			LocationType,
			isActive,
			CompanyID,
			LastOrderID
	FROM	Locations
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Login]
(
	@PhoneNumber  NVARCHAR(80) = '',
	@Password NVARCHAR(200) = '',
	@responsemessage INT OUTPUT   
)
AS


BEGIN

	DECLARE	@SuccessId int = 0

	
			SELECT	@SuccessId = COUNT(*)
			FROM	Customer
			WHERE	PhoneNumber = @PhoneNumber AND
					[Password] = @Password AND
					IsActive = 1


	IF(@SuccessId > 0)
	BEGIN
		
			SELECT	CustomerID,ID,CAST(ID  AS nvarchar)AS IDString,FullName
			FROM	Customer
			WHERE	PhoneNumber = @PhoneNumber AND
					[Password] = @Password AND
					IsActive = 1

		SELECT @responsemessage = 1;
	END
	ELSE
	BEGIN
		SELECT	''
		SELECT @responsemessage = 0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderDetails_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:09
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_OrderDetails_DML]
(
	@TID varchar (15) = '',
	@OrderID varchar (10) = '',
	@GarmentID int = 0,
	@ServiceID int = 0,
	@Qty int = 0,
	@Total float = 0,
	@Status varchar (50) = '',
	@DeliveredOn datetime = NULL,
	@LineID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_OrderDetails_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO OrderDetails
	(
		TID,
		OrderID,
		GarmentID,
		ServiceID,
		Qty,
		Total,
		[Status],
		DeliveredOn,
		LineID
	)
	VALUES
	(
		@TID,
		@OrderID,
		@GarmentID,
		@ServiceID,
		@Qty,
		@Total,
		@Status,
		@DeliveredOn,
		@LineID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	OrderDetails
	SET	OrderID = @OrderID,
		GarmentID = @GarmentID,
		ServiceID = @ServiceID,
		Qty = @Qty,
		Total = @Total,
		[Status] = @Status,
		DeliveredOn = @DeliveredOn,
		LineID = @LineID 
	WHERE TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	OrderDetails
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_OrderDetails_DML
else
	commit transaction sp_OrderDetails_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderDetails_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_OrderDetails_GetAll]
(
	@TID varchar (15) = NULL
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID IS NOT NULL)
BEGIN
	SELECT	TID,
			OrderID,
			GarmentID,
			ServiceID,
			Qty,
			Total,
			[Status],
			DeliveredOn,
			LineID
	FROM	OrderDetails
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			OrderID,
			GarmentID,
			ServiceID,
			Qty,
			Total,
			[Status],
			DeliveredOn,
			LineID
	FROM	OrderDetails
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Orders_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Orders_DML]
(
	@ID varchar (10) = '',
	@OrderDate datetime = NULL,
	@CustomerID bigint = 0,
	@DeliverBy datetime = NULL,
	@isCancelled bit = 0,
	@isPaid bit = 0,
	@CompanyID int = 0,
	@Status varchar (50) = '',
	@isHang bit = 0,
	@Comments varchar (100) = '',
	@LocationID int = 0,
	@PromoApplied int = 0,
	@Discount float = 0,
	@DoEmail datetime = NULL,
	@SubTotal float = 0,
	@VATAmount float = 0,
	@GrandTotal float = 0,
	@Balance float = 0,
	@isExpress bit = 0,
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Orders_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Orders
	(
		ID,
		OrderDate,
		CustomerID,
		DeliverBy,
		isCancelled,
		isPaid,
		CompanyID,
		[Status],
		isHang,
		Comments,
		LocationID,
		PromoApplied,
		Discount,
		DoEmail,
		SubTotal,
		VATAmount,
		GrandTotal,
		Balance,
		isExpress,
		isSync
	)
	VALUES
	(
		@ID,
		@OrderDate,
		@CustomerID,
		@DeliverBy,
		@isCancelled,
		@isPaid,
		@CompanyID,
		@Status,
		@isHang,
		@Comments,
		@LocationID,
		@PromoApplied,
		@Discount,
		@DoEmail,
		@SubTotal,
		@VATAmount,
		@GrandTotal,
		@Balance,
		@isExpress,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Orders
	SET	OrderDate = @OrderDate,
		CustomerID = @CustomerID,
		DeliverBy = @DeliverBy,
		isCancelled = @isCancelled,
		isPaid = @isPaid,
		CompanyID = @CompanyID,
		[Status] = @Status,
		isHang = @isHang,
		Comments = @Comments,
		LocationID = @LocationID,
		PromoApplied = @PromoApplied,
		Discount = @Discount,
		DoEmail = @DoEmail,
		SubTotal = @SubTotal,
		VATAmount = @VATAmount,
		GrandTotal = @GrandTotal,
		Balance = @Balance,
		isExpress = @isExpress,
		isSync = @isSync 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Orders
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_Orders_DML
else
	commit transaction sp_Orders_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Orders_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Orders_GetAll]
(
	@ID varchar (10) = NULL
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID IS NOT NULL)
BEGIN
	SELECT	ID,
			OrderDate,
			CustomerID,
			DeliverBy,
			isCancelled,
			isPaid,
			CompanyID,
			[Status],
			isHang,
			Comments,
			LocationID,
			PromoApplied,
			Discount,
			DoEmail,
			SubTotal,
			VATAmount,
			GrandTotal,
			Balance,
			isExpress,
			isSync
	FROM	Orders
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			OrderDate,
			CustomerID,
			DeliverBy,
			isCancelled,
			isPaid,
			CompanyID,
			[Status],
			isHang,
			Comments,
			LocationID,
			PromoApplied,
			Discount,
			DoEmail,
			SubTotal,
			VATAmount,
			GrandTotal,
			Balance,
			isExpress,
			isSync
	FROM	Orders
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Payments_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Payments_DML]
(
	@PayID varchar (50) = '',
	@OrderID varchar (10) = '',
	@PayDate datetime = NULL,
	@Amount float = 0,
	@RecievedBy int = 0,
	@PaymentType varchar (50) = '',
	@isCancelled bit = 0,
	@CancelledBy int = 0,
	@CancelledOn datetime = NULL,
	@isSync bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Payments_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Payments
	(
		PayID,
		OrderID,
		PayDate,
		Amount,
		RecievedBy,
		PaymentType,
		isCancelled,
		CancelledBy,
		CancelledOn,
		isSync
	)
	VALUES
	(
	    @PayID,
		@OrderID,
		@PayDate,
		@Amount,
		@RecievedBy,
		@PaymentType,
		@isCancelled,
		@CancelledBy,
		@CancelledOn,
		@isSync	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Payments
	SET	OrderID = @OrderID,
		PayDate = @PayDate,
		Amount = @Amount,
		RecievedBy = @RecievedBy,
		PaymentType = @PaymentType,
		isCancelled = @isCancelled,
		CancelledBy = @CancelledBy,
		CancelledOn = @CancelledOn,
		isSync = @isSync 
	WHERE PayID = @PayID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Payments
	WHERE	PayID = @PayID

	SELECT	@responsemessage = 3;
END

SELECT @PayID;

if @@error <> 0
	rollback transaction sp_Payments_DML
else
	commit transaction sp_Payments_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Payments_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Payments_GetAll]
(
	@PayID varchar (50) = NULL
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@PayID IS NOT NULL)
BEGIN
	SELECT	PayID,
			OrderID,
			PayDate,
			Amount,
			RecievedBy,
			PaymentType,
			isCancelled,
			CancelledBy,
			CancelledOn,
			isSync
	FROM	Payments
	WHERE	PayID = @PayID
END
ELSE
BEGIN
	SELECT	PayID,
			OrderID,
			PayDate,
			Amount,
			RecievedBy,
			PaymentType,
			isCancelled,
			CancelledBy,
			CancelledOn,
			isSync
	FROM	Payments
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Payterms_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Payterms_DML]
(
	@ID int = 0,
	@PaytermName varchar (50) = '',
	@PayAfter int = 0,
	@isActive bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Payterms_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Payterms
	(
		PaytermName,
		PayAfter,
		isActive
	)
	VALUES
	(
		@PaytermName,
		@PayAfter,
		@isActive	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Payterms
	SET	PaytermName = @PaytermName,
		PayAfter = @PayAfter,
		isActive = @isActive 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Payterms
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_Payterms_DML
else
	commit transaction sp_Payterms_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Payterms_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Payterms_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			PaytermName,
			PayAfter,
			isActive
	FROM	Payterms
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			PaytermName,
			PayAfter,
			isActive
	FROM	Payterms
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PriceList]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PriceList]
(
	@CustomerId bigint = 0
)
AS
BEGIN
SET NOCOUNT ON;
	SELECT	*
	FROM	vwCustomerPrice
	WHERE	CustomerId = @CustomerId
	order by serviceID

	select	*
	from	dbo.[Services]
	order by ID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PromotionLocation_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_PromotionLocation_DML]
(
	@TID int = 0,
	@PromotionID int  = 0,
	@LocationID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_PromotionLocation_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO PromotionLocation
	(
		PromotionID,
		LocationID
	)
	VALUES
	(
		@PromotionID,
		@LocationID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	PromotionLocation
	SET	PromotionID = @PromotionID,
		LocationID = @LocationID 
	WHERE TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	PromotionLocation
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_PromotionLocation_DML
else
	commit transaction sp_PromotionLocation_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_PromotionLocation_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_PromotionLocation_GetAll]
(
	@TID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID > 0)
BEGIN
	SELECT	TID,
			PromotionID,
			LocationID
	FROM	PromotionLocation
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			PromotionID,
			LocationID
	FROM	PromotionLocation
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Promotions_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Promotions_DML]
(
	@ID int = 0,
	@PromoCode varchar (50) = '',
	@PromoName varchar (50) = '',
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
	@PromoType varchar (50) = '',
	@ApplicableAfter int = 0,
	@DiscountPer float = 0,
	@CompanyID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Promotions_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO Promotions
	(
		PromoCode,
		PromoName,
		StartDate,
		EndDate,
		PromoType,
		ApplicableAfter,
		DiscountPer,
		CompanyID
	)
	VALUES
	(
		@PromoCode,
		@PromoName,
		@StartDate,
		@EndDate,
		@PromoType,
		@ApplicableAfter,
		@DiscountPer,
		@CompanyID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	Promotions
	SET	PromoCode = @PromoCode,
		PromoName = @PromoName,
		StartDate = @StartDate,
		EndDate = @EndDate,
		PromoType = @PromoType,
		ApplicableAfter = @ApplicableAfter,
		DiscountPer = @DiscountPer,
		CompanyID = @CompanyID 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	Promotions
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_Promotions_DML
else
	commit transaction sp_Promotions_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Promotions_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Promotions_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			PromoCode,
			PromoName,
			StartDate,
			EndDate,
			PromoType,
			ApplicableAfter,
			DiscountPer,
			CompanyID
	FROM	Promotions
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	p.ID,
			p.PromoCode,
			p.PromoName,
			p.StartDate,
			p.EndDate,
			p.PromoType,
			p.ApplicableAfter,
			p.DiscountPer,
			p.CompanyID,
			c.CompanyName,
			c.Logo
	FROM	Promotions AS p
			LEFT JOIN Company AS c ON p.CompanyID = c.ID
			
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Register]
(
	@ID bigint = 0,
	@CustomerID varchar (50) = '',
	@CompanyID int = 0,
	@CorpID int = 0,
	@FullName varchar (200) = '',
	@Address varchar (500) = '',
	@PhoneNumber varchar (20) = '',
	@MobileNumber varchar (20) = '',
	@Email varchar (100) = '',
	@Password Nvarchar (100) = '',
	@IsActive bit = 0,
	@CreatedOn datetime = NULL,
	@CreatedBy int = 0,
	@Latitude NVARCHAR(50) = '',
	@Longitude NVARCHAR(50) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Register

IF(@Mode = 1)
BEGIN
	INSERT INTO Customer
	(
		CustomerID,
		CompanyID,
		CorpID,
		FullName,
		[Address],
		PhoneNumber,
		MobileNumber,
		isActive,
		CreatedOn,
		CreatedBy,
		Email,
		[Password],
		Latitude,
		Longitude
	)
	VALUES
	(
		@CustomerID,
		@CompanyID,
		@CorpID,
		@FullName,
		@Address,
		@PhoneNumber,
		@MobileNumber,
		@IsActive,
		@CreatedOn,
		@CreatedBy,
		@Email,
		@Password,
		@Latitude,
		@Longitude
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN

	UPDATE	Customer
	SET		FullName = @FullName,
			PhoneNumber = @PhoneNumber,
			[Address] = @Address,
			MobileNumber = @MobileNumber,
			CompanyID = @CompanyID,
			CorpID =@CorpID,
			Email =@Email,
			IsActive=@IsActive,
			Latitude=@Latitude,
			Longitude=@Longitude

	WHERE	ID = @ID
	
	SELECT	@responsemessage = 2;
END
SELECT @id;

if @@error <> 0
	rollback transaction sp_Register
else
	commit transaction sp_Register

GO
/****** Object:  StoredProcedure [dbo].[sp_Register_MobileNumber]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Register_MobileNumber]
(
	@PhoneNumber NVARCHAR(20) = '',
	@CreatedOn datetime = NULL
	--@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Register_MobileNumber

DECLARE @isExitsPhoneNumber INT = 0

	SELECT	@isExitsPhoneNumber = COUNT(*)
	FROM	Customer
	WHERE	PhoneNumber = @PhoneNumber

	IF(@isExitsPhoneNumber > 0)
	BEGIN
		SELECT	ID,CAST(ID AS nvarchar) AS IDString,CustomerID,CustomerCode,FullName,[Address],Landmark,PhoneNumber,MobileNumber,Email,CompanyID,CreatedBy,CorpID
		FROM	Customer
		WHERE	PhoneNumber = @PhoneNumber
	END
	--ELSE
	--BEGIN
	--	INSERT INTO Customer(MobileNumber,CreatedOn)
	--	VALUES(@MobileNumber,@CreatedOn)
	--END

if @@error <> 0
	rollback transaction sp_Register_MobileNumber
else
	commit transaction sp_Register_MobileNumber
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportLog_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_ReportLog_DML]
(
	@ID int = 0,
	@ReportType varchar (50) = '',
	@ReportDate datetime = NULL,
	@ReportDoc varbinary (MAX) = NULL,
	@ReportBy int = 0,
	@ReportingTime datetime = NULL,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_ReportLog_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO ReportLog
	(
		ReportType,
		ReportDate,
		ReportDoc,
		ReportBy,
		ReportingTime
	)
	VALUES
	(
		@ReportType,
		@ReportDate,
		@ReportDoc,
		@ReportBy,
		@ReportingTime	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	ReportLog
	SET	ReportType = @ReportType,
		ReportDate = @ReportDate,
		ReportDoc = @ReportDoc,
		ReportBy = @ReportBy,
		ReportingTime = @ReportingTime 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	ReportLog
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_ReportLog_DML
else
	commit transaction sp_ReportLog_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportLog_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_ReportLog_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			ReportType,
			ReportDate,
			ReportDoc,
			ReportBy,
			ReportingTime
	FROM	ReportLog
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			ReportType,
			ReportDate,
			ReportDoc,
			ReportBy,
			ReportingTime
	FROM	ReportLog
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RFIDReaders_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_RFIDReaders_DML]
(
	@ID int = 0,
	@ReaderCode varchar (50) = '',
	@IPAddress varchar (50) = '',
	@AN1 float = 0,
	@AN2 float = 0,
	@AN3 float = 0,
	@AN4 float = 0,
	@ReaderType varchar (50) = '',
	@LocationID int = 0,
	@CompanyID int = 0,
	@isActive bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_RFIDReaders_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO RFIDReaders
	(
		ReaderCode,
		IPAddress,
		AN1,
		AN2,
		AN3,
		AN4,
		ReaderType,
		LocationID,
		CompanyID,
		isActive
	)
	VALUES
	(
		@ReaderCode,
		@IPAddress,
		@AN1,
		@AN2,
		@AN3,
		@AN4,
		@ReaderType,
		@LocationID,
		@CompanyID,
		@isActive	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	RFIDReaders
	SET	ReaderCode = @ReaderCode,
		IPAddress = @IPAddress,
		AN1 = @AN1,
		AN2 = @AN2,
		AN3 = @AN3,
		AN4 = @AN4,
		ReaderType = @ReaderType,
		LocationID = @LocationID,
		CompanyID = @CompanyID,
		isActive = @isActive 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	RFIDReaders
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_RFIDReaders_DML
else
	commit transaction sp_RFIDReaders_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_RFIDReaders_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_RFIDReaders_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			ReaderCode,
			IPAddress,
			AN1,
			AN2,
			AN3,
			AN4,
			ReaderType,
			LocationID,
			CompanyID,
			isActive
	FROM	RFIDReaders
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			ReaderCode,
			IPAddress,
			AN1,
			AN2,
			AN3,
			AN4,
			ReaderType,
			LocationID,
			CompanyID,
			isActive
	FROM	RFIDReaders
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Services_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Services_DML]
(
	@ID int = 0,
	@ServiceType nvarchar (100) = '',
	@isActive bit = 0,
	@CompanyID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_Services_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO [dbo].[Services]
	(
		ServiceType,
		isActive,
		CompanyID
	)
	VALUES
	(
		@ServiceType,
		@isActive,
		@CompanyID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	[dbo].[Services]
	SET	ServiceType = @ServiceType,
		isActive = @isActive,
		CompanyID = @CompanyID 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	[dbo].[Services]
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_Services_DML
else
	commit transaction sp_Services_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_Services_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Services_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			ServiceType,
			isActive,
			CompanyID
	FROM	Services
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			ServiceType,
			isActive,
			CompanyID
	FROM	Services
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_StatusMaster_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_StatusMaster_DML]
(
	@ID int = 0,
	@StatusDesc varchar (50) = '',
	@HoursMax int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_StatusMaster_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO StatusMaster
	(
		StatusDesc,
		HoursMax
	)
	VALUES
	(
		@StatusDesc,
		@HoursMax	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	StatusMaster
	SET	StatusDesc = @StatusDesc,
		HoursMax = @HoursMax 
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	StatusMaster
	WHERE	ID = @ID

	SELECT	@responsemessage = 3;
END

SELECT @ID;

if @@error <> 0
	rollback transaction sp_StatusMaster_DML
else
	commit transaction sp_StatusMaster_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_StatusMaster_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_StatusMaster_GetAll]
(
	@ID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@ID > 0)
BEGIN
	SELECT	ID,
			StatusDesc,
			HoursMax
	FROM	StatusMaster
	WHERE	ID = @ID
END
ELSE
BEGIN
	SELECT	ID,
			StatusDesc,
			HoursMax
	FROM	StatusMaster
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAccess_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblAccess_DML]
(
	@AccessID int = 0,
	@AccessDesc varchar (50) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_tblAccess_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO tblAccess
	(
		AccessDesc
	)
	VALUES
	(
		@AccessDesc	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	tblAccess
	SET		AccessDesc = @AccessDesc 
	WHERE   AccessID = @AccessID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	tblAccess
	WHERE	AccessID = @AccessID

	SELECT	@responsemessage = 3;
END

SELECT @AccessID;

if @@error <> 0
	rollback transaction sp_tblAccess_DML
else
	commit transaction sp_tblAccess_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAccess_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblAccess_GetAll]
(
	@AccessID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@AccessID > 0)
BEGIN
	SELECT	AccessID,
			AccessDesc
	FROM	tblAccess
	WHERE	AccessID = @AccessID
END
ELSE
BEGIN
	SELECT	AccessID,
			AccessDesc
	FROM	tblAccess
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAppPrefs_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblAppPrefs_DML]
(
	@AppSetting varchar (50) = '',
	@AppValue varchar (500) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_tblAppPrefs_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO tblAppPrefs
	(
		AppValue
	)
	VALUES
	(
		@AppValue	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	tblAppPrefs
	SET	  AppValue = @AppValue 
	WHERE AppSetting = @AppSetting

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	tblAppPrefs
	WHERE	AppSetting = @AppSetting

	SELECT	@responsemessage = 3;
END

SELECT @AppSetting;

if @@error <> 0
	rollback transaction sp_tblAppPrefs_DML
else
	commit transaction sp_tblAppPrefs_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAppPrefs_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblAppPrefs_GetAll]
(
	@AppSetting varchar (50) = NULL
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@AppSetting IS NOT NULL)
BEGIN
	SELECT	AppSetting,
			AppValue
	FROM	tblAppPrefs
	WHERE	AppSetting = @AppSetting
END
ELSE
BEGIN
	SELECT	AppSetting,
			AppValue
	FROM	tblAppPrefs
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRole_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblRole_DML]
(
	@RoleID int = 0,
	@RoleDesc varchar (50) = '',
	@isActive bit = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_tblRole_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO tblRole
	(
		RoleDesc,
		isActive
	)
	VALUES
	(
		@RoleDesc,
		@isActive	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	tblRole
	SET	RoleDesc = @RoleDesc,
		isActive = @isActive 
	WHERE RoleID = @RoleID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	tblRole
	WHERE	RoleID = @RoleID

	SELECT	@responsemessage = 3;
END

SELECT @RoleID;

if @@error <> 0
	rollback transaction sp_tblRole_DML
else
	commit transaction sp_tblRole_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRole_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblRole_GetAll]
(
	@RoleID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@RoleID > 0)
BEGIN
	SELECT	RoleID,
			RoleDesc,
			isActive
	FROM	tblRole
	WHERE	RoleID = @RoleID
END
ELSE
BEGIN
	SELECT	RoleID,
			RoleDesc,
			isActive
	FROM	tblRole
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRoleDetails_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblRoleDetails_DML]
(
	@TID int = 0,
	@RoleID int = 0,
	@AccessID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_tblRoleDetails_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO tblRoleDetails
	(
		RoleID,
		AccessID
	)
	VALUES
	(
		@RoleID,
		@AccessID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	tblRoleDetails
	SET	RoleID = @RoleID,
		AccessID = @AccessID 
	WHERE TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	tblRoleDetails
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_tblRoleDetails_DML
else
	commit transaction sp_tblRoleDetails_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRoleDetails_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblRoleDetails_GetAll]
(
	@TID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID > 0)
BEGIN
	SELECT	TID,
			RoleID,
			AccessID
	FROM	tblRoleDetails
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			RoleID,
			AccessID
	FROM	tblRoleDetails
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblUser_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblUser_DML]
(
	@UID int = 0,
	@UserID varchar (50) = '',
	@iPassword varchar (50) = '',
	@RoleID int = 0,
	@DisplayName varchar (50) = '',
	@RFID varchar (50) = '',
	@isActive bit = 0,
	@BS varchar (50) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_tblUser_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO tblUser
	(
		UserID,
		iPassword,
		RoleID,
		DisplayName,
		RFID,
		isActive,
		BS
	)
	VALUES
	(
		@UserID,
		@iPassword,
		@RoleID,
		@DisplayName,
		@RFID,
		@isActive,
		@BS	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	tblUser
	SET	UserID = @UserID,
		iPassword = @iPassword,
		RoleID = @RoleID,
		DisplayName = @DisplayName,
		RFID = @RFID,
		isActive = @isActive,
		BS = @BS 
	WHERE [UID] = @UID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	tblUser
	WHERE	[UID] = @UID

	SELECT	@responsemessage = 3;
END

SELECT @UID;

if @@error <> 0
	rollback transaction sp_tblUser_DML
else
	commit transaction sp_tblUser_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_tblUser_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE procedure [dbo].[sp_tblUser_GetAll]
(
	@UID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@UID > 0)
BEGIN
	SELECT	[UID],
			UserID,
			iPassword,
			RoleID,
			DisplayName,
			RFID,
			isActive,
			BS
	FROM	tblUser
	WHERE	[UID] = @UID
END
ELSE
BEGIN
	SELECT	[UID],
			UserID,
			iPassword,
			RoleID,
			DisplayName,
			RFID,
			isActive,
			BS
	FROM	tblUser
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomerProfile]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCustomerProfile]
(
	@ID bigint = 0,
	@FullName varchar (200) = '',
	@Address varchar (500) = '',
	@PhoneNumber varchar (20) = '',
	@MobileNumber varchar (20) = '',
	@CreatedOn datetime = NULL,
	@CreatedBy int = 0,
	@Email varchar (100) = '',
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_UpdateCustomerProfile
IF(@Mode = 2)
BEGIN
	UPDATE	Customer
	SET
		FullName = @FullName,
		[Address] = @Address,
		PhoneNumber = @PhoneNumber,
		MobileNumber = @MobileNumber,
		CreatedOn = @CreatedOn,
		CreatedBy = @CreatedBy,
		Email = @Email
	WHERE ID = @ID

	SELECT	@responsemessage = 2;
END
ELSE 
BEGIN
	SELECT	@responsemessage = 0;
END

SELECT @id;

if @@error <> 0
	rollback transaction sp_UpdateCustomerProfile
else
	commit transaction sp_UpdateCustomerProfile
GO
/****** Object:  StoredProcedure [dbo].[sp_UserCompany_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserCompany_DML]
(
	@TID int = 0,
	@UID int = 0,
	@CID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_UserCompany_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO UserCompany
	(
		[UID],
		CID
	)
	VALUES
	(
		@UID,
		@CID	
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	UserCompany
	SET	[UID] = @UID,
		CID = @CID 
	WHERE TID = @TID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	UserCompany
	WHERE	TID = @TID

	SELECT	@responsemessage = 3;
END

SELECT @TID;

if @@error <> 0
	rollback transaction sp_UserCompany_DML
else
	commit transaction sp_UserCompany_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_UserCompany_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:28
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE procedure [dbo].[sp_UserCompany_GetAll]
(
	@TID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@TID > 0)
BEGIN
	SELECT	TID,
			[UID],
			CID
	FROM	UserCompany
	WHERE	TID = @TID
END
ELSE
BEGIN
	SELECT	TID,
			[UID],
			CID
	FROM	UserCompany
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLocation_DML]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:38:10
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserLocation_DML]
(
	@UserID int = 0,
	@LocationID int = 0,
	@Mode INT = 0,
	@responsemessage INT OUTPUT 
)
AS

BEGIN TRANSACTION sp_UserLocation_DML

IF(@Mode = 1)
BEGIN
	INSERT INTO UserLocation
	(
		UserID
	)
	VALUES
	(
		@UserID
	)

	SELECT	@responsemessage = 1;
END
ELSE IF(@Mode = 2)
BEGIN
	UPDATE	UserLocation
	SET	 UserID = @UserID
	WHERE UserID = @UserID AND
		  LocationID = @LocationID

	SELECT	@responsemessage = 2;
END
ELSE IF(@Mode = 3)
BEGIN
	DELETE 
	FROM	UserLocation
	WHERE	UserID = @UserID AND
	LocationID = @LocationID

	SELECT	@responsemessage = 3;
END

SELECT @LocationID;

if @@error <> 0
	rollback transaction sp_UserLocation_DML
else
	commit transaction sp_UserLocation_DML
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLocation_GetAll]    Script Date: 10/24/2019 10:45:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		"System""
-- Create date: 03/09/2019 16:13:29
-- Description:	Insert, Update, Detete 
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserLocation_GetAll]
(
	@UserID int = 0,
	@LocationID int = 0
)
AS
BEGIN
	
SET NOCOUNT ON;
	
IF(@UserID > 0 AND @LocationID > 0)
BEGIN
	SELECT	UserID,
			LocationID
	FROM	UserLocation
	WHERE	UserID = @UserID AND
			LocationID = @LocationID
END
ELSE
BEGIN
	SELECT	UserID,
			LocationID
	FROM	UserLocation
END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "StatusMaster"
            Begin Extent = 
               Top = 0
               Left = 373
               Bottom = 113
               Right = 543
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 149
               Left = 450
               Bottom = 279
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 132
               Left = 244
               Bottom = 262
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "GarmentType"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 148
               Left = 711
               Bottom = 278
               Right = 881
            End
            Display' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAlarms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Flags = 280
            TopColumn = 16
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 185
               Left = 77
               Bottom = 315
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations_1"
            Begin Extent = 
               Top = 165
               Left = 911
               Bottom = 295
               Right = 1081
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAlarms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAlarms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[7] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Items"
            Begin Extent = 
               Top = 31
               Left = 378
               Bottom = 161
               Right = 548
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 14
               Left = 127
               Bottom = 144
               Right = 297
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 24
               Left = 581
               Bottom = 154
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 21
               Left = 832
               Bottom = 151
               Right = 1002
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GarmentType"
            Begin Extent = 
               Top = 213
               Left = 320
               Bottom = 343
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 203
               Left = 22
               Bottom = 333
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RFIDReaders"
            Begin Extent = 
               Top = 263
               Left = 568
               Bottom = 393
               Right = 738
            End
            Disp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'layFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations_1"
            Begin Extent = 
               Top = 188
               Left = 823
               Bottom = 318
               Right = 993
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 323
               Left = 875
               Bottom = 453
               Right = 1045
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 24
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderItemStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderItemStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 126
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "vwPayments"
            Begin Extent = 
               Top = 155
               Left = 437
               Bottom = 245
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderPayments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderPayments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderPayments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vwOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GarmentType"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 126
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 174
               Left = 592
               Bottom = 294
               Right = 752
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GarmentService"
            Begin Extent = 
               Top = 6
               Left = 830
               Bottom = 126
               Right = 990
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 156
               Left = 119
               Bottom = 276
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CorporateAccount"
            Begin Extent = 
               Top = 330
               Left = 317
               Bottom = 460
               Right = 487
            End
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vwOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOrderTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPayments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPayments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GarmentType"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 119
               Left = 497
               Bottom = 249
               Right = 683
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 39
               Left = 722
               Bottom = 169
               Right = 908
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 122
               Left = 254
               Bottom = 252
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTaggedItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTaggedItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTaggedItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "vwOrderTotal"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 96
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwOrderQty"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 96
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPayments"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 216
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwXOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwXOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwXOrder'
GO

