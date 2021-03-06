USE [studbud]
GO
/****** Object:  StoredProcedure [dbo].[StudentAddUpdate]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StudentAddUpdate]
(
@Type varchar(20)='',
@Studid int=0,
@EnrollNo varchar(20)='',
@Name varchar(50)='',
@Password varchar(50)='',
@Lati varchar(20)='',
@Longi varchar(20)=''
)
as begin
if(@Type='AddStudent')
begin
INSERT INTO studentmaster(enrollmentno, name, password, lati, longi,reportedat) 
VALUES (@EnrollNo,@Name,@Password,@Lati,@Longi,getdate())
select @@IDENTITY as StudID,'New Student added successfully' as Message
end
end
--select * from studentmaster
--StudentAddUpdate 'AddStudent','','02145','Vaibhav Gole','fdfgfgdf','12.8416','79.0022'
GO
/****** Object:  Table [dbo].[assignstudent]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignstudent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NOT NULL,
	[courseid] [int] NOT NULL,
 CONSTRAINT [PK__assignst__3213E83FD6FB642B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[assignsubject]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignsubject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subid] [int] NOT NULL,
	[teacherid] [int] NOT NULL,
 CONSTRAINT [PK__assignsu__3213E83F160CAB84] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[attendence]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendence](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NOT NULL,
	[courseid] [int] NOT NULL,
	[teacherid] [int] NOT NULL,
	[slotid] [int] NOT NULL,
	[dayid] [int] NOT NULL,
	[Entrydate] [datetime2](0) NOT NULL,
	[Attendencedatae] [datetime2](0) NOT NULL,
	[Attendencestatus] [varchar](50) NOT NULL,
	[Subjectid] [int] NOT NULL,
 CONSTRAINT [PK__attenden__3213E83F6F5612B7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calendermaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[calendermaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [varchar](50) NOT NULL,
	[day] [varchar](200) NOT NULL,
 CONSTRAINT [PK__calender__3213E83F82B1F2A5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contentmaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contentmaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[timetableid] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[verify] [smallint] NOT NULL,
	[material] [varchar](max) NOT NULL,
	[remarks] [varchar](max) NOT NULL,
	[slotnumber] [int] NOT NULL,
 CONSTRAINT [PK__contentm__3213E83FDBA07D5E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[coursemaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[coursemaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[fromdate] [datetime2](0) NOT NULL,
	[todate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK__coursema__3213E83F9C69D663] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[daymaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[daymaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dayname] [varchar](10) NOT NULL,
 CONSTRAINT [PK__daymaste__3213E83F3C5430EC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timetableid] [int] NOT NULL,
	[location] [varchar](100) NOT NULL,
 CONSTRAINT [PK__location__3213E83FE272BC06] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[noticemap]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noticemap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noticeid] [int] NOT NULL,
	[courseid] [int] NOT NULL,
 CONSTRAINT [PK__noticema__3213E83FE7DDA0AA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notices]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NOT NULL,
	[content] [varchar](max) NULL,
	[poster] [int] NOT NULL,
	[views] [int] NULL,
	[attach] [int] NULL,
	[postdate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK__notices__3213E83F9D1C2688] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slotmaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slotmaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slotnumber] [int] NOT NULL,
	[courseid] [int] NOT NULL,
	[fromslot] [time](0) NOT NULL,
	[toslot] [time](0) NOT NULL,
 CONSTRAINT [PK__slotmast__3213E83F8241F694] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[studentmaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studentmaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[enrollmentno] [varchar](max) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[longi] [decimal](10, 4) NULL,
	[lati] [decimal](10, 4) NULL,
	[reportedat] [datetime2](0) NULL,
 CONSTRAINT [PK__studentm__3213E83F00CA943E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subjectmaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subjectmaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[course] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK__subjectm__3213E83F6FA8A63A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teachermaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachermaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[longi] [decimal](10, 4) NULL,
	[lati] [decimal](10, 4) NULL,
	[reportedat] [datetime2](0) NULL,
 CONSTRAINT [PK__teacherm__3213E83FF23612A8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[timetablemaster]    Script Date: 24-Apr-17 8:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timetablemaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NOT NULL,
	[slot] [int] NOT NULL,
	[subjectid] [int] NOT NULL,
	[dayid] [int] NOT NULL,
	[location] [int] NOT NULL,
 CONSTRAINT [PK__timetabl__3213E83F80D97970] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[assignstudent] ON 

GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (1, 1, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (2, 2, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (3, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[assignstudent] OFF
GO
SET IDENTITY_INSERT [dbo].[assignsubject] ON 

GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (1, 1, 2)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (2, 3, 1)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (3, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[assignsubject] OFF
GO
SET IDENTITY_INSERT [dbo].[attendence] ON 

GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (4, 1, 1, 1, 1, 1, CAST(0x00000000B63C0B0000 AS DateTime2), CAST(0x00000000B63C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (5, 2, 1, 1, 2, 1, CAST(0x00000000B63C0B0000 AS DateTime2), CAST(0x00000000B63C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (6, 1, 1, 1, 1, 4, CAST(0x00000000B73C0B0000 AS DateTime2), CAST(0x00000000B73C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (7, 0, 1, 1, 1, 1, CAST(0x00000000B53C0B0000 AS DateTime2), CAST(0x00000000B53C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (8, 0, 1, 1, 1, 2, CAST(0x00000000B63C0B0000 AS DateTime2), CAST(0x00000000B63C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (9, 0, 1, 1, 1, 3, CAST(0x00000000B73C0B0000 AS DateTime2), CAST(0x00000000B73C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (10, 0, 1, 1, 1, 3, CAST(0x00000000B73C0B0000 AS DateTime2), CAST(0x00000000B73C0B0000 AS DateTime2), N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[attendence] OFF
GO
SET IDENTITY_INSERT [dbo].[calendermaster] ON 

GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (9, N'2017-01-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (10, N'2017-01-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (11, N'2017-01-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (12, N'2017-01-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (13, N'2017-01-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (14, N'2017-01-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (15, N'2017-01-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (16, N'2017-01-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (17, N'2017-01-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (18, N'2017-01-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (19, N'2017-01-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (20, N'2017-01-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (21, N'2017-01-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (22, N'2017-01-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (23, N'2017-01-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (24, N'2017-01-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (25, N'2017-01-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (26, N'2017-01-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (27, N'2017-01-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (28, N'2017-01-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (29, N'2017-01-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (30, N'2017-01-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (31, N'2017-01-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (32, N'2017-01-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (33, N'2017-01-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (34, N'2017-01-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (35, N'2017-01-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (36, N'2017-01-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (37, N'2017-01-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (38, N'2017-01-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (39, N'2017-02-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (40, N'2017-02-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (41, N'2017-02-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (42, N'2017-02-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (43, N'2017-02-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (44, N'2017-02-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (45, N'2017-02-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (46, N'2017-02-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (47, N'2017-02-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (48, N'2017-02-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (49, N'2017-02-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (50, N'2017-02-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (51, N'2017-02-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (52, N'2017-02-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (53, N'2017-02-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (54, N'2017-02-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (55, N'2017-02-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (56, N'2017-02-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (57, N'2017-02-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (58, N'2017-02-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (59, N'2017-02-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (60, N'2017-02-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (61, N'2017-02-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (62, N'2017-02-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (63, N'2017-02-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (64, N'2017-02-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (65, N'2017-02-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (66, N'2017-02-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (67, N'2017-03-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (68, N'2017-03-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (69, N'2017-03-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (70, N'2017-03-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (71, N'2017-03-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (72, N'2017-03-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (73, N'2017-03-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (74, N'2017-03-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (75, N'2017-03-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (76, N'2017-03-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (77, N'2017-03-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (78, N'2017-03-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (79, N'2017-03-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (80, N'2017-03-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (81, N'2017-03-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (82, N'2017-03-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (83, N'2017-03-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (84, N'2017-03-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (85, N'2017-03-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (86, N'2017-03-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (87, N'2017-03-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (88, N'2017-03-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (89, N'2017-03-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (90, N'2017-03-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (91, N'2017-03-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (92, N'2017-03-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (93, N'2017-03-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (94, N'2017-03-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (95, N'2017-03-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (96, N'2017-03-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (97, N'2017-03-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (98, N'2017-04-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (99, N'2017-04-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (100, N'2017-04-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (101, N'2017-04-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (102, N'2017-04-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (103, N'2017-04-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (104, N'2017-04-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (105, N'2017-04-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (106, N'2017-04-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (107, N'2017-04-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (108, N'2017-04-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (109, N'2017-04-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (110, N'2017-04-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (111, N'2017-04-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (112, N'2017-04-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (113, N'2017-04-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (114, N'2017-04-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (115, N'2017-04-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (116, N'2017-04-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (117, N'2017-04-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (118, N'2017-04-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (119, N'2017-04-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (120, N'2017-04-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (121, N'2017-04-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (122, N'2017-04-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (123, N'2017-04-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (124, N'2017-04-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (125, N'2017-04-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (126, N'2017-04-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (127, N'2017-04-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (128, N'2017-05-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (129, N'2017-05-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (130, N'2017-05-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (131, N'2017-05-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (132, N'2017-05-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (133, N'2017-05-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (134, N'2017-05-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (135, N'2017-05-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (136, N'2017-05-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (137, N'2017-05-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (138, N'2017-05-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (139, N'2017-05-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (140, N'2017-05-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (141, N'2017-05-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (142, N'2017-05-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (143, N'2017-05-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (144, N'2017-05-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (145, N'2017-05-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (146, N'2017-05-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (147, N'2017-05-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (148, N'2017-05-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (149, N'2017-05-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (150, N'2017-05-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (151, N'2017-05-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (152, N'2017-05-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (153, N'2017-05-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (154, N'2017-05-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (155, N'2017-05-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (156, N'2017-05-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (157, N'2017-05-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (158, N'2017-05-31 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (159, N'2017-06-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (160, N'2017-06-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (161, N'2017-06-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (162, N'2017-06-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (163, N'2017-06-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (164, N'2017-06-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (165, N'2017-06-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (166, N'2017-06-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (167, N'2017-06-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (168, N'2017-06-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (169, N'2017-06-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (170, N'2017-06-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (171, N'2017-06-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (172, N'2017-06-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (173, N'2017-06-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (174, N'2017-06-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (175, N'2017-06-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (176, N'2017-06-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (177, N'2017-06-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (178, N'2017-06-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (179, N'2017-06-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (180, N'2017-06-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (181, N'2017-06-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (182, N'2017-06-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (183, N'2017-06-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (184, N'2017-06-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (185, N'2017-06-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (186, N'2017-06-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (187, N'2017-06-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (188, N'2017-06-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (189, N'2017-07-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (190, N'2017-07-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (191, N'2017-07-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (192, N'2017-07-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (193, N'2017-07-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (194, N'2017-07-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (195, N'2017-07-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (196, N'2017-07-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (197, N'2017-07-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (198, N'2017-07-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (199, N'2017-07-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (200, N'2017-07-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (201, N'2017-07-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (202, N'2017-07-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (203, N'2017-07-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (204, N'2017-07-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (205, N'2017-07-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (206, N'2017-07-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (207, N'2017-07-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (208, N'2017-07-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (209, N'2017-07-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (210, N'2017-07-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (211, N'2017-07-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (212, N'2017-07-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (213, N'2017-07-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (214, N'2017-07-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (215, N'2017-07-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (216, N'2017-07-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (217, N'2017-07-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (218, N'2017-07-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (219, N'2017-07-31 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (220, N'2017-08-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (221, N'2017-08-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (222, N'2017-08-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (223, N'2017-08-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (224, N'2017-08-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (225, N'2017-08-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (226, N'2017-08-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (227, N'2017-08-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (228, N'2017-08-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (229, N'2017-08-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (230, N'2017-08-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (231, N'2017-08-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (232, N'2017-08-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (233, N'2017-08-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (234, N'2017-08-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (235, N'2017-08-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (236, N'2017-08-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (237, N'2017-08-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (238, N'2017-08-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (239, N'2017-08-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (240, N'2017-08-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (241, N'2017-08-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (242, N'2017-08-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (243, N'2017-08-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (244, N'2017-08-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (245, N'2017-08-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (246, N'2017-08-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (247, N'2017-08-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (248, N'2017-08-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (249, N'2017-08-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (250, N'2017-08-31 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (251, N'2017-09-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (252, N'2017-09-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (253, N'2017-09-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (254, N'2017-09-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (255, N'2017-09-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (256, N'2017-09-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (257, N'2017-09-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (258, N'2017-09-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (259, N'2017-09-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (260, N'2017-09-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (261, N'2017-09-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (262, N'2017-09-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (263, N'2017-09-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (264, N'2017-09-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (265, N'2017-09-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (266, N'2017-09-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (267, N'2017-09-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (268, N'2017-09-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (269, N'2017-09-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (270, N'2017-09-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (271, N'2017-09-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (272, N'2017-09-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (273, N'2017-09-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (274, N'2017-09-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (275, N'2017-09-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (276, N'2017-09-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (277, N'2017-09-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (278, N'2017-09-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (279, N'2017-09-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (280, N'2017-09-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (281, N'2017-10-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (282, N'2017-10-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (283, N'2017-10-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (284, N'2017-10-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (285, N'2017-10-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (286, N'2017-10-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (287, N'2017-10-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (288, N'2017-10-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (289, N'2017-10-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (290, N'2017-10-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (291, N'2017-10-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (292, N'2017-10-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (293, N'2017-10-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (294, N'2017-10-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (295, N'2017-10-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (296, N'2017-10-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (297, N'2017-10-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (298, N'2017-10-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (299, N'2017-10-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (300, N'2017-10-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (301, N'2017-10-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (302, N'2017-10-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (303, N'2017-10-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (304, N'2017-10-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (305, N'2017-10-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (306, N'2017-10-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (307, N'2017-10-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (308, N'2017-10-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (309, N'2017-10-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (310, N'2017-10-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (311, N'2017-10-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (312, N'2017-11-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (313, N'2017-11-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (314, N'2017-11-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (315, N'2017-11-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (316, N'2017-11-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (317, N'2017-11-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (318, N'2017-11-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (319, N'2017-11-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (320, N'2017-11-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (321, N'2017-11-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (322, N'2017-11-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (323, N'2017-11-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (324, N'2017-11-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (325, N'2017-11-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (326, N'2017-11-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (327, N'2017-11-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (328, N'2017-11-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (329, N'2017-11-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (330, N'2017-11-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (331, N'2017-11-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (332, N'2017-11-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (333, N'2017-11-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (334, N'2017-11-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (335, N'2017-11-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (336, N'2017-11-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (337, N'2017-11-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (338, N'2017-11-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (339, N'2017-11-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (340, N'2017-11-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (341, N'2017-11-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (342, N'2017-12-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (343, N'2017-12-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (344, N'2017-12-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (345, N'2017-12-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (346, N'2017-12-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (347, N'2017-12-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (348, N'2017-12-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (349, N'2017-12-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (350, N'2017-12-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (351, N'2017-12-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (352, N'2017-12-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (353, N'2017-12-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (354, N'2017-12-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (355, N'2017-12-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (356, N'2017-12-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (357, N'2017-12-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (358, N'2017-12-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (359, N'2017-12-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (360, N'2017-12-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (361, N'2017-12-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (362, N'2017-12-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (363, N'2017-12-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (364, N'2017-12-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (365, N'2017-12-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (366, N'2017-12-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (367, N'2017-12-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (368, N'2017-12-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (369, N'2017-12-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (370, N'2017-12-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (371, N'2017-12-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (372, N'2017-12-31 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (373, N'2018-01-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (374, N'2018-01-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (375, N'2018-01-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (376, N'2018-01-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (377, N'2018-01-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (378, N'2018-01-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (379, N'2018-01-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (380, N'2018-01-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (381, N'2018-01-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (382, N'2018-01-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (383, N'2018-01-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (384, N'2018-01-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (385, N'2018-01-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (386, N'2018-01-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (387, N'2018-01-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (388, N'2018-01-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (389, N'2018-01-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (390, N'2018-01-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (391, N'2018-01-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (392, N'2018-01-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (393, N'2018-01-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (394, N'2018-01-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (395, N'2018-01-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (396, N'2018-01-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (397, N'2018-01-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (398, N'2018-01-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (399, N'2018-01-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (400, N'2018-01-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (401, N'2018-01-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (402, N'2018-01-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (403, N'2018-01-31 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (404, N'2018-02-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (405, N'2018-02-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (406, N'2018-02-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (407, N'2018-02-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (408, N'2018-02-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (409, N'2018-02-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (410, N'2018-02-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (411, N'2018-02-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (412, N'2018-02-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (413, N'2018-02-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (414, N'2018-02-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (415, N'2018-02-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (416, N'2018-02-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (417, N'2018-02-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (418, N'2018-02-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (419, N'2018-02-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (420, N'2018-02-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (421, N'2018-02-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (422, N'2018-02-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (423, N'2018-02-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (424, N'2018-02-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (425, N'2018-02-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (426, N'2018-02-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (427, N'2018-02-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (428, N'2018-02-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (429, N'2018-02-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (430, N'2018-02-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (431, N'2018-02-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (432, N'2018-03-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (433, N'2018-03-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (434, N'2018-03-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (435, N'2018-03-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (436, N'2018-03-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (437, N'2018-03-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (438, N'2018-03-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (439, N'2018-03-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (440, N'2018-03-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (441, N'2018-03-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (442, N'2018-03-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (443, N'2018-03-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (444, N'2018-03-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (445, N'2018-03-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (446, N'2018-03-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (447, N'2018-03-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (448, N'2018-03-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (449, N'2018-03-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (450, N'2018-03-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (451, N'2018-03-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (452, N'2018-03-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (453, N'2018-03-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (454, N'2018-03-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (455, N'2018-03-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (456, N'2018-03-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (457, N'2018-03-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (458, N'2018-03-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (459, N'2018-03-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (460, N'2018-03-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (461, N'2018-03-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (462, N'2018-03-31 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (463, N'2018-04-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (464, N'2018-04-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (465, N'2018-04-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (466, N'2018-04-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (467, N'2018-04-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (468, N'2018-04-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (469, N'2018-04-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (470, N'2018-04-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (471, N'2018-04-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (472, N'2018-04-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (473, N'2018-04-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (474, N'2018-04-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (475, N'2018-04-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (476, N'2018-04-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (477, N'2018-04-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (478, N'2018-04-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (479, N'2018-04-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (480, N'2018-04-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (481, N'2018-04-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (482, N'2018-04-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (483, N'2018-04-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (484, N'2018-04-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (485, N'2018-04-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (486, N'2018-04-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (487, N'2018-04-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (488, N'2018-04-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (489, N'2018-04-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (490, N'2018-04-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (491, N'2018-04-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (492, N'2018-04-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (493, N'2018-05-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (494, N'2018-05-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (495, N'2018-05-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (496, N'2018-05-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (497, N'2018-05-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (498, N'2018-05-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (499, N'2018-05-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (500, N'2018-05-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (501, N'2018-05-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (502, N'2018-05-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (503, N'2018-05-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (504, N'2018-05-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (505, N'2018-05-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (506, N'2018-05-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (507, N'2018-05-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (508, N'2018-05-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (509, N'2018-05-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (510, N'2018-05-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (511, N'2018-05-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (512, N'2018-05-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (513, N'2018-05-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (514, N'2018-05-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (515, N'2018-05-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (516, N'2018-05-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (517, N'2018-05-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (518, N'2018-05-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (519, N'2018-05-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (520, N'2018-05-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (521, N'2018-05-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (522, N'2018-05-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (523, N'2018-05-31 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (524, N'2018-06-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (525, N'2018-06-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (526, N'2018-06-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (527, N'2018-06-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (528, N'2018-06-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (529, N'2018-06-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (530, N'2018-06-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (531, N'2018-06-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (532, N'2018-06-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (533, N'2018-06-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (534, N'2018-06-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (535, N'2018-06-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (536, N'2018-06-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (537, N'2018-06-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (538, N'2018-06-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (539, N'2018-06-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (540, N'2018-06-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (541, N'2018-06-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (542, N'2018-06-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (543, N'2018-06-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (544, N'2018-06-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (545, N'2018-06-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (546, N'2018-06-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (547, N'2018-06-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (548, N'2018-06-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (549, N'2018-06-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (550, N'2018-06-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (551, N'2018-06-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (552, N'2018-06-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (553, N'2018-06-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (554, N'2018-07-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (555, N'2018-07-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (556, N'2018-07-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (557, N'2018-07-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (558, N'2018-07-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (559, N'2018-07-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (560, N'2018-07-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (561, N'2018-07-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (562, N'2018-07-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (563, N'2018-07-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (564, N'2018-07-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (565, N'2018-07-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (566, N'2018-07-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (567, N'2018-07-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (568, N'2018-07-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (569, N'2018-07-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (570, N'2018-07-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (571, N'2018-07-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (572, N'2018-07-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (573, N'2018-07-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (574, N'2018-07-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (575, N'2018-07-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (576, N'2018-07-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (577, N'2018-07-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (578, N'2018-07-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (579, N'2018-07-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (580, N'2018-07-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (581, N'2018-07-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (582, N'2018-07-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (583, N'2018-07-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (584, N'2018-07-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (585, N'2018-08-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (586, N'2018-08-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (587, N'2018-08-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (588, N'2018-08-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (589, N'2018-08-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (590, N'2018-08-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (591, N'2018-08-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (592, N'2018-08-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (593, N'2018-08-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (594, N'2018-08-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (595, N'2018-08-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (596, N'2018-08-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (597, N'2018-08-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (598, N'2018-08-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (599, N'2018-08-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (600, N'2018-08-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (601, N'2018-08-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (602, N'2018-08-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (603, N'2018-08-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (604, N'2018-08-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (605, N'2018-08-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (606, N'2018-08-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (607, N'2018-08-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (608, N'2018-08-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (609, N'2018-08-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (610, N'2018-08-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (611, N'2018-08-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (612, N'2018-08-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (613, N'2018-08-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (614, N'2018-08-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (615, N'2018-08-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (616, N'2018-09-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (617, N'2018-09-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (618, N'2018-09-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (619, N'2018-09-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (620, N'2018-09-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (621, N'2018-09-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (622, N'2018-09-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (623, N'2018-09-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (624, N'2018-09-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (625, N'2018-09-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (626, N'2018-09-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (627, N'2018-09-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (628, N'2018-09-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (629, N'2018-09-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (630, N'2018-09-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (631, N'2018-09-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (632, N'2018-09-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (633, N'2018-09-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (634, N'2018-09-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (635, N'2018-09-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (636, N'2018-09-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (637, N'2018-09-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (638, N'2018-09-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (639, N'2018-09-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (640, N'2018-09-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (641, N'2018-09-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (642, N'2018-09-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (643, N'2018-09-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (644, N'2018-09-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (645, N'2018-09-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (646, N'2018-10-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (647, N'2018-10-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (648, N'2018-10-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (649, N'2018-10-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (650, N'2018-10-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (651, N'2018-10-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (652, N'2018-10-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (653, N'2018-10-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (654, N'2018-10-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (655, N'2018-10-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (656, N'2018-10-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (657, N'2018-10-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (658, N'2018-10-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (659, N'2018-10-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (660, N'2018-10-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (661, N'2018-10-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (662, N'2018-10-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (663, N'2018-10-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (664, N'2018-10-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (665, N'2018-10-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (666, N'2018-10-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (667, N'2018-10-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (668, N'2018-10-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (669, N'2018-10-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (670, N'2018-10-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (671, N'2018-10-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (672, N'2018-10-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (673, N'2018-10-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (674, N'2018-10-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (675, N'2018-10-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (676, N'2018-10-31 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (677, N'2018-11-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (678, N'2018-11-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (679, N'2018-11-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (680, N'2018-11-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (681, N'2018-11-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (682, N'2018-11-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (683, N'2018-11-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (684, N'2018-11-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (685, N'2018-11-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (686, N'2018-11-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (687, N'2018-11-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (688, N'2018-11-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (689, N'2018-11-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (690, N'2018-11-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (691, N'2018-11-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (692, N'2018-11-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (693, N'2018-11-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (694, N'2018-11-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (695, N'2018-11-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (696, N'2018-11-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (697, N'2018-11-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (698, N'2018-11-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (699, N'2018-11-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (700, N'2018-11-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (701, N'2018-11-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (702, N'2018-11-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (703, N'2018-11-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (704, N'2018-11-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (705, N'2018-11-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (706, N'2018-11-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (707, N'2018-12-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (708, N'2018-12-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (709, N'2018-12-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (710, N'2018-12-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (711, N'2018-12-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (712, N'2018-12-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (713, N'2018-12-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (714, N'2018-12-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (715, N'2018-12-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (716, N'2018-12-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (717, N'2018-12-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (718, N'2018-12-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (719, N'2018-12-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (720, N'2018-12-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (721, N'2018-12-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (722, N'2018-12-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (723, N'2018-12-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (724, N'2018-12-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (725, N'2018-12-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (726, N'2018-12-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (727, N'2018-12-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (728, N'2018-12-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (729, N'2018-12-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (730, N'2018-12-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (731, N'2018-12-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (732, N'2018-12-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (733, N'2018-12-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (734, N'2018-12-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (735, N'2018-12-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (736, N'2018-12-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (737, N'2018-12-31 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (738, N'2019-01-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (739, N'2019-01-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (740, N'2019-01-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (741, N'2019-01-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (742, N'2019-01-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (743, N'2019-01-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (744, N'2019-01-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (745, N'2019-01-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (746, N'2019-01-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (747, N'2019-01-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (748, N'2019-01-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (749, N'2019-01-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (750, N'2019-01-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (751, N'2019-01-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (752, N'2019-01-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (753, N'2019-01-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (754, N'2019-01-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (755, N'2019-01-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (756, N'2019-01-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (757, N'2019-01-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (758, N'2019-01-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (759, N'2019-01-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (760, N'2019-01-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (761, N'2019-01-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (762, N'2019-01-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (763, N'2019-01-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (764, N'2019-01-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (765, N'2019-01-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (766, N'2019-01-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (767, N'2019-01-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (768, N'2019-01-31 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (769, N'2019-02-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (770, N'2019-02-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (771, N'2019-02-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (772, N'2019-02-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (773, N'2019-02-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (774, N'2019-02-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (775, N'2019-02-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (776, N'2019-02-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (777, N'2019-02-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (778, N'2019-02-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (779, N'2019-02-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (780, N'2019-02-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (781, N'2019-02-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (782, N'2019-02-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (783, N'2019-02-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (784, N'2019-02-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (785, N'2019-02-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (786, N'2019-02-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (787, N'2019-02-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (788, N'2019-02-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (789, N'2019-02-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (790, N'2019-02-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (791, N'2019-02-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (792, N'2019-02-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (793, N'2019-02-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (794, N'2019-02-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (795, N'2019-02-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (796, N'2019-02-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (797, N'2019-03-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (798, N'2019-03-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (799, N'2019-03-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (800, N'2019-03-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (801, N'2019-03-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (802, N'2019-03-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (803, N'2019-03-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (804, N'2019-03-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (805, N'2019-03-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (806, N'2019-03-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (807, N'2019-03-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (808, N'2019-03-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (809, N'2019-03-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (810, N'2019-03-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (811, N'2019-03-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (812, N'2019-03-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (813, N'2019-03-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (814, N'2019-03-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (815, N'2019-03-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (816, N'2019-03-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (817, N'2019-03-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (818, N'2019-03-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (819, N'2019-03-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (820, N'2019-03-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (821, N'2019-03-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (822, N'2019-03-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (823, N'2019-03-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (824, N'2019-03-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (825, N'2019-03-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (826, N'2019-03-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (827, N'2019-03-31 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (828, N'2019-04-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (829, N'2019-04-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (830, N'2019-04-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (831, N'2019-04-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (832, N'2019-04-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (833, N'2019-04-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (834, N'2019-04-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (835, N'2019-04-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (836, N'2019-04-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (837, N'2019-04-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (838, N'2019-04-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (839, N'2019-04-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (840, N'2019-04-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (841, N'2019-04-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (842, N'2019-04-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (843, N'2019-04-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (844, N'2019-04-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (845, N'2019-04-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (846, N'2019-04-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (847, N'2019-04-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (848, N'2019-04-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (849, N'2019-04-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (850, N'2019-04-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (851, N'2019-04-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (852, N'2019-04-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (853, N'2019-04-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (854, N'2019-04-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (855, N'2019-04-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (856, N'2019-04-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (857, N'2019-04-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (858, N'2019-05-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (859, N'2019-05-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (860, N'2019-05-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (861, N'2019-05-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (862, N'2019-05-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (863, N'2019-05-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (864, N'2019-05-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (865, N'2019-05-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (866, N'2019-05-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (867, N'2019-05-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (868, N'2019-05-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (869, N'2019-05-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (870, N'2019-05-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (871, N'2019-05-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (872, N'2019-05-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (873, N'2019-05-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (874, N'2019-05-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (875, N'2019-05-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (876, N'2019-05-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (877, N'2019-05-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (878, N'2019-05-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (879, N'2019-05-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (880, N'2019-05-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (881, N'2019-05-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (882, N'2019-05-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (883, N'2019-05-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (884, N'2019-05-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (885, N'2019-05-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (886, N'2019-05-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (887, N'2019-05-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (888, N'2019-05-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (889, N'2019-06-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (890, N'2019-06-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (891, N'2019-06-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (892, N'2019-06-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (893, N'2019-06-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (894, N'2019-06-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (895, N'2019-06-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (896, N'2019-06-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (897, N'2019-06-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (898, N'2019-06-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (899, N'2019-06-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (900, N'2019-06-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (901, N'2019-06-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (902, N'2019-06-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (903, N'2019-06-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (904, N'2019-06-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (905, N'2019-06-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (906, N'2019-06-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (907, N'2019-06-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (908, N'2019-06-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (909, N'2019-06-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (910, N'2019-06-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (911, N'2019-06-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (912, N'2019-06-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (913, N'2019-06-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (914, N'2019-06-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (915, N'2019-06-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (916, N'2019-06-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (917, N'2019-06-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (918, N'2019-06-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (919, N'2019-07-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (920, N'2019-07-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (921, N'2019-07-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (922, N'2019-07-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (923, N'2019-07-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (924, N'2019-07-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (925, N'2019-07-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (926, N'2019-07-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (927, N'2019-07-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (928, N'2019-07-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (929, N'2019-07-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (930, N'2019-07-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (931, N'2019-07-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (932, N'2019-07-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (933, N'2019-07-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (934, N'2019-07-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (935, N'2019-07-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (936, N'2019-07-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (937, N'2019-07-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (938, N'2019-07-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (939, N'2019-07-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (940, N'2019-07-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (941, N'2019-07-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (942, N'2019-07-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (943, N'2019-07-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (944, N'2019-07-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (945, N'2019-07-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (946, N'2019-07-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (947, N'2019-07-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (948, N'2019-07-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (949, N'2019-07-31 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (950, N'2019-08-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (951, N'2019-08-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (952, N'2019-08-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (953, N'2019-08-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (954, N'2019-08-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (955, N'2019-08-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (956, N'2019-08-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (957, N'2019-08-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (958, N'2019-08-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (959, N'2019-08-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (960, N'2019-08-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (961, N'2019-08-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (962, N'2019-08-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (963, N'2019-08-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (964, N'2019-08-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (965, N'2019-08-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (966, N'2019-08-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (967, N'2019-08-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (968, N'2019-08-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (969, N'2019-08-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (970, N'2019-08-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (971, N'2019-08-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (972, N'2019-08-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (973, N'2019-08-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (974, N'2019-08-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (975, N'2019-08-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (976, N'2019-08-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (977, N'2019-08-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (978, N'2019-08-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (979, N'2019-08-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (980, N'2019-08-31 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (981, N'2019-09-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (982, N'2019-09-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (983, N'2019-09-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (984, N'2019-09-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (985, N'2019-09-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (986, N'2019-09-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (987, N'2019-09-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (988, N'2019-09-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (989, N'2019-09-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (990, N'2019-09-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (991, N'2019-09-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (992, N'2019-09-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (993, N'2019-09-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (994, N'2019-09-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (995, N'2019-09-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (996, N'2019-09-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (997, N'2019-09-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (998, N'2019-09-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (999, N'2019-09-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1000, N'2019-09-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1001, N'2019-09-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1002, N'2019-09-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1003, N'2019-09-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1004, N'2019-09-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1005, N'2019-09-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1006, N'2019-09-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1007, N'2019-09-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1008, N'2019-09-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1009, N'2019-09-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1010, N'2019-09-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1011, N'2019-10-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1012, N'2019-10-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1013, N'2019-10-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1014, N'2019-10-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1015, N'2019-10-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1016, N'2019-10-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1017, N'2019-10-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1018, N'2019-10-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1019, N'2019-10-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1020, N'2019-10-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1021, N'2019-10-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1022, N'2019-10-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1023, N'2019-10-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1024, N'2019-10-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1025, N'2019-10-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1026, N'2019-10-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1027, N'2019-10-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1028, N'2019-10-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1029, N'2019-10-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1030, N'2019-10-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1031, N'2019-10-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1032, N'2019-10-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1033, N'2019-10-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1034, N'2019-10-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1035, N'2019-10-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1036, N'2019-10-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1037, N'2019-10-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1038, N'2019-10-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1039, N'2019-10-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1040, N'2019-10-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1041, N'2019-10-31 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1042, N'2019-11-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1043, N'2019-11-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1044, N'2019-11-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1045, N'2019-11-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1046, N'2019-11-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1047, N'2019-11-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1048, N'2019-11-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1049, N'2019-11-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1050, N'2019-11-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1051, N'2019-11-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1052, N'2019-11-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1053, N'2019-11-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1054, N'2019-11-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1055, N'2019-11-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1056, N'2019-11-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1057, N'2019-11-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1058, N'2019-11-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1059, N'2019-11-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1060, N'2019-11-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1061, N'2019-11-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1062, N'2019-11-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1063, N'2019-11-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1064, N'2019-11-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1065, N'2019-11-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1066, N'2019-11-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1067, N'2019-11-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1068, N'2019-11-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1069, N'2019-11-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1070, N'2019-11-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1071, N'2019-11-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1072, N'2019-12-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1073, N'2019-12-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1074, N'2019-12-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1075, N'2019-12-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1076, N'2019-12-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1077, N'2019-12-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1078, N'2019-12-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1079, N'2019-12-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1080, N'2019-12-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1081, N'2019-12-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1082, N'2019-12-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1083, N'2019-12-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1084, N'2019-12-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1085, N'2019-12-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1086, N'2019-12-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1087, N'2019-12-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1088, N'2019-12-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1089, N'2019-12-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1090, N'2019-12-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1091, N'2019-12-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1092, N'2019-12-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1093, N'2019-12-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1094, N'2019-12-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1095, N'2019-12-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1096, N'2019-12-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1097, N'2019-12-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1098, N'2019-12-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1099, N'2019-12-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1100, N'2019-12-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1101, N'2019-12-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1102, N'2019-12-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1103, N'2020-01-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1104, N'2020-01-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1105, N'2020-01-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1106, N'2020-01-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1107, N'2020-01-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1108, N'2020-01-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1109, N'2020-01-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1110, N'2020-01-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1111, N'2020-01-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1112, N'2020-01-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1113, N'2020-01-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1114, N'2020-01-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1115, N'2020-01-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1116, N'2020-01-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1117, N'2020-01-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1118, N'2020-01-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1119, N'2020-01-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1120, N'2020-01-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1121, N'2020-01-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1122, N'2020-01-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1123, N'2020-01-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1124, N'2020-01-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1125, N'2020-01-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1126, N'2020-01-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1127, N'2020-01-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1128, N'2020-01-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1129, N'2020-01-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1130, N'2020-01-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1131, N'2020-01-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1132, N'2020-01-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1133, N'2020-01-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1134, N'2020-02-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1135, N'2020-02-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1136, N'2020-02-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1137, N'2020-02-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1138, N'2020-02-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1139, N'2020-02-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1140, N'2020-02-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1141, N'2020-02-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1142, N'2020-02-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1143, N'2020-02-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1144, N'2020-02-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1145, N'2020-02-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1146, N'2020-02-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1147, N'2020-02-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1148, N'2020-02-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1149, N'2020-02-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1150, N'2020-02-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1151, N'2020-02-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1152, N'2020-02-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1153, N'2020-02-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1154, N'2020-02-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1155, N'2020-02-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1156, N'2020-02-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1157, N'2020-02-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1158, N'2020-02-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1159, N'2020-02-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1160, N'2020-02-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1161, N'2020-02-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1162, N'2020-02-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1163, N'2020-03-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1164, N'2020-03-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1165, N'2020-03-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1166, N'2020-03-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1167, N'2020-03-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1168, N'2020-03-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1169, N'2020-03-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1170, N'2020-03-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1171, N'2020-03-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1172, N'2020-03-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1173, N'2020-03-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1174, N'2020-03-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1175, N'2020-03-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1176, N'2020-03-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1177, N'2020-03-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1178, N'2020-03-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1179, N'2020-03-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1180, N'2020-03-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1181, N'2020-03-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1182, N'2020-03-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1183, N'2020-03-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1184, N'2020-03-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1185, N'2020-03-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1186, N'2020-03-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1187, N'2020-03-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1188, N'2020-03-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1189, N'2020-03-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1190, N'2020-03-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1191, N'2020-03-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1192, N'2020-03-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1193, N'2020-03-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1194, N'2020-04-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1195, N'2020-04-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1196, N'2020-04-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1197, N'2020-04-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1198, N'2020-04-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1199, N'2020-04-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1200, N'2020-04-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1201, N'2020-04-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1202, N'2020-04-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1203, N'2020-04-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1204, N'2020-04-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1205, N'2020-04-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1206, N'2020-04-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1207, N'2020-04-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1208, N'2020-04-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1209, N'2020-04-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1210, N'2020-04-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1211, N'2020-04-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1212, N'2020-04-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1213, N'2020-04-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1214, N'2020-04-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1215, N'2020-04-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1216, N'2020-04-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1217, N'2020-04-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1218, N'2020-04-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1219, N'2020-04-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1220, N'2020-04-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1221, N'2020-04-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1222, N'2020-04-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1223, N'2020-04-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1224, N'2020-05-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1225, N'2020-05-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1226, N'2020-05-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1227, N'2020-05-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1228, N'2020-05-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1229, N'2020-05-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1230, N'2020-05-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1231, N'2020-05-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1232, N'2020-05-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1233, N'2020-05-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1234, N'2020-05-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1235, N'2020-05-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1236, N'2020-05-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1237, N'2020-05-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1238, N'2020-05-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1239, N'2020-05-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1240, N'2020-05-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1241, N'2020-05-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1242, N'2020-05-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1243, N'2020-05-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1244, N'2020-05-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1245, N'2020-05-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1246, N'2020-05-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1247, N'2020-05-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1248, N'2020-05-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1249, N'2020-05-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1250, N'2020-05-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1251, N'2020-05-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1252, N'2020-05-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1253, N'2020-05-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1254, N'2020-05-31 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1255, N'2020-06-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1256, N'2020-06-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1257, N'2020-06-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1258, N'2020-06-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1259, N'2020-06-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1260, N'2020-06-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1261, N'2020-06-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1262, N'2020-06-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1263, N'2020-06-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1264, N'2020-06-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1265, N'2020-06-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1266, N'2020-06-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1267, N'2020-06-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1268, N'2020-06-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1269, N'2020-06-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1270, N'2020-06-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1271, N'2020-06-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1272, N'2020-06-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1273, N'2020-06-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1274, N'2020-06-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1275, N'2020-06-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1276, N'2020-06-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1277, N'2020-06-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1278, N'2020-06-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1279, N'2020-06-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1280, N'2020-06-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1281, N'2020-06-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1282, N'2020-06-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1283, N'2020-06-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1284, N'2020-06-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1285, N'2020-07-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1286, N'2020-07-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1287, N'2020-07-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1288, N'2020-07-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1289, N'2020-07-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1290, N'2020-07-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1291, N'2020-07-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1292, N'2020-07-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1293, N'2020-07-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1294, N'2020-07-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1295, N'2020-07-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1296, N'2020-07-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1297, N'2020-07-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1298, N'2020-07-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1299, N'2020-07-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1300, N'2020-07-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1301, N'2020-07-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1302, N'2020-07-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1303, N'2020-07-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1304, N'2020-07-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1305, N'2020-07-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1306, N'2020-07-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1307, N'2020-07-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1308, N'2020-07-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1309, N'2020-07-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1310, N'2020-07-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1311, N'2020-07-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1312, N'2020-07-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1313, N'2020-07-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1314, N'2020-07-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1315, N'2020-07-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1316, N'2020-08-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1317, N'2020-08-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1318, N'2020-08-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1319, N'2020-08-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1320, N'2020-08-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1321, N'2020-08-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1322, N'2020-08-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1323, N'2020-08-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1324, N'2020-08-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1325, N'2020-08-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1326, N'2020-08-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1327, N'2020-08-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1328, N'2020-08-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1329, N'2020-08-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1330, N'2020-08-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1331, N'2020-08-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1332, N'2020-08-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1333, N'2020-08-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1334, N'2020-08-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1335, N'2020-08-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1336, N'2020-08-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1337, N'2020-08-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1338, N'2020-08-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1339, N'2020-08-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1340, N'2020-08-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1341, N'2020-08-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1342, N'2020-08-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1343, N'2020-08-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1344, N'2020-08-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1345, N'2020-08-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1346, N'2020-08-31 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1347, N'2020-09-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1348, N'2020-09-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1349, N'2020-09-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1350, N'2020-09-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1351, N'2020-09-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1352, N'2020-09-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1353, N'2020-09-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1354, N'2020-09-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1355, N'2020-09-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1356, N'2020-09-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1357, N'2020-09-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1358, N'2020-09-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1359, N'2020-09-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1360, N'2020-09-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1361, N'2020-09-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1362, N'2020-09-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1363, N'2020-09-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1364, N'2020-09-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1365, N'2020-09-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1366, N'2020-09-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1367, N'2020-09-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1368, N'2020-09-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1369, N'2020-09-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1370, N'2020-09-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1371, N'2020-09-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1372, N'2020-09-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1373, N'2020-09-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1374, N'2020-09-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1375, N'2020-09-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1376, N'2020-09-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1377, N'2020-10-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1378, N'2020-10-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1379, N'2020-10-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1380, N'2020-10-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1381, N'2020-10-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1382, N'2020-10-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1383, N'2020-10-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1384, N'2020-10-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1385, N'2020-10-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1386, N'2020-10-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1387, N'2020-10-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1388, N'2020-10-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1389, N'2020-10-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1390, N'2020-10-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1391, N'2020-10-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1392, N'2020-10-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1393, N'2020-10-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1394, N'2020-10-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1395, N'2020-10-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1396, N'2020-10-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1397, N'2020-10-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1398, N'2020-10-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1399, N'2020-10-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1400, N'2020-10-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1401, N'2020-10-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1402, N'2020-10-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1403, N'2020-10-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1404, N'2020-10-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1405, N'2020-10-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1406, N'2020-10-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1407, N'2020-10-31 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1408, N'2020-11-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1409, N'2020-11-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1410, N'2020-11-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1411, N'2020-11-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1412, N'2020-11-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1413, N'2020-11-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1414, N'2020-11-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1415, N'2020-11-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1416, N'2020-11-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1417, N'2020-11-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1418, N'2020-11-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1419, N'2020-11-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1420, N'2020-11-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1421, N'2020-11-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1422, N'2020-11-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1423, N'2020-11-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1424, N'2020-11-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1425, N'2020-11-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1426, N'2020-11-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1427, N'2020-11-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1428, N'2020-11-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1429, N'2020-11-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1430, N'2020-11-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1431, N'2020-11-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1432, N'2020-11-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1433, N'2020-11-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1434, N'2020-11-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1435, N'2020-11-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1436, N'2020-11-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1437, N'2020-11-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1438, N'2020-12-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1439, N'2020-12-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1440, N'2020-12-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1441, N'2020-12-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1442, N'2020-12-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1443, N'2020-12-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1444, N'2020-12-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1445, N'2020-12-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1446, N'2020-12-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1447, N'2020-12-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1448, N'2020-12-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1449, N'2020-12-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1450, N'2020-12-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1451, N'2020-12-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1452, N'2020-12-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1453, N'2020-12-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1454, N'2020-12-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1455, N'2020-12-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1456, N'2020-12-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1457, N'2020-12-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1458, N'2020-12-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1459, N'2020-12-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1460, N'2020-12-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1461, N'2020-12-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1462, N'2020-12-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1463, N'2020-12-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1464, N'2020-12-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1465, N'2020-12-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1466, N'2020-12-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1467, N'2020-12-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1468, N'2020-12-31 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1469, N'2021-01-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1470, N'2021-01-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1471, N'2021-01-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1472, N'2021-01-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1473, N'2021-01-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1474, N'2021-01-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1475, N'2021-01-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1476, N'2021-01-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1477, N'2021-01-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1478, N'2021-01-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1479, N'2021-01-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1480, N'2021-01-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1481, N'2021-01-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1482, N'2021-01-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1483, N'2021-01-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1484, N'2021-01-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1485, N'2021-01-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1486, N'2021-01-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1487, N'2021-01-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1488, N'2021-01-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1489, N'2021-01-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1490, N'2021-01-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1491, N'2021-01-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1492, N'2021-01-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1493, N'2021-01-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1494, N'2021-01-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1495, N'2021-01-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1496, N'2021-01-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1497, N'2021-01-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1498, N'2021-01-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1499, N'2021-01-31 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1500, N'2021-02-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1501, N'2021-02-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1502, N'2021-02-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1503, N'2021-02-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1504, N'2021-02-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1505, N'2021-02-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1506, N'2021-02-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1507, N'2021-02-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1508, N'2021-02-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1509, N'2021-02-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1510, N'2021-02-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1511, N'2021-02-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1512, N'2021-02-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1513, N'2021-02-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1514, N'2021-02-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1515, N'2021-02-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1516, N'2021-02-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1517, N'2021-02-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1518, N'2021-02-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1519, N'2021-02-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1520, N'2021-02-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1521, N'2021-02-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1522, N'2021-02-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1523, N'2021-02-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1524, N'2021-02-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1525, N'2021-02-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1526, N'2021-02-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1527, N'2021-02-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1528, N'2021-03-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1529, N'2021-03-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1530, N'2021-03-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1531, N'2021-03-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1532, N'2021-03-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1533, N'2021-03-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1534, N'2021-03-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1535, N'2021-03-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1536, N'2021-03-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1537, N'2021-03-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1538, N'2021-03-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1539, N'2021-03-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1540, N'2021-03-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1541, N'2021-03-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1542, N'2021-03-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1543, N'2021-03-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1544, N'2021-03-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1545, N'2021-03-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1546, N'2021-03-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1547, N'2021-03-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1548, N'2021-03-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1549, N'2021-03-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1550, N'2021-03-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1551, N'2021-03-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1552, N'2021-03-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1553, N'2021-03-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1554, N'2021-03-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1555, N'2021-03-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1556, N'2021-03-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1557, N'2021-03-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1558, N'2021-03-31 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1559, N'2021-04-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1560, N'2021-04-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1561, N'2021-04-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1562, N'2021-04-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1563, N'2021-04-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1564, N'2021-04-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1565, N'2021-04-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1566, N'2021-04-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1567, N'2021-04-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1568, N'2021-04-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1569, N'2021-04-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1570, N'2021-04-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1571, N'2021-04-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1572, N'2021-04-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1573, N'2021-04-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1574, N'2021-04-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1575, N'2021-04-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1576, N'2021-04-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1577, N'2021-04-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1578, N'2021-04-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1579, N'2021-04-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1580, N'2021-04-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1581, N'2021-04-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1582, N'2021-04-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1583, N'2021-04-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1584, N'2021-04-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1585, N'2021-04-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1586, N'2021-04-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1587, N'2021-04-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1588, N'2021-04-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1589, N'2021-05-01 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1590, N'2021-05-02 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1591, N'2021-05-03 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1592, N'2021-05-04 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1593, N'2021-05-05 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1594, N'2021-05-06 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1595, N'2021-05-07 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1596, N'2021-05-08 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1597, N'2021-05-09 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1598, N'2021-05-10 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1599, N'2021-05-11 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1600, N'2021-05-12 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1601, N'2021-05-13 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1602, N'2021-05-14 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1603, N'2021-05-15 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1604, N'2021-05-16 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1605, N'2021-05-17 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1606, N'2021-05-18 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1607, N'2021-05-19 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1608, N'2021-05-20 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1609, N'2021-05-21 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1610, N'2021-05-22 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1611, N'2021-05-23 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1612, N'2021-05-24 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1613, N'2021-05-25 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1614, N'2021-05-26 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1615, N'2021-05-27 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1616, N'2021-05-28 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1617, N'2021-05-29 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1618, N'2021-05-30 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1619, N'2021-05-31 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1620, N'2021-06-01 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1621, N'2021-06-02 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1622, N'2021-06-03 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1623, N'2021-06-04 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1624, N'2021-06-05 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1625, N'2021-06-06 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1626, N'2021-06-07 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1627, N'2021-06-08 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1628, N'2021-06-09 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1629, N'2021-06-10 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1630, N'2021-06-11 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1631, N'2021-06-12 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1632, N'2021-06-13 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1633, N'2021-06-14 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1634, N'2021-06-15 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1635, N'2021-06-16 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1636, N'2021-06-17 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1637, N'2021-06-18 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1638, N'2021-06-19 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1639, N'2021-06-20 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1640, N'2021-06-21 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1641, N'2021-06-22 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1642, N'2021-06-23 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1643, N'2021-06-24 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1644, N'2021-06-25 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1645, N'2021-06-26 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1646, N'2021-06-27 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1647, N'2021-06-28 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1648, N'2021-06-29 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1649, N'2021-06-30 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1650, N'2021-07-01 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1651, N'2021-07-02 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1652, N'2021-07-03 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1653, N'2021-07-04 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1654, N'2021-07-05 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1655, N'2021-07-06 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1656, N'2021-07-07 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1657, N'2021-07-08 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1658, N'2021-07-09 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1659, N'2021-07-10 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1660, N'2021-07-11 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1661, N'2021-07-12 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1662, N'2021-07-13 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1663, N'2021-07-14 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1664, N'2021-07-15 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1665, N'2021-07-16 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1666, N'2021-07-17 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1667, N'2021-07-18 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1668, N'2021-07-19 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1669, N'2021-07-20 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1670, N'2021-07-21 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1671, N'2021-07-22 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1672, N'2021-07-23 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1673, N'2021-07-24 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1674, N'2021-07-25 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1675, N'2021-07-26 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1676, N'2021-07-27 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1677, N'2021-07-28 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1678, N'2021-07-29 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1679, N'2021-07-30 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1680, N'2021-07-31 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1681, N'2021-08-01 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1682, N'2021-08-02 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1683, N'2021-08-03 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1684, N'2021-08-04 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1685, N'2021-08-05 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1686, N'2021-08-06 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1687, N'2021-08-07 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1688, N'2021-08-08 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1689, N'2021-08-09 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1690, N'2021-08-10 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1691, N'2021-08-11 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1692, N'2021-08-12 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1693, N'2021-08-13 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1694, N'2021-08-14 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1695, N'2021-08-15 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1696, N'2021-08-16 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1697, N'2021-08-17 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1698, N'2021-08-18 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1699, N'2021-08-19 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1700, N'2021-08-20 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1701, N'2021-08-21 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1702, N'2021-08-22 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1703, N'2021-08-23 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1704, N'2021-08-24 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1705, N'2021-08-25 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1706, N'2021-08-26 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1707, N'2021-08-27 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1708, N'2021-08-28 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1709, N'2021-08-29 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1710, N'2021-08-30 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1711, N'2021-08-31 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1712, N'2021-09-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1713, N'2021-09-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1714, N'2021-09-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1715, N'2021-09-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1716, N'2021-09-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1717, N'2021-09-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1718, N'2021-09-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1719, N'2021-09-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1720, N'2021-09-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1721, N'2021-09-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1722, N'2021-09-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1723, N'2021-09-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1724, N'2021-09-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1725, N'2021-09-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1726, N'2021-09-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1727, N'2021-09-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1728, N'2021-09-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1729, N'2021-09-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1730, N'2021-09-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1731, N'2021-09-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1732, N'2021-09-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1733, N'2021-09-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1734, N'2021-09-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1735, N'2021-09-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1736, N'2021-09-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1737, N'2021-09-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1738, N'2021-09-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1739, N'2021-09-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1740, N'2021-09-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1741, N'2021-09-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1742, N'2021-10-01 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1743, N'2021-10-02 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1744, N'2021-10-03 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1745, N'2021-10-04 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1746, N'2021-10-05 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1747, N'2021-10-06 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1748, N'2021-10-07 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1749, N'2021-10-08 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1750, N'2021-10-09 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1751, N'2021-10-10 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1752, N'2021-10-11 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1753, N'2021-10-12 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1754, N'2021-10-13 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1755, N'2021-10-14 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1756, N'2021-10-15 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1757, N'2021-10-16 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1758, N'2021-10-17 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1759, N'2021-10-18 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1760, N'2021-10-19 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1761, N'2021-10-20 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1762, N'2021-10-21 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1763, N'2021-10-22 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1764, N'2021-10-23 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1765, N'2021-10-24 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1766, N'2021-10-25 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1767, N'2021-10-26 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1768, N'2021-10-27 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1769, N'2021-10-28 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1770, N'2021-10-29 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1771, N'2021-10-30 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1772, N'2021-10-31 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1773, N'2021-11-01 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1774, N'2021-11-02 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1775, N'2021-11-03 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1776, N'2021-11-04 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1777, N'2021-11-05 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1778, N'2021-11-06 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1779, N'2021-11-07 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1780, N'2021-11-08 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1781, N'2021-11-09 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1782, N'2021-11-10 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1783, N'2021-11-11 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1784, N'2021-11-12 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1785, N'2021-11-13 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1786, N'2021-11-14 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1787, N'2021-11-15 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1788, N'2021-11-16 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1789, N'2021-11-17 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1790, N'2021-11-18 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1791, N'2021-11-19 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1792, N'2021-11-20 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1793, N'2021-11-21 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1794, N'2021-11-22 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1795, N'2021-11-23 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1796, N'2021-11-24 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1797, N'2021-11-25 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1798, N'2021-11-26 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1799, N'2021-11-27 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1800, N'2021-11-28 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1801, N'2021-11-29 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1802, N'2021-11-30 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1803, N'2021-12-01 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1804, N'2021-12-02 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1805, N'2021-12-03 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1806, N'2021-12-04 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1807, N'2021-12-05 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1808, N'2021-12-06 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1809, N'2021-12-07 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1810, N'2021-12-08 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1811, N'2021-12-09 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1812, N'2021-12-10 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1813, N'2021-12-11 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1814, N'2021-12-12 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1815, N'2021-12-13 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1816, N'2021-12-14 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1817, N'2021-12-15 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1818, N'2021-12-16 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1819, N'2021-12-17 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1820, N'2021-12-18 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1821, N'2021-12-19 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1822, N'2021-12-20 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1823, N'2021-12-21 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1824, N'2021-12-22 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1825, N'2021-12-23 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1826, N'2021-12-24 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1827, N'2021-12-25 00:00:00', N'Saturday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1828, N'2021-12-26 00:00:00', N'Sunday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1829, N'2021-12-27 00:00:00', N'Monday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1830, N'2021-12-28 00:00:00', N'Tuesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1831, N'2021-12-29 00:00:00', N'Wednesday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1832, N'2021-12-30 00:00:00', N'Thursday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1833, N'2021-12-31 00:00:00', N'Friday')
GO
INSERT [dbo].[calendermaster] ([id], [date], [day]) VALUES (1834, N'2022-01-01 00:00:00', N'Saturday')
GO
SET IDENTITY_INSERT [dbo].[calendermaster] OFF
GO
SET IDENTITY_INSERT [dbo].[contentmaster] ON 

GO
INSERT [dbo].[contentmaster] ([id], [date], [timetableid], [description], [verify], [material], [remarks], [slotnumber]) VALUES (1, CAST(0x0000A74F00000000 AS DateTime), 1, N'Today we look at stuff that you''d never know', 1, N'-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2017 at 05:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `slotid` int(11) NOT NULL,
  `dayid` int(11) NOT NULL,
  `Entrydate` datetime NOT NULL,
  `Attendencedatae` datetime NOT NULL,
  `Attendencestatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`studentid`, `courseid`, `teacherid`, `slotid`, `dayid`, `Entrydate`, `Attendencedatae`, `Attendencestatus`) VALUES
(1, 1, 1, 1, 1, ''2017-04-16 04:00:08'', ''2017-04-16 04:00:08'', ''''),
(1, 1, 1, 1, 1, ''2017-04-16 04:05:24'', ''2017-04-16 04:05:24'', ''P''),
(1, 1, 1, 1, 6, ''2017-04-16 04:57:27'', ''2017-04-16 04:57:27'', ''P'');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
', N'', 0)
GO
INSERT [dbo].[contentmaster] ([id], [date], [timetableid], [description], [verify], [material], [remarks], [slotnumber]) VALUES (2, CAST(0x0000A74D00000000 AS DateTime), 2, N'somenew things', 1, N'', N'Some stuff', 0)
GO
SET IDENTITY_INSERT [dbo].[contentmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[coursemaster] ON 

GO
INSERT [dbo].[coursemaster] ([id], [name], [fromdate], [todate]) VALUES (1, N'BEIT', CAST(0x00000000A33C0B0000 AS DateTime2), CAST(0x00000000C13C0B0000 AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[coursemaster] OFF
GO
SET IDENTITY_INSERT [dbo].[daymaster] ON 

GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (1, N'Monday')
GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (2, N'Tuesday')
GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (3, N'Wednesday')
GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (4, N'Thursday')
GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (5, N'Friday')
GO
INSERT [dbo].[daymaster] ([id], [Dayname]) VALUES (6, N'Saturday')
GO
SET IDENTITY_INSERT [dbo].[daymaster] OFF
GO
SET IDENTITY_INSERT [dbo].[location] ON 

GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (1, 1, N'Room number1')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (2, 2, N'Room number 2')
GO
SET IDENTITY_INSERT [dbo].[location] OFF
GO
SET IDENTITY_INSERT [dbo].[noticemap] ON 

GO
INSERT [dbo].[noticemap] ([id], [noticeid], [courseid]) VALUES (1, 1, 1)
GO
INSERT [dbo].[noticemap] ([id], [noticeid], [courseid]) VALUES (2, 2, 1)
GO
INSERT [dbo].[noticemap] ([id], [noticeid], [courseid]) VALUES (3, 3, 1)
GO
INSERT [dbo].[noticemap] ([id], [noticeid], [courseid]) VALUES (4, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[noticemap] OFF
GO
SET IDENTITY_INSERT [dbo].[notices] ON 

GO
INSERT [dbo].[notices] ([id], [title], [content], [poster], [views], [attach], [postdate]) VALUES (1, N'asdf', N'asdfasdfasfdasdf', 1, NULL, NULL, CAST(0x00CEB300703C0B0000 AS DateTime2))
GO
INSERT [dbo].[notices] ([id], [title], [content], [poster], [views], [attach], [postdate]) VALUES (2, N'XYZ', N'SDAFASDFASDFASDFasd', 2, 1, NULL, CAST(0x0019B600B73C0B0000 AS DateTime2))
GO
INSERT [dbo].[notices] ([id], [title], [content], [poster], [views], [attach], [postdate]) VALUES (3, N'1234564', N'123312315', 3, 12, NULL, CAST(0x0030B600B73C0B0000 AS DateTime2))
GO
INSERT [dbo].[notices] ([id], [title], [content], [poster], [views], [attach], [postdate]) VALUES (4, N'fsdaasdfadfdffadfsasdfadfsasfdadfsasdfadfsasfd', N'adfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfdadfsasdfadfsasfd', 1, 1, NULL, CAST(0x00ACB900B73C0B0000 AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[notices] OFF
GO
SET IDENTITY_INSERT [dbo].[slotmaster] ON 

GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (1, 1, 1, CAST(0x0040380000000000 AS Time), CAST(0x00300B0100000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (2, 2, 1, CAST(0x0060540000000000 AS Time), CAST(0x0070620000000000 AS Time))
GO
SET IDENTITY_INSERT [dbo].[slotmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[studentmaster] ON 

GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (1, N'01240', N'Test1', N'Test1', CAST(72.8441 AS Decimal(10, 4)), CAST(19.2372 AS Decimal(10, 4)), CAST(0x007F0E00BA3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (2, N'0234', N'Test2', N'Test2', CAST(72.8356 AS Decimal(10, 4)), CAST(19.0645 AS Decimal(10, 4)), CAST(0x00012200B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (3, N'0354', N'Test3', N'Test3', CAST(72.8466 AS Decimal(10, 4)), CAST(18.9921 AS Decimal(10, 4)), CAST(0x009A2600B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (4, N'02145', N'Test4', N'Test4', CAST(72.8514 AS Decimal(10, 4)), CAST(19.0303 AS Decimal(10, 4)), CAST(0x0013A900B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (5, N'12505', N'Test5', N'test5', CAST(72.8466 AS Decimal(10, 4)), CAST(18.9921 AS Decimal(10, 4)), CAST(0x00A22600B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (6, N'12526', N'Test6', N'Test6', CAST(72.8356 AS Decimal(10, 4)), CAST(19.0640 AS Decimal(10, 4)), CAST(0x00E82600B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (7, N'12487', N'Test7', N'test7', CAST(72.8356 AS Decimal(10, 4)), CAST(19.0640 AS Decimal(10, 4)), CAST(0x00EC2600B63C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (8, N'02145', N'Jay Choksi', N'meowmeow', CAST(72.8416 AS Decimal(10, 4)), CAST(19.0022 AS Decimal(10, 4)), CAST(0x00300E00BA3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (9, N'02145', N'Vaibhav Gole', N'fdfgfgdf', CAST(79.0022 AS Decimal(10, 4)), CAST(12.8416 AS Decimal(10, 4)), CAST(0x00741700BA3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (10, N'02145', N'Vaibhav Gole', N'fdfgfgdf', CAST(79.0022 AS Decimal(10, 4)), CAST(12.8416 AS Decimal(10, 4)), CAST(0x00771700BA3C0B0000 AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[studentmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[subjectmaster] ON 

GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (1, N'STQA', 1, N'Software Testing and Quality Assurance')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (2, N'FAMT', 1, N'Financial technologies ')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (3, N'LDAP', 1, N'Light weight directory access protocol')
GO
SET IDENTITY_INSERT [dbo].[subjectmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[teachermaster] ON 

GO
INSERT [dbo].[teachermaster] ([id], [name], [description], [password], [longi], [lati], [reportedat]) VALUES (1, N'Roanld Dough', N'Skilled one', N'', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [name], [description], [password], [longi], [lati], [reportedat]) VALUES (2, N'Peter Graggery', N'VC', N'', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [name], [description], [password], [longi], [lati], [reportedat]) VALUES (3, N'Stewart Benard', N'Gc', N'', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [name], [description], [password], [longi], [lati], [reportedat]) VALUES (7, N'John', N'awesome', N'anythin', NULL, NULL, NULL)
GO
INSERT [dbo].[teachermaster] ([id], [name], [description], [password], [longi], [lati], [reportedat]) VALUES (16, N'Sandesfdsadsfah', N'daf', N'devfdasfdsad', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[teachermaster] OFF
GO
SET IDENTITY_INSERT [dbo].[timetablemaster] ON 

GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (2, 1, 2, 2, 1, 2)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (3, 1, 3, 3, 1, 1)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (13, 1, 1, 2, 2, 1)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (14, 1, 2, 2, 2, 2)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (15, 1, 3, 3, 2, 3)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (16, 1, 1, 1, 3, 1)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (17, 1, 2, 2, 3, 2)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (18, 1, 3, 3, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[timetablemaster] OFF
GO
ALTER TABLE [dbo].[contentmaster] ADD  CONSTRAINT [DF__contentma__verif__22AA2996]  DEFAULT ('0') FOR [verify]
GO
ALTER TABLE [dbo].[notices] ADD  CONSTRAINT [DF__notices__content__2D27B809]  DEFAULT (NULL) FOR [content]
GO
ALTER TABLE [dbo].[notices] ADD  CONSTRAINT [DF__notices__views__2E1BDC42]  DEFAULT (NULL) FOR [views]
GO
ALTER TABLE [dbo].[notices] ADD  CONSTRAINT [DF__notices__attach__2F10007B]  DEFAULT (NULL) FOR [attach]
GO
ALTER TABLE [dbo].[notices] ADD  CONSTRAINT [DF__notices__postdat__300424B4]  DEFAULT (getdate()) FOR [postdate]
GO
ALTER TABLE [dbo].[studentmaster] ADD  CONSTRAINT [DF__studentma__longi__34C8D9D1]  DEFAULT (NULL) FOR [longi]
GO
ALTER TABLE [dbo].[studentmaster] ADD  CONSTRAINT [DF__studentmas__lati__35BCFE0A]  DEFAULT (NULL) FOR [lati]
GO
ALTER TABLE [dbo].[studentmaster] ADD  CONSTRAINT [DF__studentma__repor__36B12243]  DEFAULT (NULL) FOR [reportedat]
GO
ALTER TABLE [dbo].[teachermaster] ADD  CONSTRAINT [DF__teacherma__longi__3B75D760]  DEFAULT (NULL) FOR [longi]
GO
ALTER TABLE [dbo].[teachermaster] ADD  CONSTRAINT [DF__teachermas__lati__3C69FB99]  DEFAULT (NULL) FOR [lati]
GO
ALTER TABLE [dbo].[teachermaster] ADD  CONSTRAINT [DF__teacherma__repor__3D5E1FD2]  DEFAULT (NULL) FOR [reportedat]
GO
