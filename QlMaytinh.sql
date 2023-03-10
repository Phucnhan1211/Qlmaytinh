USE [QlMaytinh]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gdich'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gdich'
GO
ALTER TABLE [dbo].[hoadon] DROP CONSTRAINT [FK_hoadon_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_may]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loai]') AND type in (N'U'))
DROP TABLE [dbo].[loai]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DangNhap]') AND type in (N'U'))
DROP TABLE [dbo].[DangNhap]
GO
/****** Object:  View [dbo].[view_gdich]    Script Date: 12/20/2021 1:40:41 PM ******/
DROP VIEW [dbo].[view_gdich]
GO
/****** Object:  Table [dbo].[may]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[may]') AND type in (N'U'))
DROP TABLE [dbo].[may]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang]') AND type in (N'U'))
DROP TABLE [dbo].[KhachHang]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon]') AND type in (N'U'))
DROP TABLE [dbo].[ChiTietHoaDon]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/20/2021 1:40:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hoadon]') AND type in (N'U'))
DROP TABLE [dbo].[hoadon]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaMay] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[sodt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[may]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[may](
	[mamay] [nvarchar](50) NOT NULL,
	[tenmay] [nvarchar](100) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[manhinh] [nvarchar](50) NULL,
	[ram] [nvarchar](50) NULL,
	[cpu] [nvarchar](50) NULL,
	[ocung] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_may] PRIMARY KEY CLUSTERED 
(
	[mamay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_gdich]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_gdich]
AS
SELECT h.MaHoaDon, h.makh, h.NgayMua, h.damua AS hddamua, c.damua AS cthddamua, c.MaChiTietHD, c.MaMay, c.SoLuongMua, m.gia, c.SoLuongMua * m.gia AS Thanhtien, k.hoten, k.diachi
FROM   dbo.hoadon AS h INNER JOIN
             dbo.ChiTietHoaDon AS c ON h.MaHoaDon = c.MaHoaDon INNER JOIN
             dbo.may AS m ON c.MaMay = m.mamay INNER JOIN
             dbo.KhachHang AS k ON h.makh = k.makh
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nchar](10) NOT NULL,
	[MatKhau] [nchar](10) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 12/20/2021 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (1, N'a2', 1, 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (2, N'a1', 3, 2, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (3, N'a2', 3, 3, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (4, N'a1', 1, 4, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (5, N'a1', 2, 5, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (6, N'a2', 1, 6, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (7, N'a3', 1, 7, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (8, N'a2', 1, 8, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (9, N'd1', 1, 9, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10, N'a1', 1, 10, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (11, N'a1', 1, 11, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (12, N'a2', 1, 11, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (13, N'd1', 1, 12, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (14, N'a3', 1, 12, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (15, N'a2', 2, 13, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (16, N'a3', 1, 13, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (17, N'a2', 1, 14, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (18, N'd1', 1, 15, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (19, N'a1', 1, 16, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20, N'a2', 1, 17, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaMay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (21, N'a1', 1, 18, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'abc       ', N'123       ', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'dencan    ', N'111       ', 1)
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 1, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 1, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 1, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 1, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (12, 1, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (13, 1, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (14, 8, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (15, 8, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (16, 1, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (17, 8, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (18, 8, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (1, N'Thai Phuc Nhan', N'Hue', N'123456789', N'nhan@gmail.com', N'nhan', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (2, N'Nguyen Anh', N'Hue', N'123456', N'anh@gmail.com', N'anh', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (8, N'Nhan', N'Hue', N'123', N'123@gmail.com', N'kh1', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (9, N'132', N'Hue', N'123', N'123@gmail.com', N'kh2', N'123')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Acer', N'Laptop ACER')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Asus', N'Laptop ASUS')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Dell', N'Laptop DELL')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Gygabyte', N'Laptop GYGABYTE')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Hp', N'Laptop HP')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Mac', N'MACBOOK')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Msi', N'Laptop MSI')
GO
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'a1', N'Laptop Asus Vivobook A515EA-L11970T', 20, 20000000, N'Asus', N'
15.6Inch, 1920x1080 Pixel, OLED, 60 Hz', N'8 GB, DDR4, 3200 MHz', N'
Intel Core i5-1135G7', N'
SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/a1.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'a2', N'Laptop Asus VivoBook X515EA-BR1409T', 30, 17000000, N'Asus', N'
15.6Inch, 1366x768 Pixel, TN, 60 Hz,LED', N'8 GB, DDR4, 2666 MHz', N'
Intel Core i5-1135G7', N'
SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/a2.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'a3', N'Laptop Acer Triton Gaming PT315-53', 50, 50000000, N'Acer', N'15.6Inch, 2560x1440 Pixel, IPS, 165 Hz', N'
16 GB, DDR4, 3200 MHz', N'
Intel Core i7-11800H', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/a3.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'a4', N'Laptop Acer Nitro Gaming AN515-57', 20, 30000000, N'Acer', N'
115.6Inch, 1920x1080 Pixel, IPS, 144 Hz', N'
8 GB, DDR4, 3200 MHz', N'
Intel Core i7-11800H', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/a4.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'd1', N'Laptop Dell Gaming G5 5500 i7 10750H', 5, 37000000, N'Dell', N'15.6Inch, 1920x1080 Pixel, WVA, 120 Hz', N'16 GB, DDR4, 2933 MHz', N'Intel Core i7-10750H', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/d1.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'd2', N'Laptop Dell Gaming G15 5511 i7 11800H', 10, 35000000, N'Dell', N'15.6Inch, 1920x1080 Pixel, WVA, 120 Hz', N'16 GB, DDR4, 3200 MHz', N'Intel Core i7-11800H', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/d2.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'm1', N'MacBook Pro 13" 2020 Touch Bar', 50, 46000000, N'Mac', N'13.3Inch, 2560x1600 Pixel, IPS LCD LED', N'16 GB, LPDDR4X, 3733 MHz', N'Intel Core i5-10th-gen', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/m1.jfif')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'm2', N'MacBookAir 13" 2020 M1 256GB', 20, 28900000, N'Mac', N'13.3Inch, 2560x1600 Pixel, IPS LCD LED', N'
8 GB, LPDDR4', N'Apple M1', N'SSD 256 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/m2.jfif')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'm4', N'MacBookPro 16" 2021 M1 Pro', 10, 65000000, N'Mac', N'
16.2Inch, 3456x2234 Pixel, IPS LCD LED Backlit', N'16 GB', N'
Apple M1 Pro', N'
SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/m4.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'ms1', N'Laptop MSI Gaming Stealth 15M A11UEK', 30, 41000000, N'Msi', N'115.6Inch, 1920x1080 Pixel, IPS, 144 Hz, LCD', N'16 GB, DDR4, 3200 MHz', N'Intel Core i7-11370H

', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/ms1.jpg')
INSERT [dbo].[may] ([mamay], [tenmay], [soluong], [gia], [maloai], [manhinh], [ram], [cpu], [ocung], [NgayNhap], [anh]) VALUES (N'ms2', N'Laptop MSI Gaming GF65 10UE 286VN', 5, 30000000, N'Msi', N'
15.6Inch, 1920x1080 Pixel, IPS, 144 Hz', N'
16 GB, DDR4, 3200 MHz', N'Intel Core i5-10500H', N'SSD 512 GB', CAST(N'2021-09-15T19:25:58.897' AS DateTime), N'image_may/ms2.jpg')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_may] FOREIGN KEY([MaMay])
REFERENCES [dbo].[may] ([mamay])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_may]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[29] 3) )"
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
         Top = -144
         Left = 0
      End
      Begin Tables = 
         Begin Table = "h"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "k"
            Begin Extent = 
               Top = 241
               Left = 100
               Bottom = 438
               Right = 322
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gdich'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gdich'
GO
