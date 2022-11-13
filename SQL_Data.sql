
CREATE TABLE [dbo].[Staff]
(
	[IDStaff] NVARCHAR(10) NOT NULL,
	 NameStaff nvarchar(50) NULL ,
	 Gender bit NULL,
	 Birthday date NULL,
	 Address nvarchar(100) NULL,
	 PhoneNumber NVARCHAR(20) NULL,
	 IDPoisition NVARCHAR(10) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[IDStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Poisition]
(
	[IDPoisition] NVARCHAR(10) NOT NULL PRIMARY KEY,
	 NamePoisition nvarchar(50),
)

go
CREATE TABLE [dbo].[Customer]
(
	 [IDCustomer] NVARCHAR(10) NOT NULL PRIMARY KEY,
	 NameCustomer nvarchar(50) NULL,
	 Address nvarchar(100) NULL,
	 PhoneNumber NVARCHAR(20) NULL,
	 Email NVARCHAR(50) NULL,
)
go
CREATE TABLE [dbo].[ProductionCompany]
(
	[IDPC] NVARCHAR(10) NOT NULL PRIMARY KEY,
	NamePC nvarchar(80),
)
go
CREATE TABLE [dbo].[Product]
(
	[IDProduct] NVARCHAR(10) NOT NULL PRIMARY KEY,
	NameProduct nvarchar(80) NULL,
	IDPC NVARCHAR(10) NOT NULL,
	ImportPrice int NULL,
	SellingPrice int NULL,
	Amount int NULL,
)
go
CREATE TABLE [dbo].[ProductDetails]
(
	[IDProduct] NVARCHAR(10) NOT NULL PRIMARY KEY,
	Designs nvarchar(20) NULL,
	Screen nvarchar(40) NULL,
	Camera varchar(20) NULL,
	ROM varchar(20) NULL,
	OS varchar(30) NULL,
	CPU varchar(100) NULL,
	RAM varchar(10) NULL,
	Battery varchar(8) NULL,
)
go
CREATE TABLE [dbo].[SaleBill]
(
	[IDSaleBill] nvarchar(10) NOT NULL PRIMARY KEY,
	IDStaff nvarchar(10) NOT NULL,
	IDCustomer nvarchar(10) NOT NULL,
	DateSale date NULL,
	BillAmount int NULL,
)
go
CREATE TABLE [dbo].[SaleBillDetails]
(
	IDSaleBill NVARCHAR(10) NOT NULL,
	IDProduct NVARCHAR(10) NOT NULL,
	Amount int NULL,
	Price int NULL,
	Discount int NULL,
	
)
go
CREATE TABLE [dbo].[PurchaseOrder]
(
	IDPurchaseOrder NVARCHAR(10) NOT NULL ,
	IDCustomer NVARCHAR(10) NOT NULL,
	OrderDate date NULL,
	DeliveryDate date NULL,
	PRIMARY KEY (IDPurchaseOrder) 
)
go
CREATE TABLE [dbo].[PurchaseOrderDetails]
(
	IDPurchaseOrder NVARCHAR(10) NOT NULL,
	IDProduct NVARCHAR(10) NOT NULL,
	Amount int NULL,
	Price int NULL,
	
)
go
CREATE TABLE [dbo].[Supplier]
(
	[IDSupplier] NVARCHAR(10) NOT NULL PRIMARY KEY,
	NameSupplier nvarchar(50),
	Address nvarchar(MAX),
	Phonenumber varchar(20)
)

go
CREATE TABLE [dbo].[ImportBill]
(
	[IDImportBill] NVARCHAR(10) NOT NULL,
	IDStaff NVARCHAR(10) NOT NULL,
	IDSupplier NVARCHAR(10) NOT NULL,
	ImportDate date NULL,
	PRIMARY KEY(IDImportBill)
)
go
CREATE TABLE [dbo].[ImportBillDetails]
(
	IDImportBill NVARCHAR(10) NOT NULL,
	IDProduct NVARCHAR(10) NOT NULL,
	Amount int NULL,
	Price int NULL,
	Discount int NULL,
	
)

go
alter table Staff add FOREIGN KEY(IDPoisition) REFERENCES Poisition(IDPoisition)
go
alter table Product add foreign key(IDPC) references ProductionCompany(IDPC)
go
alter table ProductDetails add foreign key(IDProduct) references Product(IDProduct)
go
alter table ImportBill add foreign key(IDSupplier) references Supplier(IDSupplier)
go
alter table ImportBillDetails add foreign key(IDImportBill) references ImportBill(IDImportBill)
go
alter table ImportBillDetails add foreign key(IDProduct) references Product(IDProduct)
go
alter table PurchaseOrder add foreign key(IDCustomer) references Customer(IDCustomer)
go
alter table PurchaseOrderDetails add foreign key(IDPurchaseOrder) references PurchaseOrder(IDPurchaseOrder)
go
alter table PurchaseOrderDetails add foreign key(IDProduct) references Product(IDProduct)
go
alter table SaleBill add foreign key(IDStaff) references Staff(IDStaff)
go
alter table SaleBill add foreign key(IDCustomer) references Customer(IDCustomer)
go
alter table SaleBillDetails add foreign key(IDProduct) references Product(IDProduct)
go
alter table SaleBillDetails add foreign key(IDSaleBill) references SaleBill(IDSaleBill)
go
--INSERT Data
--Staff

INSERT INTO Staff VALUES ('NV0001', N'Đinh Ngọc Phi', '1', '1997-01-16', N'89 Đội Cấn - Ba Đình - Hà Nội', '0952462963', 'KTV');
INSERT INTO Staff VALUES ('NV0002', N'Hồ Thu Giang', '0', '1992-08-19', N'179 Hoàng Quốc Việt - Nghĩa Đô - Cầu Giấy - Hà Nội', '0856924236', 'TN');
INSERT INTO Staff VALUES ('NV0003', N'Hoàng Thị Thủy', '0', '1994-06-22', N'8 Phùng Chí Kiên - Nghĩa Đô - Cầu Giấy - Hà Nội', '0352644926', 'TVBN');
INSERT INTO Staff VALUES ('NV0004', N'Lê Công Toản', '1', '1992-10-21', N'52 Cầu Giấy - Dịch Vọng - Cầu Giấy- Hà Nội', '0785624162', 'PTK');
INSERT INTO Staff VALUES ('NV0005', N'Lê Thị Bích Hương', '0', '1999-10-07', N'15 Duy Tân - Dịch Vọng Hậu - Từ Liêm - Hà Nội', '0999856212', 'TVBN');
INSERT INTO Staff VALUES ('NV0006', N'Lê Thị Huyền', '0', '2002-01-25', N'10 Phạm Văn Bạch - Dịch Vọng - Cầu Giấy - Hà Nội', '0589315562', 'QL');
INSERT INTO Staff VALUES ('NV0007', N'Lương Tiếng Giang', '1', '1989-04-27', N'13 Tôn Thất Tùng - Kim Liên - Đống Đa - Hà Nội', '0151426699', 'KTV');
INSERT INTO Staff VALUES ('NV0008', N'Nghiêm Thị Minh Hòa', '0', '1991-05-11', N'54 Trương Định - Tương Mai - Hoàng Mai - Hà Nội', '0265624789', 'KT ');
INSERT INTO Staff VALUES ('NV0009', N'Ngô Thu Phương', '0', '1991-01-08', N'639 Giải Phóng - Giáp Bát - Thanh Xuân - Hà Nội,', '0663358879', 'TN');
INSERT INTO Staff VALUES ('NV0010', N'Nguyễn Khánh Vân', '0', '1991-12-20', N'192 Lê Trọng Tấn - Định Công - Thanh Xuân - Hà Nội', '0226599922', 'CSKH');
INSERT INTO Staff VALUES ('NV0011', N'Nguyễn Mạnh Ngọc', '1', '1991-12-20', N'127 Khương Trung - Thanh Xuân - Hà Nội', '0655622947', 'BV');
INSERT INTO Staff VALUES ('NV0012', N'Nguyễn Thị Thanh Vân', '0', '2004-05-11', N'90 Khuất Duy Tiến - Thanh Xuân - Hà Nội', '0258533219', 'TN');
INSERT INTO Staff VALUES ('NV0013', N'Nguyễn Văn Tuấn', '1', '2001-12-16', N'94 Tố Hữu - Trung Văn - Từ Liêm - Hà Nội', '0266998513', 'BV');
INSERT INTO Staff VALUES ('NV0014', N'Phạm Thị Thu Vân', '0', '2002-10-27', N'811 Lê Quang Đạo - Mễ Trì - Từ Liêm - Hà Nội', '0562202563', 'CSKH');
INSERT INTO Staff VALUES ('NV0015', N'Phạm Vũ Chương', '1', '1997-08-01', N'518 Phúc Diễn - Xuân Phương - Từ Liêm - Hà Nội', '0689326153', 'TVBN');
INSERT INTO Staff VALUES ('NV0016', N'Trần Quang Khải', '1', '2004-05-11', N'79 - Xuân La - Tây Hồ - Hà Nội', '0322154893', 'QL');
INSERT INTO Staff VALUES ('NV0017', N'Trần Thị Nguyệt Anh', '0', '1991-09-02', N'85 Ngọc Thụy - Long Biên - Hà Nội,', '0321549223', 'TN');
INSERT INTO Staff VALUES ('NV0118', N'Trần Viết Anh', '1', '2001-02-20', N'34 Hoàng Minh Thảo - Xuân La - Tây Hồ - Hà Nội', '0922441023', 'KTV');
INSERT INTO Staff VALUES ('NV0119', N'Trương Ngọc Phong', '1', '1993-11-23', N'79 Lý Nam Đế - Cửa Đông - Hoàn Kiếm - Hà Nội', '0785642636', 'TVBN');
INSERT INTO Staff VALUES ('NV0200', N'Vũ Đức Lộc', '1', '2004-10-09', N'22 Nguyễn Tư Giản - Phúc Tân - Hoàn Kiếm - Hà Nội', '0955322179', 'PTK');


--Poisition

INSERT INTO [Poisition] VALUES ('TN', N'Thu Ngân');
INSERT INTO [Poisition] VALUES ('TVBN', N'Tư Vấn Bán Hàng');
INSERT INTO [Poisition] VALUES ('QL', N'Quản Lý');
INSERT INTO [Poisition] VALUES ('KTV', N'Kỹ Thuật Viên');
INSERT INTO [Poisition] VALUES ('CSKH', N'Chăm Sóc Khách Hàng');
INSERT INTO [Poisition] VALUES ('KT ', N'Kế Toán');
INSERT INTO [Poisition] VALUES ('PTK', N'Phụ Trách Kho');
INSERT INTO [Poisition] VALUES ('BV', N'Bảo Vệ');


--SaleBill

INSERT INTO SaleBill VALUES ('HDB0001', 'NV0002', 'KH0001', '2022-01-23', 73800000);
INSERT INTO SaleBill VALUES ('HDB0002', 'NV0002', 'KH0003', '2022-08-12', '90897000');
INSERT INTO SaleBill VALUES ('HDB0003', 'NV0002', 'KH0004', '2022-06-22', '4450000');
INSERT INTO SaleBill VALUES ('HDB0004', 'NV0002', 'KH0005', '2022-03-21', '90109000');
INSERT INTO SaleBill VALUES ('HDB0005', 'NV0002', 'KH0006', '2022-10-07', '95027000');
INSERT INTO SaleBill VALUES ('HDB0006', 'NV0002', 'KH0002', '2022-08-25', '55400000');
INSERT INTO SaleBill VALUES ('HDB0007', 'NV0002', 'KH0011', '2022-04-27', '24000000');
INSERT INTO SaleBill VALUES ('HDB0008', 'NV0002', 'KH0013', '2022-03-11', '68000000');
INSERT INTO SaleBill VALUES ('HDB0009', 'NV0002', 'KH0017', '2022-01-08', '35449000');
INSERT INTO SaleBill VALUES ('HDB0010', 'NV0009', 'KH0011', '2021-12-20', '40200000');
INSERT INTO SaleBill VALUES ('HDB0011', 'NV0009', 'KH0012', '2021-12-20', '2699000');
INSERT INTO SaleBill VALUES ('HDB0012', 'NV0009', 'KH0013', '2022-05-11', '37090000');
INSERT INTO SaleBill VALUES ('HDB0013', 'NV0009', 'KH0014', '2021-12-16', '0');
INSERT INTO SaleBill VALUES ('HDB0014', 'NV0009', 'KH0006', '2022-10-27', '0');
INSERT INTO SaleBill VALUES ('HDB0015', 'NV0009', 'KH0007', '2022-08-01', '0');
INSERT INTO SaleBill VALUES ('HDB0016', 'NV0009', 'KH0011', '2022-05-11', '0');
INSERT INTO SaleBill VALUES ('HDB0017', 'NV0009', 'KH0007', '1922-09-02', '0');
INSERT INTO SaleBill VALUES ('HDB0018', 'NV0009', 'KH0008', '2022-02-20', '0');
INSERT INTO SaleBill VALUES ('HDB0019', 'NV0017', 'KH0009', '2021-11-23', '0');
INSERT INTO SaleBill VALUES ('HDB0020', 'NV0017', 'KH0010', '2022-10-09', '0');


--SaleBillDetails

INSERT INTO [SaleBillDetails] VALUES ('HDB0001', 'SP0001', '2', '63998000', '198000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0001', 'SP0006', '1', '10399000', '399000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0002', 'SP0007', '2', '8798000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0002', 'SP0008', '1', '8699000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0002', 'SP0013', '3', '74370000', '970000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0003', 'SP0014', '1', '4450000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0004', 'SP0015', '2', '73180000', '1080000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0004', 'SP0020', '1', '18699000', '690000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0005', 'SP0001', '3', '95997000', '970000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0006', 'SP0002', '2', '55998000', '598000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0007', 'SP0003', '1', '25599000', '1599000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0008', 'SP0012', '1', '20590000', '590000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0008', 'SP0013', '2', '49580000', '1580000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0009', 'SP0014', '1', '4450000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0009', 'SP0016', '1', '8999000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0009', 'SP0011', '3', '23070000', '1070000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0010', 'SP0018', '2', '40480000', '280000');
INSERT INTO [SaleBillDetails] VALUES ('HDB0011', 'SP0019', '1', '2699000', '0');
INSERT INTO [SaleBillDetails] VALUES ('HDB0012', 'SP0020', '2', '37398000', '308000');


--ProductDetails
INSERT INTO [ProductDetails] VALUES ('SP0001', 'Modern', '6.7 inches', '48 MP', '128 GB', 'iOS 16', 'Apple A16 Bionic 6core', '6 GB', '4352 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0002', 'Modern', '6.7 inches', '12MP', '128 GB', 'iOS 15', 'Apple A15', '6 GB', '4325 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0003', 'Modern', '6.7 inches', '12 MP', '128 GB', 'iOS 14.1 ', 'Apple A14 Bionic (5 nm)', '6 GB', '3687 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0004', 'Modern', '6.1 inches', '12 MP', '128 GB', 'iOS 13 ', 'A13 Bionic', '4 GB', '3110 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0005', 'Modern', '6.1 inches', '12 MP', '64 GB', 'iOS 13 ', 'A13 Bionic', '4 GB', '3110 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0006', 'Modern', '4.7 inches', '12 MP', '64 GB', 'iOS 15', 'Chip A15 Bionic 6 core', '4 GB', '2018 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0007', 'Modern', '6.9 inches', '50 MP', '128 GB', 'Android 11, HIOS', 'Helio G88', '6 GB', '7000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0008', 'Modern', '6.4 inches', '64MP', '256 GB', 'Android 12', 'Qualcomm Snapdragon 680', '8 GB', '4500 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0009', 'Modern', '6.43 inches', '50 MP', '64 GB', 'Android 11, MIUI 12.5', 'Snapdragon 680 8 core', '4 GB', '5000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0010', 'Modern', '6.7 inches', '108 MP', '256 GB', 'Android 12, One UI 4.1', 'Snapdragon 778G 5G 8 core', '8 GB', '5000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0011', 'Modern', '6.6 inches', '64 MP', '128 GB', 'Android 12, MIUI 13', 'MediaTek Dimensity 8100', '8 GB', '5080 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0012', 'Modern', '6.7 inches', '12 MP', '128 GB', 'Android 12, One UI 4.1.1', 'Snapdragon 8+ Gen 1', '8 GB', '3700 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0013', 'Modern', '6.8 inches', '108 MP', '128 GB', 'Android 12, One UI 4.1', 'Qualcomm Snapdragon 8 Gen 1', '8 GB', '5000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0014', 'Modern', '6.43 inches', '50 MP', '128 GB', 'Android 11, MIUI 12.5', 'Snapdragon 680 8 core', '4 GB', '5000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0015', 'Modern', '7.6 inches', '50 MP', '256 GB', 'Android 12, One UI 4.1.1', 'Snapdragon 8 Plus Gen 1', '12 GB', '4400 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0016', 'Modern', '6.67 inches', '108 MP', '256 GB', 'Android 11, MIUI 12.5', 'MediaTek Dimensity 920 5G (6 nm)', '8 GB', '4500 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0017', 'Modern', '6.44 inches', '64 MP', '128 GB', 'Android 12', 'MediaTek Helio G99', '8 GB', '4500 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0018', 'Modern', '6.78 inches', '50 MP', '256 GB', 'Android 12', 'Qualcomm  Snapdragon 8+ 1', '12 GB', '6000 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0019', 'Modern', '6.7 inches', '15 MP', '32 GB', 'Android 12', 'Unisoc 9863A1', '3 GB', '5050 mAh');
INSERT INTO [ProductDetails] VALUES ('SP0020', 'Modern', '6.7 inches', '50 MP', '256 GB', 'Android 12, ColorOS 12.1', 'MediaTek Dimensity 8100 Max 8 core', '12 GB', '4500 mAh');


--Product

INSERT INTO [Product] VALUES ('SP0001', 'iPhone', 'NSX001', 29000000, 31999000, 60);
INSERT INTO [Product] VALUES ('SP0002', 'iPhone 13 Pro Max 128GB', 'NSX001', 24999999, 27999000, 80);
INSERT INTO [Product] VALUES ('SP0003', 'iPhone 12 Pro Max 128GB', 'NSX001', 22000000, 25599000, 40);
INSERT INTO [Product] VALUES ('SP0004', 'iPhone 11 128GB', 'NSX001', 10000000, 13099000, 40);
INSERT INTO [Product] VALUES ('SP0005', 'iPhone 11 64GB', 'NSX001', 8590000, 11290000, 20);
INSERT INTO [Product] VALUES ('SP0006', 'iPhone SE 2022', 'NSX001', 7390000, 10399000, 40);
INSERT INTO [Product] VALUES ('SP0007', 'Tecno POVA 3', 'NSX005', 3000000, 4399000, 80);
INSERT INTO [Product] VALUES ('SP0008', 'OPPO Reno8', 'NSX003', 7900000, 8699000, 120);
INSERT INTO [Product] VALUES ('SP0009', 'Xiaomi Redmi Note 11', 'NSX004', 3000000, 4150000, 90);
INSERT INTO [Product] VALUES ('SP0010', 'Samsung Galaxy A73 (5G) 256GB', 'NSX002', 8900000, 10790000, 60);
INSERT INTO [Product] VALUES ('SP0011', 'POCO X4 GT', 'NSX004', 6500000, 7690000, 40);
INSERT INTO [Product] VALUES ('SP0012', 'Samsung Galaxy Z Flip4 128GB', 'NSX002', 18090000, 20590000, 80);
INSERT INTO [Product] VALUES ('SP0013', 'Samsung Galaxy S22 Ultra (8GB - 128GB)', 'NSX002', 21590000, 24790000, 50);
INSERT INTO [Product] VALUES ('SP0014', 'Xiaomi Redmi Note 11 128GB', 'NSX004', 3790000, 4450000, 60);
INSERT INTO [Product] VALUES ('SP0015', 'Samsung Galaxy Z Fold4', 'NSX002', 33090000, 36590000, 40);
INSERT INTO [Product] VALUES ('SP0016', 'Xiaomi Redmi Note 11 Pro Plus 5G', 'NSX004', 7900000, 8999000, 40);
INSERT INTO [Product] VALUES ('SP0017', 'Vivo V25e 8GB 128GB', 'NSX006', 5900000, 7699000, 60);
INSERT INTO [Product] VALUES ('SP0018', 'ASUS ROG Phone 6 12GB 256GB', 'NSX009', 18900000, 20240000, 40);
INSERT INTO [Product] VALUES ('SP0019', 'Nokia C31 3GB 32GB', 'NSX007', 1390000, 2699000, 30);
INSERT INTO [Product] VALUES ('SP0020', 'OPPO Reno8 Pro 5G 12GB 256GB', 'NSX003', 15900000, 18699000, 50);


--ProductionCompany

INSERT INTO [ProductionCompany] VALUES ('NSX001', 'Iphone');
INSERT INTO [ProductionCompany] VALUES ('NSX002', 'Samsung');
INSERT INTO [ProductionCompany] VALUES ('NSX003', 'Oppo');
INSERT INTO [ProductionCompany] VALUES ('NSX004', 'Xiaomi');
INSERT INTO [ProductionCompany] VALUES ('NSX005', 'Tecno');
INSERT INTO [ProductionCompany] VALUES ('NSX006', 'Vivo');
INSERT INTO [ProductionCompany] VALUES ('NSX007', 'Nokia');
INSERT INTO [ProductionCompany] VALUES ('NSX008', 'Realme');
INSERT INTO [ProductionCompany] VALUES ('NSX009', 'Asus');
INSERT INTO [ProductionCompany] VALUES ('NSX010', 'Oneplus');
INSERT INTO [ProductionCompany] VALUES ('NSX011', 'Nubia');


--Customer

INSERT INTO [Customer] VALUES ('KH0001', N'Nguyễn Hữu Long ', N'18 - Lê Văn Lương - Hà Nội ', '0904007477', 'huulong@gmail.com');
INSERT INTO [Customer] VALUES ('KH0002', N'Nguyễn Quỳnh Anh', N'33 Phương Liên - Đống Đa - Hà Nội ', '0904160368', 'quynhanh@gmail.com');
INSERT INTO [Customer] VALUES ('KH0003', N'Nguyễn Minh Trà ', N'A14 Nghĩa Tân - Cầu Giấy - Hà Nội ', '0976053681', 'minhtra@gmail.com');
INSERT INTO [Customer] VALUES ('KH0004', N'Nguyễn Thị Minh Quyên', N'42 Ngõ 19 - Lạc Trung - Hai Bà Trưng, Hà Nội ', '0912093978', 'minhquyen@gmail.com');
INSERT INTO [Customer] VALUES ('KH0005', N'Đoàn Thị Thanh Hằng', N'1 Khương Trung - Thanh Xuân - Hà Nội ', '0912074030', 'thanhhang@gmail.com');
INSERT INTO [Customer] VALUES ('KH0006', N'Vũ Thị Thu Trang ', N'75B Chùa Láng - Đống Đa - Hà Nội ', '0913235829', 'thutrang@gmail.com');
INSERT INTO [Customer] VALUES ('KH0007', N'Nguyễn Văn Hùng ', N'A4 - Đền Lừ 2 - Hoàng Mai - Hà Nội ', '0904804179', 'vanhung@gmail.com');
INSERT INTO [Customer] VALUES ('KH0008', N'Phan Thị Hồng Nhu', N'441 Đội Cấn -  Ba Đình - Hà Nội ', '0904242761', 'hongnhu@gmail.com');
INSERT INTO [Customer] VALUES ('KH0009', N'Nguyễn Thị Thanh Huyền', N'E5B Trung Tự - Đống Đa - Hà Nội ', '0989055120', 'thanhhuyen@gmail.com');
INSERT INTO [Customer] VALUES ('KH0010', N'Phạm Thị Hường ', N'61 Khương Trung - Thanh Xuân - Hà Nội ', '0986215818', 'huongthi@gmail.com');
INSERT INTO [Customer] VALUES ('KH0011', N'Phạm Thị Nguyệt Hằng', N'Tân Minh - Thường Tín - Hà Tây ', '0903418911', 'nguyethang@gmail.com');
INSERT INTO [Customer] VALUES ('KH0012', N'Nguyễn Hoài Anh', N'Làng quốc tế Thăng Long - Cầu Giấy - Hà Nội ', '0912495888', 'hoaia@gmail.com');
INSERT INTO [Customer] VALUES ('KH0013', N'Nghiêm Quang Minh', N'37 Lý Nam Đế - Hà Nội ', '0912060656', 'qminh@gmail.com');
INSERT INTO [Customer] VALUES ('KH0014', N'Phan Thế Cường ', N'CT4 Đô thị Mỹ Đình - Mễ Trì - Hà Nội ', '0983835518', 'thecuong@gmail.com');
INSERT INTO [Customer] VALUES ('KH0015', N'Nguyễn Thị Thúy Nga', N'22 Ngô Quyền - Hà Đông - Hà Tây ', '0936999777', 'thuynga@gmail.com');
INSERT INTO [Customer] VALUES ('KH0016', N'Nguyễn Xuân Phán', N'10 Đông Ngạc - Từ Liêm - Hà Nội ', '0982009638', 'phanxuan@gmail.com');
INSERT INTO [Customer] VALUES ('KH0017', N'Kim Mạnh Hà ', N'C3 Thanh Xuân Bắc - Hà Nội ', '0936348425', 'hamanh@gmail.com');
INSERT INTO [Customer] VALUES ('KH0018', N'Phạm Ngọc Phú ', N'135 Nguyễn Văn Cừ - Long Biên - Hà Nội ', '0982488288', 'ngocphu@gmail.com');
INSERT INTO [Customer] VALUES ('KH0019', N'Nguyễn Kim Tuấn ', N'3 Định Công - Hoàng Mai - Hà Nội ', '0986999866', 'kimtuan@gmail.com');
INSERT INTO [Customer] VALUES ('KH0020', N'Đặng Thanh Tuấn', N'2 Đại Lan - Duyên Hà - Thanh Trì - Hà Nội ', '0913533861', 'thanhtuan@gmail.com');


--ImportBill

INSERT INTO ImportBill VALUES ('HDN0001', 'NV0004', 'NCC001', '2022-02-12');
INSERT INTO ImportBill VALUES ('HDN0002', 'NV0004', 'NCC001', '2022-02-13');
INSERT INTO ImportBill VALUES ('HDN0003', 'NV0004', 'NCC002', '2022-03-22');
INSERT INTO ImportBill VALUES ('HDN0004', 'NV0200', 'NCC004', '2022-01-11');
INSERT INTO ImportBill VALUES ('HDN0005', 'NV0200', 'NCC004', '2022-01-11');
INSERT INTO ImportBill VALUES ('HDN0006', 'NV0004', 'NCC004', '2022-05-17');
INSERT INTO ImportBill VALUES ('HDN0007', 'NV0004', 'NCC004', '2022-05-17');
INSERT INTO ImportBill VALUES ('HDN0008', 'NV0004', 'NCC005', '2022-05-17');
INSERT INTO ImportBill VALUES ('HDN0009', 'NV0004', 'NCC005', '2022-05-17');
INSERT INTO ImportBill VALUES ('HDN0010', 'NV0200', 'NCC005', '2022-05-20');
INSERT INTO ImportBill VALUES ('HDN0011', 'NV0200', 'NCC005', '2022-05-20');
INSERT INTO ImportBill VALUES ('HDN0012', 'NV0200', 'NCC005', '2022-05-20');
INSERT INTO ImportBill VALUES ('HDN0013', 'NV0004', 'NCC005', '2022-06-21');
INSERT INTO ImportBill VALUES ('HDN0014', 'NV0200', 'NCC005', '2022-03-12');
INSERT INTO ImportBill VALUES ('HDN0015', 'NV0200', 'NCC006', '2022-05-23');
INSERT INTO ImportBill VALUES ('HDN0016', 'NV0004', 'NCC006', '2022-05-23');
INSERT INTO ImportBill VALUES ('HDN0017', 'NV0004', 'NCC006', '2022-04-25');
INSERT INTO ImportBill VALUES ('HDN0018', 'NV0200', 'NCC006', '2022-01-26');
INSERT INTO ImportBill VALUES ('HDN0019', 'NV0200', 'NCC006', '2022-01-02');
INSERT INTO ImportBill VALUES ('HDN0020', 'NV0200', 'NCC006', '2021-12-28');


--ImportBillDetails
select * from ImportBillDetails

INSERT INTO [ImportBillDetails] VALUES ('HDN0001', 'SP0001', '80', 232000000, 116000000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0001', 'SP0002', '40', 999999960, 49999998);   
INSERT INTO [ImportBillDetails] VALUES ('HDN0002', 'SP0008', '20', 158000000, 7900000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0003', 'SP0009', '40', 120000000, 6000000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0004', 'SP0011', '40', 260000000, 13000000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0005', 'SP0015', '40', 1323600000, 66180000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0006', 'SP0012', '60', 1085400000, 54270000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0006', 'SP0013', '80', 1727200000, 86360000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0006', 'SP0015', '80', 2647200000, 13236000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0012', 'SP0008', '80', 632000000, 31600000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0012', 'SP0020', '40', 636000000, 31800000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0012', 'SP0007', '60', 180000000, 9000000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0013', 'SP0007', '40', 120000000, 6000000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0014', 'SP0008', '60', 474000000, 23700000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0014', 'SP0016', '40', 316000000, 15800000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0014', 'SP0020', '60', 954000000, 47700000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0014', 'SP0017', '80', 472000000, 23600000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0015', 'SP0018', '40', 756000000, 37800000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0016', 'SP0017', '80', 472000000, 23600000);
INSERT INTO [ImportBillDetails] VALUES ('HDN0017', 'SP0019', '80', 111200000, 5560000);



--Supplier

INSERT INTO [Supplier] VALUES ('NCC001', N'Hệ Thống Phân Phối Chính Hãng Xiaomi', N'261 Lê Lợi - Ngô Quyền - Hải Phòng', '0888888261');
INSERT INTO [Supplier] VALUES ('NCC002', N'Văn Phòng Đại Diện - Công Ty Nokia', N'235 Đồng Khởi - Bến Nghé - Quận 1 - Tp. Hồ Chí Minh', '02838236894');
INSERT INTO [Supplier] VALUES ('NCC003', N'Thế Giới Di Động - Công Ty TNHH Thế Giới Di Động', N'364 Cộng Hòa - Tân Bình - Tp. Hồ Chí Minh', '02835100100');
INSERT INTO [Supplier] VALUES ('NCC004', N'Công Ty TNHH Phân Phối Synnex FPT', N'17 Duy Tân - Dịch Vọng Hậu - Cầu Giấy - Hà Nội', '02473006666');
INSERT INTO [Supplier] VALUES ('NCC005', N'Tổng Công ty cổ phần Dịch vụ Tổng hợp Dầu khí', N'5 Lê Duẩn - Phú Thuận - Quận 1 - Thành phố Hồ Chí Minh', '02839117777');
INSERT INTO [Supplier] VALUES ('NCC006', N'Công ty CP Thế giới số', N'197 Nguyễn Thái Bình - Quận 1 - Thành phố Hồ Chí Minh', '02435376888');


--PurchaseOrder

INSERT INTO PurchaseOrder VALUES ('DDH0001', 'KH0016', '2022-02-15', '2022-02-19');
INSERT INTO PurchaseOrder VALUES ('DDH0002', 'KH0010', '2022-01-18', '2022-01-21');
INSERT INTO PurchaseOrder VALUES ('DDH0003', 'KH0011', '2022-03-22', '2022-03-22');
INSERT INTO PurchaseOrder VALUES ('DDH0004', 'KH0012', '2022-01-11', '2022-01-12');
INSERT INTO PurchaseOrder VALUES ('DDH0005', 'KH0014', '2022-01-11', '2022-01-15');
INSERT INTO PurchaseOrder VALUES ('DDH0006', 'KH0015', '2022-05-17', '2022-05-19');
INSERT INTO PurchaseOrder VALUES ('DDH0007', 'KH0016', '2022-05-07', '2022-05-11');
INSERT INTO PurchaseOrder VALUES ('DDH0008', 'KH0005', '2022-03-03', '2022-03-05');
INSERT INTO PurchaseOrder VALUES ('DDH0009', 'KH0014', '2022-05-17', '2022-05-21');
INSERT INTO PurchaseOrder VALUES ('DDH0010', 'KH0003', '2022-05-20', '2022-05-20');
INSERT INTO PurchaseOrder VALUES ('DDH0011', 'KH0004', '2022-05-01', '2022-05-06');
INSERT INTO PurchaseOrder VALUES ('DDH0012', 'KH0005', '2022-05-29', '2022-06-01');
INSERT INTO PurchaseOrder VALUES ('DDH0013', 'KH0010', '2022-06-21', '2022-06-22');
INSERT INTO PurchaseOrder VALUES ('DDH0014', 'KH0016', '2022-03-09', '2022-03-12');
INSERT INTO PurchaseOrder VALUES ('DDH0015', 'KH0010', '2022-08-23', '2022-08-27');
INSERT INTO PurchaseOrder VALUES ('DDH0016', 'KH0011', '2022-09-30', '2022-10-02');
INSERT INTO PurchaseOrder VALUES ('DDH0017', 'KH0010', '2022-05-25', '2022-06-02');
INSERT INTO PurchaseOrder VALUES ('DDH0018', 'KH0016', '2022-01-26', '2022-01-31');
INSERT INTO PurchaseOrder VALUES ('DDH0019', 'KH0005', '2022-01-02', '2022-01-02');
INSERT INTO PurchaseOrder VALUES ('DDH0020', 'KH0014', '2021-12-28', '2022-01-08');


--PurchaseOrderDetails

INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0001', 'SP0001', '3', '95997000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0001', 'SP0002', '3', '83997000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0001', 'SP0006', '2', '26198000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0002', 'SP0002', '1', '27999000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0003', 'SP0018', '3', '60720000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0004', 'SP0012', '3', '61770000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0005', 'SP0013', '4', '99160000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0006', 'SP0007', '4', '17596000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0006', 'SP0015', '1', '36590000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0006', 'SP0012', '4', '82360000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0006', 'SP0013', '1', '24790000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0007', 'SP0020', '4', '74796000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0008', 'SP0018', '2', '40480000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0008', 'SP0004', '2', '26198000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0009', 'SP0012', '2', '41180000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0018', 'SP0019', '4', '10796000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0019', 'SP0003', '4', '102396000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0019', 'SP0005', '3', '33870000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0020', 'SP0014', '4', '17800000');
INSERT INTO [PurchaseOrderDetails] VALUES ('DDH0020', 'SP0016', '3', '26997000');
