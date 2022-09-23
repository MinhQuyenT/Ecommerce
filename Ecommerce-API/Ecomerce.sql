USE [DBEcommerce]
GO
/****** Object:  Table [dbo].[About]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[MetaKeywork] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[MapUrl] [nvarchar](max) NULL,
	[OpeningHours] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressText] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NULL,
	[ProvinceCode] [nvarchar](5) NULL,
	[DistrictCode] [nvarchar](5) NULL,
	[WardCode] [nvarchar](5) NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminRole]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminRole](
	[RoleUnique] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[RoleType] [nvarchar](50) NOT NULL,
	[RoleNote] [nvarchar](250) NULL,
	[RoleSequence] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[Url] [nvarchar](50) NULL,
	[Routing] [nvarchar](150) NULL,
	[ParentId] [nvarchar](50) NULL,
	[IsTitle] [bit] NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[RoleUnique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserAccount] [varchar](20) NOT NULL,
	[Password] [varchar](20) NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [varchar](254) NULL,
	[ValidFrom] [date] NULL,
	[ValidTo] [date] NULL,
	[LastLogin] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[UserAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUserRole]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUserRole](
	[UserAccount] [nvarchar](50) NOT NULL,
	[RoleUnique] [nvarchar](50) NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_EmployeeRoleMapping] PRIMARY KEY CLUSTERED 
(
	[UserAccount] ASC,
	[RoleUnique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[ImageList] [nvarchar](max) NULL,
	[DestLink] [nvarchar](250) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[BlogCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogTag]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_BlogTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Logo] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Sequence] [int] NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_en] [nvarchar](250) NULL,
	[Name_vi] [nvarchar](250) NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Level] [nvarchar](50) NULL,
	[ProvinceCode] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faqs]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faqs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[PolicyId] [int] NOT NULL,
 CONSTRAINT [PK_Faqs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_en] [nvarchar](250) NOT NULL,
	[Name_vi] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[MenuTypeID] [int] NOT NULL,
	[MenuParentID] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/23/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [int] NULL,
	[Discount] [nvarchar](50) NULL,
	[ShippingMethod] [nvarchar](50) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](20) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](20) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [int] NULL,
	[CreateBy] [nvarchar](20) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](20) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Avartar] [nvarchar](250) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[ImageList] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[OldPrice] [float] NULL,
	[Promotion] [nvarchar](max) NULL,
	[IsHot] [bit] NULL,
	[IsSale] [bit] NULL,
	[IsNew] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NULL,
	[ProdcutCaterogyId] [int] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name_vi] [nvarchar](250) NULL,
	[Name_en] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Avartar] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Thumb] [nvarchar](250) NULL,
	[Url] [nvarchar](250) NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRecently]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRecently](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductRecently] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Rating] [float] NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Level] [nvarchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Expires] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[RevokedTime] [datetime2](7) NULL,
	[ReplacedByToken] [nvarchar](max) NULL,
	[ReasonRevoked] [nvarchar](max) NULL,
	[UserAccount] [varchar](20) NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Bust] [nvarchar](50) NULL,
	[Waist] [nvarchar](50) NULL,
	[Hip] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Social]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Social](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Icon] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcribe]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcribe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Subcribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Level] [nvarchar](50) NULL,
	[DistrictCode] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 9/23/2022 4:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config', N'MenuItem.Config.Text', N'Admin', NULL, 14, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.About', N'MenuItem.Config.Children.About', N'Admin', N'bx bx-info-circle', 20, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'about', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Banner', N'MenuItem.Config.Children.Banner', N'Admin', N'bx bx-photo-album', 18, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'banner', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Company', N'MenuItem.Config.Children.Company', N'Admin', N'bx bx-building-house', 19, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'company', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Contact', N'MenuItem.Config.Children.Contact', N'Admin', N'bx bx-chat', 21, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'contact', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu', N'MenuItem.Config.Children.Menu.Text', N'Admin', N'bx bx-menu', 15, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu.List', N'MenuItem.Config.Children.Menu.Children.List', N'Admin', NULL, 16, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config.Menu', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu.Type', N'MenuItem.Config.Children.Menu.Children.Type', N'Admin', NULL, 17, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config.Menu', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.OrderList', N'MenuItem.Order.Children.List', N'Admin', N'bx bx-book-open', 12, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'order/manager', N'Admin.OrderManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.OrderManager', N'MenuItem.Order.Text', N'Admin', NULL, 11, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Category', N'MenuItem.Product.Children.Category', N'Admin', N'bx bx-wallet', 5, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/category', N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.ProductManager', N'MenuItem.Product.Children.List', N'Admin', N'bx bx-anchor', 6, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/list', N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties', N'MenuItem.Product.Children.Properties.Text', N'Admin', N'bx bxs-color-fill', 7, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Color', N'MenuItem.Product.Children.Properties.Children.Color', N'Admin', N'bx bx-user', 8, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/color', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Material', N'MenuItem.Product.Children.Properties.Children.Material', N'Admin', N'bx bx-user', 10, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/material', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Size', N'MenuItem.Product.Children.Properties.Children.Size', N'Admin', N'bx bx-user', 9, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/size', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.ProductManager', N'MenuItem.Product.Text', N'Admin', N'', 4, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Report', N'MenuItem.Order.Children.Report', N'Admin', N'bx bx-line-chart', 13, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'order/report', N'Admin.OrderManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.User.AdminUser', N'MenuItem.User.Children.AdminUser', N'Admin', N'bx bx-user', 3, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'user/admin-user', N'Admin.UserManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.User.Customer', N'MenuItem.User.Children.Customer', N'Admin', N'bx bx-user-circle', 2, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'user/admin-customer', N'Admin.UserManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.UserManager', N'MenuItem.User.Text', N'Admin', N'', 1, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
GO
INSERT [dbo].[AdminUser] ([UserAccount], [Password], [UserName], [Email], [ValidFrom], [ValidTo], [LastLogin], [UpdateBy], [UpdateTime]) VALUES (N'admin', N'123', N'Administrator', N'administrator@ecommerce.com', CAST(N'2022-08-10' AS Date), CAST(N'9999-12-31' AS Date), CAST(N'2022-09-23T13:50:09.687' AS DateTime), NULL, NULL)
INSERT [dbo].[AdminUser] ([UserAccount], [Password], [UserName], [Email], [ValidFrom], [ValidTo], [LastLogin], [UpdateBy], [UpdateTime]) VALUES (N'philong.nguyen', N'123456', N'Nguyễn Phi Long', N'philong26792@gmail.com.vn', CAST(N'2022-08-10' AS Date), CAST(N'9999-12-31' AS Date), CAST(N'2022-09-23T13:52:00.213' AS DateTime), N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime))
GO
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.About', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Banner', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Company', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Contact', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Menu', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Menu.List', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Config.Menu.Type', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.OrderList', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.OrderManager', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.Category', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.ProductManager', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.Properties', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.Properties.Color', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.Properties.Material', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Product.Properties.Size', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.ProductManager', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.Report', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.User.AdminUser', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.User.Customer', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'admin', N'Admin.UserManager', N'admin', CAST(N'2022-08-12T13:51:36.263' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.About', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Banner', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Company', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Contact', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Menu', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Menu.List', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Config.Menu.Type', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.OrderList', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.OrderManager', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.Category', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.ProductManager', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.Properties', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.Properties.Color', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.Properties.Material', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Product.Properties.Size', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.ProductManager', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.Report', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.User.AdminUser', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.User.Customer', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'philong.nguyen', N'Admin.UserManager', N'admin', CAST(N'2022-08-12T13:45:00.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Name_en], [Name_vi], [Code], [Description]) VALUES (1, N'Black', N'Đen', N'#000000', N'Màu đen')
INSERT [dbo].[Color] ([Id], [Name_en], [Name_vi], [Code], [Description]) VALUES (3, N'White	', N'Trắng', N'#FFFFFF', N'Màu trắng')
INSERT [dbo].[Color] ([Id], [Name_en], [Name_vi], [Code], [Description]) VALUES (4, N'Red', N'Đỏ', N'#FF0000', N'Màu đỏ')
INSERT [dbo].[Color] ([Id], [Name_en], [Name_vi], [Code], [Description]) VALUES (5, N'Blue', N'Xanh', N'#0000FF', N'Màu xanh da trời')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Code], [Quantity], [TotalPrice], [Discount], [ShippingMethod], [PaymentMethod], [Status], [Content], [CustomerName], [Phone], [Email], [Address], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (1, N'SK2540', 3, 9830000, N'0', N'Express', N'COD', N'shipped', N'Giao hàng gấp', N'Nguyễn Văn A', N'0974968723', N'email@gmail.com', N'Số nhà 89, phố Tô Vĩnh Diễn, phường Khương Trung, quận Thanh Xuân, thành phố Hà Nội', N'staff', CAST(N'2022-08-10T09:54:40.847' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [TotalPrice], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (2, 1, 1, 2, 504000, N'staff', CAST(N'2022-08-10T09:54:40.847' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [TotalPrice], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (3, 1, 2, 1, 432000, N'staff', CAST(N'2022-08-10T09:54:40.847' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Code], [Name_vi], [Name_en], [Title], [Description], [Avartar], [Status], [Thumb], [Url], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (1, N'CF2798', N'Áo Khoác', N'Coat', N'Áo Khoác', N'Áo Khoác', N'Category/CF2798857a.png', NULL, N'Category/CF2798857a.png', NULL, N'Admin', CAST(N'2022-08-17T10:34:12.787' AS DateTime), NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Code], [Name_vi], [Name_en], [Title], [Description], [Avartar], [Status], [Thumb], [Url], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (2, N'KL0752', N'Áo', N'shirt', N'Áo', N'Áo', N'Category/KL0752a05d.jpeg', NULL, N'Category/KL0752a05d.jpeg', NULL, N'Admin', CAST(N'2022-08-17T10:39:32.913' AS DateTime), NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Code], [Name_vi], [Name_en], [Title], [Description], [Avartar], [Status], [Thumb], [Url], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (3, N'TD8370', N'Quần dài', N'trousers', N'Quần dài', N'Quần dài', N'Category/TD8370cdfc.jpeg', NULL, N'Category/TD8370cdfc.jpeg', NULL, N'Admin', CAST(N'2022-08-17T10:41:35.373' AS DateTime), NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Code], [Name_vi], [Name_en], [Title], [Description], [Avartar], [Status], [Thumb], [Url], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (4, N'NC7251', N'QUẦN SHORT', N'SHORT', N'QUẦN SHORT', N'QUẦN SHORT', N'Category/NC7251167a.jpeg', NULL, N'Category/NC7251167a.jpeg', NULL, N'Admin', CAST(N'2022-08-17T10:42:39.087' AS DateTime), NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Code], [Name_vi], [Name_en], [Title], [Description], [Avartar], [Status], [Thumb], [Url], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime]) VALUES (5, N'AE6010', N'Phụ kiện', N'Accessory', N'Phụ kiện', N'Phụ kiện', N'Category/AE6010ca1e.jpeg', NULL, N'Category/AE6010ca1e.jpeg', NULL, N'Admin', CAST(N'2022-08-17T10:44:10.600' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (99, N'1q31RQk8xEbmwbQF3ZKbeQvO/ssxrXJZS0GrG6BAU/f1odkKVdQq9hnSyRHfuPxP+sIU9epV+XaE4cfkCOKPsQ==', CAST(N'2022-09-24T13:50:12.5596790' AS DateTime2), CAST(N'2022-09-23T13:50:12.5597142' AS DateTime2), NULL, NULL, NULL, N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (100, N'MQf/i1hLt/CPI6yuo5Q1nmPyqDmOmUQUEWtzCRABaVY5VEs33X7uiD3sidaOl2ZkEU19i2kbAv/oVAEyuM0xOg==', CAST(N'2022-09-24T13:52:00.2749203' AS DateTime2), CAST(N'2022-09-23T13:52:00.2749223' AS DateTime2), NULL, NULL, NULL, N'philong.nguyen')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
