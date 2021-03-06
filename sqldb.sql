USE [master]
GO
/****** Object:  Database [Manage_News]    Script Date: 7/5/2018 7:03:22 AM ******/
CREATE DATABASE [Manage_News]
GO
ALTER DATABASE [Manage_News] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manage_News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manage_News] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manage_News] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manage_News] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manage_News] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manage_News] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manage_News] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Manage_News] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manage_News] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manage_News] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manage_News] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manage_News] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manage_News] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manage_News] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manage_News] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manage_News] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Manage_News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manage_News] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manage_News] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manage_News] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manage_News] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manage_News] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manage_News] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manage_News] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Manage_News] SET  MULTI_USER 
GO
ALTER DATABASE [Manage_News] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manage_News] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manage_News] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manage_News] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Manage_News] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Manage_News]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblComment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentId] [bigint] NULL,
	[News] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Email] [varchar](64) NULL,
	[PhoneNumber] [varchar](64) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__tblComme__3214EC078975A96B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGroup]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGroup](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Creators] [int] NULL,
	[ParentId] [smallint] NULL,
	[Title] [nvarchar](1024) NOT NULL,
	[Describe] [nvarchar](1024) NULL,
	[Icon] [varchar](512) NOT NULL,
	[Status] [smallint] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__tblGroup__3214EC0714170034] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Creators] [int] NULL,
	[Img] [varchar](512) NOT NULL,
	[ImgResizer] [varchar](512) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Creators] [int] NOT NULL,
	[Group] [smallint] NOT NULL,
	[Titles] [nvarchar](1024) NOT NULL,
	[Describe] [nvarchar](1024) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Img] [varchar](512) NULL,
	[ImgResizer] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[Position] [smallint] NULL,
	[Order] [smallint] NULL,
	[View] [int] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__tblNews__3214EC075CA48ACB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSupport]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSupport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Creators] [int] NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
	[GradeLevel] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NOT NULL,
	[TimeExpected] [datetime2](7) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblSupport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/5/2018 7:03:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Creators] [int] NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Img] [varchar](512) NULL,
	[ImgResizer] [varchar](512) NULL,
	[Status] [smallint] NOT NULL,
	[Decentralize] [smallint] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblGroup] ON 

INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (1, NULL, -1, N'Du học Nhật Bản', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (2, NULL, -1, N'Du học Đức', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (3, NULL, -1, N'Du học Hàn Quốc', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (4, NULL, -1, N'Du học Đài Loan', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (5, NULL, -1, N'Du học Canada', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (6, NULL, -1, N'Việc làm nước ngoài', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblGroup] ([Id], [Creators], [ParentId], [Title], [Describe], [Icon], [Status], [CreateDate], [ModifyDate]) VALUES (7, NULL, -1, N'Visa quốc tế', NULL, N'Uploads/images/images/post/slider/1.jpg', 1, CAST(N'2018-07-02 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-02 00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblGroup] OFF
SET IDENTITY_INSERT [dbo].[tblNews] ON 

INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (6, 0, 1, N'Trường đại học DAEGU HAANY tuyển sinh', N'TRƯỜNG ĐẠI HỌC DAEGU HAANY Địa chỉ: 1 Haanydaero, Gyeongsan, Gyeongsanbuk, South Korea', N'<p>Đại học Daegu Haany được th&agrave;nh lập năm 1980 như l&agrave; một viện gi&aacute;o dục đại học trọng điểm của khu vực, tập trung v&agrave;o việc bồi dưỡng t&agrave;i năng cho cộng đồng.Để đ&aacute;p lại sự thay đổi to&agrave;n cầu h&oacute;a, trường đại học n&agrave;y tập trung v&agrave;o việc gi&aacute;o dục những người t&agrave;i năng c&oacute; kỹ năng to&agrave;n cầu bằng c&aacute;ch điều chỉnh chủ động mục ti&ecirc;u gi&aacute;o dục v&agrave; hướng tới m&ocirc; h&igrave;nh to&agrave;n cầu h&oacute;a.Để đ&agrave;o tạo những t&agrave;i năng n&agrave;y tr&ecirc;n thế giới v&agrave; cộng đồng, trường đại học n&agrave;y đ&atilde; cải c&aacute;ch chương tr&igrave;nh học của m&igrave;nh th&agrave;nh một c&ocirc;ng nghệ sinh học (BT), c&ocirc;ng nghệ văn ho&aacute; (CT) v&agrave; c&ocirc;ng nghệ th&ocirc;ng tin (IT) v&agrave; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu chuy&ecirc;n ng&agrave;nh.Trường đại học n&agrave;y cũng cung cấp c&aacute;c chương tr&igrave;nh gi&aacute;o dục kh&ocirc;ng gian mạng cho những sinh vi&ecirc;n muốn học qua mạng. Trường đại học n&agrave;y sẽ c&oacute; một viện gi&aacute;o dục đại học lớn để ph&aacute;t triển kh&ocirc;ng chỉ với cộng đồng địa phương m&agrave; c&ograve;n cho cộng đồng quốc gia v&agrave; quốc tế về sức khoẻ v&agrave; sự thịnh vượng của con người.</p>
', N'/Uploads/images/univercity/medicine2.png', N'/Uploads/_thumbs/images/univercity/medicine2.png', NULL, NULL, 1, 34, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-02 20:43:07.4344325' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (7, 1, 3, N'Trường đại học SILLA', N'Địa chỉ: 140 Baekgyang-taero, 700 ( chilbaek ) be, Sasang-ku, Busan, Hàn Quốc, Busan, Busan', N'<h2><strong>GIỚI THIỆU VỀ TRƯỜNG ĐẠI HỌC SILLA</strong></h2><ul>	<li>Địa chỉ: 140 Baekgyang-taero, 700 ( chilbaek ) be, Sasang-ku, Busan, H&agrave;n Quốc, Busan, Busan</li>	<li>Thời gian nhập học: Th&aacute;ng 9,12</li>	<li>K&yacute; t&uacute;c x&aacute;: C&oacute;</li>	<li>Trang chủ:<a href="http://www.silla.ac.kr/">http://www.silla.ac.kr</a></li></ul><p>Qu&aacute; tr&igrave;nh đ&agrave;o tạo tiếng h&agrave;n của trung t&acirc;m giữ vững trọng t&acirc;m tập trung v&agrave;o h&igrave;nh th&agrave;nh khả năng thống nhất ng&ocirc;n ngữ của học vi&ecirc;n trong qu&aacute; tr&igrave;nh 20 tuần tương đương với 200 giờ đạo tạo tiếng h&agrave;n tại trung t&acirc;m. Đ&acirc;y l&agrave; qu&aacute; tr&igrave;nh d&agrave;nh cho c&aacute;c học vi&ecirc;n c&oacute; nguyện vọng v&agrave;o học đại học v&agrave; sau đại học tại trường ch&uacute;ng t&ocirc;i.</p><h2>Nội dung qu&aacute; tr&igrave;nh đ&agrave;o tạo đại học Silla</h2><table style="width:847px">	<thead>		<tr>			<td colspan="3"><strong>Ph&acirc;n loại</strong></td>			<td><strong>Đối tượng học tập</strong></td>			<td><strong>Thời gian học</strong></td>			<td><strong>Giai đoạn</strong></td>			<td><strong>Ghi ch&uacute;</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td rowspan="3"><strong>Đ&agrave;o tạo ch&iacute;nh quy</strong></td>			<td colspan="2"><strong>Đ&agrave;o tạo tiếng H&agrave;n ch&iacute;nh quy</strong></td>			<td>Du học sinh đ&agrave;o tạo ch&iacute;nh quy</td>			<td>20 tuần ( 400 giờ )</td>			<td>5 bậc (sơ-trung-cao cấp)</td>			<td>Mỗi học kỳ</td>		</tr>		<tr>			<td rowspan="2"><strong>Chương tr&igrave;nh v&agrave; tiết học đặc biệt</strong></td>			<td><strong>Luyện thi TOPIK</strong></td>			<td>Du học sinh đ&agrave;o tạo ch&iacute;nh quy</td>			<td>20 tuần,( 1 tuần 2 buổi=4 giờ )</td>			<td>Cấp 1~cấp 5</td>			<td>Trong học kỳ</td>		</tr>		<tr>			<td><strong>Học viết</strong></td>			<td>Du học sinh đ&agrave;o tạo ch&iacute;nh quy</td>			<td>2 tuần ( 1 buổi/1 tuần= 2 giờ)</td>			<td>Cấp 1 ~ cấp 5</td>			<td>Trong học k&igrave;</td>		</tr>		<tr>			<td rowspan="2"><strong>Kh&oacute;a họcđặc biệt</strong></td>			<td colspan="2"><strong>Kh&oacute;a học tiếng H&agrave;n ngắn hạn</strong></td>			<td>Người&nbsp; nước ngo&agrave;i cư tr&uacute; ngắn hạn</td>			<td>4 tuần ( 80 giờ )</td>			<td>2 giai đoạn( sơ.trung cấp )</td>			<td>Trong kỳ nghỉ</td>		</tr>		<tr>			<td colspan="2"><strong>Kh&oacute;a học văn h&oacute;a H&agrave;n Quốc ngắn hạn</strong></td>			<td>Người&nbsp; nước ngo&agrave;i cư tr&uacute; ngắn hạn</td>			<td>1 tuần ( 20 giờ )</td>			<td>1 giai đoạn</td>			<td>Thỉnh thoảng</td>		</tr>	</tbody></table><p>&nbsp;</p><h2>Lịch học</h2><table style="width:847px">	<thead>		<tr>			<td><strong>Học k&igrave;</strong></td>			<td><strong>Thời gian</strong></td>			<td><strong>Tổng số giờ học</strong></td>			<td><strong>Thời gian tiết học</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td><strong>Học k&igrave; 1</strong></td>			<td>Đầu th&aacute;ng 3 đến giữa th&aacute;ng 7 ( 20 tuần )</td>			<td>20 tuần ( tổng 400 giờ )</td>			<td>20 giờ/ tuần</td>		</tr>		<tr>			<td><strong>Học k&igrave; 2</strong></td>			<td>Đầu th&aacute;ng 9 đến giữa th&aacute;ng 1 ( 20 tuần )</td>			<td>20 tuần ( tổng 400 giờ )</td>			<td>20 giờ/tuần</td>		</tr>	</tbody></table><p><strong>&nbsp;</strong></p><h2>Thời kh&oacute;a biểu</h2><table style="width:847px">	<thead>		<tr>			<td><strong>Thời gian</strong></td>			<td><strong>Thứ hai</strong></td>			<td><strong>Thứ ba</strong></td>			<td><strong>Thứ tư</strong></td>			<td><strong>Thứ năm</strong></td>			<td><strong>Thứ s&aacute;u</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td><strong>09:00~11:00</strong></td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Học ch&iacute;nh kh&oacute;a</td>		</tr>		<tr>			<td><strong>11:00~13:00</strong></td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Luyện thi TOPIK</td>			<td>Học ch&iacute;nh kh&oacute;a</td>			<td>Luyện thi TOPIK</td>			<td>Học ch&iacute;nh kh&oacute;a</td>		</tr>		<tr>			<td><strong>13:00~14:00</strong></td>			<td colspan="5">Thời gian nghỉ trưa</td>		</tr>		<tr>			<td><strong>14:00~16:00</strong></td>			<td>&nbsp;</td>			<td>&nbsp;</td>			<td>Học viết</td>			<td>&nbsp;</td>			<td>&nbsp;</td>		</tr>	</tbody></table><p>&nbsp;</p><h2>Trải nghiệm văn h&oacute;a<img alt="dai-hoc-silla" src="http://duhochana.com.vn/wp-content/uploads/2016/11/silla.jpg" style="height:452px; width:700px" /></h2><ol>	<li>Tham quan Busan. Kyungju.</li>	<li>Trải nghiệm 2 ng&agrave;y 1 đ&ecirc;m</li>	<li>L&agrave;m đồănH&agrave;n Quốc (Kimchi, bibimbap. Songpyeon, ttokbokki ho&agrave;ng cung, japche)</li>	<li>Trải nghiệm văn h&oacute;a truyền thống (mặc &aacute;o Hanbok, nghi thức truyền thống H&agrave;n Quốc, tr&agrave; đạo)</li>	<li>Học samulnori</li>	<li>Học taekwondo</li>	<li>Xem biển diễn văn h&oacute;a</li>	<li>Kiến tập c&aacute;c doanh nghiệp</li>	<li>Học c&ocirc;ng nghệ l&agrave;m giấy</li></ol><h2>&nbsp;Trợ gi&uacute;p học tiếng H&agrave;n</h2><h3><strong>C&aacute;c hoạt động hỗ trợ</strong></h3><ol>	<li>Tạo cơ hội giao lưu v&agrave; kết bạn với c&aacute;c bạn du học sinh nước ngo&agrave;i, trải nghiệm văn h&oacute;a nước ngo&agrave;i</li>	<li>Được cấp chứng chỉ hoạt động x&atilde; hội, văn học H&agrave;n Quốc v&agrave; Anh quốc. ( được cấp bởi viện trưởng trung t&acirc;m tiếng h&agrave;n đại học Silla</li></ol><h2>TH&Ocirc;NG TIN HỌC PH&Iacute;</h2><p>( 1 học k&igrave; : 20 tuần/&nbsp; theo ti&ecirc;u chuẩn năm 2015 )</p><table style="width:847px">	<thead>		<tr>			<td><strong>Ph&acirc;n loại</strong></td>			<td><br />			<strong>học ph&iacute;</strong></td>			<td><strong>Thời gian học</strong></td>			<td><strong>Ghi ch&uacute;</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td><strong>Chi ph&iacute; đ&agrave;o tạo</strong></td>			<td>2,300,000</td>			<td>1 học k&igrave; : 20 tuần</td>			<td>Nộp khi nhập học</td>		</tr>	</tbody></table><p>Để biết th&ecirc;m th&ocirc;ng tin chi tiết xin vui l&ograve;ng truy cập v&agrave;o trang giao lưu quốc tế v&agrave; trang chủ k&iacute; t&uacute;c x&aacute; trường đại học Silla</p><h2>TH&Ocirc;NG TIN TRƯỜNG ĐẠI HỌC TRƯỜNG ĐẠI HỌC SILLA</h2><p>+ Trường Đại học Silla l&agrave; một trong số những&nbsp;<strong>trường đại học ở H&agrave;n Quốc</strong>&nbsp;danh tiếng được sinh vi&ecirc;n chọn nhiều nhất, với chất lượng giảng dạy h&agrave;ng đầu v&agrave; được Ch&iacute;nh phủ H&agrave;n Quốc t&agrave;i trợ v&agrave;o việc đầu tư trang thiết bị gi&aacute;o dục tốt v&agrave; hiện đại bậc nhất.</p><p>+ Trường Đại học Silla bao gồm 7 trường Đại học với c&aacute;c khoa v&agrave; chuy&ecirc;n ng&agrave;nh kh&aacute;c nhau c&aacute;c bạn sinh vi&ecirc;n c&oacute; thể lựa chọn theo sở th&iacute;ch v&agrave; khả năng của m&igrave;nh.</p><p>+ Hiện đang tại c&oacute; 40 quốc gia đang theo học tại trường v&agrave; 3 năm li&ecirc;n tiếp trường được chọn để đ&agrave;o tạo c&aacute;c học sinh nhận học bổng của Ch&iacute;nh phủ H&agrave;n Quốc.</p><p><strong>KH&Oacute;A HỌC NG&Ocirc;N NGỮ</strong></p><p>D&agrave;i hạn th&aacute;ng 6</p><p>D&agrave;i hạn th&aacute;ng 12</p><p>THỜI LƯỢNG TIẾT HỌC</p><p>4 tiết/ 1 ng&agrave;y</p><p><strong>HỌC PH&Iacute; CHI TIẾT</strong></p><table style="width:847px">	<thead>		<tr>			<td><strong>Kh&oacute;a học</strong></td>			<td><strong>Ph&iacute; x&eacute;t duyệt</strong></td>			<td><strong>Học ph&iacute;</strong></td>			<td><strong>K&yacute; t&uacute;c x&aacute;</strong></td>			<td><strong>Gi&aacute;o tr&igrave;nh</strong></td>			<td><strong>Ph&iacute; cơ sở</strong></td>			<td><strong>Chi ph&iacute; kh&aacute;c</strong></td>			<td><strong>Tổng</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td>1 năm</td>			<td>60,000 Won</td>			<td>4,600,000 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>4,660,000 Won</td>		</tr>		<tr>			<td>6 th&aacute;ng</td>			<td>60,000 Won</td>			<td>2,300,000 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>0 Won</td>			<td>2,360,000 Won</td>		</tr>	</tbody></table><h2>HỒ SƠ V&Agrave; ĐIỀU KIỆN ĐĂNG K&Yacute; NHẬP HỌC ĐẠI HỌC SILLA</h2><h3><strong>Điều kiện đăng k&iacute; nhập học</strong></h3><ol>	<li>Tốt nghiệp ch&iacute;nh quy THPT trở l&ecirc;n<br />	(th&iacute;sinh muốn đăng k&iacute; học Thạc sĩ phải c&oacute; bằng Cử nh&acirc;n v&agrave; th&iacute; sinh muốn học Tiến sĩ phải c&oacute; học h&agrave;m Thạc sĩ)</li>	<li>Học vi&ecirc;n muốn đăng k&iacute; học phải c&oacute; TOPIK cấp 3 trở l&ecirc;n</li>	<li>Đối với trường hợp học vi&ecirc;n đăng k&iacute; khoa quốc tế chuy&ecirc;n ng&agrave;nh H&agrave;n Quốc học phải c&oacute; chứng chỉ tiếng anh quốc tế tương ứng TOEFL 550, CBT 210, IBT 80, IELTS 5.5, TEPS550 ( ri&ecirc;ng đối với c&aacute;c ứng vi&ecirc;n c&oacute; tiếng mẹ để l&agrave; tiếng anh th&igrave; kh&ocirc;ng cần )</li>	<li>C&aacute;c học vi&ecirc;n của trường đạt được TOPIK cấp 4 trở l&ecirc;n th&igrave; mới c&oacute; thể tốt nghiệp. (ri&ecirc;ngđối với c&aacute;c sinh vi&ecirc;n khoa quốc tế chuy&ecirc;n ng&agrave;nh H&agrave;n quốc học kh&ocirc;ng cần TOPIK cấp 4)</li></ol><p>C&aacute;c th&iacute; sinh đăng k&iacute; v&agrave;o sau đại học Silla phải c&oacute; TOPIK cấp 3 trở l&ecirc;n v&agrave; chứng chỉ tiếng anh.</p><p>Dưới đ&acirc;y l&agrave; một số y&ecirc;u cầu chung m&agrave; tối thiểu th&iacute; sinh phải đ&aacute;p ứng được 1 trong 3 điều kiện</p><h3><strong>Y&ecirc;u cầu chung</strong></h3><table style="width:847px">	<thead>		<tr>			<td><strong>&nbsp;</strong><strong>STT</strong></td>			<td><strong>Y&ecirc;u cầu</strong></td>			<td><strong>Giải th&iacute;ch</strong></td>			<td><strong>Điều kiện</strong></td>			<td><strong>Ghi ch&uacute;</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td><strong>1</strong></td>			<td>L&agrave; người nước ngo&agrave;i ch&iacute;nh gốc</td>			<td>Cả bố mẹ v&agrave; th&iacute; sinh đều l&agrave; người c&oacute; quốc tịch nước ngo&agrave;i</td>			<td>Đ&atilde; tốt nghiệp THPT ở trong hoặc ngo&agrave;i nước</td>			<td>&nbsp;</td>		</tr>		<tr>			<td><strong>2</strong></td>			<td>L&agrave; người nước ngo&agrave;i đ&atilde; ho&agrave;n th&agrave;nh to&agrave;n bộ qu&aacute; tr&igrave;nh gi&aacute;o dục ch&iacute;nh quy</td>			<td>Phải c&oacute; quốc tịch nước ngo&agrave;i v&agrave; ho&agrave;n th&agrave;nh to&agrave;n bộ gi&aacute;o dục tiểu học, trung học v&agrave; trung học phổ th&ocirc;ng tại nước ngo&agrave;i. ( kh&ocirc;ng li&ecirc;n quan đến quốc tịch của bố mẹ )</td>			<td>L&agrave; người đ&atilde; ho&agrave;n th&agrave;nh to&agrave;n bộ hệ thống gi&aacute;o dục 12 năm ở nước ngo&agrave;i ( tiểu học, trung học v&agrave; trung học phổ th&ocirc;ng )</td>			<td>Chấp nhận đối với trường hợp ho&agrave;n th&agrave;nh thết hệ thống gi&aacute;o học phổ th&ocirc;ng ở c&aacute;c quốc gia c&oacute; bậc học 11(10) năm</td>		</tr>		<tr>			<td><strong>3</strong></td>			<td>Những y&ecirc;u cầu kh&aacute;c</td>			<td>Đối với c&aacute;c th&iacute; sinh người nước ngo&agrave;i kh&ocirc;ng đủ hai y&ecirc;u cầu tr&ecirc;n</td>			<td>Người đ&atilde; ho&agrave;n th&agrave;nh hệ thống gi&aacute;o dục phổ th&ocirc;ng ở trong hoặc ngo&agrave;i nước</td>			<td>Một v&agrave;i người ( t&ugrave;y theo số sinh vi&ecirc;n mỗi năm, c&oacute; 100 ứng vi&ecirc;n th&igrave; số lượng ưu ti&ecirc;n kh&ocirc;ng thể qu&aacute; 2 người)</td>		</tr>	</tbody></table><p>(kh&ocirc;ng chấp nhận c&aacute;c ứng vi&ecirc;n c&oacute; hai quốc tịch hoặc kh&ocirc;ng quốc tịch )</p><h3><strong>Hồ sơ nhập học đại học Silla</strong></h3><table style="width:847px">	<thead>		<tr>			<td><strong>&nbsp;</strong><strong>STT</strong></td>			<td><strong>Ứng vi&ecirc;n học đại học / cao học ( visa D-2)</strong></td>			<td><strong>Ứng vi&ecirc;n học tiếng h&agrave;n ( visa D-4)</strong></td>		</tr>	</thead>	<tbody>		<tr>			<td><strong>1</strong></td>			<td>Đơn đăng k&iacute; nhập học( bằng c&aacute;ch tải về tr&ecirc;n trang chủ giao lưu quốc tế )</td>			<td>Đơn đăng k&iacute; nhập học( bằng c&aacute;ch tải về tr&ecirc;n trang chủ giao lưu quốc tế )</td>		</tr>		<tr>			<td><strong>2</strong></td>			<td>Bản gốc bằng tốt nghiệp THPT ( giấy chứng nhận tốt nghiệp tạm thời )*cần c&oacute; x&aacute;c nhận Apostille</td>			<td>Bản gốc bằng tốt nghiệp THPT( giấy chứng nhận tốt nghiệp tạm thời)*cần c&oacute; x&aacute;c nhận apostille</td>		</tr>		<tr>			<td><strong>3</strong></td>			<td>Đối với th&iacute; sinh đ&atilde; tốt nghiệp đại học: bằng tốt nghiệp ( tạm thời ) , giấy chứng nhận tr&igrave;nh độ học vấn bản gốcĐối với sinh vi&ecirc;n đang theo học: bản gốc giấy chứng nhận sinh vi&ecirc;n			<p>*cần c&oacute; x&aacute;c nhận Apostille</p>			</td>			<td>Đối với th&iacute; sinh đ&atilde; tốt nghiệp đại học: bằng nhận tốt nghiệp đại học ( tạm thời ), giấy chứng nhận tr&igrave;nh độ học vấn bản gốcĐối với sinh vi&ecirc;n đang theo học: bản gốc giấy chứng nhận sinh vi&ecirc;n			<p>*cần c&oacute; x&aacute;c nhận Apostille</p>			</td>		</tr>		<tr>			<td><strong>4</strong></td>			<td>Bản gốc kết quả học tập tại đại học &ndash; đối với cả th&iacute; sinh đang theo học, đ&atilde; tốt nghiệp đại học</td>			<td>Bản gốc kết quả học tập tại đại học- đối với cả th&iacute; sinh đang theo học, đ&atilde; tốt nghiệp đại học</td>		</tr>		<tr>			<td><strong>5</strong></td>			<td>Bản gốc giấy chứng nhận số dư t&agrave;i khoản ng&acirc;n h&agrave;ng ( t&agrave;i khoản c&aacute; nhận hoặc bố mẹ phải c&oacute; số tiền tương đương với 13.000 đ&ocirc; la mỹ c&aacute;ch đ&acirc;y &iacute;t nhất 6 th&aacute;ng)</td>			<td>Bản gốc giấy chứng nhận số dư t&agrave;i khoản ng&acirc;n h&agrave;ng ( t&agrave;i khoản c&aacute; nh&acirc;n hoặc của bố mẹ phải c&oacute; số tiền tương đương 5000 đ&ocirc; la mỹ c&aacute;ch đ&acirc;y &iacute;t nhất 6 th&aacute;ng )</td>		</tr>		<tr>			<td><strong>6</strong></td>			<td>Bản gốc giấy chứng nhận thu nhập việc l&agrave;m hiện tại của bố mẹ ( chức vị, thu nhập, địa chỉ c&ocirc;ng t&aacute;c, số điện thoại nơi l&agrave;m việc, c&oacute; x&aacute;c nhận của nơi l&agrave;m việc )*trong trường hợp bố mẹ c&oacute; c&ocirc;ng ty ri&ecirc;ng, cần nộp giấy chứng nhận kinh doanh, t&agrave;i sản v&agrave; giấy tờ thuế để thay thế</td>			<td>Bản gốc giấy chứng nhận thu nhập việc l&agrave;m hiện tại của bố mẹ ( chức vị, thu nhập, địa chỉ c&ocirc;ng t&aacute;c, số điện thoại nơi l&agrave;m việc, c&oacute; x&aacute;c nhận của nơi l&agrave;m việc )*trong trường hợp bố mẹ c&oacute; c&ocirc;ng ty ri&ecirc;ng, cần nộp giấy chứng nhận kinh doanh, t&agrave;i sản v&agrave; giấy tờ thuế để thay thế</td>		</tr>		<tr>			<td><strong>7</strong></td>			<td>Giấy chứng nhận quan hệ gia đ&igrave;nh</td>			<td>Giấy chứng nhận quan hệ gia đ&igrave;nh</td>		</tr>		<tr>			<td><strong>8</strong></td>			<td>Bản sao chứng minh thư nh&acirc;n d&acirc;n ( bố mẹ v&agrave; bản th&acirc;n )</td>			<td>Bản sao chứng minh thư nh&acirc;n d&acirc;n ( cả gia đ&igrave;nh)</td>		</tr>		<tr>			<td><strong>9</strong></td>			<td>Giấy kh&aacute;m sức khỏe ( được cấp tại bệnh viện, bao gồm x&eacute;t nghiệm vi&ecirc;m gan B v&agrave; m&aacute;u )</td>			<td>Giấy kh&aacute;m sức khỏe ( cấp tại bệnh viện. bao gồm x&eacute;t nghiệm vi&ecirc;m gan B v&agrave; m&aacute;u )</td>		</tr>		<tr>			<td><strong>10</strong></td>			<td>Kế hoạch du học ( viết theo h&igrave;nh thức tự do, bao gồm giới thiệu bản th&acirc;n v&agrave; bản thảo kế hoạch học tập, biết bằng tiếng h&agrave;n v&agrave; tiếng việt, mỗi c&aacute;i 1 bản )</td>			<td>Kế hoạch du học ( viết theo h&igrave;nh thức tự do, bao gồm giới thiệu bản th&acirc;n v&agrave; bản thảo kế hoạch học tập, biết bằng tiếng h&agrave;n v&agrave; tiếng anh, mỗi c&aacute;i 1 bản )</td>		</tr>		<tr>			<td><strong>11</strong></td>			<td>5 ảnh 4*5( ph&ocirc;ng nền trắng )</td>			<td>5 ảnh 4*5( ph&ocirc;ng nền trắng )</td>		</tr>		<tr>			<td><strong>12</strong></td>			<td>Bản sao hộ chiếu</td>			<td>Bản sao hộ chiếu</td>		</tr>		<tr>			<td><strong>13</strong></td>			<td>Đối với trường hợp người cư tr&uacute; tại H&agrave;n quốc phải nộp th&ecirc;m giấy chứng nhận người ngoại quốc</td>			<td>Bản sao hộ chiếu</td>		</tr>		<tr>			<td><strong>14</strong></td>			<td>Bản gốc giấy chứng nhận TOPIK cấp 3 trở l&ecirc;n<br />			*đối với c&aacute;c sinh vi&ecirc;n khoa H&agrave;n Quốc học cần phải c&oacute; bản gốc giấy chứng nhận năng lực tiếng anh tương đương TOEFL 550, CBT 210, IBT 80, IELTS 5.5, TEPS 550 ( đối với trường hợp tiếng mẹ đẻ l&agrave; tiếng anh th&igrave; kh&ocirc;ng cần )</td>			<td>&nbsp;</td>		</tr>		<tr>			<td><strong>15</strong></td>			<td>Giấy bảo l&atilde;nh nh&acirc;n th&acirc;n của người H&agrave;n ( ghi r&otilde; quan hệ với người nhập học v&agrave; chi ph&iacute; du học ), giấy chứng nhận thu nhập c&aacute; nh&acirc;n của người H&agrave;n bảo l&atilde;nh ( ghi r&otilde; số điện thoại v&agrave; địa chỉ nơi l&agrave;m việc )*nếu cần ( viết bằng tiếng h&agrave;n )</td>			<td>&nbsp;</td>		</tr>		<tr>			<td><strong>16</strong></td>			<td>Ph&iacute; nhập học 50.000 won ( nộp v&agrave;o t&agrave;i khoản cố định )</td>			<td>&nbsp;</td>		</tr>	</tbody></table><p>&nbsp;</p><h3><strong>Tr&igrave;nh tự nhập học</strong></h3><ol>	<li>Th&iacute; sinh nộp hồ sơ đăng k&iacute; v&agrave;o trang giao lưu quốc tế của trường đại học Silla</li>	<li>Nguyện vọng nhập học</li>	<li>Kết quả tr&uacute;ng tuyển sẽ được gửi v&agrave;o h&ograve;m thưc&aacute; nh&acirc;n của th&iacute; sinh, th&iacute; sinh tr&uacute;ng tuyển phải nộp học ph&iacute; v&agrave;o t&agrave;i khoản của nh&agrave; trường trong thời gian quy định</li>	<li>Sau khi x&aacute;c nhận đ&atilde; đ&oacute;ng đầy đủ học ph&iacute;, nh&agrave; trường sẽ gửi giấy b&aacute;o nhập học đến sinh vi&ecirc;n</li>	<li>Th&iacute; sinh đến đại sứ qu&aacute;n H&agrave;n Quốc tại quốc để xin cấp Visa (nộp giấy tuyển sinh, hộ chiếu, v&agrave; một số giấy tờ kh&aacute;c)</li>	<li>Sau khi nhận được Visa, th&iacute; sinh tr&uacute;ng tuyển nhập học v&agrave;o trường theođ&uacute;ng thời gian quy định</li></ol>', N'/Uploads/images/univercity/silla-696x535.png', N'/Uploads/images/univercity/silla-696x535.png', 1, 1, 1, 0, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (8, 1, 1, N'Kinh nghiệm chuẩn bị đồ dùng khi sang Nhật du học kì 1 tháng 10/2018', N'Bạn đã hoàn tất mọi thủ tục từ hộ chiếu cho đến visa, chuẩn bị tốt các kĩ năng ngôn ngữ cũng như kĩ năng sống để đi du học Nhật Bản. Giờ bạn chỉ phải chuẩn bị một số đồ dùng mang theo. Nhưng bạn còn đắn đo không biết nên mang gì mà không nên mang theo gì. Hãy đọc bài viết này, Du học 2T chắc chắn nó sẽ có ích cho bạn.', N'<p>Với nhiều năm l&agrave;m việc trong lĩnh vực tư vấn du học cũng như đ&atilde; từng trải qua nhiều năm học tập v&agrave; l&agrave;m việc tại Nhật Bản,&nbsp;<a href="https://2te.vn/" rel="noopener noreferrer" target="_blank">Du học nhật</a>&nbsp;c&oacute; gom g&oacute;p được một ch&uacute;t kinh nghiệm muốn chia sẻ với c&aacute;c bạn khi lần đầu ti&ecirc;n đến Nhật cần mang theo những g&igrave;?</p>

<p>Du học Nhật Bản: Dưới đ&acirc;y l&agrave; một v&agrave;i kinh nghiệm chia sẻ với c&aacute;c bạn. &Agrave;, nhớ cầm giấy cho ph&eacute;p lưu tr&uacute; (Certificate of Eligibility) đi xin visa tại đại sứ qu&aacute;n hay l&atilde;nh sự qu&aacute;n Nhật Bản nữa nh&eacute;. V&agrave; khi mua v&eacute; bạn phải kiểm tra số c&acirc;n được gửi k&egrave;m theo m&aacute;y bay l&agrave; bao nhi&ecirc;u.</p>

<p><strong><a href="http://2te.vn/duhocnhat/" rel="noopener noreferrer" target="_blank" title="thời điểm đi du học Nhật Bản tốt nhất">&gt;&gt;&gt; Xem th&ecirc;m:&nbsp;</a><a href="https://riki.edu.vn/blogs/du-hoc-nhat/quy-trinh-du-hoc-nhat-ngu-cung-riki" rel="noopener noreferrer" target="_blank">Quy tr&igrave;nh du học Nhật ngữ c&ugrave;ng du học</a></strong></p>

<h3><strong>1.Thứ nhất l&agrave; c&aacute;c loại giấy tờ cần thiết</strong></h3>

<p>Bạn kh&ocirc;ng được qu&ecirc;n c&aacute;c giấy như:</p>

<p>&ndash; Hộ chiếu<br />
&ndash; V&eacute; m&aacute;y bay</p>

<p><img src="https://riki.edu.vn/storage/nicole-harrington-62045-unsplash.jpg" style="height:400px; width:690px" /><br />
<em>Giấy tờ cần thiết</em></p>

<p>Học bạ cấp ba, sổ hộ khẩu, giấy khai sinh th&igrave; &nbsp;th&igrave; chỉ cần mang bản photo c&ocirc;ng chứng l&agrave; được. Bạn cũng n&ecirc;n mang theo ảnh thẻ. Chụp ảnh lấy ngay ở Nhật kh&ocirc;ng rẻ ch&uacute;t n&agrave;o (~700 y&ecirc;n) n&ecirc;n bạn cần mang nhiều ảnh một ch&uacute;t, đủ d&ugrave;ng trong v&agrave;i năm, hoặc c&oacute; thể lưu v&agrave;o usb hay tr&ecirc;n internet để in tại Nhật nếu cần thiết.</p>

<h3><strong>2. Thứ hai&nbsp;l&agrave; cần ch&uacute; &yacute; số kg h&agrave;nh l&yacute; được mang theo</strong></h3>

<p><img alt="Hành lí du học" src="https://riki.edu.vn/storage/images/hanhliduhoc.jpg" style="height:467px; width:701px" /></p>

<p>Th&ocirc;ng thường số c&acirc;n sẽ được t&iacute;nh theo hai loại l&agrave;: h&agrave;nh l&yacute; k&yacute; gửi theo m&aacute;y bay(~20kg) v&agrave; h&agrave;nh l&yacute; x&aacute;ch tay(kh&ocirc;ng được qu&aacute; 7kg). V&agrave; nếu bạn mang theo dao k&eacute;o, đồ kim loại cũng như chất lỏng th&igrave; bạn phải để trong h&agrave;nh l&yacute; k&yacute; gửi để đảm bảo quy định an ninh của chuyến bay. H&atilde;y nhớ c&acirc;n h&agrave;nh l&yacute; của m&igrave;nh ở nh&agrave; trước nh&eacute;, nếu kh&ocirc;ng khi ra s&acirc;n bay m&agrave; thừa số c&acirc;n h&agrave;nh l&yacute; th&igrave; c&aacute;c bạn sẽ phải bỏ lại hoặc đ&oacute;ng th&ecirc;m ph&iacute; vận chuyển rất cao nữa đấy.</p>

<h3><strong>3. Thứ ba phải kể đến đ&oacute; l&agrave; quần &aacute;o</strong></h3>

<p><img alt="" src="https://riki.edu.vn/storage/nordwood-themes-162465-unsplash.jpg" style="height:472px; width:709px" />Quần &aacute;o</p>

<p>Hiện giờ đang l&agrave; đợt tuyển sinh th&aacute;ng 4 b&ecirc;n Nhật, v&igrave; thế, du học 2T khuy&ecirc;n bạn n&ecirc;n mang theo một c&aacute;i &aacute;o ấm, bởi tiết trời l&uacute;c n&agrave;y đang c&ograve;n hơi se lạnh. Kh&ocirc;ng cần mang nhiều &aacute;o r&eacute;t, v&igrave; &aacute;o r&eacute;t ở Nhật rẻ m&agrave; cũng rất ấm, thiết kế d&agrave;nh ri&ecirc;ng cho thời tiết ở Nhật n&ecirc;n mang nhiều &aacute;o ấm ở nh&agrave; chỉ l&agrave;m tốn chỗ h&agrave;nh l&yacute; m&agrave; th&ocirc;i. Nhớ l&agrave; chỉ n&ecirc;n mang 1 c&aacute;i l&agrave; đủ.<br />
Ngược lại, bạn n&ecirc;n mang đủ nhiều &aacute;o thun, đồ l&oacute;t, quần &aacute;o mỏng mặc ở nh&agrave;, tất(vớ) v.v&hellip; v&agrave; một v&agrave;i &aacute;o kho&aacute;c mỏng mặc m&ugrave;a xu&acirc;n hoặc m&ugrave;a thu. N&ecirc;n chọn những c&aacute;i n&agrave;o bạn ưng &yacute; nhất th&ocirc;i v&igrave; sang Nhật quần &aacute;o rất nhiều v&agrave; cũng kh&ocirc;ng hề đắt&nbsp;so với Việt Nam.</p>

<h3><strong>4. Thứ tư l&agrave; đồ d&ugrave;ng vệ sinh c&aacute; nh&acirc;n</strong></h3>

<p>Bạn n&ecirc;n mang những vật dụng c&aacute; nh&acirc;n cần thiết v&igrave; qua Nhật chưa chắc l&uacute;c đ&atilde; quen thuộc đường x&aacute; cũng như chưa biết chỗ n&agrave;o mua rẻ. Những thứ n&ecirc;n mang l&agrave;: kem đ&aacute;nh răng, dầu gội, dầu xả, b&agrave;n chải đ&aacute;nh răng, khăn tắm, khăn mặt v&agrave; một số đồ vệ sinh th&acirc;n thể.(chỉ n&ecirc;n mang theo lượng đủ d&ugrave;ng trong th&aacute;ng đầu ti&ecirc;n &ndash; th&aacute;ng l&agrave;m quen với cuộc sống mới).</p>

<h3><strong>5. Thứ năm l&agrave; tiền</strong></h3>

<p><img alt="" src="https://riki.edu.vn/storage/allef-vinicius-468838-unsplash.jpg" style="height:475px; width:713px" /><br />
<em>Tiền bao nhi&ecirc;u l&agrave; đủ?</em></p>

<p>Nếu được n&ecirc;n mang tầm 100,000 ~ 200,000 y&ecirc;n (1000 ~ 2000 USD), nhớ đổi ra tiền y&ecirc;n, kh&ocirc;ng mang tiền VND hay USD (rất kh&oacute; đổi USD v&igrave; ở Nhật chỉ x&agrave;i JPY).<br />
&Agrave;, nếu bạn nghĩ tới ng&agrave;y nhập cảnh về VN th&igrave; c&oacute; thể mang tầm 500,000 VND để mua thẻ điện thoại chẳng hạn, hay nộp những loại ph&iacute; m&agrave; kh&ocirc;ng tiện n&oacute;i t&ecirc;n!</p>

<h3><strong>6. Thứ s&aacute;u l&agrave; thuốc, đồ d&ugrave;ng sức khỏe, đồ ăn, đồ uống</strong></h3>

<p>N&ecirc;n mang theo thuốc cảm c&uacute;m, đường ruột (dị ứng, ho, sốt) m&agrave; bạn thường d&ugrave;ng với số lượng vừa phải (đủ d&ugrave;ng trong 2 &ndash; 3 th&aacute;ng l&agrave; được), đừng mang qu&aacute; nhiều v&igrave; chắc bạn chẳng bao giờ d&ugrave;ng tới, với lại bạn đi du học th&igrave; thường kh&aacute; trẻ v&agrave; khỏe, kh&ocirc;ng kh&iacute; v&agrave; đồ ăn b&ecirc;n Nhật lại rất sạch n&ecirc;n cũng kh&oacute; c&oacute; g&igrave; xảy ra. Bạn n&ecirc;n mang theo vitamin C v&igrave; rau quả b&ecirc;n Nhật thường &iacute;t hơn, gi&aacute; cả đắt hơn thịt, n&ecirc;n cứ mang theo cho chắc, c&oacute; g&igrave; c&ograve;n bổ sung chất.</p>

<p>Đồ uống th&igrave; kh&ocirc;ng n&ecirc;n mang theo bởi ở Nhật rất rẻ, chỉ n&ecirc;n mang nước suối để uống khi ở s&acirc;n bay th&ocirc;i. C&ograve;n đồ ăn nếu muốn tiết kiệm th&igrave; bạn c&oacute; thể mang mỳ ăn liền, ruốc kh&ocirc; v&agrave; một &iacute;t đồ gia vị (ớt, h&agrave;nh, tỏi ) chẳng hạn. N&oacute;i chung cũng kh&ocirc;ng cần mang nhiều đồ qu&aacute; v&igrave; si&ecirc;u thị b&ecirc;n Nhật đến tầm 8-9h tối đều giảm gi&aacute; kh&aacute; nhiều n&ecirc;n bạn c&oacute; thể ch&uacute; &yacute; khung giờ n&agrave;y đi mua đồ cũng được.</p>

<h3><strong>7. Thứ bảy l&agrave; m&aacute;y t&iacute;nh x&aacute;ch tay, điện thoại, từ điển</strong></h3>

<p>M&aacute;y t&iacute;nh x&aacute;ch tay: Nếu m&aacute;y t&iacute;nh bạn vẫn x&agrave;i được tốt th&igrave; n&ecirc;n mang theo, v&igrave; điện m&aacute;y t&iacute;nh l&agrave; 100 &ndash; 240 V n&ecirc;n c&oacute; thể sạc điện tại Nhật (ở Nhật d&ugrave;ng điện 100 V).<br />
Điện thoại: Ch&uacute; &yacute; l&agrave; băng tần điện thoại Nhật Bản v&agrave; Việt Nam kh&aacute;c nhau, n&ecirc;n c&oacute; mang sang cũng kh&ocirc;ng x&agrave;i được. Bạn d&ugrave;ng để b&aacute;o thức hay v&agrave;o wifi (nếu điện thoại bạn bắt được wifi) th&igrave; được. =&gt; Mang hay kh&ocirc;ng t&ugrave;y bạn!<br />
Kh&ocirc;ng n&ecirc;n mang m&aacute;y t&iacute;nh để b&agrave;n (desktop computer) đi, v&igrave; rất nặng, cồng kềnh m&agrave; lại &ldquo;chở củi về rừng&rdquo;.<br />
Ngo&agrave;i ra, bạn n&ecirc;n mang từ điển Việt &ndash; Nhật, Nhật &ndash; Việt hoặc kim từ điển cũng được.</p>

<p>Những thứ kh&aacute;c th&igrave; kh&ocirc;ng cần thiết, vừa nặng, lại kh&ocirc;ng biết qua Nhật c&oacute; d&ugrave;ng được kh&ocirc;ng. N&ecirc;n nhớ ở Nhật c&aacute;i g&igrave; cũng c&oacute;, trừ thực phẩm ra th&igrave; những thứ kh&aacute;c ở Nhật đều rẻ hơn Việt Nam n&ecirc;n bạn kh&ocirc;ng cần lo lắng.</p>

<h3><strong>***ĐỪNG BAO GIỜ MANG NHỮNG THỨ KH&Ocirc;NG THỰC SỰ CẦN THIẾT!</strong></h3>

<p><strong>Từ những lời khuy&ecirc;n ở tr&ecirc;n, Du học 2TE đ&uacute;c kết lại những thứ sau:</strong></p>

<p><strong>&ndash; Bắt buộc: Hộ chiếu, v&eacute; m&aacute;y bay</strong><br />
<strong>&ndash; Ảnh 3&times;4, 4&times;6 đủ nhiều (v&agrave;i chục tấm)</strong><br />
<strong>&ndash; M&aacute;y t&iacute;nh x&aacute;ch tay, điện thoại (l&agrave;m đồng hồ b&aacute;o thức), một USB</strong><br />
<strong>&ndash; &Aacute;o r&eacute;t: 1 c&aacute;i, &aacute;o kho&aacute;c mỏng: 2-3 c&aacute;i, &aacute;o thun: 5-6 c&aacute;i, &aacute;o sơ mi(1 c&aacute;i mặc cho trang trọng), quần t&acirc;y(1 c&aacute;i), giầy t&acirc;y(1 đ&ocirc;i), quần jean(2 c&aacute;i), quần lửng(1-2 c&aacute;i), quần l&oacute;t(đủ x&agrave;i cả tuần), vớ(4-5 đ&ocirc;i)</strong><br />
<strong>&ndash; B&agrave;n chải, tu&yacute;p kem đ&aacute;nh răng nhỏ, chai dầu gội nhỏ, chai sữa tắm nhỏ, khăn mặt (v&agrave;i c&aacute;i), khăn tắm</strong><br />
<strong>&ndash; Gi&agrave;y (1-2 đ&ocirc;i chắc vừa), d&eacute;p t&ocirc;ng</strong><br />
<strong>&ndash; Từ điển Nhật-Việt-Anh, kim từ điển (nếu c&oacute;), sổ tay, c&acirc;y viết</strong><br />
<strong>&ndash; 1 th&ugrave;ng mỳ, nửa k&yacute; ch&agrave; b&ocirc;ng, 1 t&ocirc; c&oacute; nắp, 1 đ&ocirc;i đũa, 1 th&igrave;a (kh&ocirc;ng lại kh&ocirc;ng biết ăn mỳ bằng g&igrave;!)</strong><br />
<strong>&ndash; Vitamin C, thuốc cảm c&uacute;m, ho, đường ruột</strong><br />
<strong>&ndash; Tiền: 10 &ndash; 15 vạn y&ecirc;n</strong></p>
', N'/Uploads/images/univercity/anh-du-nhat-696x1040.jpg', N'/Uploads/images/univercity/anh-du-nhat-696x1040.jpg', 1, 1, 1, 0, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (9, 1, 3, N'Tìm hiểu visa D2 du học Hàn Quốc', N'Visa du học D-2 được cấp cho sinh viên nước ngoài học tập từ bậc cao đẳng trở lên tại các trường đại học tại Hàn Quốc.', N'<p>&nbsp;</p>

<p><a href="http://2te.vn/wp-content/uploads/2018/05/du-hoc-han-quoc-visa-d2-2.jpg"><img alt="" src="http://2te.vn/wp-content/uploads/2018/05/du-hoc-han-quoc-visa-d2-2.jpg" style="height:319px; width:433px" title="Du-học-Hàn-Quốc-Visa-D2-2" /></a></p>

<h2>T&Igrave;M HIỂU VISA D2 DU HỌC H&Agrave;N QUỐC</h2>

<p>Visa du học D-2 được cấp cho sinh vi&ecirc;n nước ngo&agrave;i học tập từ bậc cao đẳng trở l&ecirc;n tại c&aacute;c trường đại học tại H&agrave;n Quốc.</p>

<p>Sinh vi&ecirc;n học tiếng hay học sinh cấp ba th&igrave; thuộc visa đ&agrave;o tạo D-4.</p>

<p>Visa D-2 được cấp hay gia hạn tối đa cho 1 lần l&agrave; 2 năm.</p>

<p><strong>I. C&Aacute;C LOẠI VISA D-2:&nbsp;</strong><br />
Visa D-2 bao gồm&nbsp;<strong>7 loại</strong>&nbsp;visa cụ thể như sau:</p>

<p><strong>1. D-2-1:&nbsp;</strong>Sinh vi&ecirc;n cao đẳng (전문학사)</p>

<p><strong>2. D-2-2:&nbsp;</strong>Sinh vi&ecirc;n Đại học (학사유학)</p>

<p><strong>3. D-2-3:</strong>&nbsp;Sinh vi&ecirc;n thạc sĩ (석사유학)</p>

<p><strong>4. D-2-4:</strong>&nbsp;Nghi&ecirc;n cứu sinh tiến sĩ (박사유학)</p>

<p><strong>5. D-2-5:</strong>&nbsp;Nghi&ecirc;n cứu (연구유학)</p>

<p><strong>&nbsp;</strong></p>

<p><strong>6. D-2-6:&nbsp;</strong>Sinh vi&ecirc;n trao đổi (교환학생)</p>

<p><strong>6. D-2-7:&nbsp;</strong>Du học &ndash; L&agrave;m việc kết hợp (일-학습연계 유학)</p>

<p><strong>6. D-2-8:</strong>&nbsp;Du học ngắn hạn (단기유학)</p>

<p><strong>7. D-2-F:</strong>&nbsp;Sinh vi&ecirc;n trao đổi (교환학생)</p>

<p><strong>II. CHUYỂN ĐỔI SANG VISA D-2:&nbsp;</strong></p>

<p><strong>1. Quy định về việc cho ph&eacute;p học tập tại H&agrave;n Quốc:&nbsp;</strong></p>

<p>&ndash; Theo luật xuất nhập cảnh, khi bạn l&agrave;m c&aacute;i g&igrave; m&agrave; kh&ocirc;ng thuộc visa của bạn quy định th&igrave; phải đăng k&yacute;. Tuy nhi&ecirc;n về việc học h&agrave;nh th&igrave; c&oacute; ngoại lệ.</p>

<p>+ Bất cứ người n&agrave;o hợp ph&aacute;p ở H&agrave;n đều c&oacute; thể học tiếng m&agrave; kh&ocirc;ng cần chuyển sang visa D-4 hay b&aacute;o c&aacute;o.</p>

<p>+ Người c&oacute; visa A-1, A-2, A-3, D-1,D-2, D-5 ~ D-9, E-1 ~ E-7, F-1 ~ F-6, H-2 &hellip; được ph&eacute;p tham gia c&aacute;c hoạt động được quy định cho visa D-2 tức l&agrave; đi học từ cao đẳng trở l&ecirc;n m&agrave; kh&ocirc;ng cần b&aacute;o c&aacute;o.</p>

<p><strong>2. Quy định về việc đổi sang visa D-2:&nbsp;</strong></p>

<p>&ndash; Người c&oacute; visa ngắn hạn (bao gồm người nhập cảnh H&agrave;n Quốc dưới dạng B-1 (miễn visa) v&agrave; B-2 (du lịch qu&aacute; cảnh) hặc người nước ngo&agrave;i đ&atilde; đăng k&yacute; tại H&agrave;n Quốc (tức c&oacute; thẻ chứng minh người nước ngo&agrave;i).</p>

<p>&ndash; Tuy nhi&ecirc;n, c&aacute;c visa C-3-2, C-3-3, D-3,E-9, E-10 hay G-1 th&igrave; bị hạn chế chuyển sang D-2.</p>

<p><strong>*** Hồ sơ cơ bản bao gồm:&nbsp;</strong></p>

<p>&ndash; Đơn y&ecirc;u cầu tổng hợp mẫu số 34 c&oacute; d&aacute;n ảnh đ&uacute;ng chuẩn.</p>

<p>&ndash; Hộ chiếu</p>

<p>&ndash; Thẻ chứng minh người nước ngo&agrave;i nếu c&oacute;.</p>

<p>&ndash; Giấy chứng nhận đăng k&yacute; kinh doanh của Trường hay Viện</p>

<p>&ndash; Thư nhập học của trường, được cấp bởi hiệu trưởng.</p>

<p>&ndash; Giấy chứng nhận quan hệ với người bảo l&atilde;nh: nếu cha mẹ l&agrave; người bảo l&atilde;nh t&agrave;i ch&iacute;nh.</p>

<p><strong>&nbsp;*** Hồ sơ y&ecirc;u cầu th&ecirc;m d&agrave;nh cho visa D-2-1, D-2-2, D-2-3, D-2-4:&nbsp;</strong></p>

<p>&ndash; Giấy chứng chứng minh cấp học cao nhất: bao gồm bằng v&agrave; bảng điểm, phải được hợp ph&aacute;p h&oacute;a l&atilde;nh sự tại ĐSQ/LSQ H&agrave;n Quốc tại Việt Nam hoặc ĐSQ Việt Nam tại H&agrave;n Quốc.</p>

<p>&ndash; Chứng nhận t&agrave;i ch&iacute;nh: thể hiện số tiền đủ để trả học ph&iacute; v&agrave; sinh hoạt ph&iacute; 1 năm.</p>

<p><strong>*** Hồ sơ y&ecirc;u cầu th&ecirc;m d&agrave;nh cho visa D-2-5:&nbsp;</strong></p>

<p>&ndash; Giấy chứng chứng minh cấp học cao nhất: bao gồm bằng v&agrave; bảng điểm, phải được hợp ph&aacute;p h&oacute;a l&atilde;nh sự tại ĐSQ/LSQ H&agrave;n Quốc tại Việt Nam hoặc ĐSQ Việt Nam tại H&agrave;n Quốc.</p>

<p>&nbsp;&ndash; Chứng minh t&agrave;i ch&iacute;nh: chứng nhận khả năng trả sinh hoạt ph&iacute; tại H&agrave;n Quốc như số dư ng&acirc;n h&agrave;ng, chứng nhận được trả lương khi nghi&ecirc;n cứu tại H&agrave;n Quốc.</p>

<p>&ndash; Giấy chứng nhận cho việc tham gia v&agrave;o hoạt động nghi&ecirc;n cứu.</p>

<p><strong>*** Hồ sơ y&ecirc;u cầu th&ecirc;m d&agrave;nh cho visa D-2-6:&nbsp;</strong></p>

<p>&ndash; Chứng minh t&agrave;i ch&iacute;nh: chứng nhận khả năng trả sinh hoạt ph&iacute; khi trao đổi tại H&agrave;n Quốc (học ph&iacute; được xem như đ&atilde; đ&oacute;ng trước khi sang)</p>

<p>&ndash; Giấy giới thiệu từ hiệu trưởng của trường đang học ở Việt Nam.</p>

<p>&ndash; Giấy chứng nhận sinh vi&ecirc;n trao đổi: thư mời ch&iacute;nh thức từ trường ở H&agrave;n Quốc, văn bản k&yacute; kết hợp t&aacute;c giữa 2 trường &hellip;.</p>

<p>&ndash; Giấy chứng nhận ho&agrave;n th&agrave;nh ở cấp học cao nhất: bằng v&agrave; bảng điểm được hợp ph&aacute;p h&oacute;a l&atilde;nh sự). V&iacute; dụ trao đổi ở bậc đại học th&igrave; nộp bằng cấp 3, trao đổi bậc thạc sĩ th&igrave; nộp bằng đại học.</p>

<p>&ndash; Giấy chứng nhận đ&atilde; ho&agrave;n th&agrave;nh &iacute;t nhất 1 học kỳ ở trường học ở Việt Nam trước khi đi trao đổi.</p>

<p><strong>III. GIA HẠN VISA D-2:&nbsp;</strong></p>

<p>&ndash; B&agrave;i viết đang được bi&ecirc;n tập.</p>

<p><strong>IV. CH&Uacute; &Yacute;:&nbsp;</strong></p>

<p>&ndash; Visa D-2 c&oacute; thể bảo l&atilde;nh cha, mẹ, anh, chị em sang du lịch dưới 90 ng&agrave;y.</p>

<p>&ndash; Với c&aacute;c visa D-2-1, D-2-2, D-2-3, D-2-4, sau khi tốt nghiệp bạn c&oacute; thể chuyển l&ecirc;n học cấp cao hơn với visa tương ứng.</p>

<p>&ndash; Nếu đ&atilde; c&oacute; c&ocirc;ng ty chấp nhận bảo l&atilde;nh th&igrave; chuyển sang visa E-7.</p>

<p>&ndash; Nếu đ&atilde; c&oacute; c&ocirc;ng ty chấp nhận v&agrave; đủ điều kiện chuyển sang F-2 theo điểm th&igrave; chuyển thẳng qua F-2 chứ kh&ocirc;ng cần qua E-7.</p>

<p>&ndash; Nếu muốn ở lại t&igrave;m việc th&igrave; chuyển sang D-10. Mỗi lần được cấp 6 th&aacute;ng.</p>

<p>Nguồn hanquocngaynay.info</p>
', N'/Uploads/images/univercity/du-hoc-han-quoc-visa-d2-2.jpg', N'/Uploads/images/univercity/du-hoc-han-quoc-visa-d2-2.jpg', 1, 1, 1, 0, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (10, 1, 5, N'Hồ sơ xin Visa du lịch – Công tác Canada', N'Hồ sơ xin Visa du lịch Canada', N'<p><strong>Hồ sơ nh&acirc;n th&acirc;n:</strong></p>

<ul>
	<li>Hộ chiếu gốc đ&atilde; k&yacute; t&ecirc;n (c&ograve;n hiệu lực &iacute;t nhất 6 th&aacute;ng v&agrave; c&ograve;n trang trống);</li>
	<li>Tất cả c&aacute;c hộ chiếu cũ (nếu c&oacute;);</li>
	<li>Bản sao c&ocirc;ng chứng mặt hộ chiếu v&agrave; c&aacute;c trang c&oacute; đ&oacute;ng dấu mộc hải quan v&agrave; visa bất kỳ nước n&agrave;o;</li>
	<li>Tờ khai xin visa Canada (Form IMM5257) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Tờ khai th&ocirc;ng tin gia đ&igrave;nh (Form IMM5645) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Mẫu chấp thuận CVAC v&agrave; sử dụng dịch vụ của VFS (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Mẫu IMM5257_SCHEDULE 1 nếu đương đơn đ&atilde; từng hoặc đang l&agrave;m trong qu&acirc;n đội (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Form sử dụng người đại diện IMM5476 (nếu sử dụng người đại diện) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Bản sao c&ocirc;ng chứng Chứng minh nh&acirc;n d&acirc;n;</li>
	<li>Bản sao c&ocirc;ng chứng Giấy khai sinh;</li>
	<li>Bản sao c&ocirc;ng chứng Sổ hộ khẩu gia đ&igrave;nh (tất cả c&aacute;c trang, kể cả trang trống);</li>
	<li>Giấy đăng k&yacute; kết h&ocirc;n (nếu đ&atilde; kết h&ocirc;n) / Giấy x&aacute;c nhận độc th&acirc;n (nếu c&ograve;n độc th&acirc;n) / Quyết định ly h&ocirc;n của t&ograve;a &aacute;n (nếu đ&atilde; ly h&ocirc;n) / Giấy chứng tử (nếu vợ/chồng đ&atilde; mất);</li>
</ul>

<p><strong><strong>Giấy tờ chuyến đi</strong>:</strong></p>

<ul>
	<li>X&aacute;c nhận booking v&eacute; m&aacute;y bay 2 chiều;</li>
	<li>X&aacute;c nhận đặt ph&ograve;ng kh&aacute;ch sạn;</li>
	<li>Lịch tr&igrave;nh du lịch tại Canada;</li>
</ul>

<p><strong><strong>Hồ sơ c&ocirc;ng việc</strong>:</strong><em><em>Nếu l&agrave; c&aacute;n bộ, nh&acirc;n vi&ecirc;n</em>:</em></p>

<ul>
	<li>Hợp đồng lao động / Quyết định tuyển dụng / Quyết định bổ nhiệm / Quyết định tăng lương;</li>
	<li>Đơn xin nghỉ ph&eacute;p để đi du lịch;</li>
	<li>Bảng lương 3 th&aacute;ng gần nhất;</li>
</ul>

<p><em><em>Nếu l&agrave; chủ sở hữu doanh nghiệp</em>:</em></p>

<ul>
	<li>Đăng k&yacute; kinh doanh;</li>
	<li>Bi&ecirc;n lai nộp thuế thu nhập doanh nghiệp 2 năm gần nhất;</li>
	<li>X&aacute;c nhận số dư t&agrave;i khoản ng&acirc;n h&agrave;ng của c&ocirc;ng ty;</li>
</ul>

<p><em><em>Nếu l&agrave; học sinh, sinh vi&ecirc;n</em>:</em></p>

<ul>
	<li>Đơn xin nghỉ học c&oacute; x&aacute;c nhận của nh&agrave; trường;</li>
</ul>

<p><em>Nếu l&agrave; người đ&atilde; nghỉ hưu:</em></p>

<ul>
	<li>Thẻ hưu tr&iacute; / Quyết định nghỉ hưu / Sổ lĩnh lương hưu;</li>
</ul>

<p><strong><strong>Chứng minh t&agrave;i ch&iacute;nh</strong>:</strong></p>

<ul>
	<li>Sổ tiết kiệm c&oacute; gi&aacute; trị tổi thiểu 5.000 USD trở l&ecirc;n (C&agrave;ng nhiều c&agrave;ng c&oacute; khả năng đậu cao);</li>
	<li>Giấy x&aacute;c nhận số dư sổ tiết kiệm tại thời điểm hiện tại;</li>
	<li>Sổ đỏ hoặc Giấy chứng nhận quyền sử dụng đất, hoặc t&agrave;i sản ri&ecirc;ng c&oacute; gi&aacute; trị kh&aacute;c (nếu c&oacute;);</li>
	<li>Giấy chứng nhận sở hữu c&aacute;c t&agrave;i sản kh&aacute;c nếu c&oacute; (xe hơi, cổ phiếu, cổ phần, tr&aacute;i phiếu);</li>
	<li>Photo Thẻ Master Card hoặc Visa Card (nếu c&oacute;)</li>
</ul>

<h1><strong>Hồ sơ xin Visa c&ocirc;ng t&aacute;c Canada</strong></h1>

<hr />
<p><strong>Hồ sơ nh&acirc;n th&acirc;n:</strong></p>

<ul>
	<li>Hộ chiếu gốc đ&atilde; k&yacute; t&ecirc;n (c&ograve;n hiệu lực &iacute;t nhất 6 th&aacute;ng v&agrave; c&ograve;n trang trống);</li>
	<li>Tất cả c&aacute;c hộ chiếu cũ (nếu c&oacute;);</li>
	<li>Bản sao c&ocirc;ng chứng mặt hộ chiếu v&agrave; c&aacute;c trang c&oacute; đ&oacute;ng dấu mộc hải quan v&agrave; visa bất kỳ nước n&agrave;o;</li>
	<li>Tờ khai xin visa Canada (Form IMM5257) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Tờ khai th&ocirc;ng tin gia đ&igrave;nh (Form IMM5645) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Mẫu chấp thuận CVAC v&agrave; sử dụng dịch vụ của VFS (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Mẫu IMM5257_SCHEDULE 1 nếu đương đơn đ&atilde; từng hoặc đang l&agrave;m trong qu&acirc;n đội (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Form sử dụng người đại diện IMM5476 (nếu sử dụng người đại diện) (chữ k&yacute; của đương đơn trong tờ khai phải giống với chữ k&yacute; tr&ecirc;n hộ chiếu);</li>
	<li>Bản sao c&ocirc;ng chứng Chứng minh nh&acirc;n d&acirc;n;</li>
	<li>Bản sao c&ocirc;ng chứng Giấy khai sinh;</li>
	<li>Bản sao c&ocirc;ng chứng Sổ hộ khẩu gia đ&igrave;nh (tất cả c&aacute;c trang, kể cả trang trống);</li>
	<li>Giấy đăng k&yacute; kết h&ocirc;n (nếu đ&atilde; kết h&ocirc;n) / Giấy x&aacute;c nhận độc th&acirc;n (nếu c&ograve;n độc th&acirc;n) / Quyết định ly h&ocirc;n của t&ograve;a &aacute;n (nếu đ&atilde; ly h&ocirc;n) / Giấy chứng tử (nếu vợ/chồng đ&atilde; mất);</li>
</ul>

<p><strong><strong>Hồ sơ c&ocirc;ng việc</strong>:</strong>&nbsp;<em><em>Nếu l&agrave; c&aacute;n bộ, nh&acirc;n vi&ecirc;n</em>:</em></p>

<ul>
	<li>Hợp đồng lao động / Quyết định tuyển dụng / Quyết định bổ nhiệm / Quyết định tăng lương;</li>
	<li>X&aacute;c nhận lương 3 th&aacute;ng gần nhất;</li>
	<li>Quyết định cử đi c&ocirc;ng t&aacute;c;</li>
</ul>

<p><em><em>Nếu l&agrave; chủ sở hữu doanh nghiệp</em>:</em></p>

<ul>
	<li>Đăng k&yacute; kinh doanh;</li>
	<li>Bi&ecirc;n lai nộp thuế thu nhập doanh nghiệp 2 năm gần nhất;</li>
	<li>X&aacute;c nhận số dư t&agrave;i khoản ng&acirc;n h&agrave;ng của c&ocirc;ng ty;</li>
	<li>B&agrave;n giao c&ocirc;ng việc để đi c&ocirc;ng t&aacute;c;</li>
</ul>

<p><strong><strong>Chứng minh t&agrave;i ch&iacute;nh</strong>:</strong></p>

<ul>
	<li>Sổ tiết kiệm c&oacute; gi&aacute; trị tổi thiểu 5.000 USD trở l&ecirc;n (C&agrave;ng nhiều c&agrave;ng c&oacute; khả năng đậu cao);</li>
	<li>Giấy x&aacute;c nhận số dư sổ tiết kiệm tại thời điểm hiện tại;</li>
	<li>Sổ đỏ hoặc Giấy chứng nhận quyền sử dụng đất, hoặc t&agrave;i sản ri&ecirc;ng c&oacute; gi&aacute; trị kh&aacute;c (nếu c&oacute;);</li>
	<li>Giấy chứng nhận sở hữu c&aacute;c t&agrave;i sản kh&aacute;c nếu c&oacute; (xe hơi, cổ phiếu, cổ phần, tr&aacute;i phiếu);</li>
	<li>Photo Thẻ Master Card hoặc Visa Card (nếu c&oacute;)</li>
</ul>

<p><strong><strong>Giấy tờ chuyến đi</strong>:</strong></p>

<ul>
	<li>X&aacute;c nhận booking v&eacute; m&aacute;y bay 2 chiều;</li>
	<li>X&aacute;c nhận đặt ph&ograve;ng kh&aacute;ch sạn;</li>
	<li>Thư mời của đối t&aacute;c tại Canada;</li>
</ul>
', N'/Uploads/images/univercity/hqdefault-1.jpg', N'/Uploads/images/univercity/hqdefault-1.jpg', 1, 1, 1, 0, CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-06-17 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (11, 0, 1, N'Trường đại học YEUNGNAM  tuyển sinh 1', N'Đại học Daegu Haany được thành lập năm 1980 như là một viện giáo dục đại học trọng điểm của khu vực, tập trung vào việc bồi dưỡng tài năng cho cộng đồng.Để đáp lại sự thay đổi toàn cầu hóa, trường đại học này tập trung vào việc giáo dục những người tài năng có kỹ năng toàn cầu bằng cách điều chỉnh chủ động mục tiêu giáo dục và hướng tới mô hình toàn cầu hóa.', N'<p>Đại học Daegu Haany được th&agrave;nh lập năm 1980 như l&agrave; một viện gi&aacute;o dục đại học trọng điểm của khu vực, tập trung v&agrave;o việc bồi dưỡng t&agrave;i năng cho cộng đồng.Để đ&aacute;p lại sự thay đổi to&agrave;n cầu h&oacute;a, trường đại học n&agrave;y tập trung v&agrave;o việc gi&aacute;o dục những người t&agrave;i năng c&oacute; kỹ năng to&agrave;n cầu bằng c&aacute;ch điều chỉnh chủ động mục ti&ecirc;u gi&aacute;o dục v&agrave; hướng tới m&ocirc; h&igrave;nh to&agrave;n cầu h&oacute;a.Để đ&agrave;o tạo những t&agrave;i năng n&agrave;y tr&ecirc;n thế giới v&agrave; cộng đồng, trường đại học n&agrave;y đ&atilde; cải c&aacute;ch chương tr&igrave;nh học của m&igrave;nh th&agrave;nh một c&ocirc;ng nghệ sinh học (BT), c&ocirc;ng nghệ văn ho&aacute; (CT) v&agrave; c&ocirc;ng nghệ th&ocirc;ng tin (IT) v&agrave; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu chuy&ecirc;n ng&agrave;nh.Trường đại học n&agrave;y cũng cung cấp c&aacute;c chương tr&igrave;nh gi&aacute;o dục kh&ocirc;ng gian mạng cho những sinh vi&ecirc;n muốn học qua mạng. Trường đại học n&agrave;y sẽ c&oacute; một viện gi&aacute;o dục đại học lớn để ph&aacute;t triển kh&ocirc;ng chỉ với cộng đồng địa phương m&agrave; c&ograve;n cho cộng đồng quốc gia v&agrave; quốc tế về sức khoẻ v&agrave; sự thịnh vượng của con người.</p>
', N'/Uploads/images/univercity/silla-696x535.png', N'/Uploads/_thumbs/images/univercity/silla-696x535.png', NULL, NULL, 2, 25, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-02 20:42:14.8082891' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (17, 1, 3, N'Lưu ý đối với du học sinh Hàn khi tìm việc làm thêm', N'LƯU Ý VỚI DU HỌC SINH KHI TÌM VIỆC LÀM THÊM ', N'<p>L&agrave;m th&ecirc;m khi đang&nbsp;<strong>du học H&agrave;n Quốc</strong>&nbsp;kh&ocirc;ng c&ograve;n xa lạ đối với c&aacute;c du học sinh Việt Nam. Lựa chọn được một c&ocirc;ng việc ph&ugrave; hợp với bản th&acirc;n v&agrave; mang lại thu nhập tốt l&agrave; mong muốn của bất cứ du học sinh n&agrave;o. Vậy cần lưu &yacute; g&igrave; khi t&igrave;m việc l&agrave;m th&ecirc;m tại H&agrave;n Quốc, b&agrave;i viết n&agrave;y sẽ gi&uacute;p bạn hiểu được những ch&iacute;nh s&aacute;ch lao động v&agrave; nh&acirc;n lực H&agrave;n Quốc, cũng như d&agrave;nh tặng bạn những lời khuy&ecirc;n hữu &iacute;ch khi t&igrave;m việc.</p>

<p><img alt="" src="http://2te.vn/wp-content/uploads/2018/04/01-parttime-010318.jpg" style="height:532px; width:800px" /></p>

<h2>I. &nbsp;Tu&acirc;n thủ đ&uacute;ng quy định của ch&iacute;nh phủ H&agrave;n Quốc</h2>

<p>Theo quy định của H&agrave;n Quốc, du học sinh quốc tế được chấp nhận đi l&agrave;m th&ecirc;m khi đạt được c&aacute;c y&ecirc;u cầu nhất định sau:</p>

<p>&ndash;&nbsp;Du học H&agrave;n Quốc&nbsp;bao gồm 2 giai đoạn học tiếng v&agrave; học chuy&ecirc;n ng&agrave;nh, chỉ sinh vi&ecirc;n đăng k&yacute; theo học chương tr&igrave;nh đ&agrave;o tạo chuy&ecirc;n ng&agrave;nh( cao đẳng, đại học, cao học) sau khi kết th&uacute;c thời gian học tiếng H&agrave;n mới được ph&eacute;p đi l&agrave;m th&ecirc;m.</p>

<p>&ndash;&nbsp;Thời gian nhập cảnh được 6 th&aacute;ng trở l&ecirc;n đồng nghĩa với việc c&aacute;c bạn&nbsp;du học sinh Việt Nam tại H&agrave;n Quốc&nbsp;đ&atilde; kết th&uacute;c một học kỳ tại đ&acirc;y.</p>

<p>Được cấp giấy ph&eacute;p lao động (work permit) cho ph&eacute;p l&agrave;m th&ecirc;m với thời gian tối đa 20h/ tuần ngo&agrave;i thời gian l&ecirc;n lớp, c&ograve;n đối với c&aacute;c ng&agrave;y lễ hay kỳ nghỉ th&igrave; to&agrave;n thời gian.</p>

<p><strong><em>Lưu &yacute;:</em></strong></p>

<p><em>Sinh vi&ecirc;n kh&ocirc;ng n&ecirc;n đi l&agrave;m qu&aacute; giờ c&oacute; thể ảnh hưởng đến sức khỏe, thời gian học cũng như quy định của ch&iacute;nh phủ H&agrave;n Quốc.</em></p>

<p><em>Trong thời gian đợi cấp giấy ph&eacute;p, sinh vi&ecirc;n n&ecirc;n tu&acirc;n thủ đ&uacute;ng quy định để đảm bảo qu&aacute; tr&igrave;nh học tập v&agrave; l&agrave;m việc sau n&agrave;y của m&igrave;nh tại H&agrave;n Quốc kh&ocirc;ng bị hạn chế hay ảnh hưởng ti&ecirc;u cực.</em></p>

<h2>II. T&igrave;m việc ph&ugrave; hợp với năng lực v&agrave; khả năng ng&ocirc;n ngữ</h2>

<p>Tiếng H&agrave;n c&agrave;ng tốt, khả năng xin việc l&agrave;m cao hơn. Nếu tiếng H&agrave;n tốt bạn c&oacute; thể xin l&agrave;m việc một số vị tr&iacute; như ở c&aacute;c thư viện trường, l&agrave;m phục vụ cho qu&aacute;n c&agrave; ph&ecirc;, qu&aacute;n ăn&hellip;C&ograve;n tiếng h&agrave;n &iacute;t ỏi th&igrave; bạn xin l&agrave;m phụ bếp, rửa b&aacute;t&hellip; Do đ&oacute;, việc trau dồi ng&ocirc;n ngữ, đặc biệt tiếng H&agrave;n l&agrave; v&ocirc; c&ugrave;ng quan trọng. Trong thời gian chờ cấp ph&eacute;p đi l&agrave;m, c&aacute;c&nbsp;bạn du học sinh Việt Nam tại H&agrave;n Quốc&nbsp;c&oacute; thể tập trung r&egrave;n luyện tiếng H&agrave;n thật tốt để c&oacute; th&agrave;nh t&iacute;ch cao, CV tốt, tang lợi thế khi xin c&aacute;c c&ocirc;ng việc với mức lương tốt hơn m&agrave; kh&ocirc;ng phải l&agrave;m c&aacute;c c&ocirc;ng việc tay ch&acirc;n qu&aacute; nặng nhọc. Đồng thời, du học sinh cần tự đ&aacute;nh gi&aacute; được năng lực của bản th&acirc;n, thời gian biểu v&agrave; mục đ&iacute;ch khi đi l&agrave;m th&ecirc;m, tr&aacute;nh bị qu&aacute; sức, lạc lối hay sa đ&agrave; kh&ocirc;ng cần thiết.</p>

<p><strong>Xin việc l&agrave;m tại trường</strong></p>

<p>Đa phần c&aacute;c trường đại học, cao đẳng đều tạo cơ hội việc l&agrave;m cho sinh vi&ecirc;n như trợ giảng, trợ l&yacute;, phụ việc ở nh&agrave; ăn, l&agrave;m trong thư viện trường,&hellip;với mức lương cạnh tranh. Đ&acirc;y l&agrave; những lựa chọn c&ocirc;ng việc kh&aacute; ph&ugrave; hợp cho du học sinh H&agrave;n Quốc, v&igrave; ch&uacute;ng mang đến m&ocirc;i trường gi&uacute;p sinh vi&ecirc;n r&egrave;n luyện kỹ năng mềm kh&aacute; tốt. B&ecirc;n cạnh đ&oacute;, c&aacute;c bạn sinh vi&ecirc;n c&oacute; thể xin lời khuy&ecirc;n v&agrave; giấy giới thiệu của c&aacute;c gi&aacute;o sư trong trường hay c&aacute;c gi&aacute;o sư đ&atilde; từng hợp t&aacute;c để qu&aacute; tr&igrave;nh t&igrave;m việc được nhanh ch&oacute;ng v&agrave; ph&ugrave; hợp hơn cho bản th&acirc;n.</p>

<h2>III. Một v&agrave;i gợi &yacute; khi t&igrave;m việc l&agrave;m th&ecirc;m tại H&agrave;n Quốc</h2>

<p>Tận dụng mọi cơ hội l&agrave;m việc trong thời gian học tập tại H&agrave;n Quốc</p>

<p>Tăng cường khả năng tiếng H&agrave;n của bạn bằng c&aacute;ch đầu tư v&agrave;o c&aacute;c lớp học tiếng H&agrave;n, tham dự c&aacute;c kỳ thi tiếng H&agrave;n v&agrave; c&oacute; những người bạn H&agrave;n đồng h&agrave;nh.</p>

<p>Tạo kết nối với mọi cơ hội v&agrave; mạng lưới rộng r&atilde;i. Thị trường việc l&agrave;m lu&ocirc;n khuy&ecirc;n kh&iacute;ch c&aacute;c mối quan hệ.</p>

<p>Nếu c&oacute; cơ hội được nhận l&agrave;m ở nước ngo&agrave;i, h&atilde;y kiểm tra trước chuyến đi xem c&ocirc;ng ty đ&oacute; c&oacute; được c&ocirc;ng nhận tại H&agrave;n Quốc hay kh&ocirc;ng</p>

<p><strong><em>Một số website hữu &iacute;ch để t&igrave;m việc l&agrave;m tại H&agrave;n Quốc</em></strong></p>

<p><em>&nbsp;HigherEd jobs&nbsp;&ndash; d&agrave;nh cho c&aacute;c vị tr&iacute; Tiến sĩ, Sau Tiến sĩ, nghi&ecirc;n cứu v&agrave; giảng dạy tại c&aacute;c trường đại học H&agrave;n Quốc</em></p>

<p><em>Korean national job centre&nbsp;&ndash; được hỗ trợ bởi Ch&iacute;nh phủ H&agrave;n Quốc</em></p>

<p><em>Work net&nbsp;&nbsp;&ndash; Cổng th&ocirc;ng tin tuyển dụng</em></p>

<p><em>Hi Korea &ndash; d&agrave;nh cho người nước ngo&agrave;i tại H&agrave;n Quốc</em></p>

<p><em>Government website on employment&nbsp;&ndash; trang web về việc l&agrave;m của ch&iacute;nh phủ</em></p>
', N'/Uploads/images/Du%20hoc%20Han/01-parttime-010318.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Han/01-parttime-010318.jpg', 1, 1, 1, 45, CAST(N'2018-07-02 20:45:35.7767554' AS DateTime2), CAST(N'2018-07-02 20:45:35.7767554' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (18, 1, 3, N'Du học Hàn Quốc: Có nên hay không?', N'Hàn Quốc là nước có nền giáo dục xuất sắc trong khu vực châu Á cũng như luôn đứng top trong các nước có đầu tư cao về giáo dục. Do đó, du học Hàn Quốc là mong muốn của nhiều bạn trẻ nhưng ở một góc độ nào đó, nó cũng chẳng hề dễ chịu như những gì bạn vẫn tưởng tượng. Sau đây là những lý do bạn nên đi du học Hàn Quốc và những điều bạn cần cân nhắc trước khi quyết định.', N'<h2><strong>Những l&yacute; do N&Ecirc;N đi du học H&agrave;n Quốc</strong></h2>

<h3>&nbsp;Sức cạnh tranh về Gi&aacute;o dục</h3>

<p>Theo &lsquo;b&aacute;o c&aacute;o về sức cạnh tranh Quốc Gia&rsquo; của viện Nghi&ecirc;n Cứu Ph&aacute;t Triển Kinh Doanh Quốc Tế của Thụy Sĩ th&igrave; sức cạnh tranh trong gi&aacute;o dục của H&agrave;n Quốc đứng ở vị tr&iacute; thứ 29 trong số 59 nước l&agrave; đối tượng điều tra. Tiếp đ&oacute; l&agrave; Singapore, Đ&agrave;i Loan v&agrave; Hồng K&ocirc;ng đứng thứ 4, cao hơn cả Nhật Bản v&agrave; Trung Quốc. Hơn nữa, tại hội thảo nghi&ecirc;n cứu Quốc tế về th&agrave;nh t&iacute;ch học tập (PISA) do Cơ quan Nghi&ecirc;n Cứu Ph&aacute;t Triển Hợp T&aacute;c Kinh Tế (OECD) tổ chức th&igrave; trong những năm gần đ&acirc;y H&agrave;n Quốc li&ecirc;n tục chiếm vị tr&iacute; 3-6 trong số 65 nước. Đặc biệt, H&agrave;n Quốc chiếm vị tr&iacute; thứ 1 tại hội thảo đ&aacute;nh gi&aacute; năng lực đọc kĩ thuật số. Với nền tảng dựa tr&ecirc;n sức cạnh tranh Gi&aacute;o dục n&agrave;y, H&agrave;n Quốc c&oacute; thể cung cấp dịch vụ Gi&aacute;o dục tốt nhất cho Du học sinh c&aacute;c nước</p>

<p><img alt="" src="data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=" style="height:296px; width:455px" title="dai-hoc-han-quoc" /></p>

<p>H&agrave;n Quốc c&oacute; nền gi&aacute;o dục hiện đại</p>

<h3>Một đất nước văn minh c&oacute; nền khoa học ứng dụng v&agrave; c&ocirc;ng nghệ ti&ecirc;n tiến</h3>

<p>Trong t&agrave;i liệu nghi&ecirc;n cứu về chỉ số ph&aacute;t triển ICT do Hội Li&ecirc;n Minh Viễn Th&ocirc;ng Quốc Tế(ITU) đ&atilde; ph&aacute;t biểu, H&agrave;n Quốc chiếm vị tr&iacute; thứ 1 trong số 152 nước l&agrave; đối tượng khảo s&aacute;t. Lĩnh vực điện tử viễn th&ocirc;ng của H&agrave;n Quốc đang tự h&agrave;o đạt được ti&ecirc;u chuẩn cao h&agrave;ng đầu thế giới trong c&aacute;c ng&agrave;nh như: m&aacute;y m&oacute;c, h&oacute;a học, đ&oacute;ng t&agrave;u, c&ocirc;ng nghiệp chế tạo xe hơi. Việc mở rộng mạng internet tốc độ cao vượt mức 20.000.000 hộ, đa số c&aacute;c gia đ&igrave;nh đều đang sử dụng dịch vụ n&agrave;y. X&eacute;t tr&ecirc;n phương diện l&agrave; Quốc gia c&oacute; hệ thống điện tử viễn th&ocirc;ng vững mạnh h&agrave;ng đầu thế giới, c&oacute; thể đưa ra kết luận l&agrave; truyền thống v&agrave; c&ocirc;ng nghệ của H&agrave;n Quốc ph&ugrave; hợp với lĩnh vực s&aacute;ng tạo cũng như c&aacute;c kĩ thuật ti&ecirc;n tiến mới. Cơ hội du học tại H&agrave;n Quốc-một đất nước c&oacute; sức mạnh c&ocirc;ng nghệ ở tầm cao tr&ecirc;n thế giới l&agrave; nền tảng mang lại cho c&aacute;c bạn một tương lại th&agrave;nh c&ocirc;ng.</p>

<h3>&nbsp;Nền văn h&oacute;a đa dạng v&agrave; một cuộc sống năng động</h3>

<p>H&agrave;n Quốc l&agrave; một đất nước c&oacute; nền văn h&oacute;a v&agrave; truyền thống l&acirc;u đời, đang bảo tồn nhiều di sản văn h&oacute;a v&agrave; ph&aacute;t huy truyền thống đ&oacute;. Nền văn h&oacute;a vật thể, phi vật thể được h&igrave;nh th&agrave;nh qua h&agrave;ng ngh&igrave;n năm lịch sử được kế thừa nguy&ecirc;n vẹn khắp nơi trong x&atilde; hội cho đến ng&agrave;y nay.</p>

<p><img alt="" src="data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=" style="height:333px; width:500px" title="du-hoc-han-quoc-van-hoa-dac-sac" /></p>

<p>H&agrave;n Quốc c&oacute; nền văn h&oacute;a đặc sắc gi&agrave;u truyền thống</p>

<p>L&agrave;n s&oacute;ng h&acirc;m mộ H&agrave;n Quốc bắt đầu từ những bộ phim truyền h&igrave;nh H&agrave;n Quốc đ&atilde; lan rộng th&agrave;nh t&igrave;nh cảm y&ecirc;u qu&yacute; đối với văn h&oacute;a H&agrave;n Quốc, v&agrave; t&igrave;nh y&ecirc;u đối với tiếng H&agrave;n Quốc. Gần đ&acirc;y sự h&acirc;m mộ của kh&aacute;n giả d&agrave;nh cho K-Pop, kh&ocirc;ng chỉ khẳng định l&agrave;n s&oacute;ng h&acirc;m mộ H&agrave;n Quốc m&agrave; c&ograve;n cho thấy tầm ảnh hưởng của n&oacute; tới nền văn h&oacute;a Thế Giới.</p>

<p>H&agrave;n Quốc l&agrave; một đất nước ph&aacute;t triển dựa tr&ecirc;n sự kết hợp h&agrave;i h&ograve;a giữa truyền thống l&acirc;u đời v&agrave; nền văn h&oacute;a hiện đại năng động. Cuộc sống du học tại nơi đất rất hấp dẫn v&agrave; nếu bạn được gi&aacute;o dục v&agrave; học tập trong m&ocirc;i trường như thế n&agrave;y th&igrave; bạn c&oacute; thể học c&aacute;ch l&atilde;nh đạo v&agrave; tầm nh&igrave;n s&aacute;ng suốt cần thiết của một nh&agrave; l&atilde;nh đạo mở đường cho nền văn minh nh&acirc;n loại trong tương lai.</p>

<h3>Học bổng l&agrave; thứ dễ săn t&igrave;m nhất</h3>

<p>C&oacute; hai loại học bổng thường thấy ở H&agrave;n Quốc l&agrave; học bổng của c&aacute;c trường ĐH v&agrave; học bổng của ch&iacute;nh phủ.</p>

<p>Với loại học bổng từ c&aacute;c trường ĐH, bạn phải đảm bảo th&agrave;nh t&iacute;ch học tập xuất sắc bởi gi&aacute; trị của học bổng c&oacute; thể dựa v&agrave;o kết quả học tập từng học kỳ. Để xin được loại học bổng n&agrave;y, bạn cần li&ecirc;n hệ trực tiếp với trường m&agrave; m&igrave;nh muốn theo học v&agrave; l&agrave;m theo c&aacute;c thủ tục cần thiết.</p>

<p>Học bổng của ch&iacute;nh phủ th&igrave; thường l&agrave; học bổng to&agrave;n phần v&agrave; điều kiện thường kh&oacute; khăn hơn. C&aacute;c sinh vi&ecirc;n nước ngo&agrave;i nhận học bổng n&agrave;y c&oacute; nhiệm vụ cố gắng đ&oacute;ng g&oacute;p tăng cường t&igrave;nh hữu nghị v&agrave; mối d&acirc;y li&ecirc;n hệ với H&agrave;n Quốc trong c&aacute;c lĩnh vực kh&aacute;c nhau như gi&aacute;o dục, giao lưu ch&iacute;nh thức với doanh nghiệp tr&ecirc;n to&agrave;n thế giới.</p>

<p>Nếu lo lắng về vấn đề t&agrave;i ch&iacute;nh khi du học H&agrave;n Quốc, bạn h&atilde;y l&ecirc;n kế hoạch săn những học bổng n&agrave;y ngay từ b&acirc;y giờ. Những y&ecirc;u cầu chung đối với ứng vi&ecirc;n x&eacute;t học bổng bao gồm:</p>

<p>&ndash; Người được học bổng nhất thiết phải l&agrave; c&ocirc;ng d&acirc;n của nước được cấp học bổng.</p>

<p>&ndash; Tuổi của người được nhận học bổng, t&iacute;nh đến ng&agrave;y 1/9 của năm nhận học bổng phải dưới 40 tuổi.</p>

<p>&ndash; Th&agrave;nh t&iacute;ch học tập tốt</p>

<p>&ndash; Lưu lo&aacute;t tiếng Anh hoặc tiếng H&agrave;n (Tiếng Anh tương đương TOEFL 550)</p>

<p>&ndash; Người theo học phải nỗ lực để tăng cường quan hệ hữu nghị giữa hai nước</p>

<p>C&aacute;c lợi &iacute;ch đi k&egrave;m với học bổng: V&eacute; m&aacute;y bay, chi ph&iacute; sinh hoạt, tiền học ph&iacute;, trợ cấp nghi&ecirc;n cứu, trợ cấp ổn định cuộc sống, trợ cấp chuyển nh&agrave;, chi ph&iacute; đ&agrave;o tạo tiếng, chi ph&iacute; in ấn luận văn, bảo hiểm y tế&hellip; Bạn c&oacute; thể tham khảo một số th&ocirc;ng tin về&nbsp;<a href="https://www.amec.com.vn/hoc-bong-du-hoc-han-quoc/">học bổng du học H&agrave;n Quốc mới nhất tại đ&acirc;y</a>.</p>

<h3>Điều kiện nhập học kh&ocirc;ng &ldquo;kh&oacute; nhằn&rdquo; như c&aacute;c nước ch&acirc;u &Acirc;u</h3>

<p>Điều kiện nhập học cho c&aacute;c trường ĐH ở H&agrave;n Quốc kh&ocirc;ng qu&aacute; kh&oacute; đ&aacute;p ứng. D&ugrave; một số trường c&oacute; những y&ecirc;u cầu ri&ecirc;ng, nhưng nh&igrave;n chung bạn sẽ vẫn dễ &ldquo;qua cửa&rdquo;.</p>

<p>Nếu bạn muốn theo học tiếng H&agrave;n ở xứ sở kim chi, bạn chỉ cần đ&atilde; tốt nghiệp THPT.</p>

<p>Nếu theo học bậc ĐH, Cao đẳng ở H&agrave;n Quốc, bạn phải tốt nghiệp THPT v&agrave; phải dưới 24 tuổi.</p>

<p>Nếu muốn theo học cao học th&igrave; bạn cần c&oacute; bằng tốt nghiệp ĐH chuy&ecirc;n ng&agrave;nh c&oacute; li&ecirc;n quan v&agrave; dưới 30 tuổi.</p>

<p>Về điều kiện t&agrave;i ch&iacute;nh, số tiền cần phải c&oacute; để đảm bảo chứng minh t&agrave;i ch&iacute;nh được &ldquo;tr&oacute;t lọt&rdquo; l&agrave; từ 10.000 &ndash; 30.000 USD trong t&agrave;i khoản hoặc sổ tiết kiệm.</p>

<h3>&nbsp;Chỗ ở, đi lại đẹp như &ldquo;thi&ecirc;n đường&rdquo;</h3>

<p>Ở mỗi trường ĐH đều c&oacute; k&yacute; t&uacute;c x&aacute; d&agrave;nh cho học sinh. Khu&ocirc;n vi&ecirc;n KTX của mỗi trường đều kh&aacute; đẹp v&agrave; hiện đại với mức chi ph&iacute; rẻ v&agrave; tiện lợi cho việc đi lại. Tuy nhi&ecirc;n để v&agrave;o được &ldquo;thi&ecirc;n đường&rdquo; n&agrave;y th&igrave; bạn phải đăng k&yacute; sớm bởi chỗ ở sẽ kh&ocirc;ng đủ cho to&agrave;n bộ sinh vi&ecirc;n của trường.</p>

<p><img alt="" src="data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=" style="height:364px; width:500px" title="du-hoc-han-quoc-canh-dep" /></p>

<p>Đất nước H&agrave;n Quốc c&oacute; nhiều phong cảnh đẹp</p>

<p>Về phương tiện đi lại, c&oacute; thể n&oacute;i giao th&ocirc;ng c&ocirc;ng cộng của H&agrave;n Quốc rất tiện lợi v&agrave; gi&aacute; rẻ khoảng 600 won/lần. Ở c&aacute;c th&agrave;nh phố lớn Seoul, Degu, Pusan đều c&oacute; mạng lưới xe điện ngầm. Một tip nhỏ cho bạn l&agrave; n&ecirc;n sử dụng xe bus bởi xe bus H&agrave;n Quốc kh&ocirc;ng những rẻ m&agrave; c&ograve;n rất sạch đẹp v&agrave; th&aacute;i độ phục vụ rất th&acirc;n thiện.</p>

<h3>&nbsp;Chi ph&iacute; du học hợp l&iacute;</h3>

<p>H&agrave;n Quốc c&oacute; mức chi ph&iacute; du học về học ph&iacute; cũng như sinh hoạt ph&iacute; tương đối rẻ so với c&aacute;c nước học bằng tiếng Anh như Mĩ, Canada hoặc Anh Quốc, v.v&hellip; Kh&ocirc;ng y&ecirc;u cầu du học sinh phải chi trả bất k&igrave; khoản tiền bổ sung n&agrave;o kh&aacute;c, ngo&agrave;i ra c&ograve;n c&oacute; nhiều chương tr&igrave;nh học bổng gi&uacute;p du học sinh giảm bớt &aacute;p lực g&aacute;nh nặng kinh tế. Theo ph&aacute;t biểu của Ch&iacute;nh phủ H&agrave;n Quốc, trong thời gian gần đ&acirc;y, việc hỗ trợ nhiều mặt cho du học sinh như: cấp học bổng, chỗ ở KTX, việc l&agrave;m th&ecirc;m, xin việc sau khi tốt nghiệp, v.v&hellip; v&agrave; giảm bớt c&aacute;c quy chế phức tạp khiến cho việc du học ở H&agrave;n Quốc th&ecirc;m tiện lợi với mức chi ph&iacute; phải chăng.</p>

<p>Với những bạn muốn theo học tiếng H&agrave;n th&igrave; mức học ph&iacute; sẽ v&agrave;o khoảng 1.600 &ndash; 4.700 USD/năm.</p>

<p>Học đại học v&agrave; cao học th&igrave; mức học ph&iacute; sẽ nhỉnh hơn ch&uacute;t x&iacute;u, từ 1.800 &ndash; 4.900 USD/năm với bậc đại học v&agrave; từ 2.500 &ndash; 4.000 USD/năm đối với bậc cao học.</p>

<p>Chi ph&iacute; nội tr&uacute; v&agrave;o mức 200 &ndash; 400 USD/th&aacute;ng v&agrave; mức chi ph&iacute; tiền ăn ở H&agrave;n Quốc cũng v&agrave;o khoảng 100 &ndash; 200 USD/th&aacute;ng.</p>

<p>Điều kiện ăn ở v&agrave; sinh hoạt ở H&agrave;n Quốc cũng c&oacute; sự kh&aacute;c nhau giữa c&aacute;c v&ugrave;ng, nhưng thường th&igrave; khoảng 400.000-500.000 won/th&aacute;ng l&agrave; bạn c&oacute; thể sống kh&aacute; thoải m&aacute;i.</p>

<h3>&nbsp;Rủng rỉnh t&uacute;i từ c&ocirc;ng việc part-time</h3>

<p>Một l&yacute; do hấp dẫn c&aacute;c học sinh quốc tế tới H&agrave;n Quốc học tập l&agrave; cơ hội việc l&agrave;m. Trung b&igrave;nh một du học sinh được ph&eacute;p l&agrave;m th&ecirc;m 28 giờ/tuần trong suốt kho&aacute; học v&agrave; 8h/ng&agrave;y trong c&aacute;c kỳ nghỉ. Thu nhập của mỗi giờ l&agrave;m việc từ 7 &ndash; 9 USD.</p>

<p>Bởi vậy ngo&agrave;i thời gian đảm bảo cho việc học tập, bạn c&oacute; thể kiếm việc l&agrave;m th&ecirc;m cho m&igrave;nh, vừa trải nghiệm cuộc sống, vừa đủ tiền trang trải c&aacute;c chi ph&iacute; sinh hoạt.</p>

<h3>&nbsp;Chuẩn bị hồ sơ nhanh, gọn, lẹ</h3>

<p>1/ Đơn xin học</p>

<p>2/ Bằng tốt nghiệp phổ th&ocirc;ng trung học nếu xin học ĐH</p>

<p>3/ Bằng tốt nghiệp cao đẳng hay ĐH nếu xin học cao học</p>

<p>4/ Kết quả học tập ở cấp học cao nhất đ&atilde; đạt được</p>

<p>5/ Hai thư giới thiệu m&agrave; một thư phải do gi&aacute;o sư/ giảng vi&ecirc;n ở Việt Nam tận tay gửi gắm, thư c&ograve;n lại c&oacute; thể từ trường THPT/ CĐ &ndash; ĐH hoặc địa phương</p>

<p>6/ Chứng chỉ th&agrave;nh thạo tiếng H&agrave;n hoặc bảng điểm TOEFL ch&iacute;nh thức</p>

<p>7/ Kế hoạch học tập (kế hoạch n&agrave;y bạn phải l&agrave;m thật chi tiết sẽ c&oacute; ưu thế hơn trong việc x&eacute;t phỏng vấn)</p>

<p>8/ Giới thiệu về bản th&acirc;n</p>

<p>9/ Hồ sơ về c&aacute;c c&ocirc;ng việc đ&atilde; l&agrave;m được (cho sinh vi&ecirc;n c&aacute;c ng&agrave;nh thể thao hoặc nghệ thuật)</p>

<p>Trường sẵn s&agrave;ng chi đậm cho những dự &aacute;n/ th&iacute; nghiệm của bạn</p>

<p>Bạn c&oacute; thể nhận được 300.000 won/th&aacute;ng cho bậc học cử nh&acirc;n v&agrave; 330.000 won/th&aacute;ng cho bậc tiến sĩ (mức trung b&igrave;nh ở H&agrave;n).</p>

<p>Trường cũng sẽ hỗ trợ cho c&aacute;c dự &aacute;n v&agrave; th&iacute; nghiệm của bạn với mức tiền kh&aacute; &ldquo;h&agrave;o ph&oacute;ng&rdquo;: v&iacute; dụ ở khoa m&ocirc;i trường: mỗi cử nh&acirc;n sẽ được hỗ trợ 300.000 USD, tiến sĩ</p>

<p>KTX c&oacute; bếp nấu ăn cho sinh vi&ecirc;n, m&aacute;y giặt, điều h&ograve;a, l&ograve; sưởi, ph&ograve;ng TV, ph&ograve;ng tiếng, Gym&hellip;</p>

<h2><strong>Những điều cần C&Acirc;N NHẮC khi đi du học H&agrave;n Quốc</strong></h2>

<h3>&Aacute;p lực học tập căng thẳng</h3>

<p>Theo chia sẻ của c&aacute;c du học sinh th&igrave; &aacute;p lực học tập nghi&ecirc;n cứu ở H&agrave;n Quốc l&agrave; rất căng thẳng, đặc biệt đối với c&aacute;c nghi&ecirc;n cứu sinh.C&aacute;c du học sinh thường phải l&agrave;m việc từ s&aacute;ng tới tối, thậm ch&iacute; ngủ tại lab. Những đợt gần tới hạn nộp kết quả, l&agrave;m việc th&acirc;u đ&ecirc;m suốt s&aacute;ng l&agrave; chuyện b&igrave;nh thường.</p>

<p>C&aacute;c gi&aacute;o sư cũng rất nghi&ecirc;m khắc. Bạn c&oacute; thể bị qu&aacute;t, mắng, thậm ch&iacute; bị đ&aacute;nh nếu gi&aacute;o sư kh&ocirc;ng h&agrave;i l&ograve;ng. Giữa đ&ecirc;m, bạn cũng c&oacute; thể bị gi&aacute;o sư gọi dậy nếu c&oacute; việc cần. C&oacute; những người kh&ocirc;ng thể chịu được &aacute;p lực đ&atilde; phải bỏ về. Đối với c&aacute;c du học sinh nữ, y&ecirc;u cầu c&oacute; thể nhẹ nh&agrave;ng hơn. Ngo&agrave;i ra, c&aacute;c gi&aacute;o sư trẻ của H&agrave;n Quốc ở c&aacute;c nước phương T&acirc;y về cũng c&oacute; xu hướng nh&atilde; nhặn hơn. N&ecirc;n khi chọn gi&aacute;o sư hướng dẫn, bạn cần t&igrave;m hiểu rất kĩ.</p>

<h3>Đồ ăn cay n&oacute;ng</h3>

<p>Ở xứ sở kim chi, muối, hạt ti&ecirc;u v&agrave; ớt l&agrave; những gia vị rất quan trọng, hầu như m&oacute;n ăn n&agrave;o họ cũng cho những gia vị kể tr&ecirc;n. Đồ ăn H&agrave;n Quốc rất ngon, cầu kỳ trong c&aacute;ch chế biến v&agrave; phối hợp c&aacute;c nguy&ecirc;n liệu. Tuy nhi&ecirc;n, c&oacute; lẽ v&igrave; người d&acirc;n ở đ&acirc;y sống trong thời tiết gi&aacute; lạnh n&ecirc;n họ thường cho qu&aacute; nhiều gia vị n&oacute;ng v&agrave;o đồ ăn, đ&ocirc;i khi l&agrave; qu&aacute; đ&agrave; khiến cho thực kh&aacute;ch kh&ocirc;ng quen ăn cay c&oacute; khi phải chảy nước mắt&hellip;</p>

<p><img alt="" src="https://www.amec.com.vn/wp-content/uploads/2013/09/du-hoc-han-quoc-do-an-cay-nong.jpg" style="height:233px; width:500px" title="du-hoc-han-quoc-do-an-cay-nong" /></p>

<p>Đồ ăn H&agrave;n Quốc thường cay v&agrave; hay d&ugrave;ng với Kim Chi</p>

<h3>R&agrave;o cản ng&ocirc;n ngữ</h3>

<p>Kh&ocirc;ng &iacute;t c&aacute;c bạn trẻ khi sang H&agrave;n Quốc gặp phải rất nhiều kh&oacute; khăn v&igrave; vấn đề ng&ocirc;n ngữ. Ở Việt Nam, c&aacute;c bạn chủ yếu chỉ học tiếng H&agrave;n ứng dụng, giao tiếp. V&igrave; vậy hầu hết c&aacute;c bạn đều bị stress khi phải đối mặt với những b&agrave;i giảng mang t&iacute;nh học thuật cao. Th&ecirc;m v&agrave;o đ&oacute;, sinh vi&ecirc;n H&agrave;n Quốc rất chăm chỉ. V&igrave; vậy, c&aacute;c bạn cần nỗ lực học l&agrave; chủ yếu. V&agrave; hỗ trợ cho việc tự học đ&oacute; l&agrave; nguồn t&agrave;i liệu v&agrave; s&aacute;ch vở tiếng Anh rất phong ph&uacute;. Việc nghi&ecirc;n cứu cũng đ&ograve;i hỏi t&iacute;nh độc lập cực kỳ cao.</p>

<h3>&nbsp;Kh&aacute;c biệt về văn h&oacute;a</h3>

<p>L&agrave; một nước ph&aacute;t triển nhanh, nhưng những n&eacute;t văn h&oacute;a truyền thống như &ldquo;t&ocirc;n sư trọng đại&rdquo; được giữ g&igrave;n kh&aacute; tốt. Sinh vi&ecirc;n H&agrave;n Quốc lu&ocirc;n thực sự t&ocirc;n trọng c&aacute;c giảng vi&ecirc;n. Học cũng tham gia c&aacute;c giờ học với th&aacute;i độ ho&agrave;n to&agrave;n nghi&ecirc;m t&uacute;c.</p>

<p>Người H&agrave;n Quốc n&oacute;i tiếng anh kh&ocirc;ng giỏi v&agrave; họ cũng ngại giao tiếp bằng tiếng anh. Do đ&oacute;, bạn cần chuẩn bị cho m&igrave;nh vốn tiếng H&agrave;n đủ giao tiếp trước khi quyết định du học ở xứ sở kim chi n&agrave;y.</p>

<p>H&agrave;nh động vỗ vai, vỗ lưng ở đất nước n&agrave;y chỉ đơn giản mang t&iacute;nh động vi&ecirc;n, kh&iacute;ch lệ người kh&aacute;c.</p>

<h2>Lời kết</h2>

<p>H&agrave;n Quốc l&agrave; đất nước đ&aacute;ng đi du học v&igrave; c&oacute; nền gi&aacute;o dục ph&aacute;t triển, nhiều cơ hội học bổng, điều kiện sống v&agrave; sinh hoạt thuận lợi. Tuy nhi&ecirc;n, nếu bạn c&oacute; nhiều cơ hội học bổng để đi du học c&aacute;c nước kh&aacute;c&nbsp; đặc biệt l&agrave; c&aacute;c nước n&oacute;i tiếng Anh như &Uacute;c, H&agrave; Lan, Canada, Na Uy&hellip; th&igrave; H&agrave;n Quốc chưa phải l&agrave; sự lựa chọn tốt nhất v&igrave; m&ocirc;i trường học tập căng thẳng, văn h&oacute;a g&ograve; b&oacute; sự ph&aacute;t triển c&aacute; nh&acirc;n, v&agrave; r&agrave;o cản ng&ocirc;n ngữ (bạn kh&ocirc;ng c&oacute; được tiếng Anh ho&agrave;n hảo vốn l&agrave; lợi thế lớn cho ph&aacute;t triển sự nghiệp sau n&agrave;y).</p>
', N'/Uploads/images/Du%20hoc%20Han/du-hoc-han-quoc-canh-dep1.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Han/du-hoc-han-quoc-canh-dep1.jpg', 1, 1, 2, 84, CAST(N'2018-07-02 20:47:16.2239705' AS DateTime2), CAST(N'2018-07-02 20:47:16.2239705' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (19, 1, 3, N'Quy định mới nhất đi du học Hàn Quốc 2018 có thể bạn chưa biết', N'Để tránh tình trạng hồ sơ du học ngày càng nhiều, ngăn chặn việc môi giới bất hợp pháp, xây dựng ý thức chuẩn bị du học một cách lành mạnh cho học sinh, sinh viên Việt Nam.  Năm 2018 Đại sứ quán Hàn Quốc tại Việt Nam chính thức đưa ra một số điều luật liên quan đến Visa du học như sau:', N'<p><strong><img alt="" src="http://vieclamhanquoc.vn/images/2016/05/30/cong-dong-du-hoc-sinh.jpg" /></strong></p>

<p><br />
<em>Cộng đồng du học sinh Việt Nam tại H&agrave;n Quốc</em><br />
<br />
<strong>Quy định mới nhất đi du học H&agrave;n Quốc c&aacute;c bạn n&ecirc;n biết</strong><br />
&nbsp;</p>

<h2><strong>I. Kiểm tra chặt chẽ hồ sơ tốt nghiệp v&agrave; năng lực tiếng H&agrave;n</strong></h2>

<p>&nbsp;</p>

<p>Khi đăng k&iacute; xin visa học tiếng H&agrave;n, du học sinh cần phải bổ sung th&ecirc;m th&ocirc;ng tin li&ecirc;n quan đến trường THPT &nbsp;v&agrave; c&aacute;c th&ocirc;ng tin li&ecirc;n qu&aacute;n tới Trung t&acirc;m tư vấn du học hoặc gi&aacute;o vi&ecirc;n dạy tiếng H&agrave;n.<br />
<br />
Những th&ocirc;ng tin n&agrave;y sẽ được Đại sứ qu&aacute;n trực tiếp x&aacute;c minh t&iacute;nh ch&iacute;nh x&aacute;c của c&aacute;c loại hồ sơ cần thiết đi du học như: học bạ, bằng tốt nghiệp, x&aacute;c nhận l&atilde;nh sự một c&aacute;ch chặt chẽ. Đối với những trường hợp kh&ocirc;ng thể x&aacute;c thực được theo c&aacute;ch tr&ecirc;n th&igrave; Đại sứ qu&aacute;n phải tăng cường phỏng vấn du học sinh.<br />
<br />
&gt;&gt; Xem th&ecirc;m:&nbsp;<strong><a href="http://vieclamhanquoc.vn/huong-dan-quy-trinh-thu-tuc-di-du-hoc-han-quoc-moi-nhat-hien-nay-214.htm">Hướng dẫn quy tr&igrave;nh, thủ tục đi du học H&agrave;n Quốc mới nhất hiện nay</a></strong><br />
&nbsp;<strong><img alt="" src="http://vieclamhanquoc.vn/images/2016/05/30/0-bang-tot-nghiep.png" /></strong></p>

<p><br />
<em>Lưu &yacute; những loại giấy tờ cần chuẩn bị trước khi đi du học H&agrave;n Quốc</em></p>

<p>&nbsp;</p>

<p>Đề nghị c&aacute;c học sinh, sinh vi&ecirc;n xin Visa v&agrave; c&aacute;c Trung t&acirc;m tư vấn du học nỗ lực li&ecirc;n kết để Đại sứ qu&aacute;n H&agrave;n Quốc c&oacute; thể kiểm tra t&iacute;nh x&aacute;c thực của&nbsp;hồ sơ đi du học H&agrave;n Quốc&nbsp;tại trường THPT th&ocirc;ng qua điện thoại hoặc c&ocirc;ng văn.&nbsp;<br />
<br />
<strong>&gt;&gt; Bạn n&ecirc;n biết:&nbsp;<a href="http://vieclamhanquoc.vn/huong-dan-chuan-bi-ho-so-giay-to-di-du-hoc-han-quoc-100.htm">Những loại giấy tờ cần phải chuẩn bị khi đi du học H&agrave;n Quốc</a></strong><br />
<br />
Trường hợp học sinh c&oacute; th&agrave;nh t&iacute;ch học tập thấp, Đại sứ qu&aacute;n sẽ tăng cường kiểm tra ng&ocirc;n ngữ H&agrave;n nhằm t&igrave;m hiểu r&otilde; mục đ&iacute;ch du học v&agrave; quyết t&acirc;m học tập của học sinh.</p>

<h2><br />
<strong>II. Thời gian nộp lại hồ sơ sau khi bị từ chối cấp visa sẽ được r&uacute;t ngắn, nghi&ecirc;m chỉnh xử l&iacute; đối với trường hợp nộp giấy tờ giả</strong></h2>

<p><br />
R&uacute;t ngắn thời gian được nộp lại hồ sơ sau khi bị từ chối cấp visa v&agrave; tăng cường xử l&yacute; đối với học sinh nộp giấy tờ giả.<br />
<br />
Trong trường hợp hồ sơ sau khi bị từ chối sẽ được r&uacute;t ngắn từ 6 th&aacute;ng xuống c&ograve;n 3 th&aacute;ng với l&yacute; do thiếu sự chuẩn bị khi đi du học như năng lực tiếng H&agrave;n k&eacute;m.<br />
&nbsp;</p>

<p><img alt="" src="http://vieclamhanquoc.vn/images/2016/05/30/hoc-bong-han-quoc.jpg" /></p>

<p><br />
<em>Du học H&agrave;n Quốc cơ hội mở rộng tương lai</em></p>

<p>&nbsp;<br />
Nghi&ecirc;m chỉnh xử phạt đối với học sinh nộp giấy tờ giả<br />
&nbsp;<br />
Ngo&agrave;i ra, đối với việc&nbsp;<a href="http://vieclamhanquoc.vn/du-hoc-han-quoc/"><strong>du học H&agrave;n Quốc</strong></a>&nbsp;sinh vi&ecirc;n nộp giấy tờ giả, bị ph&aacute;t hiện sẽ bị từ chối cấp visa. Đại sứ qu&aacute;n H&agrave;n Quốc tại Việt Nam sẽ lưu to&agrave;n bộ th&ocirc;ng tin c&aacute;c nh&acirc;n của người c&oacute; li&ecirc;n quan để lưu &yacute; khi cấp c&aacute;c loại visa kh&aacute;c như visa du lịch. Xử phạt mạnh tay đối với c&aacute;c Trung t&acirc;m tư vấn du học tội bao che, dung t&uacute;ng cho h&agrave;nh vi n&agrave;y.<br />
<br />
C&aacute;c thủ tục kh&aacute;c giữ nguy&ecirc;n như cũ.(<strong>Chi tiết thủ tục xin Visa du học H&agrave;n Quốc&nbsp;<a href="http://vieclamhanquoc.vn/thu-tuc-cap-visa-di-du-hoc-han-quoc-164.htm">tại đ&acirc;y</a>)</strong><br />
&nbsp;</p>

<h2><strong>III. C&aacute;c thủ tục đi du học H&agrave;n Quốc c&oacute; thể bạn chưa biết</strong><br />
&nbsp;</h2>

<p><em><u><strong>Bước 1:&nbsp;Chọn trường đăng k&iacute; đi du học H&agrave;n Quốc</strong></u></em><br />
<br />
<strong>Điều kiện đi du học H&agrave;n Quốc</strong><br />
<br />
- &nbsp;Học Cao đẳng/ Đại&nbsp;Học: Tốt nghiệp THPT, dưới 24 tuổi.<br />
- &nbsp;Học Cao học: Tốt nghiệp đại học&nbsp;chuy&ecirc;n ng&agrave;nh c&oacute; li&ecirc;n quan, dưới 30 tuổi.<br />
- &nbsp;C&oacute; chứng chỉ tiếng H&agrave;n hoặc tiếng Anh.<br />
<br />
Như vậy c&aacute;c bạn dưới 30 tuổi đều c&oacute; cơ hội tham gia để đi&nbsp;<strong>du học H&agrave;n Quốc</strong>. Điều quan trọng l&agrave; lựa chọn ng&ocirc;i trường n&agrave;o để ph&ugrave; hợp với chất lượng hồ sơ của bản th&acirc;n.<br />
&nbsp;<br />
Việc đầu ti&ecirc;n v&agrave; quan trọng khi đăng k&iacute; đi&nbsp;<strong>du học H&agrave;n Quốc</strong>&nbsp;l&agrave; chọn trường cho ph&ugrave; hợp với bản th&acirc;n<br />
<br />
&nbsp;</p>

<p><u><em><strong>Bước 2. Chuẩn bị hồ sơ xin học v&agrave; xin học bổng du học H&agrave;n Quốc</strong></em></u></p>

<p>&nbsp;</p>

<p><strong>Quy tr&igrave;nh x&eacute;t visa du học H&agrave;n Quốc</strong><br />
&nbsp;<br />
Sau khi đ&atilde; lựa chọn được ng&ocirc;i trường ph&ugrave; hợp với bản th&acirc;n c&aacute;c bạn phải nhanh ch&oacute;ng l&agrave;m hồ sơ. Đặc biệt đối với c&aacute;c bạn chưa c&oacute; ngoại ngữ th&igrave; phải phải nhanh ch&oacute;ng bổ sung<br />
<br />
<strong>Hồ sơ đi du học H&agrave;n Quốc 2016 bao gồm:</strong><br />
<br />
1/ Đơn xin học<br />
2/ Bằng tốt nghiệp phổ th&ocirc;ng trung học nếu xin học đại học<br />
3/ Bằng tốt nghiệp cao đẳng hay đại học nếu xin học cao học<br />
4/ Kết quả học tập ở cấp học cao nhất đ&atilde; đạt được<br />
5/ Hai thư giới thiệu m&agrave; một thư phải do gi&aacute;o sư/ giảng vi&ecirc;n ở Việt Nam tận tay gửi gắm, thư c&ograve;n lại c&oacute; thể từ trường THPT/ CĐ &ndash; đại học hoặc địa phương<br />
6/ Chứng chỉ th&agrave;nh thạo tiếng H&agrave;n hoặc bảng điểm TOEFL ch&iacute;nh thức<br />
7/ Kế hoạch học tập (Đ&acirc;y l&agrave; cơ hội tốt để bạn g&acirc;y ấn tượng trong việc x&eacute;t phỏng vấn n&ecirc;n bản kế hoạch học tập phải thật chi tiết)<br />
8/ Giới thiệu về bản th&acirc;n<br />
9/ Hồ sơ về c&aacute;c c&ocirc;ng việc đ&atilde; l&agrave;m được&nbsp;(đối với sinh vi&ecirc;n c&aacute;c ng&agrave;nh thể thao hoặc nghệ thuật)</p>

<p>&nbsp;</p>

<p><u><em><strong>Bước 3: &nbsp;Xin visa v&agrave; chứng minh t&agrave;i ch&iacute;nh</strong></em></u></p>

<p>&nbsp;</p>

<p><u><em><strong>Bước 4: &nbsp;Điều kiện học tập v&agrave; sinh hoạt khi du học H&agrave;n Quốc</strong></em></u><br />
<br />
Sau khi đ&atilde; ho&agrave;n thiện mọi thủ tục, con đường&nbsp;<strong>du học H&agrave;n Quốc</strong>&nbsp;đ&atilde; rộng mở với bạn. Tuy nhi&ecirc;n, để đảm bảo nhanh ch&oacute;ng bắt kịp buổi học đầu ti&ecirc;n, tại đất nước xa lạ, bạn cần nhanh ch&oacute;ng đặt v&eacute; m&aacute;y bay sớm, chuẩn bị h&agrave;ng l&iacute;, t&igrave;m chỗ ở v&agrave; cuộc sống, phong tục tập qu&aacute;n con người nơi đ&acirc;y. Một vấn đề cực k&igrave; quan trọng đối với du học sinh tự t&uacute;c &ndash; đ&oacute; ch&iacute;nh l&agrave; vi&ecirc;c l&agrave;m th&ecirc;m.<br />
<br />
Một l&yacute; do hấp dẫn c&aacute;c học sinh quốc tế tới&nbsp;H&agrave;n Quốc&nbsp;học tập l&agrave; cơ hội việc l&agrave;m. Trung b&igrave;nh một du học sinh được ph&eacute;p l&agrave;m th&ecirc;m 28 giờ/tuần trong suốt kho&aacute; học v&agrave; 8h/ ng&agrave;y trong c&aacute;c kỳ nghỉ. Thu nhập của mỗi giờ l&agrave;m việc từ 7 đến 9 USD. Như vậy c&oacute; thể chắc chắn rằng ngo&agrave;i thời gian đảm bảo cho học tập, du học sinh vẫn c&oacute; thể đi l&agrave;m v&agrave; đủ tiền trang trải cho sinh hoạt của m&igrave;nh.</p>
', N'/Uploads/images/Du%20hoc%20Han/hoc-bong-han-quoc.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Han/hoc-bong-han-quoc.jpg', 1, 1, 2, 18, CAST(N'2018-07-02 20:48:31.3996535' AS DateTime2), CAST(N'2018-07-02 20:48:31.3996535' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (20, 1, 2, N'Du học miễn học phí tại nước Đức', N'Sau đây là những lý do tại sao ngày càng có nhiều học sinh, sinh viên Việt Nam sang Đức học tập. Với sự ưu việt của nước Đức: nền kinh tế chính trị ổn định hàng đầu Châu Âu, miễn học phí bậc đại học và trên đại học, vv.. Nước Đức hiện nay là điểm đến của nhiều thế hệ sinh viên Việt Nam tới học tập, nghiên cứu và phát triển nghề nghiệp, thậm chí tìm kiếm cơ hội định cư lâu dài.', N'<p><em><u><strong>1. M&ocirc;i trường học tập hấp dẫn.</strong></u></em><br />
<br />
&nbsp;Tại Đức bạn c&oacute; cơ hội học tập ở những trường Đại học c&oacute; chất lượng đ&agrave;o tạo thuộc Top những nước h&agrave;ng đầu thế giới. Bằng tốt nghiệp ở c&aacute;c trường Đại học ở Đức được c&ocirc;ng nhận tr&ecirc;n to&agrave;n ch&acirc;u &Acirc;u v&agrave; thế giới.&nbsp;<br />
<br />
&nbsp; Tại Đức bạn c&oacute; thể lựa chọn học trong 12.500 ng&agrave;nh học kh&aacute;c nhau ở tr&ecirc;n hơn&nbsp;400&nbsp;Trường Đại học trải đều tr&ecirc;n khắp nước Đức.&nbsp;<a href="http://duhocduc.vn/dieu-kien-de-du-hoc-duc/dieu-kien-de-du-hoc-duc-nam-2018.html">Xin c&aacute;c bạn tham khảo điều kiện du học Đức năm 2018 mới nhất tại đ&acirc;y.</a><br />
<br />
<em><u><strong>2. Miễn học ph&iacute; hoặc phải đ&oacute;ng với mức thấp nhất.</strong></u></em><br />
<br />
&nbsp; &nbsp;Một điều đặc biệt nữa l&agrave; ngay cả khi t&agrave;i ch&iacute;nh của gia đ&igrave;nh bạn kh&ocirc;ng dư dả, bạn kh&ocirc;ng c&oacute; khả năng chi trả cho c&aacute;c khoản học ph&iacute; v&agrave; sinh hoạt ph&iacute; cao như ở Mỹ, Anh, Singapore&hellip; th&igrave; bạn vẫn c&oacute; c&oacute; khả năng đi du học ở Đức.&nbsp;<em>Bởi v&igrave; hầu hết c&aacute;c trường Đại học ở Đức hiện nay kh&ocirc;ng thu học ph&iacute;. Việc miễn học ph&iacute; Đại học ở Đức nằm trong ti&ecirc;u ch&iacute; đảm bảo cơ hội gi&aacute;o dục b&igrave;nh đẳng cho người d&acirc;n. Hiện nay chỉ c&oacute; một bang trong tổng số 16 bang của Đức thực hiện việc thu học ph&iacute; đối với sinh vi&ecirc;n nước ngo&agrave;i, nhưng chỉ ở mức vừa phải: 1.500 Euro/học kỳ</em>.</p>

<p>&nbsp;Với c&aacute;c bạn kh&ocirc;ng đủ điều kiện để đi du học đại học, c&aacute;c bạn c&oacute; thể lựa chọn học nghề tại Đức. Với c&aacute;c chương tr&igrave;nh đ&agrave;o tạo nghề c&oacute; hưởng lương ở Đức c&aacute;c bạn được chu cấp đầy đủ tiền ăn, ở v&agrave; sinh hoạt ph&iacute; (khoảng 800 đến 1.000 Euro/th&aacute;ng) cho cả thời gian học tiếng Đức B2, học l&yacute; thuyết v&agrave; thực tập ở c&aacute;c cơ sở đ&agrave;o tạo. Với những bạn học nghề th&igrave; cơ hội ở lại l&agrave;m việc v&agrave; định cư l&acirc;u d&agrave;i ở Đức sẽ rất cao.<br />
<br />
<img alt="" src="https://c1.staticflickr.com/1/948/41072225705_2835f021d2_z.jpg" /><br />
<br />
<em>H&igrave;nh ảnh học tập tại c&ocirc;ng ty Th&agrave;nh C&ocirc;ng</em><br />
<br />
<em><u><strong>3. Cơ hội l&agrave;m th&ecirc;m để tự trang trải chi ph&iacute; cuộc sống&nbsp;</strong></u></em><br />
<br />
&nbsp; &nbsp;Trong khi ở&nbsp;Singapore&nbsp;cấm sinh vi&ecirc;n đi l&agrave;m th&ecirc;m hoặc ở Mỹ chỉ cho ph&eacute;p sinh vi&ecirc;n đi l&agrave;m c&aacute;c c&ocirc;ng việc trong nội bộ của nh&agrave; trường, th&igrave; ở Đức cho ph&eacute;p sinh vi&ecirc;n đi l&agrave;m th&ecirc;m ở bất cứ đ&acirc;u v&agrave; bất cứ l&uacute;c n&agrave;o, miễn l&agrave; kh&ocirc;ng ảnh hưởng đến việc học tập ở nh&agrave; trường.&nbsp;<br />
<br />
&nbsp; &nbsp;Nh&agrave; nước Đức khuyến kh&iacute;ch sinh vi&ecirc;n đi l&agrave;m th&ecirc;m v&agrave;o cuối tuần hoặc v&agrave;o c&aacute;c kỳ nghỉ.&nbsp;<em>Trong một năm sinh vi&ecirc;n được ph&eacute;p l&agrave;m th&ecirc;m 120 ng&agrave;y, tương đương khoảng 5.700 đến 6.700 Euro/năm.</em>&nbsp;Điều đ&oacute; c&oacute; nghĩa với thu nhập n&agrave;y sinh vi&ecirc;n đ&atilde; c&oacute; thể tự trang trải chi ph&iacute; sinh hoạt của m&igrave;nh hoặc chỉ cần phải xin tiền sinh hoạt ph&iacute; của bố mẹ ở mức thấp nhất so với c&aacute;c nước kh&aacute;c ở ch&acirc;u &Acirc;u v&agrave; ch&acirc;u Mỹ.<br />
<br />
<em><u><strong>4 Cơ hội du lịch nước Đức v&agrave; ch&acirc;u &Acirc;u kh&ocirc;ng bi&ecirc;n giới.</strong></u></em><br />
<br />
Khi c&aacute;c bạn đ&atilde; c&oacute; giấy ph&eacute;p lưu tr&uacute; d&agrave;i hạn cho sinh vi&ecirc;n, c<em>&aacute;c bạn c&oacute; thể đi du lịch tại 27 nước trong khối Li&ecirc;n minh Ch&acirc;u &Acirc;u m&agrave; kh&ocirc;ng cần xin visa nhập cảnh v&agrave; c&oacute; thể ti&ecirc;u chung một đồng tiền Euro ở tất cả c&aacute;c nước trong khối EU.</em>&nbsp;C&aacute;c bạn c&oacute; thể thỏa sức kh&aacute;m ph&aacute; nền văn minh ch&acirc;u &Acirc;u m&agrave; kh&ocirc;ng cần tốn nhiều tiền, v&igrave; lu&ocirc;n c&oacute; c&aacute;c v&eacute; m&aacute;y bay giảm gi&aacute; (khoảng 100 Euro/700 km) v&agrave; c&aacute;c kh&aacute;ch sạn vừa phải cho sinh vi&ecirc;n thu&ecirc; (20 Euro/1 tối).<br />
<br />
<img alt="" src="https://c1.staticflickr.com/1/959/27103155737_3d36c71250.jpg" /><br />
<br />
<em>Sinh vi&ecirc;n Th&agrave;nh C&ocirc;ng tại Đức.</em><br />
<br />
<em><u><strong>5. Hỗ trợ của C&ocirc;ng ty Th&agrave;nh C&ocirc;ng với sinh vi&ecirc;n Việt&nbsp;Nam:</strong></u></em><br />
<br />
- Tư vấn chu đ&aacute;o, ch&iacute;nh x&aacute;c, minh bạch về c&aacute;c trường Đaị học v&agrave; c&aacute;c cơ hội chọn ng&agrave;nh nghề cho sinh vi&ecirc;n Việt&nbsp;Nam; Chương tr&igrave;nh&nbsp;<a href="http://duhocduc.vn/dieu-kien-de-du-hoc-duc/chuong-trinh-tu-van-mien-phi-co-hoi-du-hoc-tai-cong-hoa-lien-bang-duc-tai-cong-ty-thanh-cong.html">tư vấn miễn ph&iacute; xin tham khảo tại đ&acirc;y</a>.<br />
<br />
- Tổ chức c&aacute;c lớp học tiếng Đức từ tr&igrave;nh độ A1 cho đến khi thi lấy bằng B1, B2 đủ điều kiện du học tại Đức với c&aacute;c chuy&ecirc;n gia người Đức v&agrave; gi&aacute;o vi&ecirc;n Việt Nam gi&agrave;u kinh nghiệm giảng dạy.<br />
<br />
- Tổ chức c&aacute;c lớp r&egrave;n luyện c&aacute;c kỹ năng n&acirc;ng cao học tiếng Đức, kỹ năng phỏng vấn APS, thi TESTAS v&agrave; kỹ năng thi đầu v&agrave;o ở c&aacute;c trường Dự bị Đại học ở Đức.<br />
<br />
- Tư vấn ho&agrave;n thiện c&aacute;c thủ tục cần thiết cho đến khi c&oacute; visa du học.<br />
<br />
- Đ&oacute;n s&acirc;n bay v&agrave; chăm s&oacute;c trong thời gian ban đầu tại Đức.</p>
', N'/Uploads/images/Du%20hoc%20Duc/27103155737_3d36c71250.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Duc/27103155737_3d36c71250.jpg', 1, 1, 2, 154, CAST(N'2018-07-02 20:50:00.9180420' AS DateTime2), CAST(N'2018-07-02 20:50:00.9180420' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (21, 0, 6, N'Tuyển  Nam đi XKLĐ Nhật ', N'Các công ty Nhật Bản taị Việt Nam luôn được nhiều người quan tâm khi có ý định làm việc cho các doanh nghiệp Nhật Bản. Trong bài viết này TTC Việt Nam điểm danh các công ty Nhật Bản tại thành phố Hồ Chí Minh tính đến thời điểm hiện tại', N'<p>C&aacute;c c&ocirc;ng ty Nhật Bản taị Việt Nam lu&ocirc;n được nhiều người quan t&acirc;m khi c&oacute; &yacute; định l&agrave;m việc cho c&aacute;c doanh nghiệp Nhật Bản. Trong b&agrave;i viết n&agrave;y TTC Việt Nam điểm danh c&aacute;c c&ocirc;ng ty Nhật Bản tại th&agrave;nh phố Hồ Ch&iacute; Minh t&iacute;nh đến thời điểm hiện tại</p>

<p><strong><img alt="Tổng hợp danh sách các công ty Nhật Bản tại tpHCM" src="https://japan.net.vn/images/uploads/2018/07/02/cac-cong-ty-nhat-ban-tai-tphcm.jpg" /></strong><br />
&nbsp;</p>

<p><strong>1.&nbsp;C&ocirc;ng ty thương mại ACS Việt Nam</strong><br />
<br />
Đ&acirc;y l&agrave; c&ocirc;ng ty li&ecirc;n doanh giữa một li&ecirc;n doanh giữa ACS Capital Corporation, Aeon Thana Sinsap của tập đo&agrave;n Aeon, v&agrave; đối t&aacute;c Việt Nam.&nbsp;<br />
<br />
ACS Trading Vietnam l&agrave;&nbsp;một phần của Aeon Credit Service Nhật Bản, c&ocirc;ng ty hoạt động chủ yếu ở lĩnh vực t&agrave;i ch&iacute;nh, thương mại c&aacute;c mặt h&agrave;ng ti&ecirc;u d&ugrave;ng c&aacute; nh&acirc;n, hộ gia đ&igrave;nh như m&aacute;y t&iacute;nh, thiết bị điện tử, xe m&aacute;y&hellip;&nbsp;<br />
<br />
Địa chỉ:&nbsp;456 X&ocirc; Viết Nghệ Tĩnh, P. 25. Q. B&igrave;nh Thạnh Tp.HCM&nbsp;<br />
&nbsp;</p>

<p><strong>2. C&ocirc;ng ty TNHH nước giải kh&aacute;t Kirin&nbsp;</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty TNHH nước giải kh&aacute;t Kirin l&agrave; c&ocirc;ng ty con của tập đo&agrave;n Kirin Japan. Với hơn 20 năm x&acirc;y dựng v&agrave; ph&aacute;t triển tại thị trường Việt Nam vơ&iacute; thương hiệu Wonderfarm, hiện c&ocirc;ng ty c&oacute; mở ra hai nh&agrave; m&aacute;y ở Đồng Nai v&agrave; B&igrave;nh Dương.<br />
&nbsp;</p>

<p>Địa chỉ: Floor 4A - Vincom Center, 72 Le Thanh Ton, Ben Nghe ward, District 1, Ho Chi Minh city&nbsp;</p>

<p>3. Gumi Việt Nam<br />
&nbsp;</p>

<p>Gumi Việt Nam thuộc tập đo&agrave;n gumi Co.,Ltd Nhật Bản chuy&ecirc;n thiết kế web, lập tr&igrave;nh v&agrave; ph&aacute;t triển c&aacute;c ứng dụng d&agrave;nh cho smart phone.<br />
&nbsp;</p>

<p>Địa chỉ: Lầu 4 To&agrave; nh&agrave; DHouse 39 Nguyễn Thị Diệu Phường 6 Quận 3&nbsp;</p>

<p>&nbsp;</p>

<p><strong>4. Akuruhi</strong><br />
&nbsp;</p>

<p>Akuruhi được th&agrave;nh lập năm 1998. Akuruhi ch&iacute;nh l&agrave; hệ thống si&ecirc;u thị chuy&ecirc;n b&aacute;n h&agrave;ng Nhật như rượu, hải sản tươi sống, nước uống, rau v&agrave; cả những loại đồ d&ugrave;ng hằng ng&agrave;y như dầu gội, mỹ phẩm, phụ kiện nh&agrave; bếp.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: 03-05 Le Thanh Ton St,Dist 1, Ho Chi Minh City&nbsp;</p>

<p><br />
<strong>5. Obayashi Vietnam</strong><br />
&nbsp;</p>

<p>Obayashi Vietnam c&oacute; xuất xứ từ Nhật Bản, hoạt động tại Việt Nam tư năm 2006 chuy&ecirc;n về lĩnh vực x&acirc;y dựng. C&aacute;c dự &aacute;n c&ocirc;ng ty ho&agrave;n th&agrave;nh như nh&agrave; m&aacute;y Canon Vietnam, nh&agrave; m&aacute;y c&ocirc;ng ty Watabe Wedding, s&acirc;n bay T&acirc;n Son Nhat v&agrave; c&ocirc;ng tr&igrave;nh gần đ&acirc;y nhất l&agrave; trung t&acirc;m mua sắm Aeon T&acirc;n Ph&uacute;.</p>

<p><br />
Địa chỉ: 37 Đường T&ocirc;n Đức Thắng, Quận 1, Tp. Hồ Ch&iacute; Minh&nbsp;<br />
&nbsp;</p>

<p>T&ograve;a nh&agrave; PVI, Tầng 17, Ph&ograve;ng 1701, L&ocirc; VP2, Đường Trần Th&aacute;i T&ocirc;ng, Quận Cầu Giấy, H&agrave; Nội&nbsp;<br />
&nbsp;</p>

<p><strong>6. Saigon Precision</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty S&agrave;i G&ograve;n Precision l&agrave; c&ocirc;ng ty con của tập đo&agrave;n Misumi tại Nhật Bản, chuy&ecirc;n hoạt động ch&iacute;nh của c&ocirc;ng ty l&agrave; sản xuất phụ t&ugrave;ng khu&ocirc;n dập<br />
&nbsp;</p>

<p>Địa chỉ: Khu Chế Xuất Linh Trung 1, Đường D, L&ocirc; 15, P. Linh Trung, Q. Thủ Đức,Tp. Hồ Ch&iacute; Minh&nbsp;</p>

<p><br />
<strong>7. Daiko Vietnam</strong><br />
<br />
Daiko Vietnam l&agrave; c&ocirc;ng ty con của Daiko Nhật Bản chuy&ecirc;n về lĩnh vực quảng c&aacute;o.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Suite B601 The Manor, 91 Nguyen Huu Canh Street, Ward22, Binh Thanh District, Ho Chi Minh, Vietnam&nbsp;</p>

<p><br />
<strong>8. C&ocirc;ng Ty Ajinomoto Việt Nam</strong><br />
<br />
Ajinomoto Việt Nam l&agrave; một nh&aacute;nh của Ajinomoto Nhật Bản chuy&ecirc;n về c&aacute;c mặt h&agrave;ng như bột n&ecirc;m gia vị, giấm, nước sốt mayonnaise, nước giải kh&aacute;t..<br />
&nbsp;</p>

<p>Địa chỉ: Tầng 22, Centec Tower, 72 - 74 Nguyễn Thị Minh Khai, Quận 3, TP.HCM&nbsp;</p>

<p>&nbsp;</p>

<p><strong>10. Nidec Vietnam</strong><br />
&nbsp;</p>

<p>Th&agrave;nh lập năm 2005, Nidec Việt nam l&agrave; một nh&aacute;nh của Nidec Nhật bản hoạt động về lĩnh vực sản xuất c&aacute;c m&ocirc; tơ điện tử, phụ kiện m&aacute;y t&iacute;nh&hellip;<br />
&nbsp;</p>

<p>Địa chỉ: Lot No I1-N2, SAIGON HI-TECH PARK, District 9, Ho Chi Minh City, Vietnam&nbsp;</p>

<p><br />
<strong>11. Dentsu Vietnam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty Dentsu chuy&ecirc;n về lĩnh vực marketing<br />
&nbsp;</p>

<p>Địa chỉ: 23rd Floor, AB Tower, 76 Le Lai Street, Ho Chi Minh City&nbsp;</p>

<p>&nbsp;</p>

<p><strong>12. H.I.S - Song Han Vietnam Tourist</strong><br />
&nbsp;</p>

<p>H.I.S - Song Han Vietnam Tourist thuộc H.I.S Nhật Bản chuy&ecirc;n tour nội địa, quốc tế trọn g&oacute;i cho kh&aacute;ch Việt Nam cũng như c&aacute;c du kh&aacute;ch nước ngo&agrave;i đến Việt Nam<br />
&nbsp;</p>

<p>Địa chỉ: Tầng M, T&ograve;a nh&agrave; Bảo Việt, 233 Đồng Khởi, Phường Bến Ngh&eacute;, Quận 1, TP HCM&nbsp;</p>

<p><br />
<strong>13. C&ocirc;ng ty kĩ nghệ &amp; x&acirc;y dựng TU- Fujita&nbsp;</strong><br />
<br />
C&ocirc;ng ty kĩ nghệ &amp; x&acirc;y dựng TU- Fujita l&agrave; li&ecirc;n doanh do Fujita Engineering Nhật Bản v&agrave; tổng c&ocirc;ng ty Thăng Uy th&agrave;nh lập chuy&ecirc;n về 3 mảng kinh doanh ch&iacute;nh: giải ph&aacute;p tiết kiệm năng lượng gồm tư ấn, ứng dụng giải ph&aacute;p năng lượng hiệu quả cho ng&agrave;nh c&ocirc;ng nghiệp, thiết kế, x&acirc;y dựng v&agrave; bảo tr&igrave; to&agrave;n diện.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: 489 Nguyen Van Linh St., Tan Phong, Dist. 7, Ho Chi Minh City, Vietnam</p>

<p><br />
<strong>14. Evolable Asia</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty tr&aacute;ch nhiệm hữu hạn Evolable Asia c&oacute; vốn 100% từ Nhật, l&agrave; li&ecirc;n doanh giữa TabiCapital Nhật Bản v&agrave; Soltec Việt Nam cuy&ecirc;n về x&acirc;y dựng website, ứng dụng di động v&agrave; website<br />
&nbsp;</p>

<p>Địa chỉ: 4 Floor, Saigon Finance Center No 9, Dinh Tien Hoang Street, Dist.1&nbsp;<br />
&nbsp;</p>

<p><strong>15. Yamagata Vietnam</strong><br />
&nbsp;</p>

<p>Yamagata Việt Nam l&agrave; c&ocirc;ng ty con cuả Yamagata Nhật Bản chuy&ecirc;n về c&aacute;c loại in ấn v&agrave; cung cấp những dịch vụ kh&aacute;c như thiết kế website, thiết kế hệ thống v&agrave; dịch thuật.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Lot 49C, Quang Minh Industrial Park Me Linh, Ha Noi&nbsp;<br />
&nbsp;</p>

<p><strong>16. Nissin foods Vietnam</strong><br />
&nbsp;</p>

<p>Nissin foods Vietnam l&agrave; một chi nh&aacute;nh của tập đo&agrave;n Nissin Nhật Bản chuy&ecirc;n về m&igrave; g&oacute;i. Sản phẩm Nissin gồm những loại m&igrave; g&oacute;i ăn liền đa dạng: m&igrave; b&ograve; ti&ecirc;u xanh, m&igrave; rau răm&hellip; đều được ph&acirc;n phối tr&ecirc;n c&aacute;c cửa h&agrave;ng v&agrave; hệ thống si&ecirc;u thị ở Việt Nam.<br />
&nbsp;</p>

<p>Địa chỉ: 5th Floor, ITAXA House, 122-126 Nguyen Thi Minh Khai, District 3, HCMC, Vietnam&nbsp;</p>

<p>&nbsp;</p>

<p><strong>17. Vietnam Glass Industries</strong><br />
&nbsp;</p>

<p>Vietnam Glass Industries thuộc tập đo&agrave;n Nippon Sheet Glass (NSG) Nhật Bản chuy&ecirc;n về lĩnh vực sản xuất k&iacute;nh với c&ocirc;ng nghệ sản xuất tối t&acirc;n<br />
&nbsp;</p>

<p>Địa chỉ: 3rd FI&rdquo; OSC Bldg., 8 Nguyen Hue, Dist.1, Ho Chi Minh&nbsp;<br />
&nbsp;</p>

<p><strong>18. SCS Global Consulting Vietnam</strong><br />
&nbsp;</p>

<p>SCS Global Consulting Vietnam thuộc tập đo&agrave;n SCS Nhật Bản th&agrave;nh lập năm 2002&nbsp; chuy&ecirc;n về&nbsp; mảng kế to&aacute;n, bao gồm c&aacute;c dịch vụ thuế, kiểm to&aacute;n, tư vấn t&agrave;i ch&iacute;nh v&agrave; những dịch vụ thu&ecirc; ngo&agrave;i kh&aacute;c như trả lương, đăng k&iacute; với cơ quan ch&iacute;nh quyền&hellip;&nbsp;<br />
<br />
Địa chỉ: Floor 12A, Vincom Center B 72 Le Thanh Ton Street, District 1, Ho Chi Minh City&nbsp;</p>

<p><br />
<strong>19. Family Mart</strong><br />
&nbsp;</p>

<p>Family mart l&agrave; một hệ thống cửa h&agrave;ng tiện dụng Nhật Bản, bắt đầu c&oacute; mặt tại Việt Nam năm 2009 với nhiều sản phẩm đa dạng như thức ăn nhanh, sandwich, b&aacute;nh, đồ hộp, kẹo, nước giải kh&aacute;t&hellip;&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: 69 Nguyen Khac Nhu, Co Giang Ward, Distric 1, HCM City<br />
<br />
<strong>20. C&ocirc;ng ty TNHH Thức ăn chăn nu&ocirc;i Kyodo Sojitz</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty thức ăn chăn nu&ocirc;i Kyodo Sojitz (KSF) l&agrave; tập đo&agrave;n li&ecirc;n doanh của Nhật Bản chuy&ecirc;n về sản xuất d&ograve;ng c&aacute;m d&agrave;nh cho gia cầm v&agrave; c&aacute;c loại gia s&uacute;c kh&aacute;c.&nbsp;</p>

<p>&nbsp;</p>

<p>Địa chỉ: L&ocirc; F5-F6-F7-F8, Khu C&ocirc;ng Nghiệp Thịnh Ph&aacute;t, X&atilde; Lương B&igrave;nh, Huyện Bến Lức, Tỉnh Long An, Long An&nbsp;</p>

<p><br />
<strong>21. Kondo Textile Vietnam</strong><br />
<br />
C&ocirc;ng ty dệt Kondo Việt Nam l&agrave; c&ocirc;ng ty con 100% dưới sự quản l&iacute; của c&ocirc;ng ty Kondo Nhật Bản chuy&ecirc;n hoạt động trong lĩnh vực may mặc.<br />
&nbsp;</p>

<p>Địa chỉ: Khu C&ocirc;ng Nghiệp Mỹ Phước, Đường N6,H. Bến C&aacute;t,B&igrave;nh Dương&nbsp;</p>

<p><br />
<strong>22. Mitsubishi Electric Vietnam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty điện m&aacute;y Mitsubishi Việt Nam l&agrave; một c&ocirc;ng ty con của c&ocirc;ng ty điện m&aacute;y Mitsubishi Nhật Bản th&agrave;nh lập 2011 chuy&ecirc;n cung cấp đồ d&ugrave;ng điện tử c&oacute; thể d&ugrave;ng trong hộ gia đ&igrave;nh, cơ quan như m&aacute;y lạnh, quạt điện, tủ lạnh&hellip;&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Unit 01 &ndash; 04, 10th Floor, Vincom Center, 72 Le Thanh Ton Street, District 1, HCMC, Vietnam&nbsp;</p>

<p><br />
<strong>23. Logitem Corporation</strong><br />
&nbsp;</p>

<p>Logitem Corporation Việt Nam thuộc Logitem Nhật Bản, chuy&ecirc;n về lĩnh vực du lịch v&agrave; dịch vụ cho thu&ecirc; xe chuy&ecirc;n chở v&agrave; cung cấp những dịch vụ hậu cần đa dạng như cho thu&ecirc; kho b&atilde;i, dịch vụ giao nhận h&agrave;ng h&oacute;a,thủ tục hải quan&hellip;<br />
&nbsp;</p>

<p>Địa chỉ: No.23, Tran Nao Street, Binh An Ward, Dist.2, HCMC</p>

<p><br />
<strong>24. Rohto Mentholatum Vietnam</strong><br />
&nbsp;</p>

<p>Rohto Mentholatum Vietnam thuộc c&ocirc;ng ty Rohto Pharmaceutical Nhật Bản với d&ograve;ng sản phẩm, thuốc nhỏ mắt V. Rohto v&agrave; LipIce&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Lầu 18, Ph&ograve;ng 1808 Saigon Trade Center, 37 T&ocirc;n Đức Thắng , Q.1, TP. HCM&nbsp;</p>

<p><br />
<strong>25. G.A. Consultants Vietnam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty GA consultants Việt Nam được th&agrave;nh lập với mục ti&ecirc;u l&agrave; thắt chặt t&igrave;nh hữu nghị giữa Việt Nam v&agrave; Nhật Bản chuy&ecirc;n về đ&agrave;o tạo kĩ sư, dịch vụ t&igrave;m việc cho du học sinh<br />
&nbsp;</p>

<p>Địa chỉ: Ph&ograve;ng 203, Tầng 2, T&ograve;a nh&agrave; VIMADECO, 163 Nguyễn Văn Trỗi , Phường 11, Quận Ph&uacute; nhuận, TP. HCM</p>

<p><br />
<strong>26. C&ocirc;ng ty TNHH Lotte Việt Nam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty TNHH Lotte Việt Nam xuất th&acirc;n từ Nhật Bản chuy&ecirc;n về ph&acirc;n phối kẹo cao su, s&ocirc; c&ocirc; la v&agrave; b&aacute;nh qui.<br />
&nbsp;</p>

<p>Địa chỉ: Ph&ograve;ng 1, Tầng 4, T&ograve;a nh&agrave; Tuổi Trẻ, 60A Ho&agrave;ng Văn Thụ, Phường 9, Quận Ph&uacute; Nhuận&nbsp;</p>

<p><br />
<strong>27. Kao Vietnam</strong><br />
&nbsp;</p>

<p>Kao Việt Nam l&agrave; c&ocirc;ng ty con của Kao Nhật Bản th&agrave;nh lập năm 1995 chuy&ecirc;n về sản xuất v&agrave; ph&acirc;n phối những sản phẩm bảo vệ t&oacute;c v&agrave; da, h&oacute;a chất.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Ph&ograve;ng 10.1-10.2, t&ograve;a nh&agrave; E-town 2, 364 Cộng H&ograve;a, P.13, Q.T&acirc;n B&igrave;nh, TP.HCM&nbsp;</p>

<p>&nbsp;</p>

<p><br />
<strong>28. Shiseido Vietnam</strong><br />
&nbsp;</p>

<p>Shiseido Nhật Bản l&agrave; một nh&atilde;n hiệu mỹ phẩm được biết đến tr&ecirc;n to&agrave;n cầu.<br />
&nbsp;</p>

<p>Địa chỉ: 34 L&ecirc; Duẩn Q.1 TPHCM</p>

<p><br />
<strong>29. Schenker Vietnam</strong><br />
&nbsp;</p>

<p>Schenker Vietnam th&agrave;nh lập trụ sở tại Việt Nam v&agrave;o th&aacute;ng 9 năm 2012, c&aacute;c lĩnh vực cung cấp gồm c&oacute;: vận tải h&agrave;ng kh&ocirc;ng, vận tải biển, dịch vụ hậu cần, chuỗi cung ứng.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: 601, 6th floor, C.T plaza, Truong Son st., ward 2, Tan Binh district, HCMC&nbsp;</p>

<p><br />
<strong>30. ISB Vietnam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty TNHH ISB Việt Nam (IVC) c&oacute; vốn đầu tư 100% từ Nhật, l&agrave; một chi nh&aacute;nh của tập đo&agrave;n ISB chuy&ecirc;n về ph&aacute;t triển phần mềm di động tại Nhật Bản.<br />
&nbsp;</p>

<p>Địa chỉ: Unit 3.1, 3.2, 3.8, 3.9, 3rd Floor, E-town 2 Building, 364 Cong Hoa St., Tan Binh Dist., Ho Chi Minh&nbsp;</p>

<p><br />
<strong>31. C&ocirc;ng ty TNHH Văn Ph&ograve;ng Phẩm Tombow Việt Nam</strong><br />
<br />
Tombow Việt Nam l&agrave; một chi nh&aacute;nh của Tombow Nhật Bản, đặt nh&agrave; m&aacute;y tại Hồ Ch&iacute; Minh chuy&ecirc;n về sản xuất v&agrave; lắp r&aacute;p những đồ d&ugrave;ng văn ph&ograve;ng như: B&uacute;t x&oacute;a k&eacute;o, b&uacute;t keo hai mặt, b&uacute;t phớt, v&agrave; c&aacute;c sản phẩm nhựa đ&uacute;c.<br />
&nbsp;</p>

<p>Địa chỉ: Đường 15, khu chế xuất T&acirc;n Thuận, P. T&acirc;n Thuận Đ&ocirc;ng, Quận 7, Tp. Hồ Ch&iacute; Minh&nbsp;</p>

<p><br />
<strong>32.&nbsp;Asuzac Foods</strong><br />
&nbsp;</p>

<p>&nbsp;Asuzac foods Việt Nam l&agrave; c&ocirc;ng ty c&oacute; nguồn gốc Nhật Bản&nbsp;chuy&ecirc;n về thực phẩm sấy kh&ocirc; như rau củ, thịt, ch&aacute;o.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Đường 10 KCX T&acirc;n Thuận, Quận 7, TP.Hồ Ch&iacute; Minh.&nbsp;</p>

<p><br />
<strong>33.&nbsp;C&ocirc;ng ty Nhanh Nhanh</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty Nhanh Nhanh sở hữu 100% vốn đầu tư từ Nhật Bản hiện đ&atilde; c&oacute; văn ph&ograve;ng đặt tại th&agrave;nh phố Hồ Ch&iacute; Minh, chuy&ecirc;n&nbsp;cung cấp văn ph&ograve;ng phẩm, thiết bị văn ph&ograve;ng c&oacute; thể kể đến giấy, đinh bấm, b&uacute;t x&oacute;a, b&uacute;t mực, b&uacute;t ch&igrave;, m&aacute;y m&oacute;c văn ph&ograve;ng, vật dụng hằng ng&agrave;y, băng keo đ&oacute;ng g&oacute;i.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Số 37, Đường số 7, Phường Linh Trung, Quận Thủ Đức, Tp Hồ Ch&iacute; Minh&nbsp;<br />
<br />
<strong>34. TYA Vietnam</strong><br />
&nbsp;</p>

<p>T.Y.A l&agrave; một c&ocirc;ng ty quảng c&aacute;o ở Nhật, cung cấp dịch vụ:&nbsp;thiết kế đồ họa, giải ph&aacute;p trực tuyến, tổ chức chiến lược v&agrave; phim 3D&hellip;&nbsp;<br />
<br />
Địa chỉ: 3th floor, 144 Vo Van Tan, District 3&nbsp;<br />
<br />
<strong>35. Fujinami Construction Consultant</strong><br />
<br />
Fujinami Construction Consultant (FCC) l&agrave; c&ocirc;ng ty con của Fujinami Architects and Associates (FAA) mang lại giải ph&aacute;p to&agrave;n diện li&ecirc;n quan đến x&acirc;y dựng cho kh&aacute;ch h&agrave;ng bao gồm ph&aacute;t triển đ&ocirc; thị, x&acirc;y dựng t&ograve;a cao ốc, khu d&acirc;n cư, thiết bị nội thất, thiết kế kiến tr&uacute;c v&agrave; dự &aacute;n c&ocirc;ng nghiệp.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: 9th Floor, GOLDEN Bldg, 19 Tan Canh St, Tan Binh Dist, HCMC, Vietnam&nbsp;<br />
<br />
<strong>36. C&ocirc;ng ty CP Grateful Days</strong><br />
&nbsp;</p>

<p>Grateful Days l&agrave; một c&ocirc;ng ty Nhật Bản đ&atilde; hoạt động trong ng&agrave;nh CNTT từ năm 2005. C&ocirc;ng ty đảm nhận một qu&aacute; tr&igrave;nh t&iacute;ch hợp gồm l&ecirc;n kế hoạch, ph&aacute;t triển v&agrave; quản l&iacute; games trực tuyến, dịch vụ x&atilde; hội, ứng dụng smartphone, cung cấp th&ocirc;ng tin, c&aacute;c loại h&igrave;nh marketing v&agrave; xuất bản s&aacute;ch, tạp ch&iacute;.<br />
&nbsp;</p>

<p>Địa chỉ: 43D/23 Hồ Văn Hu&ecirc;, quận Ph&uacute; Nhuận, th&agrave;nh phố Hồ Ch&iacute; Minh&nbsp;</p>

<p><br />
<strong>37.&nbsp;Kakusho Metal Vietnam</strong><br />
&nbsp;</p>

<p>Kakusho Metal Việt Nam l&agrave; c&ocirc;ng ty con 100% của Kakusho Kogyo bắt đầu hoạt động từ năm 2008&nbsp;chuy&ecirc;n về sản xuất c&aacute;c sản phẩm cơ kh&iacute; ch&iacute;nh x&aacute;c v&agrave; phụ t&ugrave;ng d&ugrave;ng trong tủ lạnh, bếp gas v&agrave; văn ph&ograve;ng phẩm.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Đường số 19, Khu chế xuất T&acirc;n Thuận, Quận 7, TP HCM&nbsp;<br />
<br />
<strong>38. Panasonic AVC Networks Vietnam</strong><br />
&nbsp;</p>

<p>C&ocirc;ng ty Panasonic AVC Networks Việt Nam (PAVCV) l&agrave; li&ecirc;n doanh của c&ocirc;ng ty TNHH Panasonic Việt Nam trực thuộc tổng c&ocirc;ng ty Panasonic Nhật Bản v&agrave; c&ocirc;ng ty CP điện tử Thủ Đức&nbsp;chuy&ecirc;n về sản xuất v&agrave; kinh doanh h&agrave;ng loạt c&aacute;c thiết bị điện tử d&acirc;n dụng bao gồm TV m&agrave;u, thiết bị nghe- nh&igrave;n kh&aacute;c&hellip; dưới thương hiệu Panasonic.&nbsp;<br />
&nbsp;</p>

<p>Địa chỉ: Block 1 Do Xuan Hop, Phuoc Long B Ward, District 9, Hochiminh City, Vietnam<br />
<br />
<strong>Tiếp tục cập nhật&nbsp;</strong><br />
<br />
Tr&ecirc;n đ&acirc;y l&agrave; một số c&ocirc;ng ty Nhật Bản tại th&agrave;nh phố Hồ Ch&iacute; Minh ch&uacute;ng t&ocirc;i cập nhật, ngo&agrave;i ra bạn c&oacute; thể tham khảo th&ecirc;m b&agrave;i viết:&nbsp;<a href="https://japan.net.vn/danh-sach-cac-cong-ty-nhat-ban-tai-viet-nam-2598.htm"><strong>Danh s&aacute;ch c&aacute;c c&ocirc;ng ty Nhật Bản tại Việt Nam tuyển dụng</strong></a><br />
<br />
Ch&uacute;c bạn th&agrave;nh c&ocirc;ng!</p>
', N'/Uploads/images/Du%20hoc%20Nhat/cac-cong-ty-nhat-ban-tai-tphcm.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Nhat/cac-cong-ty-nhat-ban-tai-tphcm.jpg', NULL, NULL, 2, 54, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-02 21:46:13.3499991' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (22, 0, 6, N'Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo', N'Đơn hàng sơn gỗ đi Nhật thuộc ngóm ngành công xưởng đang tuyển gấp 18 nam tại TTC Việt Nam. Với mức lương trên 30 triệu chưa tính tăng ca làm thêm, xí nghiệp lớn tại Hyogo đây hứa hẹn là đơn hàng XKLĐ Nhật rất hấp dẫn tháng 7', N'<p><strong>TH&Ocirc;NG TIN ĐƠN H&Agrave;NG</strong></p>

<p>&nbsp;<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban.png" />Tuyển gấp<strong>&nbsp;18 Nam sơn gỗ</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban-1.png" />&nbsp;Địa điểm l&agrave;m việc:&nbsp;<strong>Hyogo</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban-2.png" />&nbsp;Thời gian hợp đồng:<strong>&nbsp;3 năm</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban-3.png" />&nbsp;Ng&agrave;y thi tuyển:&nbsp;23<strong>/07/2018</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban-4.png" />&nbsp;Ng&agrave;y nhập cảnh:&nbsp;<strong>Th&aacute;ng 12</strong><strong><strong>/2018</strong></strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/XKLD-nhat-ban-5.png" />&nbsp;Thu nhập:&nbsp;<strong>31 triệu VNĐ/th&aacute;ng ( chưa t&iacute;nh l&agrave;m th&ecirc;m)</strong></p>

<p>Để biết th&ecirc;m th&ocirc;ng tin về đơn h&agrave;ng đi XKLĐ Nhật Bản, vui l&ograve;ng gọi đến số HOTLINE<br />
<br />
<strong>&nbsp;0988 194 399</strong></p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p>&nbsp;</p>

<p><strong>ĐIỀU KIỆN ĐĂNG K&Iacute; ĐƠN H&Agrave;NG SƠN GỖ</strong></p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Độ tuổi đăng k&iacute; tham gia:&nbsp;<strong>18 - 30 tuổi</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Tr&igrave;nh độ học vấn:&nbsp;<strong>Tốt nghiệp cấp 3 trở l&ecirc;n</strong><br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Ngoại h&igrave;nh: Nam cao tr&ecirc;n 1m60, năm 50 kg&nbsp;<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Y&ecirc;u cầu: C&oacute; sức khỏe tốt, kh&ocirc;ng mắc c&aacute;c bệnh cấm nhập cảnh v&agrave;o Nhật Bản. Bạn đ&atilde; biết c&aacute;c biết<strong>&nbsp;</strong><a href="https://japan.net.vn/dieu-kien-suc-khoe-di-xuat-khau-lao-dong-nhat-ban-1166.htm"><strong>13 căn bệnh cấm nhập cảnh v&agrave;o Nhật bản năm 2018</strong></a>&nbsp;chưa?&nbsp;<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Y&ecirc;u cầu đặc biệt: Nhanh nhẹn, h&ograve;a đồng với mọi người, chăm chỉ, thật th&agrave;.<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/TTC-Viet-Nam-4.png" />Kh&ocirc;ng y&ecirc;u cầu kinh nghiệm</p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/0-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p><em>Để được tư vấn cụ thể về chi ph&iacute;, lương, điều kiện tham gia c&aacute;c đơn h&agrave;ng xuất khẩu lao động Nhật? H&atilde;y&nbsp;<strong>NHẬP SỐ ĐIỆN THOẠI</strong>&nbsp;v&agrave; y&ecirc;u cầu gọi lại để được c&aacute;n bộ tư vấn của c&ocirc;ng ty li&ecirc;n lạc hỗ trợ.</em><br />
&nbsp;</p>

<form action="https://docs.google.com/forms/d/e/1FAIpQLSfd8YsyhJsDgtTyOgnMS4RKLLgnJ_4P_bwLRZ3npoJcai5CtA/formResponse" id="mG61Hd" method="POST" target="hidden_iframe">
<p><input name="entry.1586651715" type="text" value="" /><br />
<input name="entry.472139328" required="" type="text" value="" /><br />
<input name="submit" type="submit" value="Yêu Cầu Gọi Lại" /></p>
</form>

<p><strong>QUYỀN LỢI KHI THAM GIA</strong></p>

<p><strong><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-6.png" /></strong><strong>&nbsp;Lương cơ bản:</strong>&nbsp;<strong>152.000 Y&ecirc;n/th&aacute;ng</strong>&nbsp;(tương đương 3<strong>1 triệu VNĐ</strong>).&nbsp;Tham khảo bảng lương tối thiểu theo v&ugrave;ng tại 47 t&igrave;nh th&agrave;nh của Nhật Bản tại&nbsp;<strong><a href="https://japan.net.vn/chinh-thuc-cong-bo-bang-luong-tai-47-tinh-thanh-nhat-ban-2125.htm">B&agrave;i Viết N&agrave;y</a>.</strong><br />
<strong><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-6.png" /></strong>Tăng ca: C&oacute; (trao đổi khi phỏng vấn) - Tối thiểu 40h/th&aacute;ng&nbsp;tương đương&nbsp;36.000 Y&ecirc;n/th&aacute;ng&nbsp;tăng ca<br />
<strong><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-6.png" /></strong>Chế độ: BHYT, BHXH, lao động theo quy định Ph&aacute;p luật Nhật Bản<br />
<strong><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-6.png" /></strong>Giờ l&agrave;m việc: Từ 08:00 đến 17:00 (nghỉ giải lao 60 ph&uacute;t) - 1 ng&agrave;y 08 tiếng<br />
<strong><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-6.png" /></strong>Ng&agrave;y nghỉ: Thứ 7, chủ nhật h&agrave;ng tuần, được nghỉ c&aacute;c ng&agrave;y lễ tết theo quy định của luật ph&aacute;p Nhật Bản.<br />
&nbsp;</p>

<p>Để nắm vững c&aacute;c vấn đề khi tham gia chương tr&igrave;nh XKLĐ Nhật Bản, xem ngay:&nbsp;<strong><a href="https://japan.net.vn/60-van-de-phai-biet-khi-xuat-khau-lao-dong-nhat-ban-1300.htm">60 vấn đề PHẢI BIẾT khi đi XKLĐ Nhật Bản</a></strong></p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/1-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p><strong>TẠI SAO CHỌN HYOGO ĐI XKLĐ NHẬT</strong></p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-1.png" />Thuộc v&ugrave;ng Kinki tr&ecirc;n đảo Honshu, tỉnh Hyogo Nhật Bản nằm ở vị tr&iacute; kh&aacute; thuận lợi cho giao thương.&nbsp;<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-1.png" />Đặc trưng của Hyogo l&agrave; rất &iacute;t xảy ra thi&ecirc;n tai như b&atilde;o v&agrave; động đất n&ecirc;n thực tập sinh c&oacute; thể an t&acirc;m sinh sống.</p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-1.png" />So với những th&agrave;nh phố lớn như Tokyo hay Osaka, vật gi&aacute; tại Hyogo ở đ&acirc;y kh&aacute; rẻ, dễ sinh sống.</p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-1.png" />Hyogo ph&aacute;t triển với đa dạng c&aacute;c ng&agrave;nh nghề như: n&ocirc;ng nghiệp (trồng trọt, chăn nu&ocirc;i...), c&ocirc;ng nghiệp (may mặc, cơ kh&iacute;, thực phẩm...), x&acirc;y dựng với mức thu nhập kh&aacute; cao&nbsp;</p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/01/12/TTC-Viet-Nam-1.png" />Con người nơi đ&acirc;y kh&aacute; th&acirc;n thiện, nhiều danh lam thắng cảnh nổi tiếng<br />
<br />
Xem ngay b&agrave;i viết:&nbsp;<a href="https://japan.net.vn/tinh-hyogo-nhat-ban-co-gi-khien-nguoi-ta-me-man-quen-loi-ve-2458.htm"><strong>Tỉnh Hyogo Nhật Bản c&oacute; g&igrave; khiến người ta m&ecirc; mẩn qu&ecirc;n lối về?</strong></a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>X&Iacute; NGHIỆP TUYỂN DỤNG</strong></p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/5-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p><em>X&iacute; nghiệp tiếp nhận thực tập sinh hiện tại l&agrave; 1 c&ocirc;ng ty gỗ lớn tại Nhật hiện đang c&oacute; 25 thực tập sinh Việt đ&atilde; l&agrave;m việc tại đ&acirc;y</em></p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/4-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p><em>Theo đ&aacute;nh gi&aacute; của thực tập sinh&nbsp;tuy mức lương của đơn h&agrave;ng n&agrave;y kh&ocirc;ng cao nhưng b&ugrave; lại đơn h&agrave;ng n&agrave;y kh&ocirc;ng y&ecirc;u cầu tay nghề v&agrave; c&ocirc;ng việc ổn định, l&agrave;m th&ecirc;m nhiều.&nbsp;</em><br />
<br />
<em><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/6-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></em></p>

<p><em>Hiện TTC Việt Nam đang đ&agrave;m ph&aacute;n lại với b&ecirc;n Nhật Bản để hỗ trợ n&acirc;ng mức lương cơ bản hỗ trợ th&ecirc;m cho thực tập sinh.</em></p>

<p><em><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/2-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></em></p>

<p><em>M&ocirc;i trường l&agrave;m việc rất tốt, c&aacute;c bạn được nghiệp đo&agrave;n bố tr&iacute; chỗ ăn ở, sinh hoạt kh&aacute; gần với địa điểm l&agrave;m việc, mỗi bạn cũng được hỗ trợ xe đạp để đi lại cho thuận tiện.</em></p>

<p><img alt="Tuyển 18 Nam đi XKLĐ Nhật đơn hàng sơn đồ gỗ làm việc tại Hyogo" src="https://japan.net.vn/images/uploads/2018/07/02/3-don-hang-son-go-tai-hyogo-nhat-ban.jpg" /></p>

<p>&nbsp;</p>

<p><strong>QUY TR&Igrave;NH THAM GIA</strong></p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/03/30/quy-trinh-di-xkld-nhat-ban.jpg" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://japan.net.vn/images/uploads/2018/03/14/icon-lu1.jpg" />Li&ecirc;n hệ c&aacute;n bộ tuyển dụng để hỗ trợ tư vấn<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/14/icon-lu2.jpg" />L&ecirc;n c&ocirc;ng ty chọn đơn, kh&aacute;m sức khỏe<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/14/icon-lu3.jpg" />Học nguồn v&agrave; thi tuyển<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/14/icon-lu4.jpg" />Học sau tr&uacute;ng tuyển<br />
<img alt="" src="https://japan.net.vn/images/uploads/2018/03/14/icon-lu5.jpg" />Xuất cảnh</p>
', N'/Uploads/images/Du%20hoc%20Nhat/1-don-hang-son-go-tai-hyogo-nhat-ban.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Nhat/1-don-hang-son-go-tai-hyogo-nhat-ban.jpg', NULL, NULL, 2, 65, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-02 21:45:28.4303467' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (23, 1, 5, N'Lý do nên chọn du học Canada năm 2018', N'Công bố mới nhất của tờ US News & World Report, Canada là nước có chất lượng đào tạo tốt nhất thế giới trên cả Anh, Mỹ hay Phần Lan.', N'<p>Canada l&agrave; quốc gia lớn thứ ba thế giới, trải d&agrave;i từ Th&aacute;i B&igrave;nh Dương đến Đại T&acirc;y Dương v&agrave; từ Bắc Cực đến bi&ecirc;n giới Mỹ. Nước này có hơn 32 triệu d&acirc;n, trong đó phần lớn sống trong khoảng 100 dặm gần bi&ecirc;n giới Mỹ. Kh&iacute; hậu nằm trong v&ugrave;ng &ocirc;n đới, m&ugrave;a đ&ocirc;ng rất lạnh, l&agrave; nước c&oacute; nền c&ocirc;ng nghiệp v&agrave; chất lượng cuộc sống cao.</p>

<p>Gi&aacute;o dục ở đ&acirc;y được ch&iacute;nh phủ t&agrave;i trợ n&ecirc;n học ph&iacute; thấp hơn so với c&aacute;c nước kh&aacute;c. Canada c&oacute; 2 ng&ocirc;n ngữ ch&iacute;nh l&agrave; tiếng Anh v&agrave; tiếng Ph&aacute;p, l&agrave; m&ocirc;i trường học tốt cho sinh vi&ecirc;n quốc tế. Mỗi năm c&oacute; khoảng 200.000 học sinh, sinh vi&ecirc;n quốc tế đến du học tại Canada trong đ&oacute; c&oacute; khoảng 1.000 l&agrave; du học sinh Việt Nam.</p>

<p><strong>Chi ph&iacute; học tập v&agrave; sinh hoạt thấp</strong></p>

<p>Mặc d&ugrave; l&agrave; đất nước c&oacute; nền kinh tế ph&aacute;t triển, mức sống cao nhưng chi ph&iacute; học tập tại Canada vẫn rẻ hơn so với c&aacute;c nước kh&aacute;c trong nh&oacute;m G-8 như Australia, Ph&aacute;p, Anh v&agrave; Mỹ. Tổng chi ph&iacute; một năm học tại Canada trung b&igrave;nh khoảng 13.000 CAD (1 CAD tương đương 18.000 đ&ocirc;̀ng).</p>

<p>Trong đ&oacute;, c&aacute;c ng&agrave;nh học về gi&aacute;o dục, x&atilde; hội, kinh tế mức học ph&iacute; rẻ hơn so với kỹ thuật, y học, kiến tr&uacute;c v&agrave; mức học ph&iacute; c&oacute; sự ch&ecirc;nh lệch kh&aacute; lớn giữa c&aacute;c tỉnh, bang.</p>

<p><img alt="ly-do-nen-chon-du-hoc-canada-nam-2018" src="https://i-vnexpress.vnecdn.net/2017/12/15/Image-ExtractWord-0-Out-8320-1513310360.png" /></p>

<p><strong>Cơ hội l&agrave;m th&ecirc;m,&nbsp;</strong><strong>thực tập hưởng lương</strong></p>

<p>Hầu hết du học sinh Việt Nam du học Canada đều đi l&agrave;m th&ecirc;m để c&oacute; thu nhập giảm bớt chi ph&iacute; sinh hoạt, n&acirc;ng cao khả năng giao tiếp v&agrave; mở rộng c&aacute;c mối quan hệ. Theo quy định của Ch&iacute;nh phủ Canada thời gian l&agrave;m th&ecirc;m theo quy định cho sinh vi&ecirc;n l&agrave; tối đa 20 giờ m&ocirc;̣t tuần trong thời gian học v&agrave; l&agrave;m việc to&agrave;n thời gian trong những kỳ nghỉ của trường. Những việc l&agrave;m th&ecirc;m phổ biến: nh&acirc;n vi&ecirc;n trong si&ecirc;u thị - kh&aacute;ch sạn - rửa xe, phục vụ nh&agrave; h&agrave;ng, l&agrave;m nail, l&agrave;m th&ecirc;m ở trang trại&hellip; với mức lương trung b&igrave;nh m&ocirc;̣t giờ l&agrave;m việc khoảng 8-12 CAD (150.000 - 220.000 đồng).</p>

<p>Ngoài việc học tập l&yacute; thuyết một số ng&agrave;nh học tại Canada cho ph&eacute;p sinh vi&ecirc;n được thực tập hưởng lương: Quản trị kinh doanh kh&aacute;ch sạn, Kế to&aacute;n, Nh&acirc;n sự, Kỹ thuật, N&ocirc;ng nghiệp&hellip; Mức lương sinh vi&ecirc;n nhận được khi tham gia chương tr&igrave;nh n&agrave;y dao động khoảng 5.000 - 15.000 CAD m&ocirc;̣t kỳ.</p>

<p><strong>Cơ hội học bổng</strong></p>

<p>Mức học ph&iacute; của Canada được Ch&iacute;nh phủ h&ocirc;̃ trợ nhiều v&agrave; rẻ hơn những thị trường du học kh&aacute;c n&ecirc;n học bổng đối với sinh vi&ecirc;n quốc tế kh&ocirc;ng qu&aacute; nhiều. Tuy nhi&ecirc;n, hàng năm c&aacute;c trường ở Canada cũng c&oacute; những suất học bổng từ 10-100% (1.000 - 15.000 CAD) để khuyến kh&iacute;ch học sinh c&oacute; th&agrave;nh t&iacute;ch học tập xuất sắc.</p>

<p><strong>Đi&ecirc;̀u ki&ecirc;̣n nh&acirc;̣p học d&ecirc;̃</strong></p>

<p>Về cơ bản, c&aacute;c chương tr&igrave;nh đi&nbsp;<a href="https://duhocbluesea.edu.vn/du-hoc-canada" target="_blank">du học Canada 2018</a>&nbsp;đều kh&ocirc;ng y&ecirc;u cầu tr&igrave;nh độ tiếng anh. Học sinh c&oacute; thể đăng ký kho&aacute; học tiếng Anh v&agrave; học đến khi đủ y&ecirc;u cầu học chương tr&igrave;nh ch&iacute;nh.</p>

<p>Chương tr&igrave;nh x&eacute;t duyệt visa nhanh CES - du học kh&ocirc;ng cần chứng m&igrave;nh t&agrave;i ch&iacute;nh triển khai từ năm 2016 đ&atilde; thu h&uacute;t du học sinh lựa chọn Canada. Chương tr&igrave;nh n&agrave;y hiện c&ograve;n tiếp diễn đến 2018. T&igrave;m hiểu th&ecirc;m về chương tr&igrave;nh&nbsp;<a href="https://duhocbluesea.edu.vn/" target="_blank">tại đ&acirc;y</a>hoặc li&ecirc;n hệ văn ph&ograve;ng của Blue Sea tại TP HCM v&agrave; H&agrave; Nội.</p>

<p><strong>Ch&iacute;nh s&aacute;ch định cư mở</strong></p>

<p>Mới đ&acirc;y, ch&iacute;nh phủ Canada đặt ra mục ti&ecirc;u tiếp nhận 51.000 người nhập cư th&ocirc;ng qua chương tr&igrave;nh Chỉ định tỉnh bang (Provincial Nominee Program). Trong đ&oacute;, tỉnh bang Quebec đưa ra mục ti&ecirc;u ch&agrave;o đ&oacute;n 29.000 người nhập cư th&ocirc;ng qua chương tr&igrave;nh định cư kinh tế, trong đ&oacute; c&oacute; bao gồm cả chương tr&igrave;nh lao động c&oacute; tay nghề Quebec (Quebec Skilled Worker Program).</p>

<p>Điều kiện định cư: du học sinh tốt nghiệp c&aacute;c chương tr&igrave;nh cao đẳng, đại học, sau đại học được ở lại l&agrave;m việc từ 1-3 năm. Sau khi l&agrave;m việc to&agrave;n thời gian tối thiểu m&ocirc;̣t năm, du học sinh được nộp hồ sơ xin định cư tại Canada theo diện việc l&agrave;m.</p>
', N'/Uploads/images/univercity/du-hoc-canada-1.jpg', N'/Uploads/_thumbs/images/univercity/du-hoc-canada-1.jpg', 1, 1, 1, 154, CAST(N'2018-07-02 21:48:33.4251677' AS DateTime2), CAST(N'2018-07-02 21:48:33.4251677' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (24, 1, 5, N'Tôi chọn du học Canada, còn bạn thì sao?', N'Có thể nói cụm từ “Du Học Canada” hoặc "Du Học Canada Diện SDS "vẫn chưa ngừng hot kể từ khi chương trình Visa ưu tiên của chính phủ Canada ban hành. Môi trường học tập hiện đại tại một đất nước có nền văn minh tiên tiến và thân thiện luôn là mơ ước của nhiều bạn học sinh. Vậy đối với những học sinh sinh viên Việt Nam đang quan tâm đến chương trình du học tại Canada chắc chắn sẽ không thể bỏ qua những thông tin tổng hợp hữu ích dưới đây của Bluesea về du học Canada.', N'<p><strong>T&ocirc;i chọn du học Canada, c&ograve;n bạn th&igrave; sao?</strong></p>

<p>C&oacute; thể n&oacute;i cụm từ &ldquo;Du Học Canada&rdquo; hoặc &quot;Du Học Canada Diện SDS &quot;vẫn chưa ngừng hot kể từ khi chương tr&igrave;nh Visa ưu ti&ecirc;n của ch&iacute;nh phủ Canada ban h&agrave;nh. M&ocirc;i trường học tập hiện đại tại một đất nước c&oacute; nền văn minh ti&ecirc;n tiến v&agrave; th&acirc;n thiện lu&ocirc;n l&agrave; mơ ước của nhiều bạn học sinh. Vậy đối với những học sinh sinh vi&ecirc;n Việt Nam đang quan t&acirc;m đến chương tr&igrave;nh du học tại Canada chắc chắn sẽ kh&ocirc;ng thể bỏ qua những th&ocirc;ng tin tổng hợp hữu &iacute;ch dưới đ&acirc;y của Bluesea về du học Canada.</p>

<p><img alt="" src="https://duhocbluesea.edu.vn/data/upload/images/du-hoc-canada-1.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Sinh vi&ecirc;n quốc tế đang du học tại Canada</em></p>

<p><strong>* Tổng quan về nền gi&aacute;o dục Canada:</strong></p>

<p>Canada l&agrave; quốc gia lớn thứ ba thế giới, trải d&agrave;i từ Th&aacute;i B&igrave;nh Dương đến Đại T&acirc;y Dương v&agrave; từ Bắc Cực đến bi&ecirc;n giới Mỹ. D&acirc;n cư với 32.207.000 d&acirc;n phần lớn sống trong khoảng 100 dặm gần bi&ecirc;n giới Mỹ. Kh&iacute; hậu nằm trong v&ugrave;ng &ocirc;n đới, m&ugrave;a đ&ocirc;ng rất lạnh, l&agrave; nước c&oacute; nền c&ocirc;ng nghiệp v&agrave; chất lượng cuộc sống cao.</p>

<p>Gi&aacute;o dục được ch&iacute;nh phủ t&agrave;i trợ n&ecirc;n học ph&iacute; thấp hơn so với c&aacute;c nước kh&aacute;c như Anh, Mỹ, &Uacute;c. Canada c&oacute; 2 ng&ocirc;n ngữ ch&iacute;nh l&agrave; tiếng Anh v&agrave; tiếng Ph&aacute;p, l&agrave; m&ocirc;i trường học tốt cho sinh vi&ecirc;n quốc tế. Mỗi năm c&oacute; khoảng 200.000 học sinh, sinh vi&ecirc;n quốc tế đến du học tại Canada trong đ&oacute; c&oacute; khoảng 1.000 l&agrave; du học sinh Việt Nam.</p>

<p>Để hiểu hơn về nền gi&aacute;o dục Canada h&atilde;y c&ugrave;ng Bluesea điểm qua những th&ocirc;ng tin chi tiết dưới đ&acirc;y c&aacute;c bạn nh&eacute;</p>

<p><strong>*</strong><strong>&nbsp;Điều kiện nhập học ở Canada theo c&aacute;c bậc học:</strong></p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Bậc học</strong></p>
			</td>
			<td>
			<p><strong>Tuổi</strong></p>
			</td>
			<td>
			<p><strong>Học lực</strong></p>
			</td>
			<td>
			<p><strong>Tr&igrave;nh độ ngoại ngữ</strong></p>
			</td>
			<td>
			<p><strong>Lưu &yacute;</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Trung học</p>
			</td>
			<td>
			<p>Dưới 18</p>
			</td>
			<td>
			<p>Trung b&igrave;nh kh&aacute; trở l&ecirc;n</p>
			</td>
			<td>
			<p>T&ugrave;y từng trương y&ecirc;u cầu kh&aacute;c nhau.</p>
			</td>
			<td>
			<p>- Thi xếp lớp để học tiếng Anh trước khi v&agrave;o học lớp ch&iacute;nh kh&oacute;a.<br />
			-Học sinh dưới 16 tuổi cần phải c&oacute; người gi&aacute;m hộ.</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Cao đẳng</p>
			</td>
			<td>
			<p>Tối thiểu 18</p>
			</td>
			<td>
			<p>Tốt nghiệp Phổ th&ocirc;ng Trung học.</p>
			</td>
			<td>
			<p>&nbsp;&nbsp; TOEFL 500 hoặc IELTS 6.5 hoặc 6.0 (đối với một số ng&agrave;nh)</p>
			</td>
			<td rowspan="3">
			<p><em>Hầu hết c&aacute;c trường Đại học tại Canada kh&ocirc;ng nhận du học sinh v&agrave;o học tại 3 chuy&ecirc;n ng&agrave;nh sau: Y khoa, Nha khoa v&agrave; Dược. Nếu du học sinh muốn học 3 ng&agrave;nh n&agrave;y th&igrave; phải c&oacute; điểm trung b&igrave;nh học tập tr&ecirc;n 8.5 điểm v&agrave; c&oacute; tr&igrave;nh độ ngoại ngữ loại giỏi (tối thiểu tr&ecirc;n 7.0 IELTS)</em></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>&nbsp;<em>Đại học</em></p>
			</td>
			<td>
			<p>Tối thiểu 18 tuổi.</p>
			</td>
			<td>
			<p>&nbsp;Tốt nghiệp PTTH.</p>
			</td>
			<td>
			<p>&nbsp;&nbsp;TOEFL 500 hoặc IELTS 6.5 trở l&ecirc;n</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Cao học</p>
			</td>
			<td>
			<p>Tối thiểu 18 tuổi</p>
			</td>
			<td>
			<p>C&oacute; bằng tốt nghiệp Đại học loại kh&aacute; v&agrave; kết quả học tập cao.</p>
			</td>
			<td>
			<p>TOEFL 500 hoặc IELTS 6.5 trở l&ecirc;n</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><strong>*&nbsp;N&ecirc;n chọn ng&agrave;nh g&igrave; khi du học Canada:</strong></p>

<p>Đ&oacute; l&agrave; c&acirc;u hỏi của kh&ocirc;ng &iacute;t học sinh đang c&oacute; &yacute; định du học v&agrave; c&oacute; &yacute; định x&acirc;y dựng tương lai của m&igrave;nh tại đất nước của những l&aacute; phong. Vậy c&acirc;u trả lời l&agrave; g&igrave;?</p>

<p>Ngo&agrave;i yếu tố nhu cầu lao động của nền kinh tế th&igrave; một trong những yếu tố gi&uacute;p bạn lựa chọn một ng&agrave;nh học ph&ugrave; hợp nhất ch&iacute;nh l&agrave; dựa v&agrave;o sở th&iacute;ch v&agrave; năng lực của bản th&acirc;n bạn. Tức l&agrave; sự đam m&ecirc;, y&ecirc;u th&iacute;ch đối với ng&agrave;nh học c&oacute; như vậy bạn mới c&oacute; thể ph&aacute;t huy hết sức mạnh của ng&agrave;nh học mang lại v&agrave; tiếp thu kiến thức một c&aacute;ch hữu &iacute;ch nhất cho c&ocirc;ng việc sau n&agrave;y, ngay cả khi bạn du học cũng như vậy, đặc biệt khi bạn chọn du học tại Canada th&igrave; việc lựa chọn trường trước l&agrave; rất cần thiết để đảm bảo việc chọn trường v&agrave; đi lại ph&ugrave; hợp. Canada c&oacute; 13 tỉnh bang v&agrave; v&ugrave;ng l&atilde;nh thổ, giữa c&aacute;c tỉnh bang v&agrave; v&ugrave;ng c&oacute; sự đa dạng v&agrave; thế mạnh ri&ecirc;ng về c&aacute;c ng&agrave;nh học. Tuy nhi&ecirc;n Bluesea c&oacute; thể điểm qua một số ng&agrave;nh học hiện tại Canada sẽ l&agrave; lựa chọn phổ biến của c&aacute;c bạn du học sinh Việt Nam v&agrave; cũng l&agrave; những ng&agrave;nh học c&oacute; cơ hội c&ocirc;ng việc sau khi c&aacute;c bạn tốt nghiệp như: Quản trị kh&aacute;ch sạn du lịch, điều dưỡng, dịch vụ, t&agrave;i ch&iacute;nh, m&aacute;y t&iacute;nh,&hellip;</p>

<p>&nbsp;</p>

<p><img alt="" src="https://duhocbluesea.edu.vn/data/upload/images/lading-page%20canada(1).jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>T&ocirc;i chọn du học tại Canada, c&ograve;n bạn th&igrave; sao?</em></p>

<p><strong><em>*&nbsp;Bạn cần bao nhi&ecirc;u tiền cho việc du học tại Canada:</em></strong></p>

<p>Nếu cần t&igrave;m một đất nước c&oacute; nền gi&aacute;o dục ph&aacute;t triển top đầu thế giới, học ph&iacute; thấp, chi ph&iacute; sinh hoạt thấp m&agrave; cơ hội định cư lại cao th&igrave; chắc chắn bạn sẽ kh&ocirc;ng thể bỏ qua Canada. Tổng chi ph&iacute; phải bỏ ra cho 1 năm học tại Canada chỉ 210 triệu &ndash; 400 triệu. H&atilde;y tham khảo chi tiết những th&ocirc;ng tin về học ph&iacute;&nbsp;dưới đ&acirc;y:&nbsp;</p>

<p><strong>* Học ph&iacute;&nbsp;</strong><strong>(1CAD = 18.000VNĐ</strong>)</p>

<p>Kh&oacute;a tiếng Anh:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1000 &ndash; 3000 CAD/th&aacute;ng&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp; 18 &ndash; 54 triệu</p>

<p>Tiểu học, trung học:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12000 &ndash; 20000 CAD/năm&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 216 &ndash; 360 triệu</p>

<p>Cao đẳng/Đại học:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12000 &ndash; 20000 CAD/năm&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp; 216 &ndash; 360 triệu</p>

<p>Sau Đại học:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15000 &ndash; 20000 CAD/năm&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp; 270 &ndash; 360 triệu</p>

<p>Trong đ&oacute;, c&aacute;c ng&agrave;nh học về gi&aacute;o dục, x&atilde; hội, kinh tế mức học ph&iacute; rẻ hơn so với kỹ thuật, y học, kiến tr&uacute;c v&agrave; mức học ph&iacute; c&oacute; sự ch&ecirc;nh lệch kh&aacute; lớn giữa c&aacute;c tỉnh bang. (Chi tiết ph&iacute; li&ecirc;n hệ C&ocirc;ng ty tư vấn du học Bluesea để được hỗ trợ)</p>

<p>&nbsp;<strong>* Chi ph&iacute; sinh hoạt</strong></p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p>Ph&iacute; k&iacute; t&uacute;c x&aacute; (đ&atilde; bao gồm ph&iacute; điện, nước)</p>
			</td>
			<td>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;600 &ndash; 900 CAD/th&aacute;ng&nbsp;&nbsp; 10 &ndash; 16 triệu</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Ph&iacute; homestay (đ&atilde; bao gồm ph&iacute; điện, nước, ăn): &nbsp;&nbsp;</p>
			</td>
			<td>
			<p>500 &ndash; 750 CAD/th&aacute;ng &nbsp; 9 &ndash; 13,5 triệu</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Tiền điện thoại</p>

			<p>&nbsp;</p>
			</td>
			<td>
			<p>20 &ndash; 60 CAD/th&aacute;ng &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,36 &ndash; 1 triệu</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>&nbsp;</p>

			<p>Tiền ti&ecirc;u vặt</p>
			</td>
			<td>
			<p>100 CAD/th&aacute;ng &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,8 triệu</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Tổng</p>
			</td>
			<td>
			<p><strong>134 &ndash; 225 triệu/năm</strong></p>

			<p>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><strong>*C&aacute;c chi ph&iacute; kh&aacute;c:</strong></p>

<p>- Ph&iacute; đi lại:</p>

<p>V&eacute; bus đơn: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,75 CAD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp; 49,5 ngh&igrave;n đồng</p>

<p>V&eacute; th&aacute;ng: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65 CAD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;1,17 triệu đồng</p>

<p><em>Du học sinh c&oacute; thể được miễn ph&iacute; đi lại xe bus trong th&agrave;nh phố nếu l&agrave; học sinh một số trường: Niagara college, Fleming College,...</em></p>

<p>&nbsp;</p>

<p>- Ph&iacute; Internet: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55 &ndash; 95 CAD/th&aacute;ng &nbsp;&nbsp;~&nbsp;&nbsp; &nbsp;0,9 &ndash; 1,7 triệu đồng</p>

<p><strong>*Chi ph&iacute; sinh hoạt cho những bạn sinh vi&ecirc;n sống một m&igrave;nh:</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;Thu&ecirc; nh&agrave; (đ&atilde; bao gồm điện, nước, internet): &nbsp;300 &ndash; 450 CAD/th&aacute;ng &nbsp;~ &nbsp;5 &ndash; 8 triệu đồng</p>

<p>&nbsp; &nbsp;- Tiền ăn (tự nấu ăn): 150 &ndash; 250 CAD/th&aacute;ng &nbsp; 2,7 &ndash; 4,5 triệu</p>

<p><img alt="" src="https://duhocbluesea.edu.vn/data/upload/images/3(6).jpg" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Nền gi&aacute;o dục Canada đạt chất lượng h&agrave;ng đầu thế giới</em></p>

<p><strong>*&nbsp;Cơ hội l&agrave;m th&ecirc;m</strong></p>

<p>Hầu hết du học sinh Việt Nam du học Canada đều đi l&agrave;m th&ecirc;m để c&oacute; thu nhập giảm bớt chi ph&iacute; sinh hoạt, n&acirc;ng cao khả năng giao tiếp v&agrave; mở rộng c&aacute;c mối quan hệ. Theo quy định của Ch&iacute;nh phủ Canada thời gian l&agrave;m th&ecirc;m theo quy định cho sinh vi&ecirc;n l&agrave; tối đa 20h/tuần trong thời gian k&igrave; học v&agrave; l&agrave;m việc to&agrave;n thời gian trong những kỳ nghỉ của trường. Những việc l&agrave;m th&ecirc;m phổ biến: Nh&acirc;n vi&ecirc;n trong si&ecirc;u thị, nh&acirc;n vi&ecirc;n kh&aacute;ch sạn, nh&acirc;n vi&ecirc;n rửa xe, phục vụ nh&agrave; h&agrave;ng, l&agrave;m nail, l&agrave;m th&ecirc;m ở trang trại&hellip;với mức lương trung b&igrave;nh 1 giờ l&agrave;m việc khoảng&nbsp; 8 &ndash; 12 CAD/giờ (150 &ndash; 220 ngh&igrave;n đồng/giờ)</p>

<p><strong><em>* Cơ hội thực tập hưởng lương</em></strong></p>

<p>B&ecirc;n cạnh việc học tập l&yacute; thuyết một số ng&agrave;nh học tại Canada cho ph&eacute;p sinh vi&ecirc;n được thực tập hưởng lương: quản trị kinh doanh kh&aacute;ch sạn, Kế to&aacute;n, nh&acirc;n sự, kỹ thuật, n&ocirc;ng nghiệp,&hellip; Mức lương m&agrave; c&aacute;c bạn nhận được khi tham gia chương tr&igrave;nh n&agrave;y dao động khoảng 5.000 &ndash; 15.000 CAD/ k&igrave;</p>

<p><strong><em>Vậy l&agrave;&nbsp;</em></strong>tổng chi ph&iacute; du học Canada 1 năm khoảng: 350 &ndash; 600 triệu/ năm.Thu nhập từ việc l&agrave;m th&ecirc;m (với du học sinh học bậc CĐ &ndash; ĐH trở l&ecirc;n): 144 &ndash; 210 triệu/năm</p>

<p><em>Như vậy, mỗi năm du học Canada chỉ cần chuẩn bị: 210 &ndash; 400 triệu.&nbsp;</em>Đ&acirc;y ch&iacute;nh l&agrave; một trong những l&yacute; do khiến Canada nằm trong Top 5 những nước c&oacute; tỷ lệ sinh vi&ecirc;n quốc tế cao nhất tr&ecirc;n thế giới!</p>

<p><strong>*&nbsp;Cơ hội học bổng</strong>: Mức học ph&iacute; của Canada đ&atilde; được ch&iacute;nh phủ rất nhiều v&agrave; c&oacute; sự rẻ hơn những thị trường du học kh&aacute;c như Anh, &Uacute;c, Mỹ. Vậy n&ecirc;n học bổng đối với sinh vi&ecirc;n quốc tế cũng c&oacute; phần kh&ocirc;ng qu&aacute; nhiều, tuy nhi&ecirc;n hằng năm c&aacute;c trường ở Canada cũng c&oacute; những suất học bổng từ 10 &ndash; 100% (1.000 &ndash; 15.000 CAD) để khuyến kh&iacute;ch c&aacute;c bạn học sinh c&oacute; th&agrave;nh t&iacute;ch học tập xuất sắc.</p>

<p>- Điều kiện học bổng:</p>

<p>+ Học lực giỏi (8.0/10.0 trở l&ecirc;n; hoặc 3.2/4.0 trở l&ecirc;n)</p>

<p>+ Khả năng ngoại ngữ: Chứng chỉ IELTS, TOEFL</p>

<p>+ Giải quốc gia</p>

<p>+ Th&agrave;nh t&iacute;ch hoạt động ngoại kh&oacute;a</p>

<p><em>C&aacute;c bạn c&oacute; th&agrave;nh t&iacute;ch tốt mong muốn nhận được hỗ trợ học bổng từ Canada th&igrave; h&atilde;y đăng k&iacute; hồ sơ cho Bluesea ngay n&agrave;o</em></p>

<p><em>T&ocirc;i chọn du học Canada &ndash; C&ograve;n bạn th&igrave; sao. Hiện nay, Canada đang l&agrave; lựa chọn của rất nhiều bạn học sinh, sinh vi&ecirc;n Việt Nam. Nguy&ecirc;n nh&acirc;n kh&ocirc;ng chỉ bởi sự cởi mở của ch&iacute;nh s&aacute;ch visa m&agrave; c&ograve;n ở m&ocirc;i trường học tập hiện đại, đẳng cấp quốc tế v&agrave; &nbsp;sự ph&ugrave; hợp về học ph&iacute;. Vậy nếu như bạn đang quan t&acirc;m đến Du học Canad, bạn đăng băn khoăn về việc chọn trường v&agrave; tỉnh bang để học tập tại đất nước của những l&aacute; phong hết sức hấp dẫn n&agrave;y, &nbsp;h&atilde;y đến với Du học Bluesea ngay nh&eacute;!</em></p>

<p><strong>*&nbsp;L&iacute; do chọn Du học Bluesea</strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://duhocbluesea.edu.vn/data/upload/images/my4(1).jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Đội ngũ tư vấn du học Bluesea tại H&agrave; Nội</em></p>

<p>Hằng năm Bluesea đưa h&agrave;ng trăm bạn học sinh đến du học tại Canada, đến với Bluesea bạn sẽ được đội ngũ l&agrave;m việc chuy&ecirc;n nghiệp gi&uacute;p đỡ tận t&igrave;nh c&aacute;c thủ tục từ chọn trường đến thủ tục xin visa v&agrave; đặc biệt l&agrave; sẽ nhận được tư vấn cụ thể chi tiết về trường cũng như ng&agrave;nh học ph&ugrave; hợp nhất đối với từng bạn học sinh. Bluesea lu&ocirc;n đặt chữ t&acirc;m l&ecirc;n h&agrave;ng đầu n&ecirc;n nhiều năm nay lu&ocirc;n được c&aacute;c bậc phụ huynh v&agrave; học sinh tin tưởng chọn l&agrave;m người bạn đồng h&agrave;nh. H&atilde;y để Bluesea chắp c&aacute;nh ước mơ du học cho c&aacute;c bạn nh&eacute;<em>!</em></p>

<p><em>Dưới đ&acirc;y l&agrave; Danh s&aacute;ch tham khảo về một số trường tại Canada, c&aacute;c bạn c&oacute; thể tham khảo: (Danh s&aacute;ch c&aacute;c trường cao đẳng, đại học)</em></p>

<p><u><strong><em>Danh s&aacute;ch trường cao đẳng</em></strong></u></p>

<table border="1" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td><strong>STT</strong></td>
			<td><strong>T&Ecirc;N TRƯỜNG</strong></td>
			<td><strong>TỈNH BANG</strong></td>
			<td><strong>HỌC PH&Iacute;</strong></td>
			<td><strong>WEBSITE</strong></td>
		</tr>
		<tr>
			<td>1</td>
			<td>College of New Caledonia</td>
			<td>Bristish Columbia</td>
			<td>$325.00/ k&igrave;</td>
			<td>http://www.cnc.bc.ca/</td>
		</tr>
		<tr>
			<td>2</td>
			<td>College of the Rockies</td>
			<td>Bristish Columbia</td>
			<td>$2,591/ k&igrave;</td>
			<td>http://www.cotr.bc.ca/</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Conestoga College Institute of Technology and Advanced Learning</td>
			<td>Ontario</td>
			<td>$13,000</td>
			<td>http://www.conestogac.on.ca/</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Confederation College</td>
			<td>Ontario</td>
			<td>$14,000 - $17,000</td>
			<td>http://www.confederationcollege.ca</td>
		</tr>
		<tr>
			<td>5</td>
			<td>Douglas College</td>
			<td>Bristish Columbia</td>
			<td>$16,000</td>
			<td>http://www.douglascollege.ca/</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Durham College</td>
			<td>Ontario</td>
			<td>$14,000</td>
			<td>http://www.durhamcollege.ca/</td>
		</tr>
		<tr>
			<td>7</td>
			<td>Emily Carr University of Art and Design</td>
			<td>Bristish Columbia</td>
			<td>$15,000</td>
			<td>http://www.ecuad.ca/</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Fleming College</td>
			<td>Ontario</td>
			<td>$1.827-2.638/ k&igrave;</td>
			<td>https://flemingcollege.ca/</td>
		</tr>
		<tr>
			<td>9</td>
			<td>George Brown College</td>
			<td>Ontario</td>
			<td>$14,000</td>
			<td>http://www.georgebrown.ca</td>
		</tr>
		<tr>
			<td>10</td>
			<td>Georgian College of Applied Arts and Technology</td>
			<td>Ontario</td>
			<td>$13,000 - $ 14,000</td>
			<td>http://www.georgiancollege.ca/</td>
		</tr>
		<tr>
			<td>11</td>
			<td>Humber College Institute of Technology &amp; Advanced Learning</td>
			<td>Ontario</td>
			<td>$14.200 - $15,000</td>
			<td>http://humber.ca/</td>
		</tr>
		<tr>
			<td>12</td>
			<td>Kwantlen Polytechnic University</td>
			<td>Bristish Columbia</td>
			<td>$16,000</td>
			<td>http://www.kpu.ca/</td>
		</tr>
		<tr>
			<td>13</td>
			<td>Lambton College of Applied Arts and Technology</td>
			<td>Ontario</td>
			<td>$12,000 - $14,000</td>
			<td>https://www.lambtoncollege.ca/</td>
		</tr>
		<tr>
			<td>14</td>
			<td>Niagara College</td>
			<td>Ontario</td>
			<td>$13,000&nbsp;($1,000 scholarship)</td>
			<td>http://www.niagaracollege.ca/</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><u><strong><em>Danh s&aacute;ch trường Đại học</em></strong></u></p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>STT</strong></p>
			</td>
			<td>
			<p><strong>T&Ecirc;N TRƯỜNG</strong></p>
			</td>
			<td>
			<p><strong>TỈNH BANG</strong></p>
			</td>
			<td>
			<p><strong>Học ph&iacute;</strong></p>
			</td>
			<td>
			<p><strong>WEBSITE</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>1</p>
			</td>
			<td>
			<p>Simon Fraser University</p>
			</td>
			<td>
			<p>Burnaby, BC</p>
			</td>
			<td>
			<p>~20.000 CAD</p>
			</td>
			<td>
			<p>http://www.sfu.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>2</p>
			</td>
			<td>
			<p>University of Victoria</p>
			</td>
			<td>
			<p>Victoria, BC</p>
			</td>
			<td>
			<p>20.000 - 23.000 CAD</p>
			</td>
			<td>
			<p>http://www.uvic.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>3</p>
			</td>
			<td>
			<p>Vancouver Island University</p>
			</td>
			<td>
			<p>Nanaimo, BC</p>
			</td>
			<td>
			<p>15.000 - 20.000 CAD</p>
			</td>
			<td>
			<p>http://www.viu.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>4</p>
			</td>
			<td>
			<p>Thompson Rivers University</p>
			</td>
			<td>
			<p>Kamloops, BC</p>
			</td>
			<td>
			<p>19.000 CAD</p>
			</td>
			<td>
			<p>http://www.tru.ca/&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>5</p>
			</td>
			<td>
			<p>University of the Fraser Valley</p>
			</td>
			<td>
			<p>&nbsp;Abbotsford, BC&nbsp;</p>
			</td>
			<td>
			<p>20.000 - 30.000 CAD</p>
			</td>
			<td>
			<p>http://www.ufv.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>6</p>
			</td>
			<td>
			<p>University of North British Columbia</p>
			</td>
			<td>
			<p>&nbsp;Prince George, BC</p>
			</td>
			<td>
			<p>15.000 - 25.000 CAD</p>
			</td>
			<td>
			<p>http://www.unbc.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>7</p>
			</td>
			<td>
			<p>Trinity Western University</p>
			</td>
			<td>
			<p>Langley, BC</p>
			</td>
			<td>
			<p>22.000 - 25.000 CAD</p>
			</td>
			<td>
			<p>http://www.twu.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>8</p>
			</td>
			<td>
			<p>Capilano University</p>
			</td>
			<td>
			<p>North Vancouver, BC</p>
			</td>
			<td>
			<p>15.000 - 24.000 CAD</p>
			</td>
			<td>
			<p>http://www.capilanou.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>9</p>
			</td>
			<td>
			<p>Royal Roads University</p>
			</td>
			<td>
			<p>Victoria, BC</p>
			</td>
			<td>
			<p>25.000 - 30.000 CAD</p>
			</td>
			<td>
			<p>http://www.royalroads.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>10</p>
			</td>
			<td>
			<p>British Columbia Institute of Technology</p>
			</td>
			<td>
			<p>Burnaby, BC</p>
			</td>
			<td>
			<p>18.000 - 22.000 CAD</p>
			</td>
			<td>
			<p>http://www.bcit.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>11</p>
			</td>
			<td>
			<p>University of Lethbridge</p>
			</td>
			<td>
			<p>Lethbridge, AB</p>
			</td>
			<td>
			<p>15.000 - 18.000 CAD</p>
			</td>
			<td>
			<p>http://www.uleth.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>12</p>
			</td>
			<td>
			<p>Southern Alberta Institute of Technology</p>
			</td>
			<td>
			<p>Calgary, AB</p>
			</td>
			<td>
			<p>10.000 - 14.000 CAD</p>
			</td>
			<td>
			<p>http://www.sait.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>13</p>
			</td>
			<td>
			<p>Northern Alberta Institute of Technology</p>
			</td>
			<td>
			<p>Edmonton, AB</p>
			</td>
			<td>
			<p>13.000 - 15.000 CAD</p>
			</td>
			<td>
			<p>http://www.nait.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>14</p>
			</td>
			<td>
			<p>Mount Royal University</p>
			</td>
			<td>
			<p>Calgary, AB</p>
			</td>
			<td>
			<p>18.000 - 20.000 CAD</p>
			</td>
			<td>
			<p>http://www.mtroyal.ca/</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>15</p>
			</td>
			<td>
			<p>Concordia University of Edmonton</p>
			</td>
			<td>
			<p>Edmonton, AB&nbsp;</p>
			</td>
			<td>
			<p>8.000 - 10.000 CAD</p>
			</td>
			<td>
			<p>http://concordia.ab.ca/</p>
			</td>
		</tr>
	</tbody>
</table>
', N'/Uploads/images/Du%20hoc%20Canada/lading-page%20canada(1).jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Canada/lading-page%20canada(1).jpg', 1, 1, 1, 65, CAST(N'2018-07-02 21:50:58.2093135' AS DateTime2), CAST(N'2018-07-02 21:50:58.2093135' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (25, 1, 4, N'Du học Đài Loan trọn gói 35tr. Tuyển sinh du học Đài Loan tại Hà Nội', N'THÔNG BÁO TUYỂN SINH DU HỌC ĐÀI LOAN TẠI HÀ NỘI
Kỳ tháng 9/2018', N'<h3>Đ&ocirc;i n&eacute;t về nền gi&aacute;o dục Đ&agrave;i Loan</h3>

<p><a href="http://hocodau.edu.vn/category/du-hoc-dai-loan">Du học Đ&agrave;i Loan</a>&nbsp;hiện đang trở th&agrave;nh tr&agrave;o lưu đối với giới trẻ Việt Nam hiện nay. Đ&agrave;i Loan l&agrave; một h&ograve;n đảo xinh đẹp rộng khoảng 36.000km2, nằm ở khu vực Đ&ocirc;ng &Aacute;, c&oacute; thủ đ&ocirc; l&agrave; Đ&agrave;i Bắc. Từ nửa sau thế kỷ 20, Đ&agrave;i Loan đ&atilde; nổi l&ecirc;n như một con rồng Ch&acirc;u &Aacute;, v&agrave; hiện nay nền gi&aacute;o dục của Đ&agrave;i Loan được đ&aacute;nh gi&aacute; l&agrave; nền gi&aacute;o dục ti&ecirc;n tiến tr&ecirc;n Thế giới.</p>

<p>Hệ thống&nbsp;<a href="http://hocodau.edu.vn/du-hoc-dai-loan-trung-tam-tu-van-du-hoc-dai-loan-tai-ha-noi.html">gi&aacute;o dục ở Đ&agrave;i Loan</a>&nbsp;gồm c&oacute; 12 năm học phổ th&ocirc;ng bắt buộc, tiếp theo l&agrave; bậc học cao đẳng, đại học k&eacute;o d&agrave;i khoảng 4 năm.&nbsp;Đ&agrave;i Loan &aacute;p dụng phương ph&aacute;p gi&aacute;o dục lấy học vi&ecirc;n l&agrave;m trung t&acirc;m, tập trung v&agrave;o sự ph&aacute;t triển của mỗi c&aacute; nh&acirc;n. B&ecirc;n cạnh đ&oacute;, Đ&agrave;i Loan cũng nỗ lực tạo ra m&ocirc;i trường học bằng tiếng Anh một c&aacute;ch th&acirc;n thiện cho sinh vi&ecirc;n quốc tế.</p>

<p>Bộ gi&aacute;o dục khuyến kh&iacute;ch trường Đại học mở c&aacute;c chương tr&igrave;nh học ho&agrave;n to&agrave;n bằng tiếng Anh nhằm thu h&uacute;t sinh vi&ecirc;n quốc tế v&agrave; chương tr&igrave;nh đ&oacute; được gi&aacute;m s&aacute;t bởi Hội đồng đ&aacute;nh gi&aacute; v&agrave; kiểm định gi&aacute;o dục&nbsp;<a href="http://hocodau.edu.vn/tag/du-hoc-dai-loan-co-kho-khong">Đ&agrave;i Loan</a>&nbsp;(HEEACT).</p>

<p>Tại&nbsp;<a href="http://hocodau.edu.vn/tag/tong-chi-phi-du-hoc-dai-loan">Đ&agrave;i Loan</a>, c&aacute;c ng&agrave;nh c&oacute; nhiều sinh vi&ecirc;n theo học chủ yếu l&agrave;: khoa học kỹ thuật, quản trị kinh doanh, nh&acirc;n văn v&agrave; nghệ thuật, v&agrave; c&aacute;c ng&agrave;nh kh&aacute;c&hellip;</p>

<h3>Để triển khai c&ocirc;ng t&aacute;c tuyển sinh năm 2018. Trường cao đẳng Văn Lang H&agrave; Nội kết hợp với c&aacute;c Trường Đại Học Đ&agrave;i Loan th&ocirc;ng b&aacute;o tuyển sinh&nbsp;<a href="http://hocodau.edu.vn/du-hoc-dai-loan-tron-goi-35tr-tuyen-sinh-du-hoc-dai-loan-tai-ha-noi.html"><strong>Du học Đ&agrave;i Loan</strong></a>&nbsp;như sau:</h3>

<p><img alt="➡" src="https://s.w.org/images/core/emoji/2.4/svg/27a1.svg" />&nbsp;<a href="http://hocodau.edu.vn/tag/cac-nganh-du-hoc-dai-loan">DU HỌC Đ&Agrave;I LOAN</a>&nbsp;&ndash;&nbsp;&nbsp;<strong>Miễn 100%</strong>&nbsp;Học ph&iacute; năm thứ nhất, học ph&iacute; 3 năm c&ograve;n lại được&nbsp; trả dần.</p>

<p><img alt="➡" src="https://s.w.org/images/core/emoji/2.4/svg/27a1.svg" />&nbsp;Sinh vi&ecirc;n vừa học &ndash; Vừa đi l&agrave;m th&ecirc;m với mức thu nhập cao&nbsp;(<strong>TỪ 16 TRIỆU TRỞ L&Ecirc;N</strong>)</p>

<p><img alt="➡" src="https://s.w.org/images/core/emoji/2.4/svg/27a1.svg" />&nbsp;Cơ hội l&agrave;m việc v&agrave; c&ocirc;ng t&aacute;c tại&nbsp;<a href="http://hocodau.edu.vn/tag/du-hoc-dai-loan-can-bao-nhieu-tien">Đ&agrave;i Loan</a>&nbsp;l&acirc;u d&agrave;i, sau khi học xong được bảo l&atilde;nh cho người th&acirc;n sang.</p>

<p><img alt="➡" src="https://s.w.org/images/core/emoji/2.4/svg/27a1.svg" />&nbsp;PH&Iacute; TRỌN G&Oacute;I:&nbsp;<strong>35 TRIỆU VNĐ</strong></p>

<p><em><u>Ghi ch&uacute;:</u></em></p>

<ol>
	<li><em>Cam kết 100% kh&ocirc;ng thu th&ecirc;m bất kỳ khoản n&agrave;o từ học vi&ecirc;n v&agrave; phụ huynh</em></li>
	<li><em>Trường Cao đẳng Văn Lang H&agrave; Nội trực thuộc Bộ lao động l&agrave;m việc trực tiếp với ch&iacute;nh phủ Đ&agrave;i Loan v&agrave; c&aacute;c trường Đại học Đ&agrave;i Loan, kh&ocirc;ng th&ocirc;ng qua m&ocirc; giới v&igrave; vậy học sinh v&agrave; phụ huynh sẽ y&ecirc;n t&acirc;m với mức kinh ph&iacute; sẽ rẻ hơn rất nhiều so với c&aacute;c Trung t&acirc;m v&agrave; c&ocirc;ng ty.</em></li>
</ol>

<h3>C&aacute;c trường li&ecirc;n kết với Văn Lang</h3>

<table>
	<tbody>
		<tr>
			<td>學校
			<p>&nbsp;</p>

			<p>Trường học</p>
			</td>
			<td>科系
			<p>&nbsp;</p>

			<p>Khoa ng&agrave;nh</p>
			</td>
			<td>人數
			<p>&nbsp;</p>

			<p>Số lượng</p>
			</td>
			<td>學費Học ph&iacute;</td>
		</tr>
		<tr>
			<td>高雄-高苑大學
			<p>&nbsp;</p>

			<p>Đại học Cao Uyển &ndash; Cao H&ugrave;ng</p>
			</td>
			<td>行銷管理
			<p>&nbsp;</p>

			<p>Quản trị&nbsp;Marketing</p>
			</td>
			<td>40</td>
			<td>第一年學費2400美金，工作賺錢第二年後，分3年繳費
			<p>&nbsp;</p>

			<p>Học ph&iacute; 1 năm 2400 USD,&nbsp;miễn ph&iacute; học năm đầu, học ph&iacute; 3 năm c&ograve;n lại sẽ được trả dần trong 3 năm học</p>
			</td>
		</tr>
		<tr>
			<td>台北-東南大學
			<p>&nbsp;</p>

			<p>Đại học Đ&ocirc;ng Nam &ndash; Đ&agrave;i Bắc</p>
			</td>
			<td>餐飲管理
			<p>&nbsp;</p>

			<p>Quản trị nh&agrave; h&agrave;ng kh&aacute;ch sạn</p>
			</td>
			<td>40</td>
			<td>前半年學費1200美金，工作賺錢後，分3.5年繳費
			<p>&nbsp;</p>

			<p>Học ph&iacute; 1 năm 1200 USD,&nbsp;miễn ph&iacute; học kỳ đầu, học ph&iacute; 3,5 năm c&ograve;n lại sẽ được trả dần trong 3.5 năm học</p>
			</td>
		</tr>
		<tr>
			<td>台北-德明大學
			<p>&nbsp;</p>

			<p>Đại học Đức Minh &ndash; Đ&agrave;i Bắc</p>
			</td>
			<td>物流管理
			<p>&nbsp;</p>

			<p>Quản trị xuất nhập khẩu</p>
			</td>
			<td>40</td>
			<td>第一年學費2400美金，工作賺錢第二年後，分3年繳費
			<p>&nbsp;</p>

			<p>Học ph&iacute; 1 năm 2400 USD,&nbsp;miễn ph&iacute; học năm đầu, học ph&iacute; 3 năm c&ograve;n lại sẽ được trả dần trong 3 năm học</p>
			</td>
		</tr>
		<tr>
			<td>台北-景文大學
			<p>&nbsp;</p>

			<p>Đ&agrave;i Bắc &ndash; Đại học Cảnh Văn</p>
			</td>
			<td>電腦通訊
			<p>&nbsp;</p>

			<p>C&ocirc;ng nghệ điện tử</p>
			</td>
			<td>40</td>
			<td>半年學費1500美金，工作後，分3.5年繳費
			<p>&nbsp;</p>

			<p>kỳ đầu miễn học ph&iacute;, học ph&iacute; 1500 USD/năm. 3,5 năm c&ograve;n lại học sinh c&oacute; thể trả dần học ph&iacute;</p>
			</td>
		</tr>
		<tr>
			<td>台北-景文大學
			<p>&nbsp;</p>

			<p>Đ&agrave;i Bắc &ndash; ĐH Cảnh Văn</p>
			</td>
			<td>觀光餐旅
			<p>&nbsp;</p>

			<p>Quản l&yacute; kh&aacute;ch sạn nh&agrave; h&agrave;ng</p>
			</td>
			<td>40</td>
			<td>半年學費1500美金，工作後，分3.5年繳費
			<p>&nbsp;</p>

			<p>kỳ đầu miễn học ph&iacute;, học ph&iacute; 1500 USD/năm. 3,5 năm c&ograve;n lại học sinh c&oacute; thể trả dần học ph&iacute;</p>
			</td>
		</tr>
		<tr>
			<td>台北-醒吾大學
			<p>&nbsp;</p>

			<p>第一班</p>

			<p>Đại Học&nbsp;Tỉnh Ng&ocirc;&nbsp;&ndash; Lớp thứ nhất</p>
			</td>
			<td>企業管理Quản&nbsp;trị&nbsp;kinh doanh</td>
			<td>40</td>
			<td>半年學雜費1500美金，工作賺錢後，分3.5年繳費
			<p>&nbsp;</p>

			<p>kỳ đầu miễn học ph&iacute;, học ph&iacute; 1500 USD/năm. 3,5 năm c&ograve;n lại học sinh c&oacute; thể trả dần học ph&iacute;</p>
			</td>
		</tr>
		<tr>
			<td>台北-醒吾大學
			<p>&nbsp;</p>

			<p>第二班</p>

			<p>Đại Học&nbsp;Tỉnh Ng&ocirc;&nbsp;&ndash; Lớp thứ hai</p>
			</td>
			<td>企業管理
			<p>&nbsp;</p>

			<p>Quản&nbsp;trị&nbsp;kinh doanh</p>
			</td>
			<td>40</td>
			<td>半年學雜費1500美金，工作賺錢後，分3.5年繳費
			<p>&nbsp;</p>

			<p>kỳ đầu miễn học ph&iacute;, học ph&iacute; 1500 USD/năm. 3,5 năm c&ograve;n lại học sinh c&oacute; thể trả dần học ph&iacute;</p>
			</td>
		</tr>
		<tr>
			<td>台南-康寧大學
			<p>&nbsp;</p>

			<p>Đ&agrave;i Nam &ndash; ĐH Khang Ninh</p>
			</td>
			<td>企業管理
			<p>&nbsp;</p>

			<p>Quản trị kinh doanh</p>
			</td>
			<td>40</td>
			<td>每半年學雜費1500美金費。
			<p>&nbsp;</p>

			<p>Học ph&iacute; + Phụ ph&iacute; = 1500 USD/năm</p>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>健康照護
			<p>&nbsp;</p>

			<p>Điều dưỡng</p>
			</td>
			<td>40</td>
			<td>每半年學雜費1500美金費。
			<p>&nbsp;</p>

			<p>Học ph&iacute; + Phụ ph&iacute; = 1500 USD/năm</p>
			</td>
		</tr>
		<tr>
			<td>Đại học Đại Đồng
			<p>&nbsp;</p>

			<p>Trung Sơn &ndash; Gia Nghĩa</p>
			</td>
			<td>QT Nh&agrave; h&agrave;ng &ndash; Kh&aacute;ch sạn</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Đại học kinh Quốc
			<p>&nbsp;</p>

			<p>Cơ Long- Đ&agrave;i Bắc</p>
			</td>
			<td>QT Nh&agrave; h&agrave;ng &ndash; Kh&aacute;ch sạn</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">vv&hellip;&hellip;&hellip;&hellip;.</td>
		</tr>
	</tbody>
</table>

<h3>Điều kiện du học Đ&agrave;i Loan</h3>

<table>
	<tbody>
		<tr>
			<td>項目
			<p>&nbsp;</p>

			<p>Hạng mục</p>
			</td>
			<td>內容
			<p>&nbsp;</p>

			<p>Nội dung</p>
			</td>
			<td>備註
			<p>&nbsp;</p>

			<p>Ghi ch&uacute;</p>
			</td>
		</tr>
		<tr>
			<td>年紀
			<p>&nbsp;</p>

			<p>Độ tuổi</p>
			</td>
			<td>18~ 25歲
			<p>&nbsp;</p>

			<p>18-25 tuổi</p>
			</td>
			<td>護照
			<p>&nbsp;</p>

			<p>Hộ chiếu</p>
			</td>
		</tr>
		<tr>
			<td>性別
			<p>&nbsp;</p>

			<p>Giới t&iacute;nh</p>
			</td>
			<td>男、女均可
			<p>&nbsp;</p>

			<p>Nam, nữ</p>
			</td>
			<td>身分證
			<p>&nbsp;</p>

			<p>Chứng minh thư</p>
			</td>
		</tr>
		<tr>
			<td>學歷
			<p>&nbsp;</p>

			<p>Học lực</p>
			</td>
			<td>高中、高職以上&nbsp;畢業
			<p>&nbsp;</p>

			<p>Tốt nghiệp THPT trở l&ecirc;n</p>
			</td>
			<td>畢業證書
			<p>&nbsp;</p>

			<p>Bằng tốt nghiệp</p>
			</td>
		</tr>
		<tr>
			<td>成績
			<p>&nbsp;</p>

			<p>Điểm</p>
			</td>
			<td>三年平均6.0分以上
			<p>&nbsp;</p>

			<p>Trung b&igrave;nh 3 năm&nbsp;6.0&nbsp;trở l&ecirc;n</p>
			</td>
			<td>成績單
			<p>&nbsp;</p>

			<p>Bảng điểm</p>
			</td>
		</tr>
		<tr>
			<td>健康
			<p>&nbsp;</p>

			<p>Sức khỏe</p>
			</td>
			<td>符合台灣政府規定
			<p>&nbsp;</p>

			<p>Ph&ugrave; hợp với c&aacute;c quy định của ch&iacute;nh phủ Đ&agrave;i Loan</p>
			</td>
			<td>身體檢查表&nbsp;kh&aacute;m sức khoẻ
			<p>&nbsp;</p>

			<p>Trung t&acirc;m&nbsp;đưa hs đi kh&aacute;m sức khỏe</p>
			</td>
		</tr>
		<tr>
			<td>財務
			<p>&nbsp;</p>

			<p>T&agrave;i ch&iacute;nh</p>
			</td>
			<td>須有5000&nbsp;美金
			<p>&nbsp;</p>

			<p>C&oacute; 5000 USD</p>
			</td>
			<td>存款證明&nbsp;5000&nbsp;美金
			<p>&nbsp;</p>

			<p>Chứng minh trong t&agrave;i khoản ng&acirc;n h&agrave;ng c&oacute; 5000 USD</p>

			<p>( Trung t&acirc;m l&agrave;m hồ sơ chứng minh cho học sinh)</p>
			</td>
		</tr>
	</tbody>
</table>
', N'/Uploads/images/univercity/cao-hung-dai-loan.jpg', N'/Uploads/_thumbs/images/univercity/cao-hung-dai-loan.jpg', 1, 1, 1, 98, CAST(N'2018-07-04 21:54:16.3411129' AS DateTime2), CAST(N'2018-07-04 21:54:16.3411129' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (26, 1, 4, N'BẬT MÍ HỌC BỔNG ĐÀI LOAN KỲ THÁNG 02/2019', N'Bậc học: Đại học, Thạc sỹ, Tiến sỹ
Giá trị học bổng: Học phí, trợ cấp (đối với bậc học Thạc sĩ, Tiến sĩ)
Kỳ nhập học: Tháng 2/2019.', N'<h2><strong>I.GIỚI THIỆU VỀ NỀN GI&Aacute;O DỤC Đ&Agrave;I LOAN</strong></h2>

<p>L&agrave; một đất nước nhỏ tại khu vực T&acirc;y Th&aacute;i B&igrave;nh Dương, Đ&agrave;i Loan đ&atilde; ph&aacute;t triển th&agrave;nh một cường quốc về kinh tế v&agrave; lu&ocirc;n giữ vững vị tr&iacute; đi đầu trong nhiều ng&agrave;nh c&ocirc;ng nghiệp tr&ecirc;n khắp thế giới. Ch&igrave;a kh&oacute;a th&agrave;nh c&ocirc;ng nằm ở sự quyết t&acirc;m ki&ecirc;n tr&igrave; của Đ&agrave;i Loan trong việc n&acirc;ng cao chất lượng gi&aacute;o dục đại học trong suốt s&aacute;u thập kỷ qua.</p>

<p>Năm 2015, trong bảng xếp hạng QS Ranking, c&oacute; 9 trường đại học tại Đ&agrave;i Loan nằm trong Top 400 c&aacute;c trường Đại học. Trong đ&oacute;, đại học quốc gia Đ&agrave;i Loan (70), Đại học Quốc Gia Thanh Hoa (155),&nbsp; Đại học Quốc gia Giao th&ocirc;ng (182), Đại học quốc gia Th&agrave;nh C&ocirc;ng (224), Đại học Khoa học v&agrave; C&ocirc;ng nghệ quốc gia Đ&agrave;i Loan (260), Đại học quốc gia Dương Minh (338), Đại học sư phạm quốc gia Đ&agrave;i Loan (376),&nbsp; Đại học quốc gia T&ocirc;n Trung Sơn (379), Đại học quốc gia Trung ương (397).</p>

<p><a href="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/07/2-3.jpg"><img alt="Học bổng Đài Loan" src="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/07/2-3.jpg?resize=600%2C400" style="height:400px; width:600px" /></a></p>

<p>Học bổng Đ&agrave;i Loan</p>

<p>Những ưu điểm c&oacute; thể kể đến khi du học Đ&agrave;i Loan l&agrave; học ph&iacute; v&agrave; chi ph&iacute; sinh hoạt thấp, khả năng xin được học bổng cực cao, nhiều c&ocirc;ng việc l&agrave;m th&ecirc;m&hellip;</p>

<p>C&aacute;c chương tr&igrave;nh học tại Đ&agrave;i Loan bao gồm: học tiếng Hoa, Đại học, Thạc sỹ v&agrave; Tiến sỹ. Ng&agrave;nh học đa dạng từ kinh doanh, kỹ thuật đến văn h&oacute;a, nghệ thuật. Ng&ocirc;n ngữ đ&agrave;o tạo bằng Tiếng Anh hoặc tiếng Hoa.</p>

<p>Học ph&iacute; học tiếng dao động từ&nbsp;<strong>750 &ndash; 1.000 USD</strong>&nbsp;cho 1 kh&oacute;a học (3 th&aacute;ng). Học ph&iacute; Đại học v&agrave; Sau đại học từ&nbsp;<strong>3.500 &ndash; 4.500 USD</strong>&nbsp;cho một năm học. Chi ph&iacute; sinh hoạt ở mức tương đối thấp, chỉ khoảng&nbsp;<strong>3.000 &ndash; 4.500 US</strong>D một năm.</p>

<p>Sinh vi&ecirc;n quốc tế c&oacute; thể được&nbsp;miễn giảm từ&nbsp;<strong>50 &ndash; 100%</strong>&nbsp;học ph&iacute;, ph&iacute; k&yacute; t&uacute;c x&aacute;, được trợ cấp sinh hoạt h&agrave;ng th&aacute;ng&hellip;nhờ v&agrave;o ch&iacute;nh s&aacute;ch học bổng đa dạng v&agrave; hấp dẫn từ c&aacute;c trường Đại học tại Đ&agrave;i Loan.</p>

<h2><strong>II.CHƯƠNG TR&Igrave;NH HỌC BỔNG Đ&Agrave;I LOAN</strong></h2>

<ol>
	<li>
	<h3><strong>Chế độ học bổng:</strong></h3>
	</li>
</ol>

<p><strong><em><u>Hệ Đại học:</u></em></strong></p>

<p>Học bổng đầu v&agrave;o: 100% học ph&iacute; cho năm học đầu ti&ecirc;n.<br />
Sau năm thứ nhất, sinh vi&ecirc;n c&oacute; thể xin học bổng cho c&aacute;c năm tiếp theo dựa v&agrave;o th&agrave;nh t&iacute;ch c&aacute;c năm học trước<br />
Thời gian nhận học bổng tối đa l&agrave; 4 năm.</p>

<p><strong><em><u>Hệ Thạc sỹ</u></em></strong></p>

<p>Học bổng đầu v&agrave;o:</p>

<p>&ndash; 100% học ph&iacute; cho năm học đầu ti&ecirc;n hoặc cho cả 2 năm.</p>

<p>&ndash; Cơ hội nhận trợ cấp h&agrave;ng th&aacute;ng d&agrave;nh cho sinh vi&ecirc;n kh&aacute;, giỏi.</p>

<p>Sinh &nbsp;vi&ecirc;n c&oacute; thể xin&nbsp;<a href="http://minhhoangan.edu.vn/">học bổng</a>&nbsp;cho năm thứ 2 dựa v&agrave;o th&agrave;nh t&iacute;ch học của năm thứ 1. Thời gian nhận học bổng tối đa l&agrave; 2 năm.</p>

<p><strong><em><u>Hệ Tiến sỹ:</u></em></strong></p>

<p>100% học ph&iacute; cho tối đa 3 năm hoặc trợ cấp mỗi th&aacute;ng tối đa l&agrave; 2 năm</p>

<p>Học bổng đầu v&agrave;o:</p>

<p>Loại 1: 100% học ph&iacute; cho năm học đầu ti&ecirc;n + k&yacute; t&uacute;c x&aacute;</p>

<p>Loại 2: 100% học ph&iacute; cho năm đầu ti&ecirc;n</p>

<p>Loại 3: 50% học ph&iacute; cho năm đầu ti&ecirc;n</p>

<ul>
	<li>C&oacute; cơ hội nhận trợ cấp h&agrave;ng th&aacute;ng d&agrave;nh cho sinh vi&ecirc;n kh&aacute;, giỏi.</li>
</ul>

<p>Sinh vi&ecirc;n c&oacute; thể xin học bổng cho năm thứ 2 dựa v&agrave;o th&agrave;nh t&iacute;ch học của năm thứ 1. Thời gian nhận học bổng tối đa l&agrave; 2 năm.</p>

<ol start="2">
	<li>
	<h3><strong>Điều kiện xin học bổng:</strong></h3>
	</li>
</ol>

<p>&ndash; Tốt nghiệp PTTH, ĐH, Thạc sỹ loại kh&aacute;, giỏi: học lực 7.0 trở l&ecirc;n (t&ugrave;y theo điều kiện của mỗi trường)</p>

<p>&ndash; C&oacute; chứng chứng chỉ IELTS từ 5.5, TOEFL iBT 65, TOEIC từ 700 trở l&ecirc;n nếu học bằng tiếng Anh</p>

<p>&ndash; Chứng chỉ TOCFL cấp độ 3, 4 hoặc tương đương t&ugrave;y theo ng&agrave;nh học v&agrave; điều kiện đầu v&agrave;o của từng trường nếu học bằng tiếng Hoa<strong>.</strong></p>

<p><a href="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/07/dl.jpg"><img alt="Học bổng Đài Loan" src="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/07/dl.jpg?resize=600%2C398" style="height:398px; width:600px" /></a></p>

<p>Học bổng Đ&agrave;i Loan</p>

<ol start="3">
	<li>
	<h3><strong>Ti&ecirc;u ch&iacute; đ&aacute;nh gi&aacute;:</strong></h3>
	</li>
</ol>

<p>Chủ yếu dựa v&agrave;o:<br />
(1) Kế hoạch học tập (2) Th&agrave;nh t&iacute;ch học tập (3) Năng lực ngoại ngữ<br />
(4) Thư giới thiệu&nbsp;&nbsp;(5) Khả năng thể hiện khi phỏng vấn</p>

<ol start="4">
	<li>
	<h3><strong>Kỳ nhập học v&agrave; hạn nhận hồ sơ</strong></h3>
	</li>
</ol>

<p>&ndash; Khai giảng: Th&aacute;ng 2/2019<br />
&ndash; Hạn ch&oacute;t nhận hồ sơ:&nbsp;30/09/2018 (Đợt 1)</p>

<ol start="5">
	<li>
	<h3><strong>C&aacute;c giấy tờ cần thiết khi xin&nbsp;học bổng</strong></h3>
	</li>
</ol>

<p>Người xin&nbsp;<a href="http://minhhoangan.edu.vn/">học bổng</a>&nbsp;cần chuẩn bị những giấy tờ sau:<br />
&ndash; Hộ chiếu c&ograve;n hiệu lực<br />
&ndash; Ảnh 3&times;4 v&agrave; 4&times;6<br />
&ndash; Học bạ &amp; bằng cấp cao nhất<br />
&ndash; Chứng chỉ năng lực ngoại ngữ:</p>

<p>Sinh vi&ecirc;n học chương tr&igrave;nh tiếng Hoa phải nộp chứng chỉ v&agrave; bảng điểm Năng lực Hoa ngữ TOCFL cấp 3 trở l&ecirc;n (kh&ocirc;ng chấp nhận chứng chỉ HSK)</p>

<p>Sinh vi&ecirc;n học chương tr&igrave;nh tiếng Anh, phải nộp chứng chỉ tiếng Anh TOEIC 700 điểm trở l&ecirc;n, IELTS 5.5 trở l&ecirc;n, TOEFL (pBT) 500 điểm hoặc TOEFL (iBT) 60 điểm trở l&ecirc;n, hoặc chứng chỉ tiếng Anh kh&aacute;c tương đương.</p>

<p>&ndash; L&yacute; lịch tư ph&aacute;p (đối với học sinh khu vực ph&iacute;a Bắc)<br />
&ndash; 02 thư giới thiệu của giảng vi&ecirc;n hoặc l&atilde;nh đạo nơi đang c&ocirc;ng t&aacute;c<br />
&ndash; Kế hoạch học tập</p>

<p>&nbsp;</p>

<p><strong>HỖ TRỢ TỪ TRUNG T&Acirc;M TƯ VẤN DU HỌC MINH HO&Agrave;NG AN</strong></p>

<p>Sinh vi&ecirc;n khi l&agrave;m hồ sơ tại Minh Ho&agrave;ng An sẽ được cam kết hỗ trợ:</p>

<p>&ndash; Tư vấn trường, ng&agrave;nh ph&ugrave; hợp.</p>

<p>&ndash; Ho&agrave;n tất thủ tục, hồ sơ xin thư mời nhập học.</p>

<p>&ndash; Ho&agrave;n thiện hồ sơ một c&aacute;ch tối ưu nhất gi&uacute;p xin học bổng mức cao nhất. Đảm bảo xin học bổng th&agrave;nh c&ocirc;ng đối với những hồ sơ đủ điều kiện.</p>

<p>&ndash; Hướng dẫn chứng minh t&agrave;i ch&iacute;nh v&agrave; ho&agrave;n tất thủ tục hồ sơ xin visa.</p>

<p>&ndash; Hướng dẫn trả lời phỏng vấn.</p>

<p>&ndash; Sắp xếp chỗ ở k&yacute; t&uacute;c x&aacute;, đ&oacute;n s&acirc;n bay tại Đ&agrave;i Loan.</p>

<p>&ndash; Hỗ trợ học sinh trong suốt qu&aacute; tr&igrave;nh học tại Đ&agrave;i Loan.</p>

<p>&ndash; Hỗ trợ phụ huynh trong việc l&agrave;m thủ tục đi thăm con em m&igrave;nh (nếu c&oacute; nguyện vọng).</p>

<p>&ndash; Nhiều chương tr&igrave;nh ưu đ&atilde;i hấp dẫn trong năm: Tặng ba l&ocirc;&nbsp;<a href="http://minhhoangan.edu.vn/">du học</a>, hỗ trợ ph&iacute; visa, tặng v&eacute; m&aacute;y bay v.v.</p>
', N'/Uploads/images/Du%20hoc%20Dai%20Loan/dl.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Dai%20Loan/dl.jpg', 1, 1, 1, 25, CAST(N'2018-07-04 21:55:56.2444010' AS DateTime2), CAST(N'2018-07-04 21:55:56.2444010' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (27, 1, 4, N'NHẬN HỌC BỔNG LẤY BẰNG CỬ NHÂN CHỈ 2 NĂM TẠI TRƯỜNG ĐẠI HỌC Ở ĐÀI NAM', N'KHOA ĐIỆN ĐIỆN TỬ – TỰ ĐỘNG HÓA

CHƯƠNG TRÌNH HỢP TÁC GIỮA TRƯỜNG VÀ DOANH NGHIỆP DÀNH CHO SINH VIÊN QUỐC TẾ', N'<p>Thời gian đ&agrave;o tạo bậc Cử nh&acirc;n: 2 năm (bao gồm 18 t&iacute;n chỉ thực h&agrave;nh v&agrave; 24 t&iacute;n chỉ thực tập)</p>

<p><strong><em>Học bổng: 100% học ph&iacute;, miễn ph&iacute; k&yacute; t&uacute;c x&aacute;, trợ cấp 5,000 NTD/th&aacute;ng</em></strong></p>

<p><a href="https://i1.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2017/06/07Mar2016010359Taiwan.jpg"><img alt="" src="https://i1.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2017/06/07Mar2016010359Taiwan.jpg?resize=600%2C402" style="height:402px; width:600px" /></a></p>

<p>Sinh vi&ecirc;n sẽ c&oacute; cơ hội học tập 1 năm tại 1 trong những Đại học khoa học kỹ thuật top đầu của Đ&agrave;i Loan v&agrave; được thực tập 1 năm tại doanh nghiệp với những trang thiết bị v&agrave; nền khoa học kỹ thuật ti&ecirc;n tiến nhất tại Đ&agrave;i Loan. Trong suốt thời gian thực tập, sinh vi&ecirc;n sẽ được hỗ trợ chỗ ở v&agrave; ăn uống c&ugrave;ng với trợ cấp đ&agrave;o tạo tương đương 5,000 NTD/th&aacute;ng.</p>

<p>Đối tượng tuyển sinh: Sinh vi&ecirc;n đ&atilde; tốt nghiệp từ c&aacute;c trường trung cấp nghề hoặc cao đẳng nghề, hoặc tương đương.</p>

<p>Y&ecirc;u cầu tiếng Anh tối thiểu: IELTS 4.5, TOEIC 500 hoặc tương đương</p>

<p><u>Hồ sơ bao gồm:</u></p>

<ul>
	<li>Bằng tốt nghiệp trung cấp nghề hoặc cao đẳng nghề</li>
	<li>Bảng điểm</li>
	<li>Chứng chỉ tiếng Anh</li>
	<li>C&aacute;c bằng khen, giấy khen, chứng chỉ kh&aacute;c&hellip;(nếu c&oacute;)</li>
	<li>Hộ chiếu</li>
	<li>H&igrave;nh 4&times;6 ph&ocirc;ng trắng khổ quốc tế</li>
</ul>

<p>Hạn nộp hồ sơ: 15/07/2017</p>
', N'/Uploads/images/Du%20hoc%20Dai%20Loan/07Mar2016010359Taiwan.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Dai%20Loan/07Mar2016010359Taiwan.jpg', 1, 1, 1, 45, CAST(N'2018-07-04 21:56:47.2071296' AS DateTime2), CAST(N'2018-07-04 21:56:47.2071296' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (28, 1, 4, N'10 ĐIỀU BẠN CẦN BIẾT TRƯỚC KHI DU HỌC ĐÀI LOAN', N'Hiện nay du học Đài Loan đang trở thành cơn sốt được nhiều bạn trẻ quan tâm. Bên cạnh số lượng học sinh du học Đài Loan ngày một tăng cao thì cũng có không ít bạn trẻ vẫn đang băn khoăn về chất lượng giáo dục, môi trường học tập, cơ hội việc làm, mức học phí,…tại đất nước được mệnh danh là con rồng Châu Á này.

Hãy cùng Minh Hoàng An giải đáp tất cả những băn khoăn cũng như lý giải vì sao Đài Loan lại là một điểm đến đầy thu hút đến vậy nhé!', N'<ol>
	<li>
	<h2><strong>Chất lượng gi&aacute;o dục cao</strong></h2>
	</li>
</ol>

<p>Gi&aacute;o dục Đ&agrave;i Loan được đ&aacute;nh gi&aacute; l&agrave; một trong những nền gi&aacute;o dục chất lượng cao của ch&acirc;u &Aacute;.</p>

<p>C&aacute;c trường đại học ở Đ&agrave;i Loan, đặc biệt c&aacute;c trường h&agrave;ng đầu, c&oacute; vị tr&iacute; kh&ocirc;ng hề khi&ecirc;m tốn trong khu vực v&agrave; tr&ecirc;n thế giới. Đ&agrave;i Loan đ&atilde; g&oacute;p mặt 4 trường đ&oacute; l&agrave; National Taiwan University, National Cheng Kung University, National Tsing Hua University, National Chiao Tung University trong top 100 trường đại học tốt nhất thế giới. Ch&iacute;nh phủ lu&ocirc;n ch&uacute; trọng v&agrave; c&oacute; những ch&iacute;nh s&aacute;ch tốt để ng&agrave;nh gi&aacute;o dục ph&aacute;t triển. Theo đ&aacute;nh gi&aacute; của một số tổ chức uy t&iacute;n, gi&aacute;o dục Đ&agrave;i Loan đ&atilde; đạt ti&ecirc;u chuẩn quốc tế. Nền văn ho&aacute; Trung Hoa v&agrave; nền văn ho&aacute; bản địa đ&atilde; ho&agrave; quyện lẫn nhau v&agrave; đạt đến ngưỡng gi&aacute; trị cao nhất trong gi&aacute;o dục. Truyền thống đề cao việc học tập đ&atilde; được gieo mầm v&agrave; ph&aacute;t triển đến tận ng&agrave;y nay.</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t1.jpg"><img alt="Du Học Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t1.jpg?resize=600%2C414" style="height:414px; width:600px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<p>V&igrave; vậy, đến với nền gi&aacute;o dục chất lượng cao ng&agrave;y, học lực của c&aacute;c bạn sẽ kh&ocirc;ng c&ograve;n được &ldquo;thấp&rdquo; như trước đ&acirc;y nữa.</p>

<ol start="2">
	<li>
	<h2><strong>Chuy&ecirc;n ng&agrave;nh đa dạng, phong ph&uacute;</strong></h2>
	</li>
</ol>

<p>Đ&agrave;i Loan c&oacute; đầy đủ c&aacute;c ng&agrave;nh học ở mọi lĩnh vực như: Khoa c&ocirc;ng nghệ sinh học, Ứng dụng &amp; quản l&yacute; mỹ phẩm, Quản l&yacute; ăn uống &ndash; quản trị kinh doanh, Quản trị doanh nghiệp, Quản l&yacute; du lịch &amp; giải tr&iacute;, Quản trị th&ocirc;ng tin, chăm s&oacute;c sức khỏe, khoa hộ l&yacute;, khoa điều dưỡng &hellip;..vv điện c&ocirc;ng tr&igrave;nh, sức khỏe &amp; giải tr&iacute;&hellip;vv</p>

<p>T&ugrave;y theo năng lực, khả năng t&agrave;i ch&iacute;nh, ng&agrave;nh nghề quan t&acirc;m m&agrave; c&aacute;c bạn đưa ra lựa chọn cho m&igrave;nh.</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t3.png"><img alt="Du Học Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t3.png?resize=577%2C339" style="height:339px; width:577px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<ol start="3">
	<li>
	<h2><strong>M&ocirc;i trường học tập v&agrave; sinh sống</strong></h2>
	</li>
</ol>

<p>M&ocirc;i trường ở đ&acirc;y rất tốt cho sinh vi&ecirc;n học tập v&agrave; sinh sống, l&agrave;m cho bạn muốn gắn b&oacute; l&acirc;u d&agrave;i với nơi đ&acirc;y m&agrave; kh&ocirc;ng muốn về nh&agrave;.</p>

<p>C&aacute;c trường đại học Đ&agrave;i Loan đều được đầu tư b&agrave;i bản từ cơ sở vật chất đến chất lượng giảng dạy v&agrave; kh&aacute; đồng đều ở c&aacute;c trường. C&aacute;c khu giảng đường,nơi nghi&ecirc;n cứu thực tập đều được trang bị đầy đủ tiện &iacute;ch để phục vụ qu&aacute; tr&igrave;nh học tập của sinh vi&ecirc;n. Khu&ocirc;n vi&ecirc;n c&aacute;c trường đại học cũng rất sạch sẽ, đẹp đẽ, an to&agrave;n. K&iacute; t&uacute;c x&aacute; tiện nghi v&agrave; thoải m&aacute;i. Đặc biệt, người d&acirc;n Đ&agrave;i Loan c&ograve;n rất th&acirc;n thiện v&agrave; nhiệt t&igrave;nh. Kh&iacute; hậu cũng gần giống với Việt Nam.</p>

<ol start="4">
	<li>
	<h2><strong>Cơ hội l&agrave;m th&ecirc;m khi du học Đ&agrave;i Loan</strong></h2>
	</li>
</ol>

<p>Sinh vi&ecirc;n sẽ kh&ocirc;ng &ldquo;được&rdquo; nh&agrave;n rỗi qu&aacute; v&igrave; c&oacute; rất nhiều cơ hội l&agrave;m th&ecirc;m. J</p>

<p>Cơ hội l&agrave;m th&ecirc;m d&agrave;nh cho c&aacute;c du học sinh nước ngo&agrave;i tại Đ&agrave;i Loan với mức thu nhập cao m&agrave; kh&ocirc;ng qu&aacute; vất vả. Sinh vi&ecirc;n được ph&eacute;p đi l&agrave;m th&ecirc;m với thu nhập từ 800 &ndash; 1000 USD/th&aacute;ng đủ để chi trả c&aacute;c khoản ph&iacute; học tập v&agrave; sinh hoạt tại Đ&agrave;i Loan.</p>

<p>C&aacute;c trường đại học tại Đ&agrave;i Loan c&oacute; nhiều ch&iacute;nh s&aacute;ch kết hợp với c&aacute;c c&ocirc;ng ty, tập đo&agrave;n hỗ trợ t&igrave;m việc l&agrave;m th&ecirc;m ph&ugrave; hợp cho sinh vi&ecirc;n.</p>

<p>Sinh vi&ecirc;n c&oacute; thể l&agrave;m c&aacute;c c&ocirc;ng việc part-time trong c&aacute;c nh&agrave; h&agrave;ng, kh&aacute;ch sạn, khu vui chơi hoặc phi&ecirc;n dịch vi&ecirc;n&hellip;</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t4.jpg"><img alt="Du Học Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t4.jpg?resize=600%2C396" style="height:396px; width:600px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<p>Việc l&agrave;m th&ecirc;m ở Đ&agrave;i Loan c&oacute; thể gi&uacute;p cho du học sinh vừa tiết kiệm chi ph&iacute;, trang trải cuộc sống. . Hơn nữa, cũng c&oacute; rất nhiều cơ hội học tập, trải nghiệm việc l&agrave;m ở một nơi kh&aacute; ph&aacute;t triển như Đ&agrave;i Loan. Đồng thời, gi&uacute;p c&aacute;c bạn du học sinh trau dồi ng&ocirc;n ngữ, học hỏi văn h&oacute;a. Rất nhiều sinh vi&ecirc;n du học Đ&agrave;i loan muốn t&igrave;m việc l&agrave;m th&ecirc;m để c&oacute; thể du lịch, về thăm gia đ&igrave;nh.</p>

<ol start="5">
	<li>
	<h2><strong>Cơ hội việc l&agrave;m sau tốt nghiệp</strong></h2>
	</li>
</ol>

<p>Bạn sẽ &ldquo;kh&oacute;&rdquo; m&agrave; thất nghiệp sau khi ho&agrave;n th&agrave;nh chương tr&igrave;nh học tập nơi đ&acirc;y J</p>

<p>Khi du học ở Đ&agrave;i Loan, bạn c&oacute; thể chọn học bằng tiếng Anh hoặc tiếng phổ th&ocirc;ng Trung Quốc, hai ng&ocirc;n ngữ được sử dụng nhiều nhất tr&ecirc;n thế giới.</p>

<p>Khi tốt nghiệp Đại học, ngo&agrave;i tấm bằng Đại Học c&oacute; gi&aacute; trị, bạn c&ograve;n n&oacute;i th&agrave;nh thạo &iacute;t nhất l&agrave; một trong hai ngoại ngữ đ&oacute;, v&igrave; vậy d&ugrave; bạn chọn trở về Việt Nam l&agrave;m việc hay xin việc l&agrave;m tại đ&acirc;u, bạn cũng c&oacute; cơ hội c&oacute; việc l&agrave;m với thu nhập cao, cơ hội thăng tiến lớn.</p>

<ol start="6">
	<li>
	<h2><strong>Cảnh quan thu h&uacute;t</strong></h2>
	</li>
</ol>

<p>C&oacute; thể bạn sẽ bị m&ecirc; hoặc bởi cảnh quan Đ&agrave;i Loan</p>

<p>Đ&agrave;i Loan tuy nhỏ m&agrave; đẹp. Từ th&agrave;nh phố tới n&ocirc;ng th&ocirc;n, n&uacute;i cao tới biển lớn, thung lũng tới đầm hồ&hellip; mỗi nơi đều mang những n&eacute;t ri&ecirc;ng th&uacute; vị, rất đ&aacute;ng để đi đến v&agrave; cảm nhận.</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t5.jpg"><img alt="Du Học Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t5.jpg?resize=600%2C401" style="height:401px; width:600px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<ul>
	<li>Hồ Nhật Nguyệt</li>
	<li>C&ocirc;ng vi&ecirc;n quốc gia Taroko</li>
	<li>Đ&agrave;i tưởng niệm T&ocirc;n Trung Sơn (Sun Yan-Sen)</li>
	<li>N&uacute;i Yangming</li>
	<li>Th&aacute;p Taipei 101</li>
</ul>

<ol start="7">
	<li>
	<h2><strong>Kinh tế ph&aacute;t triển, chất lượng cuộc sống cao</strong></h2>
	</li>
</ol>

<p>Kinh tế Đ&agrave;i Loan l&agrave; một điểm khiến cho nhiều nước trầm trồ ngưỡng mộ. S&aacute;nh vai với c&aacute;c &ldquo;con rồng&rdquo; kh&aacute;c của Ch&acirc;u &Aacute; như Singapore, Nam H&agrave;n, Hong Kong, Đ&agrave;i Loan vươn l&ecirc;n từ một h&ograve;n đảo ngh&egrave;o kh&oacute; trở th&agrave;nh một trung t&acirc;m thương mại v&agrave; c&ocirc;ng nghệ cao ở Ch&acirc;u &Aacute;. GDP hằng năm của v&ugrave;ng l&atilde;nh thổ n&agrave;y đạt được l&ecirc;n tới gần 500 tỷ USD, GDP b&igrave;nh qu&acirc;n đầu người thực tế đạt gần 40,000 USD (ngang h&agrave;ng với c&aacute;c nước EU),&hellip; tất cả tạo n&ecirc;n một bức tranh kinh tế cực kỳ ph&aacute;t triển, vững chắc. Ng&agrave;nh c&ocirc;ng nghệ nổi tiếng nhất Đ&agrave;i Loan l&agrave; ng&agrave;nh sản xuất m&aacute;y vi t&iacute;nh v&agrave; c&aacute;c phụ kiện. Ngo&agrave;i ra c&ograve;n rất nhiều ng&agrave;nh kỹ thuật, sản xuất kh&aacute;c nổi tiếng thế giới. Đến với Đ&agrave;i Loan, sinh vi&ecirc;n sẽ được h&ograve;a nhập v&agrave;o nền kinh tế hiện đại, nền kinh tế c&ocirc;ng nghệ v&agrave; tri thức, nhộn nhịp, s&ocirc;i động v&agrave; to&agrave;n cầu.</p>

<p>Sống trong nền kinh tế ph&aacute;t triển, bạn sẽ c&oacute; chất lượng sống thật văn minh.</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t6.jpg"><img alt="Du Học Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t6.jpg?resize=600%2C316" style="height:316px; width:600px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<ol start="8">
	<li>
	<h2><strong>Học ph&iacute; rẻ</strong></h2>
	</li>
</ol>

<p>Những bậc phụ huynh sẽ kh&ocirc;ng c&oacute; &ldquo;cơ hội&rdquo; lo lắng về học ph&iacute; cho con c&aacute;i m&igrave;nh. Bởi v&igrave; n&oacute; rất rẻ so với những nơi kh&aacute;c.</p>

<p>Học ph&iacute; Đại học v&agrave; dự bị tiếng tại c&aacute;c trường Đại học tại Đ&agrave;i Loan c&oacute; thể n&oacute;i l&agrave; thấp hơn nhiều lần so với c&aacute;c nước như: Singapore, Nhật Bản, H&agrave;n Quốc&hellip;chỉ khoảng 3.000 đến 3.500 USD/năm. Bạn kh&ocirc;ng cần phải nộp học ph&iacute; cho một năm lu&ocirc;n m&agrave; bạn c&oacute; thể nộp theo k&igrave; học (3 th&aacute;ng một lần) n&ecirc;n số tiền bạn phải chuẩn bị ban đầu l&agrave; rất &iacute;t. V&igrave; vậy vấn đề học ph&iacute; l&agrave; kh&ocirc;ng đ&aacute;ng lo ngại.</p>

<ol start="9">
	<li>
	<h2>Thủ tục hồ sơ du học</h2>
	</li>
</ol>

<p>Thủ tục được ho&agrave;n nhanh một c&aacute;ch nhanh ch&oacute;ng, bạn sẽ phải xa qu&ecirc; hương sớm th&ocirc;i.&nbsp;<img alt="😀" src="https://s.w.org/images/core/emoji/2.3/svg/1f600.svg" /></p>

<p>Thủ tục l&agrave;m hồ sơ du học rất đơn giản v&agrave; dễ d&agrave;ng: chỉ cần chuẩn bị những giấy tờ cần thiết v&agrave; l&agrave;m thủ tục theo c&aacute;c bước được y&ecirc;u cầu. Tất cả c&aacute;c thủ tục du học sẽ chỉ cần 4 tuần để ho&agrave;n tất.</p>

<ol start="10">
	<li>
	<h2>Cơ hội cải thiện song ngữ</h2>
	</li>
</ol>

<p>Khi học tập nơi đ&acirc;y, bạn sẽ &ldquo;bị&rdquo; giỏi &iacute;t nhất 2 ngoại ngữ J</p>

<p>Với những ai đ&atilde; biết tiếng Trung, Đ&agrave;i Loan sẽ l&agrave; một nơi học tập l&yacute; tưởng gi&uacute;p trau dồi v&agrave; n&acirc;ng cao học thức lẫn khả năng giao tiếp. Cơ hội sử dụng tiếng Trung với người bản địa kh&ocirc;ng những cải thiện tr&igrave;nh độ ngoại ngữ m&agrave; c&ograve;n gi&uacute;p ch&uacute;ng ta hiểu hơn về văn h&oacute;a v&agrave; con người nước bạn.</p>

<p><a href="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t7.jpg"><img alt="Du Học Đài Loan" src="https://i0.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/06/t7.jpg?resize=600%2C338" style="height:338px; width:600px" /></a></p>

<p>Du Học Đ&agrave;i Loan</p>

<p>Nếu kh&ocirc;ng, bạn c&oacute; thể chọn chuy&ecirc;n ng&agrave;nh được giảng dạy bằng tiếng Anh đồng thời kết hợp tham gia kh&oacute;a ngoại ngữ tiếng Trung giao tiếp được cấp bởi nh&agrave; trường. Với m&ocirc;i trường sinh hoạt v&agrave; giao tiếp tự nhi&ecirc;n, cơ hội n&acirc;ng cao cả hai ngoai ngữ dĩ nhi&ecirc;n sẽ dễ d&agrave;ng hơn với bạn</p>
', N'/Uploads/images/Du%20hoc%20Dai%20Loan/t5.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Dai%20Loan/t5.jpg', 1, 1, 1, 65, CAST(N'2018-07-04 21:57:53.6589995' AS DateTime2), CAST(N'2018-07-04 21:57:53.6589995' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (29, 1, 4, N'DU HỌC NGÀNH Y TẠI ĐÀI LOAN NĂM 2019', N'Du học ngành Y tại Đài Loan đang được các bạn trẻ và các bậc phụ huynh quan tâm, đồng thời đang là lựa chọn nằm trong danh sách ưu tiên bởi: học phí thấp, giảng viên có trình độ chuyên môn cao, được đi thực tập ngay từ sớm, cơ hội việc làm cao đặc biệt sinh viên được phép đi làm thêm với mức thu nhập đáng kể.', N'<h2><strong>I. Giới thiệu chung:</strong></h2>

<p><a href="http://www.duhocdailoan.net.vn/">Đ&agrave;i Loan</a>&nbsp;l&agrave; một trong những quốc gia Ch&acirc;u &Aacute; được đ&aacute;nh gi&aacute; cao trong lĩnh vực y học, du học Đ&agrave;i Loan ng&agrave;nh y dần trở th&agrave;nh sự lựa chọn h&agrave;ng đầu với những du học sinh muốn theo học ng&agrave;nh Y với những c&aacute;i t&ecirc;n h&agrave;ng đầu như Đại học Y Đ&agrave;i Bắc, Đại học Y Cao H&ugrave;ng, Đại học Chang Gung,&hellip;Với thời gian đ&agrave;o tạo 4&nbsp; đến 6 năm d&agrave;nh cho bậc cử nh&acirc;n v&agrave; 1 &ndash; 7 năm d&agrave;nh cho chương tr&igrave;nh sau đại học, du học Đ&agrave;i Loan ng&agrave;nh y mang đến cho người học đa dạng v&agrave; phong ph&uacute; những chuy&ecirc;n ng&agrave;nh để lựa chọn. Ch&iacute;nh v&igrave; vậy, du học ng&agrave;nh Y tại Đ&agrave;i ng&agrave;y c&agrave;ng được c&aacute;c sinh vi&ecirc;n quốc tế, đặc biết l&agrave; sinh vi&ecirc;n Việt Nam chọn lựa nhiều với c&aacute;c ưu điểm như:</p>

<ul>
	<li>Nhiều cơ hội học bổng cho sinh vi&ecirc;n quốc tế.</li>
	<li>Bằng cấp của c&aacute;c trường đại học Đ&agrave;i Loan được c&aacute;c nước ph&aacute;t triển c&ocirc;ng nhận, chất lượng gi&aacute;o dục đạt ti&ecirc;u chuẩn Quốc tế.</li>
	<li>Đ&agrave;i Loan tuy nhỏ nhưng ph&aacute;t triển, c&oacute; nhiều trường Đại học lớn, thậm ch&iacute; c&oacute; trường nằm trong Top 100 trường Đại học tốt nhất to&agrave;n cầu.</li>
	<li>Sinh vi&ecirc;n c&oacute; thể học bằng tiếng Trung hoặc tiếng Anh.</li>
	<li>Điều kiện sống v&agrave; học tập rất l&agrave;nh mạnh v&agrave; đầy đủ. K&yacute; t&uacute;c x&aacute; trong trường c&oacute; đủ chỗ cho phần lớn sinh vi&ecirc;n. Khu&ocirc;n vi&ecirc;n c&aacute;c trường rộng r&atilde;i, sạch đẹp. Một m&ocirc;i trường l&yacute; tưởng cho học sinh học tập tốt. Chi ph&iacute; sinh hoạt trong khu&ocirc;n vi&ecirc;n trường rẻ hơn ở ngo&agrave;i.</li>
	<li>Du học ng&agrave;nh Y tại Đ&agrave;i Loan với chi ph&iacute; kh&ocirc;ng cao, ph&ugrave; hợp với du học sinh Việt Nam. Gi&aacute; cả sinh hoạt kh&ocirc;ng đắt hơn ở Việt Nam nếu t&iacute;nh đến chất lượng h&agrave;ng h&oacute;a v&agrave; dịch vụ. Kh&iacute; hậu cũng kh&aacute; tương đồng Việt Nam.</li>
	<li>Sinh vi&ecirc;n được ph&eacute;p đi l&agrave;m th&ecirc;m với thu nhập từ&nbsp;<strong>800 &ndash; 1,000 USD/th&aacute;ng</strong>&nbsp;đủ để chi trả c&aacute;c khoản ph&iacute; học tập v&agrave; sinh hoạt tại Đ&agrave;i Loan.</li>
</ul>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/05/medicine2.png"><img alt="Du học ngành Y tại Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/05/medicine2.png?resize=600%2C375" style="height:375px; width:600px" /></a></p>

<p>Du học ng&agrave;nh Y tại Đ&agrave;i Loan</p>

<h2><strong>II. Ng&agrave;nh học:</strong></h2>

<p><strong>+ Ng&agrave;nh Y Khoa:</strong>&nbsp;Thời gian đ&agrave;o tạo l&agrave; 6 năm, danh hiệu l&agrave; B&aacute;c sỹ &ndash; Doctor of Medicine.</p>

<p><strong>+ Ng&agrave;nh Nha khoa:</strong>&nbsp;Thời gian đ&agrave;o tạo 6 năm, danh hiệu B&aacute;c sỹ&nbsp;phẫu thuật Nha Khoa&nbsp;&ndash; Doctor of Dental Surgery.</p>

<p><strong>+ C&aacute;c chuy&ecirc;n ng&agrave;nh kh&aacute;c như</strong>: Dược,&nbsp;C&ocirc;ng nghệ sinh học v&agrave; khoa học th&iacute; nghiệm, điều dưỡng, khoa học sức khỏe v&agrave; dinh dưỡng, sức khỏe c&ocirc;ng cộng, Quản l&yacute; chăm s&oacute;c sức khỏe, c&ocirc;ng nghệ nha khoa, vệ sinh răng miệng, quản trị bệnh viện, chăm s&oacute;c sức khỏe. .v. v.. Thời gian đ&agrave;o tạo sẽ l&agrave; 4 năm.</p>

<h2><strong>III. Điều kiện đăng k&yacute;:</strong></h2>

<p>+ Điểm trung b&igrave;nh&nbsp;l&agrave; từ&nbsp;<strong>80/100 hoặc 3.0 /4.0</strong>, trong đ&oacute; điểm c&aacute;c m&ocirc;n&nbsp;<strong>To&aacute;n, Sinh học, H&oacute;a, Vật l&yacute;</strong>&nbsp;phải đạt đủ từ &nbsp;<strong>80/100 hoặc 3.0/4.0.</strong></p>

<p>+ C&oacute; chứng chỉ tiếng Hoa&nbsp;<strong>TOCFL cấp 3</strong>&nbsp;trở l&ecirc;n hoặc&nbsp;<strong>HSK cấp 5</strong>. Một số trường y&ecirc;u cầu th&ecirc;m chứng chỉ Tiếng Anh<strong>&nbsp;IELTS 5.0, hoặc TOEIC 600, TOEFL</strong>, SAT (t&ugrave;y trường).</p>

<p>+ Trường sẽ y&ecirc;u cầu phỏng vấn qua điện thoại hoặc SKYPE (nếu cần)</p>

<p><a href="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/05/medicine3.jpg"><img alt="Du học ngành Y tại Đài Loan" src="https://i2.wp.com/www.duhocdailoan.net.vn/wp-content/uploads/2018/05/medicine3.jpg?resize=600%2C452" style="height:452px; width:600px" /></a></p>

<p>Du học ng&agrave;nh Y tại Đ&agrave;i Loan</p>

<h2><strong>IV. Học ph&iacute;:</strong></h2>

<p>Mức học Ph&iacute; l&agrave; từ 50,000 đến 70,000 NTD / học kỳ.</p>

<h2><strong>V. Danh s&aacute;ch một số trường đ&agrave;o tạo ng&agrave;nh y tại Đ&agrave;i Loan:</strong></h2>

<p>+ Taipei Medical University</p>

<p>+ Kaohsiung Medical University</p>

<p>+ National Cheng Kung University</p>

<p>+ China Medical University</p>

<p>+ Hungkuang University</p>

<p>+ National Yang-Ming University</p>

<p>+ Chang Gung University</p>
', N'/Uploads/images/Du%20hoc%20Dai%20Loan/medicine2.png', N'/Uploads/_thumbs/images/Du%20hoc%20Dai%20Loan/medicine2.png', 1, 1, 2, 55, CAST(N'2018-07-04 21:58:50.0449073' AS DateTime2), CAST(N'2018-07-04 21:58:50.0449073' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (30, 1, 5, N'TẤT TẦN TẬT THÔNG TIN VỀ DU HỌC CANADA', N'(Du học Canada) - Canada là điểm đến hấp dẫn đối với du học sinh nhiều nước trên thế giới, trong đó có Việt Nam. Qua bài viết dưới đây du học CHD sẽ giới thiệu với bạn mọi thông tin về chương trình du học Canada, để các bạn sinh viên có cái nhìn tổng quát, và có thể lựa chọn cho mình một chương trình phù hợp khi làm hồ sơ du học đến đất nước này.', N'<h1><img alt="" src="https://duhocchd.edu.vn/files/editor/images/du-hoc-canada-1.jpg" /></h1>

<h1><strong>1. T&igrave;m hiểu về Đất nước &ndash; Con người Canada</strong></h1>

<p>Canada l&agrave; thi&ecirc;n đường của người d&acirc;n nhập cư. Bạn c&oacute; thể t&igrave;m thấy hầu hết c&aacute;c sắc tộc sinh sống một c&aacute;ch h&ograve;a b&igrave;nh tại đ&acirc;y. Họ t&ocirc;n trọng c&aacute;c quy tắc chung v&agrave; những kh&aacute;c biệt của mỗi d&acirc;n tộc. Đặc biệt tại c&aacute;c th&agrave;nh phố lớn, sự đa dạng về văn h&oacute;a c&agrave;ng trở n&ecirc;n r&otilde; rệt hơn. Bởi vậy, khi sinh sống v&agrave; học tập tại đ&acirc;y, bạn c&oacute; thể trải nghiệm được rất nhiều nền văn h&oacute;a kh&aacute;c nhau tr&ecirc;n to&agrave;n thế giới.&nbsp;</p>

<p>Người Canada rất th&acirc;n thi&ecirc;n, kh&ocirc;ng c&oacute; g&igrave; ngạc nhi&ecirc;n khi những người kh&ocirc;ng quen biết cười ch&agrave;o bạn tr&ecirc;n đường. Họ cũng c&oacute; tư tưởng kh&aacute; cởi mở khi tiếp nhận những luồng tư tưởng mới v&agrave; học lu&ocirc;n ch&uacute; trọng tới việc ph&aacute;t triển m&ocirc;i trường đa văn h&oacute;a. Nh&igrave;n chung, với đặc điểm l&agrave; một nước phương T&acirc;y, người Canada cũng kh&aacute; thẳng t&iacute;nh khi tranh luận. Họ quan t&acirc;m nhưng vẫn rất t&ocirc;n trọng sự ri&ecirc;ng tư của bạn.</p>

<p>Canada l&agrave; quốc gia c&oacute; kh&iacute; hậu kh&aacute; đa dạng. Ở phần lớn những khu vực c&oacute; d&acirc;n cư sinh sống, Canada c&oacute; 4 m&ugrave;a ri&ecirc;ng biệt. M&ugrave;a h&egrave;, nhiệt độ l&ecirc;n tới 35 độ C hoặc cao hơn. Trong khi đ&oacute;, nhiệt độ hiếm khi xuống tới -15 độ C v&agrave;o m&ugrave;a đ&ocirc;ng.</p>

<p>V&agrave;o m&ugrave;a xu&acirc;n v&agrave; thu, nhiệt độ &ocirc;n h&ograve;a hơn hai m&ugrave;a c&ograve;n lại. Khu vực thảo nguy&ecirc;n v&agrave;o m&ugrave;a h&egrave; thường n&oacute;ng v&agrave; kh&ocirc;, nhưng lại ẩm hơn ở v&ugrave;ng trung nguy&ecirc;n Canada v&agrave; ở v&ugrave;ng duy&ecirc;n hải th&igrave; đặc biệt &ocirc;n h&ograve;a. M&ugrave;a xu&acirc;n l&agrave; m&ugrave;a dễ chịu nhất ở Canada. M&ugrave;a thu ở Canada thường kh&ocirc; v&agrave; lạnh nhưng m&ugrave;a thu được biết đến với l&aacute; c&acirc;y thường chuyển sang m&agrave;u cam v&agrave; đỏ. M&ugrave;a đ&ocirc;ng ở Canada lạnh v&agrave; c&oacute; tuyết rơi, d&ugrave; vậy khu vực nam Alberta thường c&oacute; gi&oacute; thổi từ n&uacute;i Rocky ở v&ugrave;ng T&acirc;y nam nước Mỹ l&agrave;m cho tuyết tan v&agrave; thời tiết dần trở n&ecirc;n ấm.</p>

<blockquote>
<p><strong>Xem th&ecirc;m:&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/nhung-dieu-can-biet-ve-visa-du-hoc-tai-canada-quoc-gia-dang-song-nhat-the-gioi/" target="_blank">Những điều cần biết về Canada - Đất nước đ&aacute;ng sống nhất thế giới</a></strong></p>
</blockquote>

<p><img alt="" src="https://duhocchd.edu.vn/files/editor/images/du-hoc-canada-2.jpg" /></p>

<h1><strong>2. Hệ thống gi&aacute;o dục Canada đạt chất lượng quốc tế</strong></h1>

<p>Canada lu&ocirc;n nằm trong top đầu những nước c&oacute; định hướng đầu tư ph&aacute;t triển&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-he-thong-giao-duc.html" target="_blank">hệ thống gi&aacute;o dục</a>&nbsp;một c&aacute;ch mạnh mẽ, họ ch&uacute; trọng việc đ&agrave;o tạo nguồn nh&acirc;n lực c&oacute; chất lượng chứ kh&ocirc;ng phải l&agrave; số lượng. Ch&iacute;nh v&igrave; vậy m&agrave; trong những năm gần đ&acirc;y, nguồn nh&acirc;n lực của nước n&agrave;y kh&ocirc;ng đủ để đ&aacute;p ứng tốc độ ph&aacute;t triển của quốc gia. Theo t&iacute;nh to&aacute;n của c&aacute;c nh&agrave; kinh tế, cứ tiếp tục như vậy đến năm 2020 th&igrave; nguồn nh&acirc;n lực nội địa Canada chỉ đủ để duy tr&igrave; nền kinh tế kh&ocirc;ng bị suy tho&aacute;i m&agrave; th&ocirc;i.</p>

<p>Để tr&aacute;nh t&igrave;nh trạng ấy v&agrave; thu h&uacute;t nh&acirc;n t&agrave;i từ khắp mọi nơi tr&ecirc;n thế giới đến l&agrave;m việc v&agrave; định cư, ch&iacute;nh phủ Canada đưa ra h&agrave;ng loạt c&aacute;c ch&iacute;nh s&aacute;ch ưu đ&atilde;i d&agrave;nh cho học sinh - sinh vi&ecirc;n quốc tế như:&nbsp;</p>

<p>►&nbsp;Được học tập trong m&ocirc;i trường gi&aacute;o dục lớn, trang thiết bị hiện đại</p>

<p>►&nbsp;Cơ hội d&agrave;nh cực nhiều&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-hoc-bong/cap-nhat-hoc-bong-du-hoc-canada-moi-nhat/" target="_blank">học bổng du học Candada</a>&nbsp;c&oacute; gi&aacute; trị cao</p>

<p>►&nbsp;Được thực tập nhiều trong qu&aacute; tr&igrave;nh học</p>

<p>►&nbsp;C&oacute; cơ hội l&agrave;m th&ecirc;m với thu nhập cao, đủ chi trả sinh hoạt trong thời gian học tập</p>

<p>►&nbsp;Được ph&eacute;p ở lại trong thời gian tối đa 3 năm để xin việc sau khi tốt nghiệp</p>

<p>►&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-visa/dinh-cu-hop-phap-tai-canada-bang-con-duong-du-hoc/" target="_blank">Cơ hội định cư bằng con đường du học Canada</a></p>

<p>►&nbsp;Bố mẹ c&oacute; cơ hội&nbsp;xin visa du lịch dễ d&agrave;ng để sang thăm bạn trong thời gian học tập</p>

<p>►&nbsp;Được học trao đổi với c&aacute;c trường lớn của Anh, Mỹ&hellip;</p>

<p>►&nbsp;Lu&ocirc;n được t&ocirc;n trọng v&agrave; ch&agrave;o đ&oacute;n bởi người d&acirc;n bản xứ.</p>

<p>►&nbsp;Chương tr&igrave;nh gi&aacute;o dục tại Canada chia ra l&agrave;m nhiều cấp bậc, m&agrave; học sinh, sinh vi&ecirc;n Việt Nam lu&ocirc;n t&igrave;m được một chương tr&igrave;nh ph&ugrave; hợp để đăng k&iacute;</p>

<blockquote>
<p><strong>Cập nhật ch&iacute;nh s&aacute;ch nhập cư mới nhất tại 7 bang ở Canada:&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/cap-nhat-chinh-sach-dinh-cu-moi-nhat-tai-7-bang-o-canada/" target="_blank">XEM TẠI Đ&Acirc;Y</a></strong></p>
</blockquote>

<p><img alt="" src="https://duhocchd.edu.vn/files/editor/images/du-hoc-canada-3.jpg" /></p>

<h3><strong><em>2.1 Gi&aacute;o dục Trung học phổ th&ocirc;ng:</em></strong></h3>

<p>►&nbsp;C&aacute;c bạn sinh vi&ecirc;n c&oacute; thể đăng k&iacute; học từ lớp 8. Chương tr&igrave;nh học chủ yếu l&agrave; tiếng Anh v&agrave; c&aacute;c chương tr&igrave;nh ngoại kh&oacute;a để c&oacute; l&agrave;m quen với m&ocirc;i trường học tập b&ecirc;n Canada</p>

<p>►&nbsp;Được trường bảo l&atilde;nh h&agrave;nh ch&iacute;nh v&agrave; lo chỗ ăn ở cho sinh vi&ecirc;n</p>

<p>►&nbsp;C&oacute; xe đưa đ&oacute;n học sinh từ chỗ ở đến nh&agrave; trường</p>

<p>►&nbsp;Được học chung với c&aacute;c bạn sinh vi&ecirc;n quốc tế v&agrave; sinh vi&ecirc;n bản ngữ</p>

<h3><strong><em>2.2 Hệ Cao đẳng</em></strong></h3>

<p>►&nbsp;Chương tr&igrave;nh đ&agrave;o tạo 2 đến 3 năm</p>

<p>►&nbsp;Đ&agrave;o tạo đa dạng ng&agrave;nh nghề</p>

<p>►&nbsp;Chương tr&igrave;nh đ&agrave;o tạo thi&ecirc;n về thực h&agrave;nh, hướng đến đ&agrave;o tạo tay nghề cho sinh vi&ecirc;n, c&oacute; thể bước v&agrave;o nghề lu&ocirc;n sau khi tốt nghiệp</p>

<p>►&nbsp;Sinh vi&ecirc;n c&oacute; cơ hội thực tập nhiều, c&oacute; hưởng lương từ k&igrave; thực tập</p>

<p>►&nbsp;C&oacute; cơ hội học tiếp l&ecirc;n đại học sau khi tốt nghiệp</p>

<p>►&nbsp;Học xong sinh vi&ecirc;n c&oacute; cơ hội ở lại đến 3 năm để xin việc</p>

<p>►&nbsp;Y&ecirc;u cầu: Tốt nghiệp cấp 3 v&agrave; c&oacute; điểm cấp 3 từ 6.0 trở l&ecirc;n, c&oacute; chứng chỉ ielts từ 6.0 hoặc tương đương</p>

<h3><strong><em>2.3 Hệ đại học:</em></strong></h3>

<p>►&nbsp;Chương tr&igrave;nh đ&agrave;o tạo 4 năm</p>

<p>►&nbsp;Đ&agrave;o tạo đa ng&agrave;nh nghề</p>

<p>►&nbsp;Chương tr&igrave;nh đ&agrave;o tạo theo định hướng nghi&ecirc;n cứu c&oacute; t&iacute;nh chuy&ecirc;n s&acirc;u</p>

<p>►&nbsp;C&oacute; nhiều kỳ thực tập c&oacute; trả lương</p>

<p>►&nbsp;Học xong sinh vi&ecirc;n c&oacute; cơ hội ở lại đến 3 năm để xin việc</p>

<p>►&nbsp;C&oacute; cơ hội học l&ecirc;n thạc sỹ sau khi tốt nghiệp</p>

<p>►&nbsp;Y&ecirc;u cầu: Tốt nghiệp cấp 3 hoặc đang l&agrave; sinh vi&ecirc;n đại học ở Việt Nam. Điểm GPA cấp 3 tr&ecirc;n 7.0 v&agrave; c&oacute; IELTS 6.5 hoặc tương đương</p>

<h3><strong><em>2.4&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/co-hoi-viec-lam-rong-mo-voi-chuong-trinh-post-graduate/" target="_blank">Hệ post-graduate:</a></em></strong></h3>

<p>►&nbsp;D&agrave;nh cho c&aacute;c bạn đ&atilde; tốt nghiệp cao đẳng hoặc đại học</p>

<p>►&nbsp;Định hướng thực h&agrave;nh cao để sinh vi&ecirc;n c&oacute; thể l&agrave;m việc ngay sau khi tốt nghiệp</p>

<p>►&nbsp;Sinh vi&ecirc;n c&oacute; cơ hội học l&ecirc;n thạc sỹ sau khi tốt nghiệp</p>

<p>►&nbsp;Y&ecirc;u cầu: Tốt nghiệp đại học hoặc cao đẳng, điểm GPA tr&ecirc;n 6.0 v&agrave; c&oacute; ielts 6.5 hoặc tương đương</p>

<h3><strong><em>2.5 Hệ thống thạc sỹ:</em></strong></h3>

<p>►&nbsp;D&agrave;nh cho c&aacute;c bạn đ&atilde; tốt nghiệp đại học</p>

<p>►&nbsp;Chương tr&igrave;nh định hướng nghi&ecirc;n cứu chuy&ecirc;n s&acirc;u</p>

<p>►&nbsp;Đối với nhiều tỉnh bang th&igrave; bạn c&oacute; bằng thạc sỹ sẽ l&agrave; một điểm cộng trong hồ sơ xin định cư v&agrave; quốc tịch tại Canada</p>

<p>►&nbsp;Cho ph&eacute;p học l&ecirc;n tiến sỹ sau khi tốt nghiệp</p>

<p>►&nbsp;Y&ecirc;u cầu: Tốt nghiệp đại học, điểm GPA tr&ecirc;n 7.0 (Một số trường lớn y&ecirc;u cầu điểm GPA cao hơn) v&agrave; c&oacute; ielts 6.5 hoặc tương đương</p>

<h3><strong><em>2.6 Chương tr&igrave;nh học dự bị tiếng (ESL)</em></strong></h3>

<p>►&nbsp;D&agrave;nh cho c&aacute;c muốn học tập tại Canada nhưng chưa c&oacute; chứng chỉ tiếng.</p>

<p>►&nbsp;Kh&ocirc;ng y&ecirc;u cầu về tiếng nhưng sinh vi&ecirc;n cần phải trải qua một b&agrave;i test online với trường để xếp lớp theo tr&igrave;nh độ</p>

<p>►&nbsp;Điểm GPA y&ecirc;u cầu tr&ecirc;n 6.0 đối với chương tr&igrave;nh học gần nhất</p>

<blockquote>
<p><strong>Tham khảo:&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/hoc-phi-cac-truong-tai-canada/" target="_blank">Học ph&iacute; c&aacute;c trường học tại Canada</a></strong></p>
</blockquote>

<p><img alt="" src="https://duhocchd.edu.vn/files/editor/images/du-hoc-canada-4.jpg" /></p>

<h2><strong>3. Một số chương tr&igrave;nh ưu ti&ecirc;n d&agrave;nh cho du học sinh Canada:</strong></h2>

<h3><strong><em>3.1&nbsp;<a href="http://duhocchd.edu.vn/du-hoc-canada-tuyen-sinh/chuong-trinh-ces-visa-du-hoc-canada-nhanh-nhat/" target="_blank">Chương tr&igrave;nh visa ưu ti&ecirc;n CES:</a></em></strong></h3>

<p>►&nbsp;Chứng chỉ 5.0 IELTS c&ograve;n hiệu lực, trong đ&oacute; kh&ocirc;ng c&oacute; kĩ năng n&agrave;o dưới 4.5</p>

<p>►&nbsp;Nhận thư mời của một trong&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/danh-sach-cac-truong-tai-canada-tham-gia-chuong-trinh-ces/" target="_blank">55 trường tham gia chương tr&igrave;nh CES</a>.</p>

<p>►&nbsp;Bằng chứng đ&atilde; chi trả học ph&iacute; trong v&ograve;ng 1 năm.</p>

<p>►&nbsp;&nbsp;Mua giấy chứng nhận Đầu tư Đảm bảo (GIC) từ Scotiabank với trị gi&aacute; 10,000 CAD để chi trả chi ph&iacute; sinh hoạt trong năm học đầu ti&ecirc;n tại Canada.</p>

<p>►&nbsp;Tiến h&agrave;nh kh&aacute;m sức khỏe tối thiểu 1 tuần trước ng&agrave;y nộp hồ sơ thị thực.</p>

<p>►&nbsp;Nộp hồ sơ xin visa 60 ng&agrave;y trước ng&agrave;y nhập học.</p>

<h3><strong><em>3.2&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-tuyen-sinh/sds-study-direct-stream-co-hoi-moi-cho-du-hoc-canada/" target="_blank">Chương tr&igrave;nh visa ưu ti&ecirc;n SDS:</a></em></strong></h3>

<p>►&nbsp;Nhập học v&agrave;o một chương tr&igrave;nh học to&agrave;n thời gian tại một cơ sở gi&aacute;o dục sau phổ th&ocirc;ng như c&aacute;c trường đại học, cao đẳng, viện nghi&ecirc;n cứu hoặc C&Eacute;GEP;</p>

<p>►&nbsp;Điểm IELTS tối thiểu l&agrave; 6.0 cho mỗi kỹ năng (Nghe, Đọc, Viết v&agrave; N&oacute;i);</p>

<p>►&nbsp;Mua Chứng nhận đầu tư đảm bảo (GIC) của Scotiabank với mức 10.000 CAD để trang trải chi ph&iacute; sinh hoạt cho năm đầu ti&ecirc;n ở tại Canada;</p>

<p>►&nbsp;Đ&oacute;ng học ph&iacute; trong một năm;</p>

<p>►&nbsp;Kh&aacute;m sức khoẻ &iacute;t nhất một tuần trước khi nộp đơn.</p>

<p>&nbsp;</p>

<p>Để được tư vấn MIỄN PH&Iacute; v&agrave; cập nhật mọi th&ocirc;ng tin mới nhất về du học Canada, xin vui l&ograve;ng đăng k&yacute; tư vấn với du học CHD ngay h&ocirc;m nay. Với ước mơ gi&uacute;p tri thức Việt Nam bay cao vươn xa, ch&uacute;ng t&ocirc;i cam kết sẽ trở th&agrave;nh người bạn đồng h&agrave;nh th&ocirc;ng minh hữu &iacute;ch lu&ocirc;n s&aacute;t c&aacute;nh b&ecirc;n bạn trong h&agrave;nh tr&igrave;nh du học tại Ch&acirc;u &Acirc;u v&agrave; mọi nơi tr&ecirc;n thế giới.&nbsp;</p>
', N'/Uploads/images/Du%20hoc%20Canada/du-hoc-canada-1.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Canada/du-hoc-canada-1.jpg', 1, 1, 1, 34, CAST(N'2018-07-04 22:01:21.1252085' AS DateTime2), CAST(N'2018-07-04 22:01:21.1252085' AS DateTime2))
INSERT [dbo].[tblNews] ([Id], [Creators], [Group], [Titles], [Describe], [Content], [Img], [ImgResizer], [Status], [Position], [Order], [View], [CreateDate], [ModifyDate]) VALUES (31, 1, 5, N'Du học thạc sĩ tại Canada', N'Canada đang là một trong các quốc gia thu hút nhiều sinh viên Việt Nam bởi chất lượng giáo dục tốt, bằng cấp có giá trị quốc tế và cơ hội định cư cao. Đặc biệt là chương trình thạc sĩ, với cơ hội có việc làm với thu nhập cao và khả năng định cư đến 80% tại Canada đang là mục tiêu của nhiều sinh viên Việt sau khi tốt nghiệp đại học.', N'<h2><img alt="" src="https://duhocchd.edu.vn/files/editor/images/thac%20si%20canada.jpg" /></h2>

<p><em>Học thạc sĩ tại Canada</em></p>

<h2><strong>1. Ưu điểm của chương tr&igrave;nh thạc sĩ tại Canada</strong></h2>

<p>&diams;&nbsp;Chương tr&igrave;nh học từ 16 đến 18 th&aacute;ng, c&oacute; k&igrave; thực tập được trả lương</p>

<p>&diams;&nbsp;Thời gian được ph&eacute;p ở lại sau khi học xong: Tối đa 3 năm, tối thiểu bằng thời gian học Master của bạn (Bạn c&oacute; giấy ph&eacute;p lao động v&agrave; được ở lại đi l&agrave;m, xin việc. Nếu c&oacute; c&ocirc;ng việc ổn định với hợp đồng lao động l&acirc;u d&agrave;i, bạn c&oacute; thể xin visa d&agrave;i hạn v&agrave; xin định cư)</p>

<p>&diams;&nbsp;Được t&iacute;nh điểm cao hơn khi x&eacute;t PR (Permanent Residence) v&agrave; định cư</p>

<p>&diams;&nbsp;C&oacute; một số bang sau khi học Master sẽ được nộp hồ sơ xin PR lu&ocirc;n theo&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/chinh-sach-dinh-cu-canada-theo-dien-tay-nghe/" target="_blank">chương tr&igrave;nh định cư</a>&nbsp;của tỉnh bang.</p>

<p>&diams;&nbsp;Được đưa vợ/chồng v&agrave; con theo học trong thời gian học tại Canada.</p>

<blockquote>
<p><strong>XEM NGAY &gt;&gt;&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/tat-tan-tat-thong-tin-ve-du-hoc-canada/" target="_blank">TẤT TẦN TẬT TH&Ocirc;NG TIN VỀ DU HỌC CANADA</a></strong></p>
</blockquote>

<h2><strong>2. Điều kiện x&eacute;t tuyển v&agrave; một số ng&agrave;nh được ưu ti&ecirc;n</strong></h2>

<p>&diams;&nbsp;Tốt nghiệp đại học trở l&ecirc;n với điểm GPA tr&ecirc;n 7.5 (C&oacute; một số ng&agrave;nh đặc th&ugrave;, c&aacute;c trường top đầu sẽ y&ecirc;u cầu GPA tr&ecirc;n 8.0). Một số ng&agrave;nh kỹ thuật bạn c&oacute; thể apply hồ sơ với mức điểm GPA 7.0</p>

<p>&diams;&nbsp;C&oacute; hai năm kinh nghiệm trong lĩnh vực đăng k&iacute; học.</p>

<p>&diams;&nbsp;Với c&aacute;c bạn chưa c&oacute; kinh nghiệm (Sinh vi&ecirc;n mới tốt nghiệp), c&oacute; thể đăng k&iacute; học Post-Graduate hoặc Pre-Master trước khi v&agrave;o học chương tr&igrave;nh master.</p>

<p>&diams;&nbsp;Tr&igrave;nh độ tiếng Anh: IELTS 7.0 trở l&ecirc;n hoặc tương đương (Một số trường y&ecirc;u cầu IELTS 7.5 hoặc thi b&agrave;i test của trường)</p>

<p>&diams;&nbsp;Trong trường hợp sinh vi&ecirc;n chưa đủ tr&igrave;nh độ tiếng Anh, bạn c&oacute; thể học chương tr&igrave;nh dự bị tiếng ESL trước khi học thạc sỹ tại trường.</p>

<p>&diams;&nbsp;Y&ecirc;u cầu hai thư giới thiệu của thầy c&ocirc; ở đại học hoặc của c&ocirc;ng ty đang l&agrave;m việc.</p>

<p>&diams;&nbsp;Thư động lưc, CV l&agrave; bắt buộc đối với hồ sơ Master Canada</p>

<p>&diams;&nbsp;Một số ng&agrave;nh y&ecirc;u cầu một số chứng chỉ đặc th&ugrave; như GMAT (từ 650) hoặc GRE (từ 150)</p>

<p><strong>Lưu &yacute;:&nbsp;</strong>Với những ứng vi&ecirc;n kh&ocirc;ng đủ điều kiện học thạc sĩ tại Canada th&igrave; c&oacute; thể chọn 1 trong 2 c&aacute;ch sau:</p>

<p>✓&nbsp;Trường hợp kh&ocirc;ng c&oacute; kinh nghiệm l&agrave;m việc: quay về Việt Nam, đi l&agrave;m 2 năm, xong nộp lại hồ sơ.</p>

<p>✓&nbsp;Trường hợp kh&ocirc;ng c&oacute; kinh nghiệm l&agrave;m việc v&agrave; thiếu điểm: chuyển hướng sang học Post-graduate Canada, học 1-2 năm, học xong thi đi l&agrave;m t&iacute;ch lũy kinh nghiệm, sau đ&oacute; nộp lại hồ sơ l&ecirc;n Master.</p>

<h2><strong>3. Chi ph&iacute; học thạc sĩ tại Canada</strong></h2>

<p>&diams;&nbsp;Học ph&iacute;: từ 15000 CAD &ndash; 28.000 CAD/năm trở l&ecirc;n t&ugrave;y từng ng&agrave;nh v&agrave; t&ugrave;y từng trường kh&aacute;c nhau</p>

<p>&diams;&nbsp;Một số ng&agrave;nh đặc th&ugrave; c&oacute; học ph&iacute; kh&aacute;c cao: V&iacute; dụ ng&agrave;nh MBA: học ph&iacute; từ 30.000 CAD &ndash; 45.000 CAD/năm tại c&aacute;c trường top đầu của Canada</p>

<p>&diams;&nbsp;Chi ph&iacute; sinh hoạt: khoảng 8000 CAD - 10000 CAD/năm (Chi ph&iacute; n&agrave;y bao gồm: Chi ph&iacute; sinh hoạt, chi ph&iacute; đi lại, ph&iacute; bảo hiểm v&agrave; c&aacute;c mức ph&iacute; cần thiết trong cuộc sống sinh vi&ecirc;n)</p>

<p>&diams;&nbsp;Sinh vi&ecirc;n học chương tr&igrave;nh thạc sĩ tại Canada được ph&eacute;p đi l&agrave;m 20h/tuần.</p>

<p>&diams;&nbsp;C&aacute;c sinh vi&ecirc;n master c&oacute; thể đi thực tập (được trả lương) hoặc đăng k&iacute; chương tr&igrave;nh vừa học vừa l&agrave;m trong thời gian học thạc sĩ.</p>

<blockquote>
<p><strong>[CẬP NHẬT] -&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/cap-nhat-chinh-sach-dinh-cu-moi-nhat-tai-7-bang-o-canada/" target="_blank">Ch&iacute;nh s&aacute;ch định cư mới nhất tại 7 bang ở Canada 2018</a></strong></p>
</blockquote>

<p><img alt="" src="https://duhocchd.edu.vn/files/editor/images/du%20hoc%20thac%20sy%20tai%20canada%20co%20gi%20hay.jpg" /></p>

<p><a href="https://duhocchd.edu.vn/du-hoc-canada.html" target="_blank"><em>Du học Canada</em></a></p>

<h2><strong>4. Hồ sơ cần chuẩn bị</strong></h2>

<p>►&nbsp;<strong>Hồ sơ xin thư mời:</strong>&nbsp;Theo y&ecirc;u cầu của từng trường v&agrave; từng từng ng&agrave;nh, tuy nhi&ecirc;n c&aacute;c hồ sơ cơ bản gồm c&oacute;:</p>

<p>✓&nbsp;Bảng điểm v&agrave; bằng đại học</p>

<p>✓&nbsp;Hộ chiếu</p>

<p>✓&nbsp;Chứng chỉ tiếng Anh</p>

<p>✓&nbsp;Thư giới thiệu</p>

<p>✓&nbsp;CV v&agrave; thư động lực</p>

<p>✓&nbsp;Hợp đồng lao động</p>

<p>►&nbsp;<strong>Hồ sơ visa:</strong></p>

<p>✓&nbsp;Với c&aacute;c bạn c&oacute; chứng chỉ IELTS tr&ecirc;n 6.0 (Kh&ocirc;ng c&oacute; kĩ năng n&agrave;o dưới 5.5) th&igrave; đăng k&iacute; chương tr&igrave;nh visa ưu ti&ecirc;n.</p>

<p>✓&nbsp;Với c&aacute;c bạn chưa đủ IELTS, sẽ đăng k&iacute; chương tr&igrave;nh dự bị tiếng trước khi học master. C&aacute;c bạn sẽ l&agrave;m hồ sơ visa chứng minh t&agrave;i ch&iacute;nh, bao gồm c&aacute;c giấy tờ:</p>

<p>&bull;&nbsp;Giấy tờ chứng minh thu nhập h&agrave;ng th&aacute;ng</p>

<p>&bull;&nbsp;Sổ tiết kiệm</p>

<p>&bull;&nbsp;Sổ đỏ, cổ phần, cổ phiếu, giấy tờ xe &ocirc; t&ocirc;&hellip;.</p>

<p>&bull;&nbsp;Giấy tờ đăng k&iacute; kinh doanh, nộp thuế doanh nghiệp</p>

<blockquote>
<p><strong>Tham khảo th&ecirc;m:&nbsp;<a href="https://duhocchd.edu.vn/du-hoc-canada-cam-nang-du-hoc/xin-visa-canada-mat-bao-lau/" target="_blank">XIN VISA CANADA MẤT BAO L&Acirc;U</a></strong></p>
</blockquote>

<h2><strong>5. Định hướng tư vấn tại c&ocirc;ng ty CHD</strong></h2>

<p>&diams;&nbsp;Được tư vấn định hướng ng&agrave;nh ph&ugrave; hợp cho chương tr&igrave;nh master</p>

<p>&diams;&nbsp;Được tư vấn lộ tr&igrave;nh hồ sơ chuẩn theo y&ecirc;u cầu của đại sứ qu&aacute;n</p>

<p>&diams;&nbsp;Tư vấn chọn trường ph&ugrave; hợp với hồ sơ của sinh vi&ecirc;n</p>

<p>&diams;&nbsp;Li&ecirc;n hệ trường sớm v&agrave; l&agrave;m hồ sơ sớm để nộp visa trong thời gian sớm nhất</p>

<p>&diams;&nbsp;Tư vấn hồ sơ t&agrave;i ch&iacute;nh</p>

<p>&diams;&nbsp;Đăng k&iacute; k&iacute; t&uacute;c x&aacute; hoặc nh&agrave; ở tư nh&acirc;n cho sinh vi&ecirc;n</p>

<p>&diams;&nbsp;Li&ecirc;n hệ dịch vụ đưa đ&oacute;n s&acirc;n bay</p>

<p>&diams;&nbsp;Xin hai thư mời nếu học sinh sang học chương tr&igrave;nh dự bị tiếng (Thư mời chương tr&igrave;nh tiếng v&agrave; thư mời chuy&ecirc;n ng&agrave;nh sau dự bị tiếng)</p>

<p>Để nhận được th&ocirc;ng tin tư vấn chi tiết, c&aacute;c bạn li&ecirc;n hệ sớm với c&ocirc;ng ty CHD. Hiện tại c&ocirc;ng ty CHD đang nhận hồ sơ đăng k&iacute; Master cho kỳ học th&aacute;ng 9/2018.</p>
', N'/Uploads/images/Du%20hoc%20Canada/thac%20si%20canada.jpg', N'/Uploads/_thumbs/images/Du%20hoc%20Canada/thac%20si%20canada.jpg', 1, 1, 1, 74, CAST(N'2018-07-04 22:03:27.3023517' AS DateTime2), CAST(N'2018-07-04 22:03:27.3023517' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblNews] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [Creators], [FullName], [UserName], [Password], [Email], [Img], [ImgResizer], [Status], [Decentralize], [CreateDate], [ModifyDate]) VALUES (1, NULL, N'Ngo Van Tai', N'admin', N'5F4DCC3B5AA765D61D8327DEB882CF99', N'tainv10@gmail.com', N'asas', N'asasas', 1, 1, CAST(N'2018-07-03 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-03 00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK__tblCommen__Paren__145C0A3F] FOREIGN KEY([ParentId])
REFERENCES [dbo].[tblComment] ([Id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK__tblCommen__Paren__145C0A3F]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK__tblComment__News__173876EA] FOREIGN KEY([News])
REFERENCES [dbo].[tblNews] ([Id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK__tblComment__News__173876EA]
GO
--ALTER TABLE [dbo].[tblGroup]  WITH CHECK ADD  CONSTRAINT [FK__tblGroup__Parent__164452B1] FOREIGN KEY([ParentId])
--REFERENCES [dbo].[tblGroup] ([Id])
--GO
ALTER TABLE [dbo].[tblGroup] CHECK CONSTRAINT [FK__tblGroup__Parent__164452B1]
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD  CONSTRAINT [FK__tblNews__Group__1367E606] FOREIGN KEY([Group])
REFERENCES [dbo].[tblGroup] ([Id])
GO
ALTER TABLE [dbo].[tblNews] CHECK CONSTRAINT [FK__tblNews__Group__1367E606]
GO
USE [master]
GO
ALTER DATABASE [Manage_News] SET  READ_WRITE 
GO
