USE [DBEcommerce]
GO
/****** Object:  Table [dbo].[About]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[AdminRole]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[AdminUser]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[AdminUserRole]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Banner]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[BlogTag]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Faqs]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Policy]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[ProductRecently]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[ProductReview]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Social]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Subcribe]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[Ward]    Script Date: 10/13/2022 4:39:40 PM ******/
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
/****** Object:  Table [dbo].[WishList]    Script Date: 10/13/2022 4:39:40 PM ******/
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
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config', N'MenuItem.Config.Text', N'Admin', N'bx bx-cog', 14, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.About', N'MenuItem.Config.Children.About', N'Admin', N'bx bx-info-circle', 20, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'about', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Banner', N'MenuItem.Config.Children.Banner', N'Admin', N'bx bx-photo-album', 18, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'banner', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Company', N'MenuItem.Config.Children.Company', N'Admin', N'bx bx-building-house', 19, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'company', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Contact', N'MenuItem.Config.Children.Contact', N'Admin', N'bx bx-chat', 21, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'contact', N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu', N'MenuItem.Config.Children.Menu.Text', N'Admin', N'bx bx-menu', 15, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu.List', N'MenuItem.Config.Children.Menu.Children.List', N'Admin', NULL, 16, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config.Menu', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Config.Menu.Type', N'MenuItem.Config.Children.Menu.Children.Type', N'Admin', NULL, 17, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.Config.Menu', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.OrderList', N'MenuItem.Order.Children.List', N'Admin', N'bx bx-book-open', 12, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'order/manager', N'Admin.OrderManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.OrderManager', N'MenuItem.Order.Text', N'Admin', N'bx bx bx-cart-alt', 11, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Category', N'MenuItem.Product.Children.Category', N'Admin', N'bx bx-wallet', 5, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/category', N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.ProductManager', N'MenuItem.Product.Children.List', N'Admin', N'bx bx-anchor', 6, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/list', N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties', N'MenuItem.Product.Children.Properties.Text', N'Admin', N'bx bxs-color-fill', 7, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, N'Admin.ProductManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Color', N'MenuItem.Product.Children.Properties.Children.Color', N'Admin', N'bx bx-user', 8, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/color', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Material', N'MenuItem.Product.Children.Properties.Children.Material', N'Admin', N'bx bx-user', 10, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/material', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Product.Properties.Size', N'MenuItem.Product.Children.Properties.Children.Size', N'Admin', N'bx bx-user', 9, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'product/property/size', N'Admin.Product.Properties', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.ProductManager', N'MenuItem.Product.Text', N'Admin', N'bx bx-briefcase-alt-2', 4, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.Report', N'MenuItem.Order.Children.Report', N'Admin', N'bx bx-line-chart', 13, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'order/report', N'Admin.OrderManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.User.AdminUser', N'MenuItem.User.Children.AdminUser', N'Admin', N'bx bx-user', 3, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'user/admin-user', N'Admin.UserManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.User.Customer', N'MenuItem.User.Children.Customer', N'Admin', N'bx bx-user-circle', 2, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', N'user/admin-customer', N'Admin.UserManager', 0)
INSERT [dbo].[AdminRole] ([RoleUnique], [RoleName], [RoleType], [RoleNote], [RoleSequence], [UpdateBy], [UpdateTime], [Url], [Routing], [ParentId], [IsTitle]) VALUES (N'Admin.UserManager', N'MenuItem.User.Text', N'Admin', N'bx bx-user', 1, N'admin', CAST(N'2022-08-11T11:27:02.053' AS DateTime), N'/', NULL, NULL, 1)
GO
INSERT [dbo].[AdminUser] ([UserAccount], [Password], [UserName], [Email], [ValidFrom], [ValidTo], [LastLogin], [UpdateBy], [UpdateTime]) VALUES (N'admin', N'123', N'Administrator', N'administrator@ecommerce.com', CAST(N'2022-08-10' AS Date), CAST(N'9999-12-31' AS Date), CAST(N'2022-09-30T10:06:44.297' AS DateTime), NULL, NULL)
INSERT [dbo].[AdminUser] ([UserAccount], [Password], [UserName], [Email], [ValidFrom], [ValidTo], [LastLogin], [UpdateBy], [UpdateTime]) VALUES (N'quyen.tran', N'123', N'Tran Minh Quyen', N'tmquyenit@gmail.com', CAST(N'2022-09-01' AS Date), CAST(N'2030-09-01' AS Date), CAST(N'2022-10-13T08:46:40.787' AS DateTime), N'admin', CAST(N'2022-09-24T09:42:20.513' AS DateTime))
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
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.About', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Banner', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Company', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Contact', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Menu', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Menu.List', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Config.Menu.Type', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.OrderList', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.OrderManager', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.Category', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.ProductManager', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.Properties', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.Properties.Color', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.Properties.Material', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Product.Properties.Size', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.ProductManager', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.Report', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.User.AdminUser', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.User.Customer', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
INSERT [dbo].[AdminUserRole] ([UserAccount], [RoleUnique], [CreateBy], [CreateTime]) VALUES (N'quyen.tran', N'Admin.UserManager', N'admin', CAST(N'2022-09-24T09:40:41.200' AS DateTime))
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

INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (100, N'MQf/i1hLt/CPI6yuo5Q1nmPyqDmOmUQUEWtzCRABaVY5VEs33X7uiD3sidaOl2ZkEU19i2kbAv/oVAEyuM0xOg==', CAST(N'2022-09-24T13:52:00.2749203' AS DateTime2), CAST(N'2022-09-23T13:52:00.2749223' AS DateTime2), NULL, NULL, NULL, N'philong.nguyen')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (105, N'BpwCZG9foPXhUAL3MV5Yw+Jsr3UCFvXquD6TXdNbVEW8yhyL22MxT+hPQ4wbv5KV9fsXAr6szuJMRrBi8U1FJQ==', CAST(N'2022-09-30T08:13:08.6194652' AS DateTime2), CAST(N'2022-09-29T08:13:08.6194975' AS DateTime2), NULL, NULL, NULL, N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (106, N'Rknert6DgqX1m5aQL5Zeg7fipW8xQElu8NRhiBGpdwElZi38g7jQS8c9O3uN+ARPb5JFQ73iDB87R7SMTzLwHA==', CAST(N'2022-10-01T09:36:41.1246570' AS DateTime2), CAST(N'2022-09-30T09:36:41.1247089' AS DateTime2), NULL, NULL, NULL, N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (107, N'YG5OTVYEvgxiVKKXG/ZXzhHvD6XbY5a2e/mdLoWJWx0o/s26Khen5jC0nwzYRzr4Y1Gm5TsdalvdFvPUW7O5oA==', CAST(N'2022-10-01T10:06:44.9101217' AS DateTime2), CAST(N'2022-09-30T10:06:44.9101242' AS DateTime2), CAST(N'2022-09-30T10:07:21.8711888' AS DateTime2), N'wiqTPFZimEnQMwuqvdRj6HPDmpMNfeLNQgjZEHIUF4CWa1Ii3wLQyXDHaNa3g+Jl1vD5O3gqvBdHlsiYBwUPAQ==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (108, N'wiqTPFZimEnQMwuqvdRj6HPDmpMNfeLNQgjZEHIUF4CWa1Ii3wLQyXDHaNa3g+Jl1vD5O3gqvBdHlsiYBwUPAQ==', CAST(N'2022-10-01T10:07:21.8691667' AS DateTime2), CAST(N'2022-09-30T10:07:21.8691711' AS DateTime2), CAST(N'2022-09-30T10:13:15.8312668' AS DateTime2), N'rNoxfLjKxLrBs+IpjAf4R1OSdSrSJLCR8Rc806c6QptQiSoAZSJGSiy7pfl24hETpRvuZzjgWI4kTUOkkoJzKA==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (109, N'rNoxfLjKxLrBs+IpjAf4R1OSdSrSJLCR8Rc806c6QptQiSoAZSJGSiy7pfl24hETpRvuZzjgWI4kTUOkkoJzKA==', CAST(N'2022-10-01T10:13:15.8312340' AS DateTime2), CAST(N'2022-09-30T10:13:15.8312378' AS DateTime2), CAST(N'2022-09-30T10:16:33.0151474' AS DateTime2), N'5bT5F8YDMTBpkaQuHhZf8pQmATisUiGADpIxQuPUZB35MmPgiFdykr1hLtiZZeG8mExiGDJ0QasZD4yPZFBlHQ==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (110, N'5bT5F8YDMTBpkaQuHhZf8pQmATisUiGADpIxQuPUZB35MmPgiFdykr1hLtiZZeG8mExiGDJ0QasZD4yPZFBlHQ==', CAST(N'2022-10-01T10:16:33.0151433' AS DateTime2), CAST(N'2022-09-30T10:16:33.0151445' AS DateTime2), CAST(N'2022-09-30T10:20:08.7738824' AS DateTime2), N'vY/qTUq1aFBLXOoqTUuplvoZlzeSBRTNh8Ogr8uIFL9yluIsAFmpP7StoSg+ied3PKHKYsqYRP0yvz6rXI0V9Q==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (111, N'vY/qTUq1aFBLXOoqTUuplvoZlzeSBRTNh8Ogr8uIFL9yluIsAFmpP7StoSg+ied3PKHKYsqYRP0yvz6rXI0V9Q==', CAST(N'2022-10-01T10:20:08.7737581' AS DateTime2), CAST(N'2022-09-30T10:20:08.7737594' AS DateTime2), CAST(N'2022-09-30T11:29:24.6756070' AS DateTime2), N'UZ43wAuFneECk/NePhNT1e4VUPe6lBGtWfg1lSEWKrIVG33/NvQA0j0CohjpgKfcqlH17EP1AYvmwfcvKkf3JA==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (112, N'UZ43wAuFneECk/NePhNT1e4VUPe6lBGtWfg1lSEWKrIVG33/NvQA0j0CohjpgKfcqlH17EP1AYvmwfcvKkf3JA==', CAST(N'2022-10-01T11:29:24.6746588' AS DateTime2), CAST(N'2022-09-30T11:29:24.6747313' AS DateTime2), CAST(N'2022-09-30T11:48:25.6039361' AS DateTime2), N'hykMsfT5juXI5FDZZCg96dtj98wgu0GrJFT+Hu1mOHLIwHuk+4K3g7YtM/Y8RX4JdIgSEwqtANdllp3IMYE1IA==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (113, N'hykMsfT5juXI5FDZZCg96dtj98wgu0GrJFT+Hu1mOHLIwHuk+4K3g7YtM/Y8RX4JdIgSEwqtANdllp3IMYE1IA==', CAST(N'2022-10-01T11:48:25.6039315' AS DateTime2), CAST(N'2022-09-30T11:48:25.6039333' AS DateTime2), CAST(N'2022-09-30T12:07:25.6487160' AS DateTime2), N'Zr67Tj/4n9euyuo1LZqeyz+Unxx8ZV0ZbmRMK7Dxs+02/uUcmJmM75insHfFGeJkSUK1RhVlWVd0ADbPXm2ekg==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (114, N'Zr67Tj/4n9euyuo1LZqeyz+Unxx8ZV0ZbmRMK7Dxs+02/uUcmJmM75insHfFGeJkSUK1RhVlWVd0ADbPXm2ekg==', CAST(N'2022-10-01T12:07:25.6487129' AS DateTime2), CAST(N'2022-09-30T12:07:25.6487146' AS DateTime2), CAST(N'2022-09-30T12:26:25.1187502' AS DateTime2), N'BEOmWJQU4Xnem99YS/u2R4XYDXdGKBBbpMOKmGQsAHtJS5D6/tdFjfHVA8la5v3poIW0QWLKu6vwFCrNBtTICg==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (115, N'BEOmWJQU4Xnem99YS/u2R4XYDXdGKBBbpMOKmGQsAHtJS5D6/tdFjfHVA8la5v3poIW0QWLKu6vwFCrNBtTICg==', CAST(N'2022-10-01T12:26:25.1187464' AS DateTime2), CAST(N'2022-09-30T12:26:25.1187486' AS DateTime2), CAST(N'2022-09-30T12:45:25.6435546' AS DateTime2), N'VKGa8J5DMbM2gNlEetrtwP9GcYhlr2O+emjZ6hvs2wNTWSjKQcVHQ8pvPI6nyF+TT/RfGhWq/UYhsqr7hMFmqg==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (116, N'VKGa8J5DMbM2gNlEetrtwP9GcYhlr2O+emjZ6hvs2wNTWSjKQcVHQ8pvPI6nyF+TT/RfGhWq/UYhsqr7hMFmqg==', CAST(N'2022-10-01T12:45:25.6435522' AS DateTime2), CAST(N'2022-09-30T12:45:25.6435530' AS DateTime2), CAST(N'2022-09-30T13:04:25.6940529' AS DateTime2), N'vubs+PESklCg0Pl7huuGgixY8CNp6NqIBjF8sLu6GKCPKVcmIkL35p78kmXBaNrZ6O8NwB+z8StfcxjEebHKHw==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (117, N'vubs+PESklCg0Pl7huuGgixY8CNp6NqIBjF8sLu6GKCPKVcmIkL35p78kmXBaNrZ6O8NwB+z8StfcxjEebHKHw==', CAST(N'2022-10-01T13:04:25.6940508' AS DateTime2), CAST(N'2022-09-30T13:04:25.6940510' AS DateTime2), CAST(N'2022-09-30T13:23:25.6961494' AS DateTime2), N'TCAeO4HHxK3UUrDMPJtPGM+XN6U8qbLhTJ0WegapBp5sqlVBHyN9fyCyKG/kT9wiOgXgzwOKPhJfs0XOlKd2Nw==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (118, N'TCAeO4HHxK3UUrDMPJtPGM+XN6U8qbLhTJ0WegapBp5sqlVBHyN9fyCyKG/kT9wiOgXgzwOKPhJfs0XOlKd2Nw==', CAST(N'2022-10-01T13:23:25.6961475' AS DateTime2), CAST(N'2022-09-30T13:23:25.6961476' AS DateTime2), CAST(N'2022-09-30T13:37:54.2318970' AS DateTime2), N'NWanRgvhldZO14c9FmjBh7hgplHAGCIKg18iqBI75v0UL41sZujm7JKxYcGdvaQn/I2Z4KB+B/wWRdOmlt5EQQ==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (119, N'NWanRgvhldZO14c9FmjBh7hgplHAGCIKg18iqBI75v0UL41sZujm7JKxYcGdvaQn/I2Z4KB+B/wWRdOmlt5EQQ==', CAST(N'2022-10-01T13:37:54.2318905' AS DateTime2), CAST(N'2022-09-30T13:37:54.2318909' AS DateTime2), CAST(N'2022-09-30T13:39:23.7783322' AS DateTime2), N'OANZ2Hieiv0+cvhB+mAj9/Io+jhyhyR2g3H7xOkR3Y3QrR9TvAOPF38Nco9SGNQoYuogEKJZ3I7SpMw8QDYB+A==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (120, N'OANZ2Hieiv0+cvhB+mAj9/Io+jhyhyR2g3H7xOkR3Y3QrR9TvAOPF38Nco9SGNQoYuogEKJZ3I7SpMw8QDYB+A==', CAST(N'2022-10-01T13:39:23.7783132' AS DateTime2), CAST(N'2022-09-30T13:39:23.7783134' AS DateTime2), CAST(N'2022-09-30T13:58:23.7046269' AS DateTime2), N'b8semtuY1kGlNyIMxC+zN483DJHPDi8BclU1flJy8YbDhZnRJP/Acnh4IWQnVAdJb2YctYxaPHq9zs4NfJ7tLw==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (121, N'b8semtuY1kGlNyIMxC+zN483DJHPDi8BclU1flJy8YbDhZnRJP/Acnh4IWQnVAdJb2YctYxaPHq9zs4NfJ7tLw==', CAST(N'2022-10-01T13:58:23.7046258' AS DateTime2), CAST(N'2022-09-30T13:58:23.7046259' AS DateTime2), CAST(N'2022-09-30T14:17:23.7302976' AS DateTime2), N'JuSCdTPRj+P2RE0LfBV0bE7TjR4FomDbcjxXaLYG7AIMwRmf2HHYoQ2gaV7z8uLW4wl0h8jBCLbwjkituRka3Q==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (122, N'JuSCdTPRj+P2RE0LfBV0bE7TjR4FomDbcjxXaLYG7AIMwRmf2HHYoQ2gaV7z8uLW4wl0h8jBCLbwjkituRka3Q==', CAST(N'2022-10-01T14:17:23.7302960' AS DateTime2), CAST(N'2022-09-30T14:17:23.7302961' AS DateTime2), CAST(N'2022-09-30T15:07:34.4854119' AS DateTime2), N'ndzJki0jXFtoWnVNRvVJULKS62tCMOThma3OTQ7F13NDTzo0O3yklH42oLwBqAiwgJhV0fRbKvERwixHADUxxQ==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (123, N'ndzJki0jXFtoWnVNRvVJULKS62tCMOThma3OTQ7F13NDTzo0O3yklH42oLwBqAiwgJhV0fRbKvERwixHADUxxQ==', CAST(N'2022-10-01T15:07:34.4854100' AS DateTime2), CAST(N'2022-09-30T15:07:34.4854105' AS DateTime2), CAST(N'2022-09-30T15:26:36.8462784' AS DateTime2), N'7FrtJjweFBjsv3No0AnVY+fzKcYjNvzgqGRAKoXTJZGtqKAW6Zt7XdjqkM4y6k/pChdlVav9aEurwY8057ofQg==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (124, N'7FrtJjweFBjsv3No0AnVY+fzKcYjNvzgqGRAKoXTJZGtqKAW6Zt7XdjqkM4y6k/pChdlVav9aEurwY8057ofQg==', CAST(N'2022-10-01T15:26:36.8457577' AS DateTime2), CAST(N'2022-09-30T15:26:36.8457916' AS DateTime2), CAST(N'2022-09-30T15:45:37.1210991' AS DateTime2), N'IQP3g6BLx1xCk/oRfoqa2BIDKq/iPJa4vbJAbWQKpAGuWMx/LsvhPZ/RSQrFzpBr3O9eN/uCNtrQsfxY9eFm8w==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (125, N'IQP3g6BLx1xCk/oRfoqa2BIDKq/iPJa4vbJAbWQKpAGuWMx/LsvhPZ/RSQrFzpBr3O9eN/uCNtrQsfxY9eFm8w==', CAST(N'2022-10-01T15:45:37.1210953' AS DateTime2), CAST(N'2022-09-30T15:45:37.1210962' AS DateTime2), CAST(N'2022-09-30T16:04:37.7679794' AS DateTime2), N'XRs6Ol7R/zPbtugyHA/LnzXYRfUY1mqYY2ToN10MCzdd2DVHNQ7W8Tg4sxcUpAZeDa+WojtWxwO5BMaA1iEWYQ==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (126, N'XRs6Ol7R/zPbtugyHA/LnzXYRfUY1mqYY2ToN10MCzdd2DVHNQ7W8Tg4sxcUpAZeDa+WojtWxwO5BMaA1iEWYQ==', CAST(N'2022-10-01T16:04:37.7679778' AS DateTime2), CAST(N'2022-09-30T16:04:37.7679785' AS DateTime2), CAST(N'2022-09-30T16:23:37.8305633' AS DateTime2), N'XqkgVw0rJfdoZhO675YJjk+/6P8N2wrGpfLRXYUwUDhiUW/pesPrEw5YO3e6GkwoaWQwJ7GFJs5BEBxmvB8w9w==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (127, N'XqkgVw0rJfdoZhO675YJjk+/6P8N2wrGpfLRXYUwUDhiUW/pesPrEw5YO3e6GkwoaWQwJ7GFJs5BEBxmvB8w9w==', CAST(N'2022-10-01T16:23:37.8305603' AS DateTime2), CAST(N'2022-09-30T16:23:37.8305607' AS DateTime2), CAST(N'2022-09-30T16:42:37.8513515' AS DateTime2), N'o1C0PpArIjxhh2EHH3ykZALb7N21N5gUCbJkKimfe0dLZ/tXhcCTj5BLofCBhLD4r6I0n2pz42WVffoBIdqzCA==', N'Replaced by new token', N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (128, N'o1C0PpArIjxhh2EHH3ykZALb7N21N5gUCbJkKimfe0dLZ/tXhcCTj5BLofCBhLD4r6I0n2pz42WVffoBIdqzCA==', CAST(N'2022-10-01T16:42:37.8513496' AS DateTime2), CAST(N'2022-09-30T16:42:37.8513498' AS DateTime2), NULL, NULL, NULL, N'admin')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1181, N'9kN1sWoUnQZKHdqnQ9CvDlgIleVOC7n0uiVE2d+Ns8wJ/03L0dH+Kc6rWvgrkSD4kuuUiAAkdM7EEqfrn+LAmA==', CAST(N'2022-10-12T16:32:36.3474834' AS DateTime2), CAST(N'2022-10-11T16:32:36.3474835' AS DateTime2), CAST(N'2022-10-11T16:51:36.3464765' AS DateTime2), N'RgwrdwtQ/+OlXfXAasLwj7o+cagLhy+3jVB8gWWBYeigLelMrVVnKnjNZLu12fYYZgurr/F5qBwYFa4OJCb8xQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1182, N'RgwrdwtQ/+OlXfXAasLwj7o+cagLhy+3jVB8gWWBYeigLelMrVVnKnjNZLu12fYYZgurr/F5qBwYFa4OJCb8xQ==', CAST(N'2022-10-12T16:51:36.3464753' AS DateTime2), CAST(N'2022-10-11T16:51:36.3464753' AS DateTime2), CAST(N'2022-10-12T07:55:26.3660839' AS DateTime2), N'i8NjhcQb6nkwOpW8+FaOvUkLQ7AtRw7e3sWv/rfzEcRAP8X5Nvw5J8UlbVKPFUvgoapU1RtoE7ktGJ4SoGya8g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1183, N'i8NjhcQb6nkwOpW8+FaOvUkLQ7AtRw7e3sWv/rfzEcRAP8X5Nvw5J8UlbVKPFUvgoapU1RtoE7ktGJ4SoGya8g==', CAST(N'2022-10-13T07:55:26.3649313' AS DateTime2), CAST(N'2022-10-12T07:55:26.3650902' AS DateTime2), CAST(N'2022-10-12T08:14:26.2827466' AS DateTime2), N'nq2JcPgI/xYjw8+wc9YG/w0tLS1df4Du2cNuukWjOVkT5O4SxvApjcdUFrm3/DvXKsOC/hdjnytBR0DQBKrChA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1184, N'nq2JcPgI/xYjw8+wc9YG/w0tLS1df4Du2cNuukWjOVkT5O4SxvApjcdUFrm3/DvXKsOC/hdjnytBR0DQBKrChA==', CAST(N'2022-10-13T08:14:26.2827447' AS DateTime2), CAST(N'2022-10-12T08:14:26.2827452' AS DateTime2), CAST(N'2022-10-12T08:33:26.3594612' AS DateTime2), N'd9blGSPY4X8AH7lcjHy4fepI3PGZq/7BQXIuHELCD5qc3tADFOYDS+JjY0Z1W+D9r1okp4qYn8MErutvMa03cA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1185, N'd9blGSPY4X8AH7lcjHy4fepI3PGZq/7BQXIuHELCD5qc3tADFOYDS+JjY0Z1W+D9r1okp4qYn8MErutvMa03cA==', CAST(N'2022-10-13T08:33:26.3594593' AS DateTime2), CAST(N'2022-10-12T08:33:26.3594595' AS DateTime2), CAST(N'2022-10-12T08:52:26.3522813' AS DateTime2), N'QAT9VevRFY52XxzKdOw+K18OVb5yjhq3dEZQQ0ahLDfgOXu8vtS7S1VNfvjN4/9k5FZQOl1zlHxDwtYHkcL76Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1186, N'QAT9VevRFY52XxzKdOw+K18OVb5yjhq3dEZQQ0ahLDfgOXu8vtS7S1VNfvjN4/9k5FZQOl1zlHxDwtYHkcL76Q==', CAST(N'2022-10-13T08:52:26.3522792' AS DateTime2), CAST(N'2022-10-12T08:52:26.3522794' AS DateTime2), CAST(N'2022-10-12T09:11:26.3950341' AS DateTime2), N'dt6qaIMwHop1xHkbCc/ERG7XKzK7qt+NCikQCH+StviK4BHjX6/bQZGlqZL2K8TonZ6pasSZ/LJ6dyVFoqHMPQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1187, N'dt6qaIMwHop1xHkbCc/ERG7XKzK7qt+NCikQCH+StviK4BHjX6/bQZGlqZL2K8TonZ6pasSZ/LJ6dyVFoqHMPQ==', CAST(N'2022-10-13T09:11:26.3950314' AS DateTime2), CAST(N'2022-10-12T09:11:26.3950320' AS DateTime2), CAST(N'2022-10-12T09:30:26.4171125' AS DateTime2), N'zZuIR0ycAvxJy4awZS3KSaHglQUekGBr5+72xkABAa/Jzi603vi11drcZ1/KCQgdZI8wCizhoQpq0EzmComPUg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1188, N'zZuIR0ycAvxJy4awZS3KSaHglQUekGBr5+72xkABAa/Jzi603vi11drcZ1/KCQgdZI8wCizhoQpq0EzmComPUg==', CAST(N'2022-10-13T09:30:26.4171097' AS DateTime2), CAST(N'2022-10-12T09:30:26.4171101' AS DateTime2), CAST(N'2022-10-12T09:49:26.4359163' AS DateTime2), N'+3MkzjY7HY6PZfKbxXRpVgK/xE2ShN46Se6e47s4N2uEZRMTXjdjE7jBURsW+5HsGof9vJ96Wb869n1Yo2UDRQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1189, N'+3MkzjY7HY6PZfKbxXRpVgK/xE2ShN46Se6e47s4N2uEZRMTXjdjE7jBURsW+5HsGof9vJ96Wb869n1Yo2UDRQ==', CAST(N'2022-10-13T09:49:26.4359118' AS DateTime2), CAST(N'2022-10-12T09:49:26.4359131' AS DateTime2), CAST(N'2022-10-12T10:08:26.5648979' AS DateTime2), N'DTlF1Dgl4M8aqja2vq556yleWVFWvLfsvOZLrooOTfIG8gIaFhiZo0AWL2Hnzxh3383KOklP3yk3R6Mw/lY0BQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1190, N'DTlF1Dgl4M8aqja2vq556yleWVFWvLfsvOZLrooOTfIG8gIaFhiZo0AWL2Hnzxh3383KOklP3yk3R6Mw/lY0BQ==', CAST(N'2022-10-13T10:08:26.5648947' AS DateTime2), CAST(N'2022-10-12T10:08:26.5648951' AS DateTime2), CAST(N'2022-10-12T10:27:26.5482987' AS DateTime2), N'n21RATrD2gMSZ30xwAdU5SsCfifmqArqeBi/4b/GOTtjU56F/w9K+C8EnDdpqJ/QHhSDs4mt2XTVVmP+JWL1BA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1191, N'n21RATrD2gMSZ30xwAdU5SsCfifmqArqeBi/4b/GOTtjU56F/w9K+C8EnDdpqJ/QHhSDs4mt2XTVVmP+JWL1BA==', CAST(N'2022-10-13T10:27:26.5482927' AS DateTime2), CAST(N'2022-10-12T10:27:26.5482936' AS DateTime2), CAST(N'2022-10-12T10:46:26.5706745' AS DateTime2), N'Jub4fFjaDVUPJcv29NgdfioVVND6w8VJ/I68CzPV2CwP8Nhx9s8LO+s63i7aNMGQ4jJtVa2JG1CU4jitkiPD0g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1192, N'Jub4fFjaDVUPJcv29NgdfioVVND6w8VJ/I68CzPV2CwP8Nhx9s8LO+s63i7aNMGQ4jJtVa2JG1CU4jitkiPD0g==', CAST(N'2022-10-13T10:46:26.5706722' AS DateTime2), CAST(N'2022-10-12T10:46:26.5706725' AS DateTime2), CAST(N'2022-10-12T11:05:26.6013772' AS DateTime2), N'440ObzHD3GipAB0satAkTnrT3V2D3NVLxy4i0DkXwYa24UKwIg32PLO7niHd9b1CndNMdf23uQ/C0i3UllpGHg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1193, N'440ObzHD3GipAB0satAkTnrT3V2D3NVLxy4i0DkXwYa24UKwIg32PLO7niHd9b1CndNMdf23uQ/C0i3UllpGHg==', CAST(N'2022-10-13T11:05:26.6013750' AS DateTime2), CAST(N'2022-10-12T11:05:26.6013753' AS DateTime2), CAST(N'2022-10-12T11:24:26.6246986' AS DateTime2), N'JJMZezi3v2yIJEuKSpgcpJzEcGGBhLRs3tR6399Wv3sPOuMV4lCXBCOwjbk3UTtyTadJYWDb7wuArTAVn1IFFQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1194, N'JJMZezi3v2yIJEuKSpgcpJzEcGGBhLRs3tR6399Wv3sPOuMV4lCXBCOwjbk3UTtyTadJYWDb7wuArTAVn1IFFQ==', CAST(N'2022-10-13T11:24:26.6206586' AS DateTime2), CAST(N'2022-10-12T11:24:26.6206590' AS DateTime2), CAST(N'2022-10-12T11:43:26.6491885' AS DateTime2), N'xKFKkZAQPFgZ5MPPGp/6iuvS3fEHdq8G7n8YMtu4RZbGg80npmjZjVOXH0/wvGVjpvvkkiOVB5Q2c5LLqm04gA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1195, N'xKFKkZAQPFgZ5MPPGp/6iuvS3fEHdq8G7n8YMtu4RZbGg80npmjZjVOXH0/wvGVjpvvkkiOVB5Q2c5LLqm04gA==', CAST(N'2022-10-13T11:43:26.6491865' AS DateTime2), CAST(N'2022-10-12T11:43:26.6491869' AS DateTime2), CAST(N'2022-10-12T12:02:26.6944783' AS DateTime2), N'u+K6RjzDyhwHnj/RJDCH3ARqevMzPfLCrr2hrNFy3T0rzXV5e6uGhnw+JGl/0SSCq2dDCdOVRyxY+GqZt+7Orw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1196, N'u+K6RjzDyhwHnj/RJDCH3ARqevMzPfLCrr2hrNFy3T0rzXV5e6uGhnw+JGl/0SSCq2dDCdOVRyxY+GqZt+7Orw==', CAST(N'2022-10-13T12:02:26.6944759' AS DateTime2), CAST(N'2022-10-12T12:02:26.6944762' AS DateTime2), CAST(N'2022-10-12T12:21:26.7846265' AS DateTime2), N'g/oDsHf5LdZ9vSac8ox2pCep5a1XL7H0LgNKS1ngNeBBqukEPV0E3aaGTID1XRJmCLK1wWSgN0If8KxDo9rxqQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1197, N'g/oDsHf5LdZ9vSac8ox2pCep5a1XL7H0LgNKS1ngNeBBqukEPV0E3aaGTID1XRJmCLK1wWSgN0If8KxDo9rxqQ==', CAST(N'2022-10-13T12:21:26.7846250' AS DateTime2), CAST(N'2022-10-12T12:21:26.7846253' AS DateTime2), CAST(N'2022-10-12T12:40:26.6653442' AS DateTime2), N'UWy09B82pbbkeqwtI+UJFAAWW3763xiGns2eF7ktShAbha7o4wp81YJuw6gc2m5Lt1Bgq2KWhYbJYly3fcOqIw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1198, N'UWy09B82pbbkeqwtI+UJFAAWW3763xiGns2eF7ktShAbha7o4wp81YJuw6gc2m5Lt1Bgq2KWhYbJYly3fcOqIw==', CAST(N'2022-10-13T12:40:26.6653422' AS DateTime2), CAST(N'2022-10-12T12:40:26.6653430' AS DateTime2), CAST(N'2022-10-12T12:59:26.3932793' AS DateTime2), N'bAcYs7RMhHqdksltmuJqF54iGPtfgekNzwM1UiX00YuOvdLBFpqB0SqLEsSqeDZSqFhMyKDYB05IpZBf/Jpx3w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1199, N'bAcYs7RMhHqdksltmuJqF54iGPtfgekNzwM1UiX00YuOvdLBFpqB0SqLEsSqeDZSqFhMyKDYB05IpZBf/Jpx3w==', CAST(N'2022-10-13T12:59:26.3932782' AS DateTime2), CAST(N'2022-10-12T12:59:26.3932784' AS DateTime2), CAST(N'2022-10-12T13:18:26.3276117' AS DateTime2), N'sN0yrvGIy9EwIM8lIbnKQga8yY9mKvSN/hSB0ZJsx5jPq3yjd0I9wtbiKUm84uT5LB7vyxkTlPi1SJzdlaycCw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1200, N'sN0yrvGIy9EwIM8lIbnKQga8yY9mKvSN/hSB0ZJsx5jPq3yjd0I9wtbiKUm84uT5LB7vyxkTlPi1SJzdlaycCw==', CAST(N'2022-10-13T13:18:26.3276100' AS DateTime2), CAST(N'2022-10-12T13:18:26.3276103' AS DateTime2), CAST(N'2022-10-13T07:59:25.4221587' AS DateTime2), N'hsnw0yH9fyFeONaqkRYEBBOaRftUKZAzCFBgdB3WsB8SRLUQmfAOuD7hhCi8dHPD3mi25l67p5Wga4u7sKUIPA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1201, N'hsnw0yH9fyFeONaqkRYEBBOaRftUKZAzCFBgdB3WsB8SRLUQmfAOuD7hhCi8dHPD3mi25l67p5Wga4u7sKUIPA==', CAST(N'2022-10-14T07:59:25.4207891' AS DateTime2), CAST(N'2022-10-13T07:59:25.4208287' AS DateTime2), CAST(N'2022-10-13T08:00:29.4051337' AS DateTime2), N'tNLcYXkFD2HFG8p3Gvy50osf9Fqo0y8kNZpvm2xEPDtdyPsqan2s5SzxwHc3XMbeuvsJTCamfu7Ark1eusWRHw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1202, N'tNLcYXkFD2HFG8p3Gvy50osf9Fqo0y8kNZpvm2xEPDtdyPsqan2s5SzxwHc3XMbeuvsJTCamfu7Ark1eusWRHw==', CAST(N'2022-10-14T08:00:29.4051312' AS DateTime2), CAST(N'2022-10-13T08:00:29.4051316' AS DateTime2), CAST(N'2022-10-13T08:04:11.7747669' AS DateTime2), N'isM9m+UfkVGMZeHbPd+vwuhoYN++rscV/iJnX71JNAT7tX11XPQxPz8u28RvEksQkHX5qtkL7Q75ieXhxMpl0g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1203, N'isM9m+UfkVGMZeHbPd+vwuhoYN++rscV/iJnX71JNAT7tX11XPQxPz8u28RvEksQkHX5qtkL7Q75ieXhxMpl0g==', CAST(N'2022-10-14T08:04:11.7747643' AS DateTime2), CAST(N'2022-10-13T08:04:11.7747645' AS DateTime2), CAST(N'2022-10-13T08:05:21.8533794' AS DateTime2), N'KwDVpYbhncowWbgnpEMJ2ufBqIQIi375QAmmLrF7SsmoFqhDi+iyXDPrqgzmh5SNwTDaGJmEqRtXOnP2a1ONQg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1204, N'KwDVpYbhncowWbgnpEMJ2ufBqIQIi375QAmmLrF7SsmoFqhDi+iyXDPrqgzmh5SNwTDaGJmEqRtXOnP2a1ONQg==', CAST(N'2022-10-14T08:05:21.8533775' AS DateTime2), CAST(N'2022-10-13T08:05:21.8533778' AS DateTime2), CAST(N'2022-10-13T08:12:42.1230910' AS DateTime2), N'ef7+gDTEmkqQV8NdJeNIN4Ufsc83ssdjOc+C55iR7uP1P2MQztKKrMBIRoevD7ezFs8hiy2kng8ylvIuloVy7g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1205, N'ef7+gDTEmkqQV8NdJeNIN4Ufsc83ssdjOc+C55iR7uP1P2MQztKKrMBIRoevD7ezFs8hiy2kng8ylvIuloVy7g==', CAST(N'2022-10-14T08:12:42.1230889' AS DateTime2), CAST(N'2022-10-13T08:12:42.1230892' AS DateTime2), CAST(N'2022-10-13T08:12:55.2410891' AS DateTime2), N'eGMziVhZh8PshEX96nyu5ciFQ3js47tb63G8Bii3yvd3TAc9Z0NTybSDXSE9kCHALNI9UHn1qdGKwvQf1MBfOw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1206, N'eGMziVhZh8PshEX96nyu5ciFQ3js47tb63G8Bii3yvd3TAc9Z0NTybSDXSE9kCHALNI9UHn1qdGKwvQf1MBfOw==', CAST(N'2022-10-14T08:12:55.2410868' AS DateTime2), CAST(N'2022-10-13T08:12:55.2410871' AS DateTime2), CAST(N'2022-10-13T08:14:57.9020007' AS DateTime2), N'kyxwL8K3ykaA422KKaRgZviOFG6gyFai2g0JJTI83o0w3jg2RXHIQ0dJkrTsewWNIRKACTOx2wKcX+lZdnw99w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1207, N'kyxwL8K3ykaA422KKaRgZviOFG6gyFai2g0JJTI83o0w3jg2RXHIQ0dJkrTsewWNIRKACTOx2wKcX+lZdnw99w==', CAST(N'2022-10-14T08:14:57.9019973' AS DateTime2), CAST(N'2022-10-13T08:14:57.9019978' AS DateTime2), CAST(N'2022-10-13T08:15:13.1938089' AS DateTime2), N'24xOy6gQ9iwkTtmuv6bXpa/k5vUycsg1SH3CVA/fAhY6uVxJ7/g8CAvalXdNUQzvtc2zf6xGEtdRQ3Qd3Jap3g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1208, N'24xOy6gQ9iwkTtmuv6bXpa/k5vUycsg1SH3CVA/fAhY6uVxJ7/g8CAvalXdNUQzvtc2zf6xGEtdRQ3Qd3Jap3g==', CAST(N'2022-10-14T08:15:13.1938047' AS DateTime2), CAST(N'2022-10-13T08:15:13.1938058' AS DateTime2), CAST(N'2022-10-13T08:15:42.5206414' AS DateTime2), N'n0UlM5CKidIY7HabN3LcSgwZS9f6Va01wafVDiGZFLFqAVhHR9kyS3hl7jTaMw1M/hXg6+NXeJd3kysugx9tfw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1209, N'n0UlM5CKidIY7HabN3LcSgwZS9f6Va01wafVDiGZFLFqAVhHR9kyS3hl7jTaMw1M/hXg6+NXeJd3kysugx9tfw==', CAST(N'2022-10-14T08:15:42.5206394' AS DateTime2), CAST(N'2022-10-13T08:15:42.5206397' AS DateTime2), CAST(N'2022-10-13T08:15:49.4718319' AS DateTime2), N'CTQCfdKFsvbC6Kj5e+mTUJmmfdScYtv5naMnUXPbWZxZ2Ti1POpvEtTiuqOoMYZpUNPMYryO/bsomgETseJL+g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1210, N'CTQCfdKFsvbC6Kj5e+mTUJmmfdScYtv5naMnUXPbWZxZ2Ti1POpvEtTiuqOoMYZpUNPMYryO/bsomgETseJL+g==', CAST(N'2022-10-14T08:15:49.4718300' AS DateTime2), CAST(N'2022-10-13T08:15:49.4718305' AS DateTime2), CAST(N'2022-10-13T08:16:46.0670351' AS DateTime2), N'psDjNsi9F8MKjvb+mLcEc6LI8wr2OeZSqNzI2NDiSMZ4NE4zYR/xSwZWiPX0g5TrOLBYpp5b1GPhkiG6RzRPVA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1211, N'psDjNsi9F8MKjvb+mLcEc6LI8wr2OeZSqNzI2NDiSMZ4NE4zYR/xSwZWiPX0g5TrOLBYpp5b1GPhkiG6RzRPVA==', CAST(N'2022-10-14T08:16:46.0670323' AS DateTime2), CAST(N'2022-10-13T08:16:46.0670326' AS DateTime2), CAST(N'2022-10-13T08:17:55.4077093' AS DateTime2), N'rnNn6Hivx+WEcsJBlYoDyGcb2SdYH6REnXBNVTtCP5tBDtHuxSyFYEIBjHxf++NNM0Y3vz3QDKW+yHAagFGmCQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1212, N'rnNn6Hivx+WEcsJBlYoDyGcb2SdYH6REnXBNVTtCP5tBDtHuxSyFYEIBjHxf++NNM0Y3vz3QDKW+yHAagFGmCQ==', CAST(N'2022-10-14T08:17:55.4077074' AS DateTime2), CAST(N'2022-10-13T08:17:55.4077077' AS DateTime2), CAST(N'2022-10-13T08:19:19.0704469' AS DateTime2), N'fsE6hiDMuE9ETbY+u+K30xPWOmJ0tlnf28FOMj7Y+aa1IgyLzAFmZ3f0SFq+ZniMRoV2Gwg0NcIH8xs8soNCTQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1213, N'fsE6hiDMuE9ETbY+u+K30xPWOmJ0tlnf28FOMj7Y+aa1IgyLzAFmZ3f0SFq+ZniMRoV2Gwg0NcIH8xs8soNCTQ==', CAST(N'2022-10-14T08:19:19.0704203' AS DateTime2), CAST(N'2022-10-13T08:19:19.0704209' AS DateTime2), CAST(N'2022-10-13T08:20:09.5644776' AS DateTime2), N'tqw/ScTu1K6ohpSj84J/0WNAs5jrlRPBqtOo8+JbG8CUm3R0PwbTZruPCCuj38NuH7mC+Z0XKGaksOzkGrY7xQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1214, N'tqw/ScTu1K6ohpSj84J/0WNAs5jrlRPBqtOo8+JbG8CUm3R0PwbTZruPCCuj38NuH7mC+Z0XKGaksOzkGrY7xQ==', CAST(N'2022-10-14T08:20:09.5644756' AS DateTime2), CAST(N'2022-10-13T08:20:09.5644760' AS DateTime2), CAST(N'2022-10-13T08:23:14.6076055' AS DateTime2), N'y0rdpI36Fl+j3qAivSmt+ap/e62/xK4UoDshDIinlhqqhd2nrwWvCJ2rBeCeiNWEd3MHyFK+fWX7yC4ANHVqVQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1215, N'y0rdpI36Fl+j3qAivSmt+ap/e62/xK4UoDshDIinlhqqhd2nrwWvCJ2rBeCeiNWEd3MHyFK+fWX7yC4ANHVqVQ==', CAST(N'2022-10-14T08:23:14.6076042' AS DateTime2), CAST(N'2022-10-13T08:23:14.6076043' AS DateTime2), CAST(N'2022-10-13T08:28:08.5075261' AS DateTime2), N'wnOdN3M4hdqXgLKiXN9SWzKkD3GGzJ2l77g1scOfbYv60OhsQGzR/JmE2d0gj1NdqUjVNSoXkYdGcrjqLuPCHQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1216, N'wnOdN3M4hdqXgLKiXN9SWzKkD3GGzJ2l77g1scOfbYv60OhsQGzR/JmE2d0gj1NdqUjVNSoXkYdGcrjqLuPCHQ==', CAST(N'2022-10-14T08:28:08.5075245' AS DateTime2), CAST(N'2022-10-13T08:28:08.5075249' AS DateTime2), CAST(N'2022-10-13T08:31:37.6986118' AS DateTime2), N'zQ+sqHmUBCOy3m6ExR6b4UOtx+3MQ2BGp7GDC4d07me5snwEUSNk0Nwo6GmaY5HUk0stPfRvyw/vb7qpsUnOUg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1217, N'zQ+sqHmUBCOy3m6ExR6b4UOtx+3MQ2BGp7GDC4d07me5snwEUSNk0Nwo6GmaY5HUk0stPfRvyw/vb7qpsUnOUg==', CAST(N'2022-10-14T08:31:37.6986092' AS DateTime2), CAST(N'2022-10-13T08:31:37.6986096' AS DateTime2), CAST(N'2022-10-13T08:32:51.3048058' AS DateTime2), N'52Ur6wjm3WnILdFxD+askDKWMDcl8GNrjaZYhPFRlG5HSqM7Ct1DJWkurSts2OIh2G86CpZwfLtV80l8jr1o9A==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1218, N'52Ur6wjm3WnILdFxD+askDKWMDcl8GNrjaZYhPFRlG5HSqM7Ct1DJWkurSts2OIh2G86CpZwfLtV80l8jr1o9A==', CAST(N'2022-10-14T08:32:51.3048035' AS DateTime2), CAST(N'2022-10-13T08:32:51.3048039' AS DateTime2), CAST(N'2022-10-13T08:37:08.7943978' AS DateTime2), N'UbOQ8o3irthGJHxfPQGNm6KRkH3Ydl2Sw77Gd9Cyu9vAAVmKHrf7d3df7szAh2yONaJ52I4zmJpflGzjTBVP/A==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1219, N'UbOQ8o3irthGJHxfPQGNm6KRkH3Ydl2Sw77Gd9Cyu9vAAVmKHrf7d3df7szAh2yONaJ52I4zmJpflGzjTBVP/A==', CAST(N'2022-10-14T08:37:08.7943957' AS DateTime2), CAST(N'2022-10-13T08:37:08.7943960' AS DateTime2), CAST(N'2022-10-13T08:37:40.2470941' AS DateTime2), N'uyeAWAGF3uCMS8DQClDGu+GBjIIlFB4wBimvVIk1N+y+A4IAPFznnOiZZq6AYAUgkVTzUYiM2iktwPGQWRG9Mw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1220, N'uyeAWAGF3uCMS8DQClDGu+GBjIIlFB4wBimvVIk1N+y+A4IAPFznnOiZZq6AYAUgkVTzUYiM2iktwPGQWRG9Mw==', CAST(N'2022-10-14T08:37:40.2470923' AS DateTime2), CAST(N'2022-10-13T08:37:40.2470926' AS DateTime2), CAST(N'2022-10-13T08:39:10.2333905' AS DateTime2), N'EnXIV2HYs+ixlI+0EvhM0eLlMNEiaQAGKghStg9x35haj/8LuPLCTNdgDRSwSXyXQuv6scRJzib5+KR7eBeNzg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1221, N'EnXIV2HYs+ixlI+0EvhM0eLlMNEiaQAGKghStg9x35haj/8LuPLCTNdgDRSwSXyXQuv6scRJzib5+KR7eBeNzg==', CAST(N'2022-10-14T08:39:10.2333876' AS DateTime2), CAST(N'2022-10-13T08:39:10.2333885' AS DateTime2), CAST(N'2022-10-13T08:40:14.2270053' AS DateTime2), N'vQY8On/Tycf5f47ijkExqM5jchuLqql1HXPvVvBjRjzytxAea98iZe9IrjU3v4gktpgci7JaZoRb2qwMuPdYOQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1222, N'vQY8On/Tycf5f47ijkExqM5jchuLqql1HXPvVvBjRjzytxAea98iZe9IrjU3v4gktpgci7JaZoRb2qwMuPdYOQ==', CAST(N'2022-10-14T08:40:14.2270029' AS DateTime2), CAST(N'2022-10-13T08:40:14.2270036' AS DateTime2), CAST(N'2022-10-13T08:42:45.4714716' AS DateTime2), N'L+QY0TheGT0HA2ll91aTvIKgpAptKv9fxzclZ2YaaCDnrTA9qVpI96dzGtuM8rpAbpFjgIqH/olUC8hPuznqgw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1223, N'L+QY0TheGT0HA2ll91aTvIKgpAptKv9fxzclZ2YaaCDnrTA9qVpI96dzGtuM8rpAbpFjgIqH/olUC8hPuznqgw==', CAST(N'2022-10-14T08:42:45.4714689' AS DateTime2), CAST(N'2022-10-13T08:42:45.4714694' AS DateTime2), CAST(N'2022-10-13T08:43:21.6288562' AS DateTime2), N'oDPOevnhM1rd+TrVfeu4H+tnrV6CmDCqtAYP1unXzrgriMg1n4b8i70GZLt0G2DQ8yi+K995/hBVqw+HMQoPzw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1224, N'oDPOevnhM1rd+TrVfeu4H+tnrV6CmDCqtAYP1unXzrgriMg1n4b8i70GZLt0G2DQ8yi+K995/hBVqw+HMQoPzw==', CAST(N'2022-10-14T08:43:21.6288549' AS DateTime2), CAST(N'2022-10-13T08:43:21.6288551' AS DateTime2), CAST(N'2022-10-13T08:44:10.2123268' AS DateTime2), N'HTUE838vB4vMFiJoU89eajTTdkuQVtHN/fmJcW1vdOhAzdToCvZL19qYX5GvTQgj2/pHPvD38vpFmGLyFY166w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1225, N'HTUE838vB4vMFiJoU89eajTTdkuQVtHN/fmJcW1vdOhAzdToCvZL19qYX5GvTQgj2/pHPvD38vpFmGLyFY166w==', CAST(N'2022-10-14T08:44:10.2123254' AS DateTime2), CAST(N'2022-10-13T08:44:10.2123258' AS DateTime2), CAST(N'2022-10-13T08:44:48.6039924' AS DateTime2), N'EbWayuafkG9fXEc/3C6ZHDUyLwEPJOcEEVlYxoGC/70dn5O1TaGtf6gvqFHQcOL15x8sN/kru1EmsRHiv8qEKQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1226, N'EbWayuafkG9fXEc/3C6ZHDUyLwEPJOcEEVlYxoGC/70dn5O1TaGtf6gvqFHQcOL15x8sN/kru1EmsRHiv8qEKQ==', CAST(N'2022-10-14T08:44:48.6039905' AS DateTime2), CAST(N'2022-10-13T08:44:48.6039908' AS DateTime2), CAST(N'2022-10-13T08:44:52.3988564' AS DateTime2), NULL, N'Attempted reuse of revoked ancestor token: HTUE838vB4vMFiJoU89eajTTdkuQVtHN/fmJcW1vdOhAzdToCvZL19qYX5GvTQgj2/pHPvD38vpFmGLyFY166w==', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1227, N'I/r+UnobYXfHMJIZQes0HBiHpKOdE+MmnYMo9tLJp95oPdLcDBZgrqFCeOcXvkAIK8pa0QTMqFE1xDwwnhZjMQ==', CAST(N'2022-10-14T08:46:40.8292170' AS DateTime2), CAST(N'2022-10-13T08:46:40.8292174' AS DateTime2), CAST(N'2022-10-13T08:50:58.2614710' AS DateTime2), N'j3Qatl6tyP4HSh8dyD/mJRXCEvOJPFTs8/inpdVWsN5HjroZF5WrjaP+nS2wVYD8L2nInCjdhwrxfPzor/rblA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1228, N'j3Qatl6tyP4HSh8dyD/mJRXCEvOJPFTs8/inpdVWsN5HjroZF5WrjaP+nS2wVYD8L2nInCjdhwrxfPzor/rblA==', CAST(N'2022-10-14T08:50:58.2614689' AS DateTime2), CAST(N'2022-10-13T08:50:58.2614693' AS DateTime2), CAST(N'2022-10-13T08:53:17.7235585' AS DateTime2), N'3cBt8I/LAullimmGEo5hHjmBvFBAV5oUcyz6q52ZiN9H3g/BXa06E0u27O3gE7DjKHY4j6aEJtHNtcBlRa/pZQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1229, N'3cBt8I/LAullimmGEo5hHjmBvFBAV5oUcyz6q52ZiN9H3g/BXa06E0u27O3gE7DjKHY4j6aEJtHNtcBlRa/pZQ==', CAST(N'2022-10-14T08:53:17.7235561' AS DateTime2), CAST(N'2022-10-13T08:53:17.7235565' AS DateTime2), CAST(N'2022-10-13T08:53:21.0656807' AS DateTime2), N'jdGkjBMr+m6/wiPdI+Eytmh0IEVitbOIhIn2/hdxJ3PIAKWMnPuzPSogSbiXdhVKn00ZfEAXsMJHwIJlnah4nw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1230, N'jdGkjBMr+m6/wiPdI+Eytmh0IEVitbOIhIn2/hdxJ3PIAKWMnPuzPSogSbiXdhVKn00ZfEAXsMJHwIJlnah4nw==', CAST(N'2022-10-14T08:53:21.0656790' AS DateTime2), CAST(N'2022-10-13T08:53:21.0656793' AS DateTime2), CAST(N'2022-10-13T08:54:15.5877824' AS DateTime2), N'NRNG1PUEetePUJiJ6GXeRG7IFOlquyPmxIq5Ymjg4BHTVsQOstFyTDLeRQzfIe4chR77xSv89dGGkWpfjlhqZA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1231, N'NRNG1PUEetePUJiJ6GXeRG7IFOlquyPmxIq5Ymjg4BHTVsQOstFyTDLeRQzfIe4chR77xSv89dGGkWpfjlhqZA==', CAST(N'2022-10-14T08:54:15.5877805' AS DateTime2), CAST(N'2022-10-13T08:54:15.5877811' AS DateTime2), CAST(N'2022-10-13T08:55:41.9818507' AS DateTime2), N'EPuVbXeIgCUGoJu18dkhY1qjYpDVeUexQd8Ut69nqSmaU2kxpNYMAf4LW5dzUBeC7rztDVmpGbD/yj5DDHMXbg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1232, N'EPuVbXeIgCUGoJu18dkhY1qjYpDVeUexQd8Ut69nqSmaU2kxpNYMAf4LW5dzUBeC7rztDVmpGbD/yj5DDHMXbg==', CAST(N'2022-10-14T08:55:41.9818488' AS DateTime2), CAST(N'2022-10-13T08:55:41.9818491' AS DateTime2), CAST(N'2022-10-13T08:59:17.0195028' AS DateTime2), N't35eKtFTWzUDKI5njkvM/eRSqoh+PTmqPVIPFXHI8GL4L/iw21Orxlw8dmTD02fUqgrXKv2VqyfnV0qzMt+f9w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1233, N't35eKtFTWzUDKI5njkvM/eRSqoh+PTmqPVIPFXHI8GL4L/iw21Orxlw8dmTD02fUqgrXKv2VqyfnV0qzMt+f9w==', CAST(N'2022-10-14T08:59:17.0194975' AS DateTime2), CAST(N'2022-10-13T08:59:17.0194985' AS DateTime2), CAST(N'2022-10-13T08:59:56.9922465' AS DateTime2), N'O2rP/XnPeU3DH/+824mEbp1f1r6/WiC4YwMZ8b3Ex9UKuek5kDMdz62SjgvKTggg2h4kUMS/1cNQEudU3biAEg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1234, N'O2rP/XnPeU3DH/+824mEbp1f1r6/WiC4YwMZ8b3Ex9UKuek5kDMdz62SjgvKTggg2h4kUMS/1cNQEudU3biAEg==', CAST(N'2022-10-14T08:59:56.9922446' AS DateTime2), CAST(N'2022-10-13T08:59:56.9922452' AS DateTime2), CAST(N'2022-10-13T09:00:39.5548868' AS DateTime2), N'ZrrbwembZ39KqrnznIwwPnQJXR6MujdFAiY9iYaWYgdFlcyQd2FNZ66rfQvgMZWTwAp27QU3ydFFgNl1I+ipNA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1235, N'ZrrbwembZ39KqrnznIwwPnQJXR6MujdFAiY9iYaWYgdFlcyQd2FNZ66rfQvgMZWTwAp27QU3ydFFgNl1I+ipNA==', CAST(N'2022-10-14T09:00:39.5548791' AS DateTime2), CAST(N'2022-10-13T09:00:39.5548806' AS DateTime2), CAST(N'2022-10-13T09:01:11.2395011' AS DateTime2), N'859e8/TJlwF6D9oyYjqyQgW84U2dJtLfK/pjZ43woShQiPw4RlL4DKuowhuuXADd3FGCPFnEmKpgsnL7g/+dTg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1236, N'859e8/TJlwF6D9oyYjqyQgW84U2dJtLfK/pjZ43woShQiPw4RlL4DKuowhuuXADd3FGCPFnEmKpgsnL7g/+dTg==', CAST(N'2022-10-14T09:01:11.2394994' AS DateTime2), CAST(N'2022-10-13T09:01:11.2394999' AS DateTime2), CAST(N'2022-10-13T09:01:18.8820439' AS DateTime2), N'y10SB2H73f72141qf9xlj/gT3CAs4XoK0MjMKEdGCPZfv0o9RWYudUX8Ven1u3A6jeqfjKCagvz8Es1aL0X2Pw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1237, N'y10SB2H73f72141qf9xlj/gT3CAs4XoK0MjMKEdGCPZfv0o9RWYudUX8Ven1u3A6jeqfjKCagvz8Es1aL0X2Pw==', CAST(N'2022-10-14T09:01:18.8820425' AS DateTime2), CAST(N'2022-10-13T09:01:18.8820428' AS DateTime2), CAST(N'2022-10-13T09:02:35.3107554' AS DateTime2), N'VpBrI2G1Xu88SK/GPRmeBhtVSNXmZI7PSivQUd7IMlIK9LiqpEgHBDZ0jhEJJ0+Vw0VijHVvqpdnF3OSLzd9vw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1238, N'VpBrI2G1Xu88SK/GPRmeBhtVSNXmZI7PSivQUd7IMlIK9LiqpEgHBDZ0jhEJJ0+Vw0VijHVvqpdnF3OSLzd9vw==', CAST(N'2022-10-14T09:02:35.3107538' AS DateTime2), CAST(N'2022-10-13T09:02:35.3107541' AS DateTime2), CAST(N'2022-10-13T09:02:54.1120567' AS DateTime2), N'OfrVWQ6TcAERuF9sep9Mj9xvlnicpRCJU86bHNaGT1VBiYP41rwXwTs88gPBmU6aBE0hUe3usa7k2RnENVo61A==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1239, N'OfrVWQ6TcAERuF9sep9Mj9xvlnicpRCJU86bHNaGT1VBiYP41rwXwTs88gPBmU6aBE0hUe3usa7k2RnENVo61A==', CAST(N'2022-10-14T09:02:54.1120544' AS DateTime2), CAST(N'2022-10-13T09:02:54.1120550' AS DateTime2), CAST(N'2022-10-13T09:02:56.7272525' AS DateTime2), N'vyB3+fJEPMcXW/+NdKBfehrb69Sd224ae3I7h6Nyqr/yJdTG0w3TbaER696xB+0vJWLvpyiHuHtQHT4vlQk1WQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1240, N'vyB3+fJEPMcXW/+NdKBfehrb69Sd224ae3I7h6Nyqr/yJdTG0w3TbaER696xB+0vJWLvpyiHuHtQHT4vlQk1WQ==', CAST(N'2022-10-14T09:02:56.7272502' AS DateTime2), CAST(N'2022-10-13T09:02:56.7272506' AS DateTime2), CAST(N'2022-10-13T09:03:07.0773515' AS DateTime2), N'1MwLgNztqa5CEkNWxQrk9lLRwh2dCWXXA/6hUGD9ImMIUXJ+DzPDasy3YpP7nfhhM8QtfG++/a1OJN4/iS8aGw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1241, N'1MwLgNztqa5CEkNWxQrk9lLRwh2dCWXXA/6hUGD9ImMIUXJ+DzPDasy3YpP7nfhhM8QtfG++/a1OJN4/iS8aGw==', CAST(N'2022-10-14T09:03:07.0773501' AS DateTime2), CAST(N'2022-10-13T09:03:07.0773504' AS DateTime2), CAST(N'2022-10-13T09:04:49.7827985' AS DateTime2), N'3c+3lqe/zTwXwGeJ5cVzRpdevXG1YYBdm80PMLzkMIpf9L/il9o34kvSxiIxPWqzXR4zNyy+lv2dqR60zlRiiw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1242, N'3c+3lqe/zTwXwGeJ5cVzRpdevXG1YYBdm80PMLzkMIpf9L/il9o34kvSxiIxPWqzXR4zNyy+lv2dqR60zlRiiw==', CAST(N'2022-10-14T09:04:49.7827964' AS DateTime2), CAST(N'2022-10-13T09:04:49.7827968' AS DateTime2), CAST(N'2022-10-13T09:07:16.2247417' AS DateTime2), N'TIr3ikj0qQ0qJSdzlJpEABFwYvtATll+PYwjrH3hKrEel7hBknBW6ntKjOswi7m91lbfwCsjfiEn9tpUenB6rA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1243, N'TIr3ikj0qQ0qJSdzlJpEABFwYvtATll+PYwjrH3hKrEel7hBknBW6ntKjOswi7m91lbfwCsjfiEn9tpUenB6rA==', CAST(N'2022-10-14T09:07:16.2247402' AS DateTime2), CAST(N'2022-10-13T09:07:16.2247405' AS DateTime2), CAST(N'2022-10-13T09:08:32.5345580' AS DateTime2), N'GSHn+DVSJUJVyblHggvdmdU+xUMaLUf3ay46vzNcgaQ/vpBlig2Yg21xDq2GWg9MFcb+jMpZqnyH2uU3BDoIdA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1244, N'GSHn+DVSJUJVyblHggvdmdU+xUMaLUf3ay46vzNcgaQ/vpBlig2Yg21xDq2GWg9MFcb+jMpZqnyH2uU3BDoIdA==', CAST(N'2022-10-14T09:08:32.5345567' AS DateTime2), CAST(N'2022-10-13T09:08:32.5345570' AS DateTime2), CAST(N'2022-10-13T09:18:52.7520291' AS DateTime2), N'+DUzmYvswsjnUH1NP6YrzZf7rCc6ByYC5JjphnCg6CkYhNtPiMX5ZLoCaerCt3gm2ttmtH91S2RIlSgjZyVEWA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1245, N'+DUzmYvswsjnUH1NP6YrzZf7rCc6ByYC5JjphnCg6CkYhNtPiMX5ZLoCaerCt3gm2ttmtH91S2RIlSgjZyVEWA==', CAST(N'2022-10-14T09:18:52.7520274' AS DateTime2), CAST(N'2022-10-13T09:18:52.7520278' AS DateTime2), CAST(N'2022-10-13T09:19:11.9696099' AS DateTime2), N'upVNrbh5z6rCpHfwNw2QoDxD45CJVC4xNDXBg1rw1Jz9dbreECv6K2rQ52TIYk799K5T1bua5P4n0EyXlTGsfw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1246, N'upVNrbh5z6rCpHfwNw2QoDxD45CJVC4xNDXBg1rw1Jz9dbreECv6K2rQ52TIYk799K5T1bua5P4n0EyXlTGsfw==', CAST(N'2022-10-14T09:19:11.9696076' AS DateTime2), CAST(N'2022-10-13T09:19:11.9696087' AS DateTime2), CAST(N'2022-10-13T09:22:10.5264295' AS DateTime2), N'HgvJPqgG6FUaEb6bfwtBGna1FAjP+WKJeGhPPAPFWL6KOMu+ww9fJgTBZ0TvrI7sfE1e4xFwp0VfJi+/OLBY7Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1247, N'HgvJPqgG6FUaEb6bfwtBGna1FAjP+WKJeGhPPAPFWL6KOMu+ww9fJgTBZ0TvrI7sfE1e4xFwp0VfJi+/OLBY7Q==', CAST(N'2022-10-14T09:22:10.5264275' AS DateTime2), CAST(N'2022-10-13T09:22:10.5264278' AS DateTime2), CAST(N'2022-10-13T09:22:13.8004465' AS DateTime2), N'yUh+20ue21jH1FxVLKXFnjGS3lG1JUOWmMrmJY3Y/6jnd/my7GvxoIdlP9SzXsNmOzsRHi3bnTbhtVzp+iYj6g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1248, N'yUh+20ue21jH1FxVLKXFnjGS3lG1JUOWmMrmJY3Y/6jnd/my7GvxoIdlP9SzXsNmOzsRHi3bnTbhtVzp+iYj6g==', CAST(N'2022-10-14T09:22:13.8004450' AS DateTime2), CAST(N'2022-10-13T09:22:13.8004453' AS DateTime2), CAST(N'2022-10-13T09:22:22.9549487' AS DateTime2), N'GTG2pRi9YKqMs79MqVzWZFAAFRBw8tb13erDIXG5pg7YbWvYLByWwrxELjNta3J8X6rI0vWAN6fgjoyZN77wiQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1249, N'GTG2pRi9YKqMs79MqVzWZFAAFRBw8tb13erDIXG5pg7YbWvYLByWwrxELjNta3J8X6rI0vWAN6fgjoyZN77wiQ==', CAST(N'2022-10-14T09:22:22.9549468' AS DateTime2), CAST(N'2022-10-13T09:22:22.9549472' AS DateTime2), CAST(N'2022-10-13T09:22:26.7242619' AS DateTime2), N'Im6hvQ+dnorvxq2GPBXfjs7ijlEMCB/foycjuH02Nm510qBUfc1gD6xYnmkhl74KrOE3MVktkpASJtCg+lrcYQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1250, N'Im6hvQ+dnorvxq2GPBXfjs7ijlEMCB/foycjuH02Nm510qBUfc1gD6xYnmkhl74KrOE3MVktkpASJtCg+lrcYQ==', CAST(N'2022-10-14T09:22:26.7242596' AS DateTime2), CAST(N'2022-10-13T09:22:26.7242605' AS DateTime2), CAST(N'2022-10-13T09:41:27.3001802' AS DateTime2), N'pPU15cE/MPCBh2Gq7VZApPMtHijBoLYpz4dWNBFSIaW5Z2/LrgmqEQxQ7kR+e4Qc+A/InA4cI9rYiYRaCcJh7Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1251, N'pPU15cE/MPCBh2Gq7VZApPMtHijBoLYpz4dWNBFSIaW5Z2/LrgmqEQxQ7kR+e4Qc+A/InA4cI9rYiYRaCcJh7Q==', CAST(N'2022-10-14T09:41:27.3001777' AS DateTime2), CAST(N'2022-10-13T09:41:27.3001781' AS DateTime2), CAST(N'2022-10-13T09:47:50.6100415' AS DateTime2), N'bzwAmKAhGnlXnsFXKcTc8LfTuLf9otr8WKb7oJLehdG1xFhlBNCBdjuI7/ef3ETuN23OhT6/0YMEmAjRpNKbnQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1252, N'bzwAmKAhGnlXnsFXKcTc8LfTuLf9otr8WKb7oJLehdG1xFhlBNCBdjuI7/ef3ETuN23OhT6/0YMEmAjRpNKbnQ==', CAST(N'2022-10-14T09:47:50.6100393' AS DateTime2), CAST(N'2022-10-13T09:47:50.6100397' AS DateTime2), CAST(N'2022-10-13T10:06:50.3570692' AS DateTime2), N'FDNqg5a1HbIP68REZ4Fbu0pTmIsnBMH91++xSNRporkFqJD+YLFvpEccIH15k7d+ozRRbvAUdgZVvQrumTgEcg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1253, N'FDNqg5a1HbIP68REZ4Fbu0pTmIsnBMH91++xSNRporkFqJD+YLFvpEccIH15k7d+ozRRbvAUdgZVvQrumTgEcg==', CAST(N'2022-10-14T10:06:50.3570658' AS DateTime2), CAST(N'2022-10-13T10:06:50.3570665' AS DateTime2), CAST(N'2022-10-13T10:25:50.1505683' AS DateTime2), N'fTS0l97jYmbxOWdhSTOWojoDStg91DrZIRwWDkZbOAkDjPyfWFaVwtxcA0B49boegJx1vvsSGDobaCvL61a4zg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1254, N'fTS0l97jYmbxOWdhSTOWojoDStg91DrZIRwWDkZbOAkDjPyfWFaVwtxcA0B49boegJx1vvsSGDobaCvL61a4zg==', CAST(N'2022-10-14T10:25:50.1505663' AS DateTime2), CAST(N'2022-10-13T10:25:50.1505666' AS DateTime2), CAST(N'2022-10-13T10:42:02.7484533' AS DateTime2), N'BAgLbIRLWoyr3ntuv1WKVZRrKDlkPHbfWdoHjYDDYzOp2NNqq/2ZMPB26Bwy/vSeZ/VToheYGbXkVqGhtHN+7Q==', N'Replaced by new token', N'quyen.tran')
GO
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1255, N'BAgLbIRLWoyr3ntuv1WKVZRrKDlkPHbfWdoHjYDDYzOp2NNqq/2ZMPB26Bwy/vSeZ/VToheYGbXkVqGhtHN+7Q==', CAST(N'2022-10-14T10:42:02.7484512' AS DateTime2), CAST(N'2022-10-13T10:42:02.7484519' AS DateTime2), CAST(N'2022-10-13T10:56:50.4846860' AS DateTime2), N'qk8tMu2H9mMZtCCFi6X/6VXYyBevswQ6tW5mMZFyZrEpqce4gX3mwFqx6FUtEOrtnF9F/42GnTeAv3p3tj7KSA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1256, N'qk8tMu2H9mMZtCCFi6X/6VXYyBevswQ6tW5mMZFyZrEpqce4gX3mwFqx6FUtEOrtnF9F/42GnTeAv3p3tj7KSA==', CAST(N'2022-10-14T10:56:50.4846843' AS DateTime2), CAST(N'2022-10-13T10:56:50.4846847' AS DateTime2), CAST(N'2022-10-13T11:15:50.4895439' AS DateTime2), N'rDCtyM7Mfq+6USn/B8IAd8JLWJAD3wfsRBIfanqw+vGU55FJWgJnHhCv7220AVzUyQlaSpmHoBKU9H4hN0D21w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1257, N'rDCtyM7Mfq+6USn/B8IAd8JLWJAD3wfsRBIfanqw+vGU55FJWgJnHhCv7220AVzUyQlaSpmHoBKU9H4hN0D21w==', CAST(N'2022-10-14T11:15:50.4895417' AS DateTime2), CAST(N'2022-10-13T11:15:50.4895424' AS DateTime2), CAST(N'2022-10-13T11:34:50.5924133' AS DateTime2), N'O4Th9KLifvH7z0HONK02CcKnRdprG/CMpkNrqgOsDTIUja9NXBS1FdL5E8M/dCIsAV8QhoIXHHgTvtCjGN+6dQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1258, N'O4Th9KLifvH7z0HONK02CcKnRdprG/CMpkNrqgOsDTIUja9NXBS1FdL5E8M/dCIsAV8QhoIXHHgTvtCjGN+6dQ==', CAST(N'2022-10-14T11:34:50.5924122' AS DateTime2), CAST(N'2022-10-13T11:34:50.5924123' AS DateTime2), CAST(N'2022-10-13T11:53:50.1409745' AS DateTime2), N'/cZZFjdTvOl3bSaLIAjvcdbJtKY1ZhtYTdKPvKgP9UQ27zsyPb9sh0N0W2k/dDXqr7pqTywhPJq5VQ5XHbrdvg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1259, N'/cZZFjdTvOl3bSaLIAjvcdbJtKY1ZhtYTdKPvKgP9UQ27zsyPb9sh0N0W2k/dDXqr7pqTywhPJq5VQ5XHbrdvg==', CAST(N'2022-10-14T11:53:50.1409724' AS DateTime2), CAST(N'2022-10-13T11:53:50.1409727' AS DateTime2), CAST(N'2022-10-13T12:12:50.6091036' AS DateTime2), N'O8lQLtDOz9OiIXpt1wWcatxRVkM3HELVwVZJdrpsDBGYOk4U34Gv/MHJTmRm5UdCkfhk0pzIUABOTwIaw5d2OA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1260, N'O8lQLtDOz9OiIXpt1wWcatxRVkM3HELVwVZJdrpsDBGYOk4U34Gv/MHJTmRm5UdCkfhk0pzIUABOTwIaw5d2OA==', CAST(N'2022-10-14T12:12:50.6091020' AS DateTime2), CAST(N'2022-10-13T12:12:50.6091022' AS DateTime2), CAST(N'2022-10-13T12:27:55.2017027' AS DateTime2), N'jrGfwwS9MpaJd5wwz6yrJOcu4SauqWX11CM+GKeQCOKnTPC0/dVjQ5TXwYF2gxZF9wFUkCx6Sl5DjX3Ein4Avg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1261, N'jrGfwwS9MpaJd5wwz6yrJOcu4SauqWX11CM+GKeQCOKnTPC0/dVjQ5TXwYF2gxZF9wFUkCx6Sl5DjX3Ein4Avg==', CAST(N'2022-10-14T12:27:55.2017005' AS DateTime2), CAST(N'2022-10-13T12:27:55.2017007' AS DateTime2), CAST(N'2022-10-13T12:31:50.6291350' AS DateTime2), N'a7XMeX6GaGWDpdySSG7NiHorrsOpU67Z4eyGAxHCha+KNHrCAQwRn4XCeNCB21estqtISnG5GPRr7i0ssGBr7g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1262, N'a7XMeX6GaGWDpdySSG7NiHorrsOpU67Z4eyGAxHCha+KNHrCAQwRn4XCeNCB21estqtISnG5GPRr7i0ssGBr7g==', CAST(N'2022-10-14T12:31:50.6291285' AS DateTime2), CAST(N'2022-10-13T12:31:50.6291291' AS DateTime2), CAST(N'2022-10-13T12:46:55.6528933' AS DateTime2), N'3BuFnMtYMLzcHr/iVmsBJRiDK6ZvbS6OcN1QqQI9UQiyLQZIv9JQ52fPM5eEjvRVGMoSp/NdXodPerjrjUj6xg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1263, N'3BuFnMtYMLzcHr/iVmsBJRiDK6ZvbS6OcN1QqQI9UQiyLQZIv9JQ52fPM5eEjvRVGMoSp/NdXodPerjrjUj6xg==', CAST(N'2022-10-14T12:46:55.6513405' AS DateTime2), CAST(N'2022-10-13T12:46:55.6513410' AS DateTime2), CAST(N'2022-10-13T12:50:50.6431245' AS DateTime2), N'sCj7HIsc03+c19Iskflma7zxQp8d7/RUQQ7m+dk+bw5pNiwTym7B3BnJOysXzT77VqhDEhRgagMTQf0BvDuf9g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1264, N'sCj7HIsc03+c19Iskflma7zxQp8d7/RUQQ7m+dk+bw5pNiwTym7B3BnJOysXzT77VqhDEhRgagMTQf0BvDuf9g==', CAST(N'2022-10-14T12:50:50.6431227' AS DateTime2), CAST(N'2022-10-13T12:50:50.6431232' AS DateTime2), CAST(N'2022-10-13T13:05:55.6550774' AS DateTime2), N'dTyp2n4peQPhPaCs09mrVW4O0Noa5zVc+ZWgKSurgIl7WBnKdPS1WGfulS4ickGTf8uPxNKdQ++HCO/35YFDGQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1265, N'dTyp2n4peQPhPaCs09mrVW4O0Noa5zVc+ZWgKSurgIl7WBnKdPS1WGfulS4ickGTf8uPxNKdQ++HCO/35YFDGQ==', CAST(N'2022-10-14T13:05:55.6550757' AS DateTime2), CAST(N'2022-10-13T13:05:55.6550760' AS DateTime2), CAST(N'2022-10-13T13:09:50.6247168' AS DateTime2), N'+j00wuwIkqHa59NBtQNKlHvFRkPCzGMnanFhEXZWNYEIA3baMWYufz768QJUmhKK95rY+mCF5/6c01cG4A3i/g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1266, N'+j00wuwIkqHa59NBtQNKlHvFRkPCzGMnanFhEXZWNYEIA3baMWYufz768QJUmhKK95rY+mCF5/6c01cG4A3i/g==', CAST(N'2022-10-14T13:09:50.6247155' AS DateTime2), CAST(N'2022-10-13T13:09:50.6247161' AS DateTime2), CAST(N'2022-10-13T13:24:55.7013356' AS DateTime2), N'Z5rKKCOdCDQfa/c+eHzZUtxf5ElbyEuqKMxM5ZWaMPAI13tVO/ibvWAH8jOtXOQETcdz7QgnyixrekXpks5iWQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1267, N'Z5rKKCOdCDQfa/c+eHzZUtxf5ElbyEuqKMxM5ZWaMPAI13tVO/ibvWAH8jOtXOQETcdz7QgnyixrekXpks5iWQ==', CAST(N'2022-10-14T13:24:55.7013343' AS DateTime2), CAST(N'2022-10-13T13:24:55.7013346' AS DateTime2), CAST(N'2022-10-13T13:28:50.6418865' AS DateTime2), N'/uHQ3cJZbi1UAQGfDq1Ly7KUb/0+tMaPsSNJqudxA32pqQOGwls6Y3erUdWKebyPF8HAQ/s40t1dRtB9c/9EYQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1268, N'/uHQ3cJZbi1UAQGfDq1Ly7KUb/0+tMaPsSNJqudxA32pqQOGwls6Y3erUdWKebyPF8HAQ/s40t1dRtB9c/9EYQ==', CAST(N'2022-10-14T13:28:50.6418851' AS DateTime2), CAST(N'2022-10-13T13:28:50.6418854' AS DateTime2), CAST(N'2022-10-13T13:43:55.7003474' AS DateTime2), N'FFzNncXRqqFgskkjwGaQWE2F2Eeiqw+/gej/S+TNqyOojhBPfbr/GEwGG+RBOEO0X4rOuuR8vlJlYMGevJ6+8A==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1269, N'FFzNncXRqqFgskkjwGaQWE2F2Eeiqw+/gej/S+TNqyOojhBPfbr/GEwGG+RBOEO0X4rOuuR8vlJlYMGevJ6+8A==', CAST(N'2022-10-14T13:43:55.7003461' AS DateTime2), CAST(N'2022-10-13T13:43:55.7003462' AS DateTime2), CAST(N'2022-10-13T13:47:50.7343976' AS DateTime2), N'eqXJOBdctYS99+SrTRnlXSwK5iLp9UxpUFcxG2hz/oo8pZ+AL46mBdNPZuEAQB1ZOabnzPLY+5D5gTKeFN1zBA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1270, N'eqXJOBdctYS99+SrTRnlXSwK5iLp9UxpUFcxG2hz/oo8pZ+AL46mBdNPZuEAQB1ZOabnzPLY+5D5gTKeFN1zBA==', CAST(N'2022-10-14T13:47:50.7343961' AS DateTime2), CAST(N'2022-10-13T13:47:50.7343966' AS DateTime2), CAST(N'2022-10-13T14:02:55.7629943' AS DateTime2), N'6FkcTCqwnAk0HDnW0lx2G80GNWxFMIeUZGv/DHOMew6zdSP6qn3+5uo/Gs/mgjZ2TEebkuQpR1QTikQv1NPW6Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1271, N'6FkcTCqwnAk0HDnW0lx2G80GNWxFMIeUZGv/DHOMew6zdSP6qn3+5uo/Gs/mgjZ2TEebkuQpR1QTikQv1NPW6Q==', CAST(N'2022-10-14T14:02:55.7629914' AS DateTime2), CAST(N'2022-10-13T14:02:55.7629916' AS DateTime2), CAST(N'2022-10-13T14:06:50.8115349' AS DateTime2), N'GZjZaxWQjtdzcQPIajAyIa/vgjifmO1vmqiBzJv80AXnry6xNaaFyctbXnu3VEMEBfp6R5nN/USwQs5MSjh+YQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1272, N'GZjZaxWQjtdzcQPIajAyIa/vgjifmO1vmqiBzJv80AXnry6xNaaFyctbXnu3VEMEBfp6R5nN/USwQs5MSjh+YQ==', CAST(N'2022-10-14T14:06:50.8115331' AS DateTime2), CAST(N'2022-10-13T14:06:50.8115335' AS DateTime2), CAST(N'2022-10-13T14:21:55.7820904' AS DateTime2), N'cz4xK8sj7jLliIwEu94/Vj9UQbabcipWDpmq2yUdqWzsKkZchEItGJASq0kAhCjeQuQUUVDT5LIz4+fs+443dw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1273, N'cz4xK8sj7jLliIwEu94/Vj9UQbabcipWDpmq2yUdqWzsKkZchEItGJASq0kAhCjeQuQUUVDT5LIz4+fs+443dw==', CAST(N'2022-10-14T14:21:55.7820885' AS DateTime2), CAST(N'2022-10-13T14:21:55.7820888' AS DateTime2), CAST(N'2022-10-13T14:25:50.7555967' AS DateTime2), N'/cpivi1fQ6dxD4gERfaF9ES10aw+8MK9QKi2hMrS8pLF75rvvY+sLEge4a6xrwHtpjOPFS70JXcytBoFCWyFyw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1274, N'/cpivi1fQ6dxD4gERfaF9ES10aw+8MK9QKi2hMrS8pLF75rvvY+sLEge4a6xrwHtpjOPFS70JXcytBoFCWyFyw==', CAST(N'2022-10-14T14:25:50.7555952' AS DateTime2), CAST(N'2022-10-13T14:25:50.7555955' AS DateTime2), CAST(N'2022-10-13T14:40:56.1419594' AS DateTime2), N'kZYWXcUezlBvxAM72hJFl689iJtFseECQczSrDG7sCzEIbqqjs2gt8J4eaKntl3BbRWBuOIXL4fTsKnb4JOGNA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1275, N'kZYWXcUezlBvxAM72hJFl689iJtFseECQczSrDG7sCzEIbqqjs2gt8J4eaKntl3BbRWBuOIXL4fTsKnb4JOGNA==', CAST(N'2022-10-14T14:40:56.1419566' AS DateTime2), CAST(N'2022-10-13T14:40:56.1419570' AS DateTime2), CAST(N'2022-10-13T14:54:22.3657549' AS DateTime2), N'nEWOibeO+GCR04qQp6gIpIpiRY/VtjDvYM/QN6++HgcwBz+Qmg6nsutV8FKukJuTQpX0ukHNzEIXbusJJcLmVQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1276, N'nEWOibeO+GCR04qQp6gIpIpiRY/VtjDvYM/QN6++HgcwBz+Qmg6nsutV8FKukJuTQpX0ukHNzEIXbusJJcLmVQ==', CAST(N'2022-10-14T14:54:22.3657531' AS DateTime2), CAST(N'2022-10-13T14:54:22.3657534' AS DateTime2), CAST(N'2022-10-13T15:13:22.3496680' AS DateTime2), N'xk1+lcvN30XN3ZyD/BdbHyHbqRKPOlKKT93+SuWFDG7hgVsB+00PiEWnHHQw2edaWbUD1ncOkq2MiXTx+uMI9w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1277, N'xk1+lcvN30XN3ZyD/BdbHyHbqRKPOlKKT93+SuWFDG7hgVsB+00PiEWnHHQw2edaWbUD1ncOkq2MiXTx+uMI9w==', CAST(N'2022-10-14T15:13:22.3496649' AS DateTime2), CAST(N'2022-10-13T15:13:22.3496651' AS DateTime2), CAST(N'2022-10-13T15:16:02.3064493' AS DateTime2), N'OsURqMmEDgUkEcgPuJEapUT3dRz08m3LPt6YQviT76Uwv6uHDgDMmC/OZ5vEW/LstJeC6aQdqiaKk3qNongNYg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1278, N'OsURqMmEDgUkEcgPuJEapUT3dRz08m3LPt6YQviT76Uwv6uHDgDMmC/OZ5vEW/LstJeC6aQdqiaKk3qNongNYg==', CAST(N'2022-10-14T15:16:02.3064471' AS DateTime2), CAST(N'2022-10-13T15:16:02.3064476' AS DateTime2), CAST(N'2022-10-13T15:16:30.3204634' AS DateTime2), N'Q+wtHP3kU4zxsy7t63f/ncIRbEJFNohJx+WZlciXez/8YEnidDALGpBwW1Pkc9Kzp5gxzqkAvvBhw/MpEAbRfQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1279, N'Q+wtHP3kU4zxsy7t63f/ncIRbEJFNohJx+WZlciXez/8YEnidDALGpBwW1Pkc9Kzp5gxzqkAvvBhw/MpEAbRfQ==', CAST(N'2022-10-14T15:16:30.3204613' AS DateTime2), CAST(N'2022-10-13T15:16:30.3204616' AS DateTime2), CAST(N'2022-10-13T15:35:31.4945474' AS DateTime2), N'8fxUb2c2wFeRh0HQUKapbhfoauEDZb+eGVYSz+rH1Qb5GpIN4BCFUJgd3wxktEXi8cpV0fz4479Z5L8iWlFuVA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1280, N'8fxUb2c2wFeRh0HQUKapbhfoauEDZb+eGVYSz+rH1Qb5GpIN4BCFUJgd3wxktEXi8cpV0fz4479Z5L8iWlFuVA==', CAST(N'2022-10-14T15:35:31.4945431' AS DateTime2), CAST(N'2022-10-13T15:35:31.4945435' AS DateTime2), CAST(N'2022-10-13T15:36:48.5206738' AS DateTime2), N'TcnOTw+9T1vQipSGWhNHa3o4NuVCqwRVCJykI3WI8/EqmLlK+uDVYnUFsN/eNK66SrDvThfexnp3ZS4L4e5Xrg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1281, N'TcnOTw+9T1vQipSGWhNHa3o4NuVCqwRVCJykI3WI8/EqmLlK+uDVYnUFsN/eNK66SrDvThfexnp3ZS4L4e5Xrg==', CAST(N'2022-10-14T15:36:48.5206719' AS DateTime2), CAST(N'2022-10-13T15:36:48.5206722' AS DateTime2), CAST(N'2022-10-13T15:43:36.3880877' AS DateTime2), N'X4t9IKqzL2LGf1OWtZckNXwLTvRCqhJQxFfrlN97jD9sMRoqrtrOJMYkSoDm9LG5KlBBgxRtv1RSGTPZwjzy4A==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1282, N'X4t9IKqzL2LGf1OWtZckNXwLTvRCqhJQxFfrlN97jD9sMRoqrtrOJMYkSoDm9LG5KlBBgxRtv1RSGTPZwjzy4A==', CAST(N'2022-10-14T15:43:36.3880855' AS DateTime2), CAST(N'2022-10-13T15:43:36.3880858' AS DateTime2), CAST(N'2022-10-13T15:46:04.7195020' AS DateTime2), N'J+DLl34mKpgKzSu9RVrJrUpDXZxvMRVCt0W9c+ARz/hVcjR0HeAlUPRborzTEwqo5E3QoDNpLUUunav92RqS4w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1283, N'J+DLl34mKpgKzSu9RVrJrUpDXZxvMRVCt0W9c+ARz/hVcjR0HeAlUPRborzTEwqo5E3QoDNpLUUunav92RqS4w==', CAST(N'2022-10-14T15:46:04.7194990' AS DateTime2), CAST(N'2022-10-13T15:46:04.7194995' AS DateTime2), CAST(N'2022-10-13T15:47:06.5177013' AS DateTime2), N'GnS6+PCsxXh7hUx43yqcXpkM4xdKRebI3J2BhhBf8nYx9eRdj6GpXqp52xrfFjQv8ozB23sIb86LCPbwiK93Ow==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1284, N'GnS6+PCsxXh7hUx43yqcXpkM4xdKRebI3J2BhhBf8nYx9eRdj6GpXqp52xrfFjQv8ozB23sIb86LCPbwiK93Ow==', CAST(N'2022-10-14T15:47:06.5176993' AS DateTime2), CAST(N'2022-10-13T15:47:06.5176996' AS DateTime2), CAST(N'2022-10-13T15:47:19.8246849' AS DateTime2), N'JcNE03YULGZWneKHyqzcmP2APw87MlClP8BWN3aX3ujVvgpNZvnU4txhQv3rD0RsiZvjZX06XmUhnpSP05ZN3w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1285, N'JcNE03YULGZWneKHyqzcmP2APw87MlClP8BWN3aX3ujVvgpNZvnU4txhQv3rD0RsiZvjZX06XmUhnpSP05ZN3w==', CAST(N'2022-10-14T15:47:19.8246826' AS DateTime2), CAST(N'2022-10-13T15:47:19.8246829' AS DateTime2), CAST(N'2022-10-13T15:54:32.1718857' AS DateTime2), N'JRT1dUhSwCRjsA1NijwZ0vopK31VqfIZOA3/jkOvJij2i0ZVUqeQOGKF7QiEPIc01oKT9fOPUQj3oJ6cge9k5w==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1286, N'JRT1dUhSwCRjsA1NijwZ0vopK31VqfIZOA3/jkOvJij2i0ZVUqeQOGKF7QiEPIc01oKT9fOPUQj3oJ6cge9k5w==', CAST(N'2022-10-14T15:54:32.1718837' AS DateTime2), CAST(N'2022-10-13T15:54:32.1718840' AS DateTime2), CAST(N'2022-10-13T16:06:19.1305571' AS DateTime2), N'ZtHEtUaQKfi/XMsDTvpe4GCDVCU8P/nW/Nn71rS6ZsYsy+cFZu7n2DisNhMY/zyHXp5tf+Y7QLJHTDVN6DsDmA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1287, N'ZtHEtUaQKfi/XMsDTvpe4GCDVCU8P/nW/Nn71rS6ZsYsy+cFZu7n2DisNhMY/zyHXp5tf+Y7QLJHTDVN6DsDmA==', CAST(N'2022-10-14T16:06:19.1305550' AS DateTime2), CAST(N'2022-10-13T16:06:19.1305552' AS DateTime2), CAST(N'2022-10-13T16:08:40.2869054' AS DateTime2), N'JJhlQmC4/YkhehI/Tp+7Qj/2wRigd0CctwoPboxm2rPzBcgegOt32NDgBqL+PnoW3g4Yj/VhAjyFK5b0wXSDSQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1288, N'JJhlQmC4/YkhehI/Tp+7Qj/2wRigd0CctwoPboxm2rPzBcgegOt32NDgBqL+PnoW3g4Yj/VhAjyFK5b0wXSDSQ==', CAST(N'2022-10-14T16:08:40.2869033' AS DateTime2), CAST(N'2022-10-13T16:08:40.2869037' AS DateTime2), CAST(N'2022-10-13T16:10:07.2444082' AS DateTime2), N'eeXqd1i0mPA1dplKZi5Gaj4qoFVmvKOs8heWweY61a3J2L+2OGeCKhNeIrID838K8/piBIz/obhh22GGklcWVA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1289, N'eeXqd1i0mPA1dplKZi5Gaj4qoFVmvKOs8heWweY61a3J2L+2OGeCKhNeIrID838K8/piBIz/obhh22GGklcWVA==', CAST(N'2022-10-14T16:10:07.2444064' AS DateTime2), CAST(N'2022-10-13T16:10:07.2444067' AS DateTime2), CAST(N'2022-10-13T16:10:44.7422913' AS DateTime2), N'zRGAb6SYoBXQ1Bq6/rM/2sGmnLZPyKDh1b6hjF0djB6i58BexFttVaV0ChSdokZ5AvSna7aUP+LFvw61aYzGfQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1290, N'zRGAb6SYoBXQ1Bq6/rM/2sGmnLZPyKDh1b6hjF0djB6i58BexFttVaV0ChSdokZ5AvSna7aUP+LFvw61aYzGfQ==', CAST(N'2022-10-14T16:10:44.7422869' AS DateTime2), CAST(N'2022-10-13T16:10:44.7422872' AS DateTime2), CAST(N'2022-10-13T16:11:15.7917353' AS DateTime2), N'dnuJRRAcJ7j4DAVLKJtJD5uv7wOWDpK8YIePhC3lvS9IZ8z3xpWlnS/odY6oe42v5fY60EmfJ1WtvgeL/XfzuA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1291, N'dnuJRRAcJ7j4DAVLKJtJD5uv7wOWDpK8YIePhC3lvS9IZ8z3xpWlnS/odY6oe42v5fY60EmfJ1WtvgeL/XfzuA==', CAST(N'2022-10-14T16:11:15.7917336' AS DateTime2), CAST(N'2022-10-13T16:11:15.7917338' AS DateTime2), CAST(N'2022-10-13T16:13:02.1979830' AS DateTime2), N'lcRQEvn9ock2bLqlaogSOBr2YuLRFNjYr0TIElXp5mUBmKYgtmRUfmCgb5Rwn36dKjka4amqbS+A/sj465LNcw==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1292, N'lcRQEvn9ock2bLqlaogSOBr2YuLRFNjYr0TIElXp5mUBmKYgtmRUfmCgb5Rwn36dKjka4amqbS+A/sj465LNcw==', CAST(N'2022-10-14T16:13:02.1979812' AS DateTime2), CAST(N'2022-10-13T16:13:02.1979819' AS DateTime2), CAST(N'2022-10-13T16:13:20.1585609' AS DateTime2), N'2LMPttvqJY24YVuro88QYuVecqnln8X9Pqrm2SFHFEHkOqev2SKccg+GQia8QfnnLBwrKmyvAs9OKpo97gnH/g==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1293, N'2LMPttvqJY24YVuro88QYuVecqnln8X9Pqrm2SFHFEHkOqev2SKccg+GQia8QfnnLBwrKmyvAs9OKpo97gnH/g==', CAST(N'2022-10-14T16:13:20.1585586' AS DateTime2), CAST(N'2022-10-13T16:13:20.1585590' AS DateTime2), CAST(N'2022-10-13T16:13:30.6974371' AS DateTime2), N'mYZv5Y+dp+mcLaLfbZpPWJ5Q0DI/slui2b72w8M9g+5y/9AApp5naEJuIuHzEiyOmA2CPEW37Vvf2ndWsx224Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1294, N'mYZv5Y+dp+mcLaLfbZpPWJ5Q0DI/slui2b72w8M9g+5y/9AApp5naEJuIuHzEiyOmA2CPEW37Vvf2ndWsx224Q==', CAST(N'2022-10-14T16:13:30.6974354' AS DateTime2), CAST(N'2022-10-13T16:13:30.6974360' AS DateTime2), CAST(N'2022-10-13T16:13:33.1129797' AS DateTime2), N'xaVQ8oQNe/z0DJh62Cxjb7IsN1GyWI2ZHViJwTGUkjEw1vuxiSoVJCVqcsWC88DVtsYnV38DByQ+DN4veloBLA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1295, N'xaVQ8oQNe/z0DJh62Cxjb7IsN1GyWI2ZHViJwTGUkjEw1vuxiSoVJCVqcsWC88DVtsYnV38DByQ+DN4veloBLA==', CAST(N'2022-10-14T16:13:33.1129784' AS DateTime2), CAST(N'2022-10-13T16:13:33.1129786' AS DateTime2), CAST(N'2022-10-13T16:14:02.3457976' AS DateTime2), N'peWXpLJX4bTqUWiVcBPNjdo3al3fZv54DADcB5LK7Vtb+6ofcG3mpOP5bKY30DVfZqdxMoVhAucRGH/vlpU9WA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1296, N'peWXpLJX4bTqUWiVcBPNjdo3al3fZv54DADcB5LK7Vtb+6ofcG3mpOP5bKY30DVfZqdxMoVhAucRGH/vlpU9WA==', CAST(N'2022-10-14T16:14:02.3457945' AS DateTime2), CAST(N'2022-10-13T16:14:02.3457954' AS DateTime2), CAST(N'2022-10-13T16:20:11.6111385' AS DateTime2), N'X/zC6rdaR0k/1ZQcIocdKF2k4GArZxEGiJK19yCLH0k5mscv4rRxqFduEXTV86bQlmx+4HJVMrAHR/70NGf7zg==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1297, N'X/zC6rdaR0k/1ZQcIocdKF2k4GArZxEGiJK19yCLH0k5mscv4rRxqFduEXTV86bQlmx+4HJVMrAHR/70NGf7zg==', CAST(N'2022-10-14T16:20:11.6111359' AS DateTime2), CAST(N'2022-10-13T16:20:11.6111363' AS DateTime2), CAST(N'2022-10-13T16:21:05.8859750' AS DateTime2), N'A9odIiCzfi5aWbp9kKFSJoPs7cMta2WDHmu6S4idb+WteiICpz/fWdl4MHjJ2S+/pb/JDds+ce5L/Sk76YilUA==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1298, N'A9odIiCzfi5aWbp9kKFSJoPs7cMta2WDHmu6S4idb+WteiICpz/fWdl4MHjJ2S+/pb/JDds+ce5L/Sk76YilUA==', CAST(N'2022-10-14T16:21:05.8859719' AS DateTime2), CAST(N'2022-10-13T16:21:05.8859724' AS DateTime2), CAST(N'2022-10-13T16:25:50.6728915' AS DateTime2), N'M89t7epuRRWxbgvw8vYYTlrd3ERBH2TvlQTGJgoz3e4VlSjYMieFIcRiKuBLWKoEIY4uLjmf2NRKVDCTZkPn/Q==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1299, N'M89t7epuRRWxbgvw8vYYTlrd3ERBH2TvlQTGJgoz3e4VlSjYMieFIcRiKuBLWKoEIY4uLjmf2NRKVDCTZkPn/Q==', CAST(N'2022-10-14T16:25:50.6728898' AS DateTime2), CAST(N'2022-10-13T16:25:50.6728901' AS DateTime2), CAST(N'2022-10-13T16:32:34.0231768' AS DateTime2), N'tGQugnbU5qXP44PxW8l0oOv12kQ88fJ1zl8ghE/RKmFTPhlyPQLb/37r7DY3aEAa8HIDMUGJzjLpTAa00T9HuQ==', N'Replaced by new token', N'quyen.tran')
INSERT [dbo].[RefreshToken] ([ID], [Token], [Expires], [CreatedTime], [RevokedTime], [ReplacedByToken], [ReasonRevoked], [UserAccount]) VALUES (1300, N'tGQugnbU5qXP44PxW8l0oOv12kQ88fJ1zl8ghE/RKmFTPhlyPQLb/37r7DY3aEAa8HIDMUGJzjLpTAa00T9HuQ==', CAST(N'2022-10-14T16:32:34.0231749' AS DateTime2), CAST(N'2022-10-13T16:32:34.0231752' AS DateTime2), NULL, NULL, NULL, N'quyen.tran')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
