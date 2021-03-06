USE [master]
GO
/****** Object:  Database [VirtualWardobeV3]    Script Date: 7/29/2018 11:29:05 PM ******/
CREATE DATABASE [VirtualWardobeV3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VirtualWardobeV3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VirtualWardobeV3.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VirtualWardobeV3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VirtualWardobeV3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VirtualWardobeV3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VirtualWardobeV3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VirtualWardobeV3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET ARITHABORT OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VirtualWardobeV3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VirtualWardobeV3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VirtualWardobeV3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VirtualWardobeV3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VirtualWardobeV3] SET  MULTI_USER 
GO
ALTER DATABASE [VirtualWardobeV3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VirtualWardobeV3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VirtualWardobeV3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VirtualWardobeV3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VirtualWardobeV3] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VirtualWardobeV3]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Season] [nvarchar](50) NULL,
	[Occasion] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottoms]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottoms](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Season] [nvarchar](50) NULL,
	[Occasion] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Bottoms] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clothing]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clothing](
	[ClothingID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NULL,
	[BottomID] [int] NULL,
	[ShoeID] [int] NULL,
	[AccessoryID] [int] NULL,
 CONSTRAINT [PK_Clothing] PRIMARY KEY CLUSTERED 
(
	[ClothingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Total] [money] NULL,
	[TopID] [int] NULL,
	[BottomID] [int] NULL,
	[AccessoryID] [int] NULL,
	[ShoeID] [int] NULL,
	[ClothingID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Season] [nvarchar](50) NULL,
	[Occasion] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tops]    Script Date: 7/29/2018 11:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tops](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Season] [nvarchar](50) NULL,
	[Occasion] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Tops] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([AccessoryID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (1, N'Alexander McQueen Printed Silk-Chiffon Scarf', N'closetAccessory1.jpg', N'Scarf', N'Black / White', N'Fall', N'Casual', N'N/A', 295.0000)
INSERT [dbo].[Accessories] ([AccessoryID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (2, N'Chloe Gold Plated Cuff', N'closetAccessory2.jpg', N'Bracelet', N'Gold', N'Spring', N'Casual', N'N/A', 425.0000)
INSERT [dbo].[Accessories] ([AccessoryID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (3, N'Chloe Medium Leather & Suede Shoulder Bag', N'closetAccessory3.jpg', N'Shoulder Bag', N'Black / Gold', N'Winter', N'Casual', N'N/A', 1950.0000)
INSERT [dbo].[Accessories] ([AccessoryID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (4, N'Givenchy Medium Antigona Bag', N'closetAccessory4.jpg', N'Shoulder Bag', N'Black Leather', N'Winter', N'Work', N'N/A', 2240.0000)
INSERT [dbo].[Accessories] ([AccessoryID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (5, N'Balenciaga XS Printed Quilted Leather Shoulder Bag', N'closetAccessory5.jpg', N'Shoulder Bag', N'Black / Gold', N'Summer', N'Casual', N'N/A', 1690.0000)
SET IDENTITY_INSERT [dbo].[Accessories] OFF
SET IDENTITY_INSERT [dbo].[Bottoms] ON 

INSERT [dbo].[Bottoms] ([BottomID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (2, N'Alexander Wang Hike Denim Shorts', N'closetBottoms1.jpg', N'Shorts', N'Black Denim', N'Summer', N'Casual', N'28', 245.0000)
INSERT [dbo].[Bottoms] ([BottomID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (3, N'Isabel Marant Étoile Leather Mini Skirt', N'closetBottoms2.jpg', N'Skirt', N'Black', N'Fall', N'Party', N'28', 755.0000)
INSERT [dbo].[Bottoms] ([BottomID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (4, N'FRAME Ali High Rise Skinny Jeans', N'closetBottoms3.jpg', N'Denim', N'Black', N'Winter', N'Casual', N'28', 220.0000)
INSERT [dbo].[Bottoms] ([BottomID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (5, N'J Brand Maria Coated High Rise Skinny Pants', N'closetBottoms3.jpg', N'Pants', N'Black', N'Fall', N'Party', N'28', 250.0000)
INSERT [dbo].[Bottoms] ([BottomID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (6, N'Antonio Berardi Niko Silk Wool Wide-Leg Pants', N'closetBottoms5.jpg', N'Pants', N'Black', N'Fall', N'Work', N'28', 1165.0000)
SET IDENTITY_INSERT [dbo].[Bottoms] OFF
SET IDENTITY_INSERT [dbo].[Clothing] ON 

INSERT [dbo].[Clothing] ([ClothingID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (4, 2, 2, 1, 1)
INSERT [dbo].[Clothing] ([ClothingID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (5, 3, 3, 2, 2)
INSERT [dbo].[Clothing] ([ClothingID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (6, 4, 4, 3, 3)
INSERT [dbo].[Clothing] ([ClothingID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (7, 5, 5, 4, 4)
INSERT [dbo].[Clothing] ([ClothingID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (8, 6, 6, 5, 5)
SET IDENTITY_INSERT [dbo].[Clothing] OFF
SET IDENTITY_INSERT [dbo].[Shoes] ON 

INSERT [dbo].[Shoes] ([ShoeID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (1, N'Balmain Mirrored Leather-Trimmed Velvet Pumps', N'closetShoe1.jpg', N'Heel', N'Black / Silver', N'Summer', N'Party', N'6', 750.0000)
INSERT [dbo].[Shoes] ([ShoeID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (2, N'Acne Studios Leather Ankle Boots', N'closetShoe2.jpg', N'Boot', N'Black', N'Fall', N'Casual', N'6', 570.0000)
INSERT [dbo].[Shoes] ([ShoeID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (3, N'Givenchy Chain-Embellished Sandals', N'closetShoe3.jpg', N'Sandal', N'Black / Silver', N'Summer', N'Party', N'6', 490.0000)
INSERT [dbo].[Shoes] ([ShoeID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (4, N'Jimmy Choo Suede Slingback Pumps', N'closetShoe4.jpg', N'Slingback Heel', N'Black', N'Fall', N'Party', N'6', 695.0000)
INSERT [dbo].[Shoes] ([ShoeID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (5, N'Sam Edelman Sequined Point-Toe Flats', N'closetShoe5.jpg', N'Flats', N'Black', N'Summer', N'Party', N'6', 90.0000)
SET IDENTITY_INSERT [dbo].[Shoes] OFF
SET IDENTITY_INSERT [dbo].[Tops] ON 

INSERT [dbo].[Tops] ([TopID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (2, N'Cropped Twist-Front French Terry Hooded Top', N'closetTop1.jpg', N'Hoodie', N'Black', N'Fall', N'Casual', N'Small', 375.0000)
INSERT [dbo].[Tops] ([TopID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (3, N'Acne Studios Leather Biker Jacket', N'closetTop2.jpg', N'Jacket', N'Black', N'Fall / Winter', N'Casual', N'Small', 995.0000)
INSERT [dbo].[Tops] ([TopID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (4, N'Balmain Button-Embellished Sequined Cotton Top', N'closetTop3.jpg', N'Tank Top', N'Black / Gold', N'Summer', N'Casual', N'Small', 395.0000)
INSERT [dbo].[Tops] ([TopID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (5, N'Saint Laurent Cropped Sequined Wool Tuxedo Jacket', N'closetTop4.jpg', N'Blazer', N'Black', N'Fall', N'Party', N'Small', 2796.0000)
INSERT [dbo].[Tops] ([TopID], [Name], [Photo], [Type], [Color], [Season], [Occasion], [Size], [Price]) VALUES (6, N'Chloe Chiffon and lamé top', N'closetTop5.jpg', N'Top', N'Black / Gold', N'Summer', N'Party', N'Small', 798.0000)
SET IDENTITY_INSERT [dbo].[Tops] OFF
ALTER TABLE [dbo].[Clothing]  WITH CHECK ADD  CONSTRAINT [FK_Clothing_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([AccessoryID])
GO
ALTER TABLE [dbo].[Clothing] CHECK CONSTRAINT [FK_Clothing_Accessories]
GO
ALTER TABLE [dbo].[Clothing]  WITH CHECK ADD  CONSTRAINT [FK_Clothing_Bottoms] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottoms] ([BottomID])
GO
ALTER TABLE [dbo].[Clothing] CHECK CONSTRAINT [FK_Clothing_Bottoms]
GO
ALTER TABLE [dbo].[Clothing]  WITH CHECK ADD  CONSTRAINT [FK_Clothing_Shoes] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoes] ([ShoeID])
GO
ALTER TABLE [dbo].[Clothing] CHECK CONSTRAINT [FK_Clothing_Shoes]
GO
ALTER TABLE [dbo].[Clothing]  WITH CHECK ADD  CONSTRAINT [FK_Clothing_Tops] FOREIGN KEY([TopID])
REFERENCES [dbo].[Tops] ([TopID])
GO
ALTER TABLE [dbo].[Clothing] CHECK CONSTRAINT [FK_Clothing_Tops]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([AccessoryID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accessories]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Bottoms] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottoms] ([BottomID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Bottoms]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shoes] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoes] ([ShoeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shoes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tops] FOREIGN KEY([TopID])
REFERENCES [dbo].[Tops] ([TopID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tops]
GO
USE [master]
GO
ALTER DATABASE [VirtualWardobeV3] SET  READ_WRITE 
GO
