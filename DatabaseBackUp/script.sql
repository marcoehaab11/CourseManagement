USE [master]
GO
/****** Object:  Database [CoursesManagement]    Script Date: 16-Oct-24 8:11:35 PM ******/
CREATE DATABASE [CoursesManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoursesManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CoursesManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoursesManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CoursesManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CoursesManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoursesManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoursesManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoursesManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoursesManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoursesManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoursesManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoursesManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoursesManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoursesManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoursesManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoursesManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoursesManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoursesManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoursesManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoursesManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoursesManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CoursesManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoursesManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoursesManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoursesManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoursesManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoursesManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CoursesManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoursesManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [CoursesManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CoursesManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoursesManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoursesManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoursesManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoursesManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoursesManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoursesManagement', N'ON'
GO
ALTER DATABASE [CoursesManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [CoursesManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CoursesManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 16-Oct-24 8:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241014174226_first', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241015155534_add-studentCourseTable', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241015175856_AddIdentityTables', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241016084744_EditRelationBetweenCourseAndTeacher', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241016085958_UpdateStudentTable', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Name], [Description]) VALUES (8, N'Flutter ', N'Dart and ....')
INSERT [dbo].[Courses] ([Id], [Name], [Description]) VALUES (9, N'Back-End', N'.Net core 
')
INSERT [dbo].[Courses] ([Id], [Name], [Description]) VALUES (10, N'Embedded Systems', N'C...')
INSERT [dbo].[Courses] ([Id], [Name], [Description]) VALUES (18, N'AI', N'Python
')
INSERT [dbo].[Courses] ([Id], [Name], [Description]) VALUES (19, N'Front-End', N'React')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8159bcee-adc1-4b78-b468-0f38c729727c', N'Student', N'STUDENT', NULL)
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bfde0559-46d9-4eed-a9b7-e54f94b323d9', N'Admin', N'ADMIN', NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentCourses] ON 

INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId], [TeacherId]) VALUES (9, 1, 8, 31)
INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId], [TeacherId]) VALUES (10, 1, 10, 26)
INSERT [dbo].[StudentCourses] ([Id], [StudentId], [CourseId], [TeacherId]) VALUES (13, 1, 9, 32)
SET IDENTITY_INSERT [dbo].[StudentCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name]) VALUES (1, N'Student')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (25, N'Khalid Magdy', 19)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (26, N'Amir Osama', 10)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (28, N'Marco Ehab', 9)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (29, N'Sameh Ashraf', 10)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (30, N'Medhat Salah', 8)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (31, N'Micheal Osama', 8)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (32, N'Ali El-Nagar', 9)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (33, N'Omar Waled', NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (34, N'Moustafa Hosny', NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (35, N'Yasser ElZero', NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [CourseId]) VALUES (36, N'Mahmoud Salem', NULL)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'70558b21-79b1-4b3a-9de0-975ba343b842', N'8159bcee-adc1-4b78-b468-0f38c729727c')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'e35923a9-a4dd-4f65-9222-90e2dd27d3f3', N'bfde0559-46d9-4eed-a9b7-e54f94b323d9')
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70558b21-79b1-4b3a-9de0-975ba343b842', N'Student@Student.com', N'STUDENT@STUDENT.COM', N'Student@Student.com', N'STUDENT@STUDENT.COM', 0, N'AQAAAAIAAYagAAAAENPIH8eStWED8SPZJFMLArvixLYnAeXmzdvVIU2KEF8TJT4QD+xvEH9hu/vSPy6T0A==', N'TSLWU25LR6RW5V3NV72VDIP2Q3EGFDEQ', N'14d4ed3c-2ef3-450a-905d-a5b5b8829bd2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e35923a9-a4dd-4f65-9222-90e2dd27d3f3', N'Admin@Admin.com', N'ADMIN@ADMIN.COM', N'Admin@Admin.com', N'ADMIN@ADMIN.COM', 0, N'AQAAAAIAAYagAAAAEA6MsolKQBdgYc0FPg3IPVO0YmWHdMfbHO25T1Bc8uzGZMHMpSg/mHgxYFmNjwXNTw==', N'2ZONRDJESAHVHALEN5CWCLL2IB4Z26QM', N'fa14aeae-7391-4522-b7fd-bed646836010', NULL, 0, 0, NULL, 1, 0)
GO
/****** Object:  Index [IX_StudentCourses_CourseId]    Script Date: 16-Oct-24 8:11:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCourses_CourseId] ON [dbo].[StudentCourses]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentCourses_StudentId]    Script Date: 16-Oct-24 8:11:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCourses_StudentId] ON [dbo].[StudentCourses]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentCourses_TeacherId]    Script Date: 16-Oct-24 8:11:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCourses_TeacherId] ON [dbo].[StudentCourses]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teachers_CourseId]    Script Date: 16-Oct-24 8:11:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teachers_CourseId] ON [dbo].[Teachers]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Courses_CourseId]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Students_StudentId]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Teachers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Teachers_TeacherId]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Courses_CourseId]
GO
USE [master]
GO
ALTER DATABASE [CoursesManagement] SET  READ_WRITE 
GO
