-- Database DBADIDAS
use DBADIDAS
-- Bảng AdminUser
CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT IDENTITY (1, 1) NOT NULL,
    [UserName]     NVARCHAR (50) NULL,
    [RoleUser]     NVARCHAR (50) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);
--Bang Category
CREATE TABLE [dbo].[Category] (
    [IDCate]   INT IDENTITY (1, 1) NOT NULL,
    [NameCate] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT  IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (50) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (50) NULL,
    [UserName] varchar(50),
    [Password] nvarchar(50),
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);
--Bang Products
CREATE TABLE [dbo].[Product] (
    [ProductID]     INT		   IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (50)  NULL,
    [DecriptionPro] NVARCHAR (50)  NULL,
    [CateID]        INT      NULL,
    [Price]         DECIMAL (18, 2) NULL,
    [ImagePro]      NVARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([CateID]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);

--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);
-- Insert dữ liệu
use DBADIDAS

------Users
Insert into AdminUser (UserName, RoleUser, PasswordUser)
	values ('HUY', 'HuyDay', '081106')
Insert into AdminUser (UserName, RoleUser, PasswordUser)
	values ('TRI', 'TRIFLOP', '366769')
------Customer
Insert into Customer (NameCus, PhoneCus, EmailCus, UserName, Password)
	values (N'Nguyễn Quốc Huy', '0902637150', 'huy@gmail.com', 'HuyNguyen', 'huy08112006')
Insert into Customer (NameCus, PhoneCus, EmailCus, UserName, Password)
	values (N'Minh Trí', '0913678345', 'tri@gmail.com', 'MinhTri', 'tri123456789')

------Category
Insert into Category (NameCate)
    Values(N'Giày Nam')
Insert into Category (NameCate)
    Values(N'Giày Nữ')
--------Products
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Buộc Dây CLIMACOOL', N'Sportswear', 2, 4200000, 'ps1.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Adizero EVO SL', N'Run', 2, 4000000, 'ps2.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Golf Đinh Liền Retrocross 25', N'Golf', 2, 3000000, 'ps3.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Samba OG', N'Originals', 2, 2700000, 'ps4.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Buộc Dây adidas Taekwondo', N'Originals', 2, 2400000, 'ps5.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày VL Court 2.0', N'Sportswear', 2, 2000000, 'ps6.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'GIÀY JAPAN', N'Originals', 1, 2900000, 'ps7.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày Adizero Aruku', N'Originals', 1, 2790000, 'ps8.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'SUPERSKATE X KADER', N'Originals', 1, 2500000, 'ps9.jpg')

--------OrderPro
Insert into OrderPro (DateOrder, IDCus, AddressDeliverry)
	values ('11/20/2025', 1, N'191 Bùi Điền,q8')
--------OrderDetail
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (1, 1, 5, 4200000)
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (2, 1, 10, 4000000)
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (3, 1, 12, 3000000)