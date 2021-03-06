USE [Okyc]
GO
/****** Object:  Table [dbo].[assignstudent]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[assignsubject]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[attendence]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[coursemaster]    Script Date: 05-30-2017 04:14:04 ******/
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
	[course] [varchar](50) NULL,
	[year] [varchar](50) NULL,
 CONSTRAINT [PK__coursema__3213E83F9C69D663] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[slotmaster]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[studentmaster]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[subjectmaster]    Script Date: 05-30-2017 04:14:04 ******/
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
/****** Object:  Table [dbo].[teachermaster]    Script Date: 05-30-2017 04:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachermaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](max) NULL,
	[name] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[longi] [decimal](10, 4) NULL,
	[lati] [decimal](10, 4) NULL,
	[reportedat] [datetime2](0) NULL,
	[privilege] [numeric](18, 0) NULL,
 CONSTRAINT [PK__teacherm__3213E83FF23612A8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[timetablemaster]    Script Date: 05-30-2017 04:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[timetablemaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NOT NULL,
	[slotid] [int] NOT NULL,
	[subjectid] [int] NOT NULL,
	[dayid] [int] NOT NULL,
	[locationid] [int] NOT NULL,
	[ttDate] [datetime] NULL,
	[description] [varchar](max) NULL,
	[verify] [smallint] NULL,
	[material] [varchar](max) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_timetablemaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[timetablemasterbkp]    Script Date: 05-30-2017 04:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timetablemasterbkp](
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
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (4, 4, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (5, 5, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (6, 6, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (7, 7, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (8, 8, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (9, 9, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (10, 10, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (11, 11, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (12, 12, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (13, 13, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (14, 14, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (15, 15, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (16, 16, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (17, 17, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (18, 18, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (19, 19, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (20, 20, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (21, 21, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (22, 22, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (23, 23, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (24, 24, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (25, 25, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (26, 26, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (27, 27, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (28, 28, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (29, 29, 1)
GO
INSERT [dbo].[assignstudent] ([id], [studentid], [courseid]) VALUES (30, 30, 1)
GO
SET IDENTITY_INSERT [dbo].[assignstudent] OFF
GO
SET IDENTITY_INSERT [dbo].[assignsubject] ON 

GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (1, 2, 1)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (2, 4, 2)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (3, 8, 3)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (4, 9, 4)
GO
INSERT [dbo].[assignsubject] ([id], [subid], [teacherid]) VALUES (10, 10, 5)
GO
SET IDENTITY_INSERT [dbo].[assignsubject] OFF
GO
SET IDENTITY_INSERT [dbo].[attendence] ON 

GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (1, 1, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (2, 2, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (3, 3, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (4, 4, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (5, 5, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (6, 6, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (7, 7, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (8, 8, 1, 1, 2, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (9, 1, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (10, 2, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (11, 3, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (12, 4, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (13, 5, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (14, 6, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (15, 7, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (16, 8, 1, 3, 1, 1, CAST(0x00000000BA3C0B0000 AS DateTime2), CAST(0x00000000BA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (17, 1, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (18, 2, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (19, 3, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (20, 4, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (21, 5, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (22, 6, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (23, 7, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (24, 8, 1, 2, 2, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (25, 1, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (26, 2, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (27, 3, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (28, 4, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (29, 5, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (30, 6, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (31, 7, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (32, 8, 1, 2, 1, 2, CAST(0x00000000BB3C0B0000 AS DateTime2), CAST(0x00000000BB3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (35, 1, 1, 2, 1, 1, CAST(0x006A2001C13C0B0000 AS DateTime2), CAST(0x00021800C13C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (36, 1, 1, 3, 2, 1, CAST(0x006A2001C13C0B0000 AS DateTime2), CAST(0x00021800C13C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (40, 1, 1, 3, 1, 2, CAST(0x00FF2101C13C0B0000 AS DateTime2), CAST(0x00000000C23C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (41, 1, 1, 2, 1, 3, CAST(0x00703101C23C0B0000 AS DateTime2), CAST(0x00703101C23C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (44, 1, 1, 2, 1, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (45, 2, 1, 2, 1, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (46, 3, 1, 2, 1, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (47, 1, 1, 3, 2, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (48, 2, 1, 3, 2, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (49, 3, 1, 3, 2, 3, CAST(0x00273301C23C0B0000 AS DateTime2), CAST(0x00273301C23C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (50, 1, 1, 2, 1, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (51, 2, 1, 2, 1, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (52, 3, 1, 2, 1, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (53, 1, 1, 3, 2, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (54, 2, 1, 3, 2, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (55, 3, 1, 3, 2, 3, CAST(0x005E3301C33C0B0000 AS DateTime2), CAST(0x005E3301C33C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (56, 1, 1, 2, 1, 3, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000CA3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (57, 1, 1, 2, 1, 3, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000D13C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (58, 1, 1, 2, 1, 1, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000CF3C0B0000 AS DateTime2), N'1', 1)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (59, 1, 1, 3, 1, 2, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000D03C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (60, 1, 1, 3, 2, 1, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000CF3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (61, 1, 1, 3, 2, 2, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000D03C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (62, 1, 1, 3, 2, 3, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000CA3C0B0000 AS DateTime2), N'1', 2)
GO
INSERT [dbo].[attendence] ([id], [studentid], [courseid], [teacherid], [slotid], [dayid], [Entrydate], [Attendencedatae], [Attendencestatus], [Subjectid]) VALUES (63, 1, 1, 3, 2, 3, CAST(0x00194001C23C0B0000 AS DateTime2), CAST(0x00000000D13C0B0000 AS DateTime2), N'1', 2)
GO
SET IDENTITY_INSERT [dbo].[attendence] OFF
GO
SET IDENTITY_INSERT [dbo].[coursemaster] ON 

GO
INSERT [dbo].[coursemaster] ([id], [name], [fromdate], [todate], [course], [year]) VALUES (1, N'BBA Sem 1-A', CAST(0x00000000743C0B0000 AS DateTime2), CAST(0x00000000293D0B0000 AS DateTime2), N'BBA', N'First')
GO
INSERT [dbo].[coursemaster] ([id], [name], [fromdate], [todate], [course], [year]) VALUES (2, N'BBA Sem 1-B', CAST(0x00000000743C0B0000 AS DateTime2), CAST(0x00000000293D0B0000 AS DateTime2), N'BBA', N'First')
GO
SET IDENTITY_INSERT [dbo].[coursemaster] OFF
GO
SET IDENTITY_INSERT [dbo].[location] ON 

GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (1, 1, N'Room number1')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (2, 2, N'Room number 2')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (3, 3, N'Room number 3')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (4, 4, N'Room number 4')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (5, 5, N'Room number 5')
GO
INSERT [dbo].[location] ([id], [timetableid], [location]) VALUES (6, 6, N'Room number 6')
GO
SET IDENTITY_INSERT [dbo].[location] OFF
GO
SET IDENTITY_INSERT [dbo].[slotmaster] ON 

GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (1, 1, 1, CAST(0x0061540000000000 AS Time), CAST(0x00907E0000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (2, 2, 1, CAST(0x00917E0000000000 AS Time), CAST(0x00C0A80000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (5, 3, 1, CAST(0x00C1A80000000000 AS Time), CAST(0x00F0D20000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (6, 4, 1, CAST(0x00F1D20000000000 AS Time), CAST(0x0020FD0000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (7, 5, 1, CAST(0x0021FD0000000000 AS Time), CAST(0x0050270100000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (8, 6, 1, CAST(0x0051270100000000 AS Time), CAST(0x0000000000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (9, 7, 1, CAST(0x0001000000000000 AS Time), CAST(0x00302A0000000000 AS Time))
GO
INSERT [dbo].[slotmaster] ([id], [slotnumber], [courseid], [fromslot], [toslot]) VALUES (12, 8, 1, CAST(0x00312A0000000000 AS Time), CAST(0x0060540000000000 AS Time))
GO
SET IDENTITY_INSERT [dbo].[slotmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[studentmaster] ON 

GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (1, N'R17ST0001', N'SARVAM SHASHANK SHAH', N'1bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (2, N'R17ST0002', N'KIANA CHIRAG DHAMELIA', N'2bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (3, N'R17ST0005', N'JAL PRATIK PATEL', N'3bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (4, N'R17ST0006', N'KRISHAV ANKIT PATEL', N'4bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (5, N'R17ST0007', N'RASHI RAJ JARIWALA', N'5bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (6, N'R17ST0011', N'VEER NIKHIL DHINGRA', N'6bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (7, N'R16ST0012', N'RITU KETAN KAPADIA', N'7bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (8, N'R17ST0015', N'HITV AJAYBHAI SUTARIYA', N'8bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (9, N'R17ST0016', N'SHLOK MANGUKIYA', N'9bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (10, N'R17ST0017', N'TASHI MUKUND HOJIWALA', N'10bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (11, N'R17ST0018', N'SRUSHTI VIVEK PATEL', N'11bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (12, N'R17ST0003', N'HEEVA ASHISH KAMRA', N'12bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (13, N'RT7ST0004', N'HEEYA ASHISH KAMRA', N'13bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (14, N'R17ST0019', N'SANVI RUSHABH ASARAWALA', N'14bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (15, N'RT7ST0010', N'NIHAR SHAILESH GOTI', N'15bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (16, N'R17ST0022', N'PRIYANSH YOGESH AGRAWAL', N'16bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (17, N'R17ST0021', N'VEDANSHI SURATWALA', N'17bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (18, N'R17ST0024', N'TATHYA YOGESH BHAI DESAI', N'18bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (19, N'R17ST0023', N'VIVAAN ALEX PATEL', N'19bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (20, N'R17ST0013', N'AARNAV HARESH LAKHANKIYA', N'20bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (21, N'R17ST0014', N'YUVAL JITUBHAI LAKHANKIYA', N'21bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (22, N'R17ST0028', N'SHIVARTH SIDDARTH DESAI', N'22bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (23, N'R17ST0030', N'JIAA SHAUNAK PATEL', N'23bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (24, N'R17ST0031', N'PARIN KRUSHABH DUMASWALA', N'24bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (25, N'R17ST0032', N'JIYA.N MODI', N'25bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (26, N'R17ST0033', N'SANCHI NAVEEN SHARMA', N'26bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (27, N'R17ST0035', N'RUDRANGI BHOWMIK', N'27bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (28, N'R17ST0034', N'AKSHAR VARIA', N'28bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (29, N'R17ST0036', N'KAVYA RAJESH CHURIWAL', N'29bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
INSERT [dbo].[studentmaster] ([id], [enrollmentno], [name], [password], [longi], [lati], [reportedat]) VALUES (30, N'R17ST0037', N'MAHANSH PATEL', N'30bbaa@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00DB2500DE3C0B0000 AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[studentmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[subjectmaster] ON 

GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (2, N'Human Resource Management 1
', 1, N'a ')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (4, N'Principles of Management 1
', 1, N'b')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (8, N'Financial Accounting
', 1, N'c')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (9, N'Quantitative Methods in Business 1
', 1, N'd')
GO
INSERT [dbo].[subjectmaster] ([id], [name], [course], [description]) VALUES (10, N'Computer Applications
', 1, N'e')
GO
SET IDENTITY_INSERT [dbo].[subjectmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[teachermaster] ON 

GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (1, N'bba1@pokemail.net', N'Aashna Mistry', N'', N'bba1@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (2, N'bba2@pokemail.net', N'Akshat Merchant', N'', N'bba2@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (3, N'bba3@pokemail.net', N'Anjali Kapadia', N'', N'bba3@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (4, N'bba4@pokemail.net', N'Ankit Marfatia', N'', N'bba4@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (5, N'bba5@pokemail.net', N'Arnav Singhal', N'', N'bba5@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (6, N'bba6@pokemail.net', N'Bharat Shah', N'', N'bba6@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (7, N'bba7@pokemail.net', N'Bhaumik Ghandhi', N'', N'bba7@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (8, N'bba8@pokemail.net', N'Bhavesh  Shah', N'', N'bba8@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (9, N'bba9@pokemail.net', N'Binaz  Wadia', N'', N'bba9@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (10, N'bba10@pokemail.net', N'Chirag  Mehta', N'', N'bba10@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (11, N'bba11@pokemail.net', N'Deepa Dave', N'', N'bba11@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (12, N'bba12@pokemail.net', N'Dhiral  Daruwala', N'', N'bba12@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (13, N'bba13@pokemail.net', N'Dhwani  Jariwala', N'', N'bba13@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (14, N'bba14@pokemail.net', N'Disha Patel', N'', N'bba14@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
INSERT [dbo].[teachermaster] ([id], [username], [name], [description], [password], [longi], [lati], [reportedat], [privilege]) VALUES (15, N'bba15@pokemail.net', N'Ekta Kadakia', N'', N'bba15@pokemail.net', CAST(0.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), CAST(0x00B92300DE3C0B0000 AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[teachermaster] OFF
GO
SET IDENTITY_INSERT [dbo].[timetablemaster] ON 

GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, 1, 2, 1, 1, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 1, 2, 4, 1, 2, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 1, 3, 8, 1, 3, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 1, 4, 9, 1, 4, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 1, 5, 10, 1, 5, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 1, 6, 4, 1, 6, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 1, 7, 10, 1, 3, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 1, 8, 4, 1, 5, CAST(0x0000A71900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 1, 1, 4, 2, 1, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 1, 2, 8, 2, 2, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 1, 3, 9, 2, 3, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 1, 4, 4, 2, 4, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 1, 5, 10, 2, 5, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 1, 6, 2, 2, 6, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 1, 7, 9, 2, 5, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 1, 8, 8, 2, 6, CAST(0x0000A71A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 1, 1, 10, 3, 1, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, 1, 2, 9, 3, 2, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 1, 3, 4, 3, 3, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 1, 4, 2, 3, 4, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 1, 5, 8, 3, 5, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 1, 6, 10, 3, 6, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 1, 7, 2, 3, 1, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 1, 8, 9, 3, 5, CAST(0x0000A71B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, 1, 1, 2, 4, 1, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, 1, 2, 4, 4, 2, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (27, 1, 3, 8, 4, 3, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (28, 1, 4, 9, 4, 4, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, 1, 5, 10, 4, 5, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (30, 1, 6, 8, 4, 6, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (31, 1, 7, 4, 4, 4, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (32, 1, 8, 8, 4, 3, CAST(0x0000A71C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (33, 1, 1, 4, 5, 1, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (34, 1, 2, 8, 5, 2, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (35, 1, 3, 9, 5, 3, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (36, 1, 4, 2, 5, 4, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (37, 1, 5, 9, 5, 6, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (38, 1, 6, 4, 5, 1, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (39, 1, 7, 9, 5, 2, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (40, 1, 8, 2, 5, 4, CAST(0x0000A71D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (41, 1, 1, 2, 1, 1, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (42, 1, 2, 4, 1, 2, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (43, 1, 3, 8, 1, 3, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (44, 1, 4, 9, 1, 4, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (45, 1, 5, 10, 1, 5, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (46, 1, 6, 4, 1, 6, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (47, 1, 7, 10, 1, 3, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (48, 1, 8, 4, 1, 5, CAST(0x0000A72000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (49, 1, 1, 4, 2, 1, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (50, 1, 2, 8, 2, 2, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (51, 1, 3, 9, 2, 3, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (52, 1, 4, 4, 2, 4, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (53, 1, 5, 10, 2, 5, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (54, 1, 6, 2, 2, 6, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (55, 1, 7, 9, 2, 5, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (56, 1, 8, 8, 2, 6, CAST(0x0000A72100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (57, 1, 1, 10, 3, 1, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (58, 1, 2, 9, 3, 2, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (59, 1, 3, 4, 3, 3, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (60, 1, 4, 2, 3, 4, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (61, 1, 5, 8, 3, 5, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (62, 1, 6, 10, 3, 6, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (63, 1, 7, 2, 3, 1, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (64, 1, 8, 9, 3, 5, CAST(0x0000A72200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (65, 1, 1, 2, 4, 1, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (66, 1, 2, 4, 4, 2, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (67, 1, 3, 8, 4, 3, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (68, 1, 4, 9, 4, 4, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (69, 1, 5, 10, 4, 5, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (70, 1, 6, 8, 4, 6, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (71, 1, 7, 4, 4, 4, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (72, 1, 8, 8, 4, 3, CAST(0x0000A72300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (73, 1, 1, 4, 5, 1, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (74, 1, 2, 8, 5, 2, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (75, 1, 3, 9, 5, 3, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (76, 1, 4, 2, 5, 4, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (77, 1, 5, 9, 5, 6, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (78, 1, 6, 4, 5, 1, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (79, 1, 7, 9, 5, 2, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (80, 1, 8, 2, 5, 4, CAST(0x0000A72400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (81, 1, 1, 2, 1, 1, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (82, 1, 2, 4, 1, 2, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (83, 1, 3, 8, 1, 3, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (84, 1, 4, 9, 1, 4, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (85, 1, 5, 10, 1, 5, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (86, 1, 6, 4, 1, 6, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (87, 1, 7, 10, 1, 3, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (88, 1, 8, 4, 1, 5, CAST(0x0000A72700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (89, 1, 1, 4, 2, 1, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (90, 1, 2, 8, 2, 2, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (91, 1, 3, 9, 2, 3, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (92, 1, 4, 4, 2, 4, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (93, 1, 5, 10, 2, 5, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (94, 1, 6, 2, 2, 6, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (95, 1, 7, 9, 2, 5, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (96, 1, 8, 8, 2, 6, CAST(0x0000A72800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (97, 1, 1, 10, 3, 1, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (98, 1, 2, 9, 3, 2, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (99, 1, 3, 4, 3, 3, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (100, 1, 4, 2, 3, 4, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (101, 1, 5, 8, 3, 5, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (102, 1, 6, 10, 3, 6, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (103, 1, 7, 2, 3, 1, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (104, 1, 8, 9, 3, 5, CAST(0x0000A72900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (105, 1, 1, 2, 4, 1, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (106, 1, 2, 4, 4, 2, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (107, 1, 3, 8, 4, 3, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (108, 1, 4, 9, 4, 4, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (109, 1, 5, 10, 4, 5, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (110, 1, 6, 8, 4, 6, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (111, 1, 7, 4, 4, 4, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (112, 1, 8, 8, 4, 3, CAST(0x0000A72A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (113, 1, 1, 4, 5, 1, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (114, 1, 2, 8, 5, 2, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (115, 1, 3, 9, 5, 3, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (116, 1, 4, 2, 5, 4, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (117, 1, 5, 9, 5, 6, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (118, 1, 6, 4, 5, 1, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (119, 1, 7, 9, 5, 2, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (120, 1, 8, 2, 5, 4, CAST(0x0000A72B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (121, 1, 1, 2, 1, 1, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (122, 1, 2, 4, 1, 2, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (123, 1, 3, 8, 1, 3, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (124, 1, 4, 9, 1, 4, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (125, 1, 5, 10, 1, 5, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (126, 1, 6, 4, 1, 6, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (127, 1, 7, 10, 1, 3, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (128, 1, 8, 4, 1, 5, CAST(0x0000A72E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (129, 1, 1, 4, 2, 1, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (130, 1, 2, 8, 2, 2, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (131, 1, 3, 9, 2, 3, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (132, 1, 4, 4, 2, 4, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (133, 1, 5, 10, 2, 5, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (134, 1, 6, 2, 2, 6, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (135, 1, 7, 9, 2, 5, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (136, 1, 8, 8, 2, 6, CAST(0x0000A72F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (137, 1, 1, 10, 3, 1, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (138, 1, 2, 9, 3, 2, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (139, 1, 3, 4, 3, 3, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (140, 1, 4, 2, 3, 4, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (141, 1, 5, 8, 3, 5, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (142, 1, 6, 10, 3, 6, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (143, 1, 7, 2, 3, 1, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (144, 1, 8, 9, 3, 5, CAST(0x0000A73000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (145, 1, 1, 2, 4, 1, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (146, 1, 2, 4, 4, 2, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (147, 1, 3, 8, 4, 3, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (148, 1, 4, 9, 4, 4, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (149, 1, 5, 10, 4, 5, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (150, 1, 6, 8, 4, 6, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (151, 1, 7, 4, 4, 4, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (152, 1, 8, 8, 4, 3, CAST(0x0000A73100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (153, 1, 1, 4, 5, 1, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (154, 1, 2, 8, 5, 2, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (155, 1, 3, 9, 5, 3, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (156, 1, 4, 2, 5, 4, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (157, 1, 5, 9, 5, 6, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (158, 1, 6, 4, 5, 1, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (159, 1, 7, 9, 5, 2, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (160, 1, 8, 2, 5, 4, CAST(0x0000A73200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (161, 1, 1, 2, 1, 1, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (162, 1, 2, 4, 1, 2, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (163, 1, 3, 8, 1, 3, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (164, 1, 4, 9, 1, 4, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (165, 1, 5, 10, 1, 5, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (166, 1, 6, 4, 1, 6, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (167, 1, 7, 10, 1, 3, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (168, 1, 8, 4, 1, 5, CAST(0x0000A73500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (169, 1, 1, 4, 2, 1, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (170, 1, 2, 8, 2, 2, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (171, 1, 3, 9, 2, 3, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (172, 1, 4, 4, 2, 4, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (173, 1, 5, 10, 2, 5, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (174, 1, 6, 2, 2, 6, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (175, 1, 7, 9, 2, 5, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (176, 1, 8, 8, 2, 6, CAST(0x0000A73600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (177, 1, 1, 10, 3, 1, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (178, 1, 2, 9, 3, 2, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (179, 1, 3, 4, 3, 3, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (180, 1, 4, 2, 3, 4, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (181, 1, 5, 8, 3, 5, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (182, 1, 6, 10, 3, 6, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (183, 1, 7, 2, 3, 1, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (184, 1, 8, 9, 3, 5, CAST(0x0000A73700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (185, 1, 1, 2, 4, 1, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (186, 1, 2, 4, 4, 2, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (187, 1, 3, 8, 4, 3, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (188, 1, 4, 9, 4, 4, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (189, 1, 5, 10, 4, 5, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (190, 1, 6, 8, 4, 6, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (191, 1, 7, 4, 4, 4, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (192, 1, 8, 8, 4, 3, CAST(0x0000A73800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (193, 1, 1, 4, 5, 1, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (194, 1, 2, 8, 5, 2, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (195, 1, 3, 9, 5, 3, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (196, 1, 4, 2, 5, 4, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (197, 1, 5, 9, 5, 6, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (198, 1, 6, 4, 5, 1, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (199, 1, 7, 9, 5, 2, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (200, 1, 8, 2, 5, 4, CAST(0x0000A73900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (201, 1, 1, 2, 1, 1, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (202, 1, 2, 4, 1, 2, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (203, 1, 3, 8, 1, 3, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (204, 1, 4, 9, 1, 4, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (205, 1, 5, 10, 1, 5, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (206, 1, 6, 4, 1, 6, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (207, 1, 7, 10, 1, 3, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (208, 1, 8, 4, 1, 5, CAST(0x0000A73C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (209, 1, 1, 4, 2, 1, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (210, 1, 2, 8, 2, 2, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (211, 1, 3, 9, 2, 3, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (212, 1, 4, 4, 2, 4, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (213, 1, 5, 10, 2, 5, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (214, 1, 6, 2, 2, 6, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (215, 1, 7, 9, 2, 5, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (216, 1, 8, 8, 2, 6, CAST(0x0000A73D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (217, 1, 1, 10, 3, 1, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (218, 1, 2, 9, 3, 2, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (219, 1, 3, 4, 3, 3, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (220, 1, 4, 2, 3, 4, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (221, 1, 5, 8, 3, 5, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (222, 1, 6, 10, 3, 6, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (223, 1, 7, 2, 3, 1, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (224, 1, 8, 9, 3, 5, CAST(0x0000A73E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (225, 1, 1, 2, 4, 1, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (226, 1, 2, 4, 4, 2, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (227, 1, 3, 8, 4, 3, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (228, 1, 4, 9, 4, 4, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (229, 1, 5, 10, 4, 5, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (230, 1, 6, 8, 4, 6, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (231, 1, 7, 4, 4, 4, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (232, 1, 8, 8, 4, 3, CAST(0x0000A73F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (233, 1, 1, 4, 5, 1, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (234, 1, 2, 8, 5, 2, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (235, 1, 3, 9, 5, 3, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (236, 1, 4, 2, 5, 4, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (237, 1, 5, 9, 5, 6, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (238, 1, 6, 4, 5, 1, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (239, 1, 7, 9, 5, 2, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (240, 1, 8, 2, 5, 4, CAST(0x0000A74000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (241, 1, 1, 2, 1, 1, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (242, 1, 2, 4, 1, 2, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (243, 1, 3, 8, 1, 3, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (244, 1, 4, 9, 1, 4, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (245, 1, 5, 10, 1, 5, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (246, 1, 6, 4, 1, 6, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (247, 1, 7, 10, 1, 3, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (248, 1, 8, 4, 1, 5, CAST(0x0000A74300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (249, 1, 1, 4, 2, 1, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (250, 1, 2, 8, 2, 2, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (251, 1, 3, 9, 2, 3, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (252, 1, 4, 4, 2, 4, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (253, 1, 5, 10, 2, 5, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (254, 1, 6, 2, 2, 6, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (255, 1, 7, 9, 2, 5, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (256, 1, 8, 8, 2, 6, CAST(0x0000A74400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (257, 1, 1, 10, 3, 1, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (258, 1, 2, 9, 3, 2, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (259, 1, 3, 4, 3, 3, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (260, 1, 4, 2, 3, 4, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (261, 1, 5, 8, 3, 5, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (262, 1, 6, 10, 3, 6, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (263, 1, 7, 2, 3, 1, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (264, 1, 8, 9, 3, 5, CAST(0x0000A74500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (265, 1, 1, 2, 4, 1, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (266, 1, 2, 4, 4, 2, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (267, 1, 3, 8, 4, 3, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (268, 1, 4, 9, 4, 4, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (269, 1, 5, 10, 4, 5, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (270, 1, 6, 8, 4, 6, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (271, 1, 7, 4, 4, 4, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (272, 1, 8, 8, 4, 3, CAST(0x0000A74600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (273, 1, 1, 4, 5, 1, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (274, 1, 2, 8, 5, 2, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (275, 1, 3, 9, 5, 3, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (276, 1, 4, 2, 5, 4, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (277, 1, 5, 9, 5, 6, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (278, 1, 6, 4, 5, 1, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (279, 1, 7, 9, 5, 2, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (280, 1, 8, 2, 5, 4, CAST(0x0000A74700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (281, 1, 1, 2, 1, 1, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (282, 1, 2, 4, 1, 2, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (283, 1, 3, 8, 1, 3, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (284, 1, 4, 9, 1, 4, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (285, 1, 5, 10, 1, 5, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (286, 1, 6, 4, 1, 6, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (287, 1, 7, 10, 1, 3, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (288, 1, 8, 4, 1, 5, CAST(0x0000A74A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (289, 1, 1, 4, 2, 1, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (290, 1, 2, 8, 2, 2, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (291, 1, 3, 9, 2, 3, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (292, 1, 4, 4, 2, 4, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (293, 1, 5, 10, 2, 5, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (294, 1, 6, 2, 2, 6, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (295, 1, 7, 9, 2, 5, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (296, 1, 8, 8, 2, 6, CAST(0x0000A74B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (297, 1, 1, 10, 3, 1, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (298, 1, 2, 9, 3, 2, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (299, 1, 3, 4, 3, 3, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (300, 1, 4, 2, 3, 4, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (301, 1, 5, 8, 3, 5, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (302, 1, 6, 10, 3, 6, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (303, 1, 7, 2, 3, 1, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (304, 1, 8, 9, 3, 5, CAST(0x0000A74C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (305, 1, 1, 2, 4, 1, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (306, 1, 2, 4, 4, 2, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (307, 1, 3, 8, 4, 3, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (308, 1, 4, 9, 4, 4, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (309, 1, 5, 10, 4, 5, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (310, 1, 6, 8, 4, 6, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (311, 1, 7, 4, 4, 4, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (312, 1, 8, 8, 4, 3, CAST(0x0000A74D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (313, 1, 1, 4, 5, 1, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (314, 1, 2, 8, 5, 2, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (315, 1, 3, 9, 5, 3, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (316, 1, 4, 2, 5, 4, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (317, 1, 5, 9, 5, 6, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (318, 1, 6, 4, 5, 1, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (319, 1, 7, 9, 5, 2, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (320, 1, 8, 2, 5, 4, CAST(0x0000A74E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (321, 1, 1, 2, 1, 1, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (322, 1, 2, 4, 1, 2, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (323, 1, 3, 8, 1, 3, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (324, 1, 4, 9, 1, 4, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (325, 1, 5, 10, 1, 5, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (326, 1, 6, 4, 1, 6, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (327, 1, 7, 10, 1, 3, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (328, 1, 8, 4, 1, 5, CAST(0x0000A75100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (329, 1, 1, 4, 2, 1, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (330, 1, 2, 8, 2, 2, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (331, 1, 3, 9, 2, 3, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (332, 1, 4, 4, 2, 4, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (333, 1, 5, 10, 2, 5, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (334, 1, 6, 2, 2, 6, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (335, 1, 7, 9, 2, 5, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (336, 1, 8, 8, 2, 6, CAST(0x0000A75200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (337, 1, 1, 10, 3, 1, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (338, 1, 2, 9, 3, 2, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (339, 1, 3, 4, 3, 3, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (340, 1, 4, 2, 3, 4, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (341, 1, 5, 8, 3, 5, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (342, 1, 6, 10, 3, 6, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (343, 1, 7, 2, 3, 1, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (344, 1, 8, 9, 3, 5, CAST(0x0000A75300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (345, 1, 1, 2, 4, 1, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (346, 1, 2, 4, 4, 2, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (347, 1, 3, 8, 4, 3, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (348, 1, 4, 9, 4, 4, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (349, 1, 5, 10, 4, 5, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (350, 1, 6, 8, 4, 6, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (351, 1, 7, 4, 4, 4, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (352, 1, 8, 8, 4, 3, CAST(0x0000A75400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (353, 1, 1, 4, 5, 1, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (354, 1, 2, 8, 5, 2, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (355, 1, 3, 9, 5, 3, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (356, 1, 4, 2, 5, 4, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (357, 1, 5, 9, 5, 6, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (358, 1, 6, 4, 5, 1, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (359, 1, 7, 9, 5, 2, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (360, 1, 8, 2, 5, 4, CAST(0x0000A75500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (361, 1, 1, 2, 1, 1, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (362, 1, 2, 4, 1, 2, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (363, 1, 3, 8, 1, 3, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (364, 1, 4, 9, 1, 4, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (365, 1, 5, 10, 1, 5, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (366, 1, 6, 4, 1, 6, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (367, 1, 7, 10, 1, 3, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (368, 1, 8, 4, 1, 5, CAST(0x0000A75800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (369, 1, 1, 4, 2, 1, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (370, 1, 2, 8, 2, 2, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (371, 1, 3, 9, 2, 3, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (372, 1, 4, 4, 2, 4, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (373, 1, 5, 10, 2, 5, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (374, 1, 6, 2, 2, 6, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (375, 1, 7, 9, 2, 5, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (376, 1, 8, 8, 2, 6, CAST(0x0000A75900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (377, 1, 1, 10, 3, 1, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (378, 1, 2, 9, 3, 2, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (379, 1, 3, 4, 3, 3, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (380, 1, 4, 2, 3, 4, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (381, 1, 5, 8, 3, 5, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (382, 1, 6, 10, 3, 6, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (383, 1, 7, 2, 3, 1, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (384, 1, 8, 9, 3, 5, CAST(0x0000A75A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (385, 1, 1, 2, 4, 1, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (386, 1, 2, 4, 4, 2, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (387, 1, 3, 8, 4, 3, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (388, 1, 4, 9, 4, 4, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (389, 1, 5, 10, 4, 5, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (390, 1, 6, 8, 4, 6, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (391, 1, 7, 4, 4, 4, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (392, 1, 8, 8, 4, 3, CAST(0x0000A75B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (393, 1, 1, 4, 5, 1, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (394, 1, 2, 8, 5, 2, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (395, 1, 3, 9, 5, 3, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (396, 1, 4, 2, 5, 4, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (397, 1, 5, 9, 5, 6, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (398, 1, 6, 4, 5, 1, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (399, 1, 7, 9, 5, 2, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (400, 1, 8, 2, 5, 4, CAST(0x0000A75C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (401, 1, 1, 2, 1, 1, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (402, 1, 2, 4, 1, 2, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (403, 1, 3, 8, 1, 3, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (404, 1, 4, 9, 1, 4, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (405, 1, 5, 10, 1, 5, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (406, 1, 6, 4, 1, 6, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (407, 1, 7, 10, 1, 3, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (408, 1, 8, 4, 1, 5, CAST(0x0000A75F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (409, 1, 1, 4, 2, 1, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (410, 1, 2, 8, 2, 2, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (411, 1, 3, 9, 2, 3, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (412, 1, 4, 4, 2, 4, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (413, 1, 5, 10, 2, 5, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (414, 1, 6, 2, 2, 6, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (415, 1, 7, 9, 2, 5, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (416, 1, 8, 8, 2, 6, CAST(0x0000A76000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (417, 1, 1, 10, 3, 1, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (418, 1, 2, 9, 3, 2, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (419, 1, 3, 4, 3, 3, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (420, 1, 4, 2, 3, 4, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (421, 1, 5, 8, 3, 5, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (422, 1, 6, 10, 3, 6, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (423, 1, 7, 2, 3, 1, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (424, 1, 8, 9, 3, 5, CAST(0x0000A76100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (425, 1, 1, 2, 4, 1, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (426, 1, 2, 4, 4, 2, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (427, 1, 3, 8, 4, 3, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (428, 1, 4, 9, 4, 4, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (429, 1, 5, 10, 4, 5, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (430, 1, 6, 8, 4, 6, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (431, 1, 7, 4, 4, 4, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (432, 1, 8, 8, 4, 3, CAST(0x0000A76200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (433, 1, 1, 4, 5, 1, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (434, 1, 2, 8, 5, 2, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (435, 1, 3, 9, 5, 3, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (436, 1, 4, 2, 5, 4, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (437, 1, 5, 9, 5, 6, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (438, 1, 6, 4, 5, 1, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (439, 1, 7, 9, 5, 2, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (440, 1, 8, 2, 5, 4, CAST(0x0000A76300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (441, 1, 1, 2, 1, 1, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (442, 1, 2, 4, 1, 2, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (443, 1, 3, 8, 1, 3, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (444, 1, 4, 9, 1, 4, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (445, 1, 5, 10, 1, 5, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (446, 1, 6, 4, 1, 6, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (447, 1, 7, 10, 1, 3, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (448, 1, 8, 4, 1, 5, CAST(0x0000A76600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (449, 1, 1, 4, 2, 1, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (450, 1, 2, 8, 2, 2, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (451, 1, 3, 9, 2, 3, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (452, 1, 4, 4, 2, 4, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (453, 1, 5, 10, 2, 5, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (454, 1, 6, 2, 2, 6, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (455, 1, 7, 9, 2, 5, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (456, 1, 8, 8, 2, 6, CAST(0x0000A76700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (457, 1, 1, 10, 3, 1, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (458, 1, 2, 9, 3, 2, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (459, 1, 3, 4, 3, 3, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (460, 1, 4, 2, 3, 4, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (461, 1, 5, 8, 3, 5, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (462, 1, 6, 10, 3, 6, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (463, 1, 7, 2, 3, 1, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (464, 1, 8, 9, 3, 5, CAST(0x0000A76800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (465, 1, 1, 2, 4, 1, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (466, 1, 2, 4, 4, 2, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (467, 1, 3, 8, 4, 3, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (468, 1, 4, 9, 4, 4, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (469, 1, 5, 10, 4, 5, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (470, 1, 6, 8, 4, 6, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (471, 1, 7, 4, 4, 4, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (472, 1, 8, 8, 4, 3, CAST(0x0000A76900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (473, 1, 1, 4, 5, 1, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (474, 1, 2, 8, 5, 2, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (475, 1, 3, 9, 5, 3, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (476, 1, 4, 2, 5, 4, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (477, 1, 5, 9, 5, 6, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (478, 1, 6, 4, 5, 1, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (479, 1, 7, 9, 5, 2, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (480, 1, 8, 2, 5, 4, CAST(0x0000A76A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (481, 1, 1, 2, 1, 1, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (482, 1, 2, 4, 1, 2, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (483, 1, 3, 8, 1, 3, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (484, 1, 4, 9, 1, 4, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (485, 1, 5, 10, 1, 5, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (486, 1, 6, 4, 1, 6, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (487, 1, 7, 10, 1, 3, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (488, 1, 8, 4, 1, 5, CAST(0x0000A76D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (489, 1, 1, 4, 2, 1, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (490, 1, 2, 8, 2, 2, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (491, 1, 3, 9, 2, 3, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (492, 1, 4, 4, 2, 4, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (493, 1, 5, 10, 2, 5, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (494, 1, 6, 2, 2, 6, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (495, 1, 7, 9, 2, 5, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (496, 1, 8, 8, 2, 6, CAST(0x0000A76E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (497, 1, 1, 10, 3, 1, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (498, 1, 2, 9, 3, 2, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (499, 1, 3, 4, 3, 3, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (500, 1, 4, 2, 3, 4, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (501, 1, 5, 8, 3, 5, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (502, 1, 6, 10, 3, 6, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (503, 1, 7, 2, 3, 1, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (504, 1, 8, 9, 3, 5, CAST(0x0000A76F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (505, 1, 1, 2, 4, 1, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (506, 1, 2, 4, 4, 2, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (507, 1, 3, 8, 4, 3, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (508, 1, 4, 9, 4, 4, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (509, 1, 5, 10, 4, 5, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (510, 1, 6, 8, 4, 6, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (511, 1, 7, 4, 4, 4, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (512, 1, 8, 8, 4, 3, CAST(0x0000A77000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (513, 1, 1, 4, 5, 1, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (514, 1, 2, 8, 5, 2, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (515, 1, 3, 9, 5, 3, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (516, 1, 4, 2, 5, 4, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (517, 1, 5, 9, 5, 6, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (518, 1, 6, 4, 5, 1, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (519, 1, 7, 9, 5, 2, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (520, 1, 8, 2, 5, 4, CAST(0x0000A77100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (521, 1, 1, 2, 1, 1, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (522, 1, 2, 4, 1, 2, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (523, 1, 3, 8, 1, 3, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (524, 1, 4, 9, 1, 4, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (525, 1, 5, 10, 1, 5, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (526, 1, 6, 4, 1, 6, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (527, 1, 7, 10, 1, 3, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (528, 1, 8, 4, 1, 5, CAST(0x0000A77400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (529, 1, 1, 4, 2, 1, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (530, 1, 2, 8, 2, 2, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (531, 1, 3, 9, 2, 3, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (532, 1, 4, 4, 2, 4, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (533, 1, 5, 10, 2, 5, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (534, 1, 6, 2, 2, 6, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (535, 1, 7, 9, 2, 5, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (536, 1, 8, 8, 2, 6, CAST(0x0000A77500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (537, 1, 1, 10, 3, 1, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (538, 1, 2, 9, 3, 2, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (539, 1, 3, 4, 3, 3, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (540, 1, 4, 2, 3, 4, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (541, 1, 5, 8, 3, 5, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (542, 1, 6, 10, 3, 6, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (543, 1, 7, 2, 3, 1, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (544, 1, 8, 9, 3, 5, CAST(0x0000A77600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (545, 1, 1, 2, 4, 1, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (546, 1, 2, 4, 4, 2, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (547, 1, 3, 8, 4, 3, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (548, 1, 4, 9, 4, 4, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (549, 1, 5, 10, 4, 5, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (550, 1, 6, 8, 4, 6, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (551, 1, 7, 4, 4, 4, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (552, 1, 8, 8, 4, 3, CAST(0x0000A77700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (553, 1, 1, 4, 5, 1, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (554, 1, 2, 8, 5, 2, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (555, 1, 3, 9, 5, 3, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (556, 1, 4, 2, 5, 4, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (557, 1, 5, 9, 5, 6, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (558, 1, 6, 4, 5, 1, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (559, 1, 7, 9, 5, 2, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (560, 1, 8, 2, 5, 4, CAST(0x0000A77800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (561, 1, 1, 2, 1, 1, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (562, 1, 2, 4, 1, 2, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (563, 1, 3, 8, 1, 3, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (564, 1, 4, 9, 1, 4, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (565, 1, 5, 10, 1, 5, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (566, 1, 6, 4, 1, 6, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (567, 1, 7, 10, 1, 3, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (568, 1, 8, 4, 1, 5, CAST(0x0000A77B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (569, 1, 1, 4, 2, 1, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (570, 1, 2, 8, 2, 2, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (571, 1, 3, 9, 2, 3, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (572, 1, 4, 4, 2, 4, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (573, 1, 5, 10, 2, 5, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (574, 1, 6, 2, 2, 6, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (575, 1, 7, 9, 2, 5, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (576, 1, 8, 8, 2, 6, CAST(0x0000A77C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (577, 1, 1, 10, 3, 1, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (578, 1, 2, 9, 3, 2, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (579, 1, 3, 4, 3, 3, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (580, 1, 4, 2, 3, 4, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (581, 1, 5, 8, 3, 5, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (582, 1, 6, 10, 3, 6, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (583, 1, 7, 2, 3, 1, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (584, 1, 8, 9, 3, 5, CAST(0x0000A77D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (585, 1, 1, 2, 4, 1, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (586, 1, 2, 4, 4, 2, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (587, 1, 3, 8, 4, 3, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (588, 1, 4, 9, 4, 4, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (589, 1, 5, 10, 4, 5, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (590, 1, 6, 8, 4, 6, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (591, 1, 7, 4, 4, 4, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (592, 1, 8, 8, 4, 3, CAST(0x0000A77E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (593, 1, 1, 4, 5, 1, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (594, 1, 2, 8, 5, 2, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (595, 1, 3, 9, 5, 3, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (596, 1, 4, 2, 5, 4, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (597, 1, 5, 9, 5, 6, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (598, 1, 6, 4, 5, 1, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (599, 1, 7, 9, 5, 2, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (600, 1, 8, 2, 5, 4, CAST(0x0000A77F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (601, 1, 1, 2, 1, 1, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (602, 1, 2, 4, 1, 2, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (603, 1, 3, 8, 1, 3, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (604, 1, 4, 9, 1, 4, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (605, 1, 5, 10, 1, 5, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (606, 1, 6, 4, 1, 6, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (607, 1, 7, 10, 1, 3, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (608, 1, 8, 4, 1, 5, CAST(0x0000A78200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (609, 1, 1, 4, 2, 1, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (610, 1, 2, 8, 2, 2, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (611, 1, 3, 9, 2, 3, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (612, 1, 4, 4, 2, 4, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (613, 1, 5, 10, 2, 5, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (614, 1, 6, 2, 2, 6, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (615, 1, 7, 9, 2, 5, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (616, 1, 8, 8, 2, 6, CAST(0x0000A78300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (617, 1, 1, 10, 3, 1, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (618, 1, 2, 9, 3, 2, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (619, 1, 3, 4, 3, 3, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (620, 1, 4, 2, 3, 4, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (621, 1, 5, 8, 3, 5, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (622, 1, 6, 10, 3, 6, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (623, 1, 7, 2, 3, 1, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (624, 1, 8, 9, 3, 5, CAST(0x0000A78400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (625, 1, 1, 2, 4, 1, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (626, 1, 2, 4, 4, 2, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (627, 1, 3, 8, 4, 3, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (628, 1, 4, 9, 4, 4, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (629, 1, 5, 10, 4, 5, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (630, 1, 6, 8, 4, 6, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (631, 1, 7, 4, 4, 4, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (632, 1, 8, 8, 4, 3, CAST(0x0000A78500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (633, 1, 1, 4, 5, 1, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (634, 1, 2, 8, 5, 2, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (635, 1, 3, 9, 5, 3, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (636, 1, 4, 2, 5, 4, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (637, 1, 5, 9, 5, 6, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (638, 1, 6, 4, 5, 1, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (639, 1, 7, 9, 5, 2, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (640, 1, 8, 2, 5, 4, CAST(0x0000A78600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (641, 1, 1, 2, 1, 1, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (642, 1, 2, 4, 1, 2, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (643, 1, 3, 8, 1, 3, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (644, 1, 4, 9, 1, 4, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (645, 1, 5, 10, 1, 5, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (646, 1, 6, 4, 1, 6, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (647, 1, 7, 10, 1, 3, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (648, 1, 8, 4, 1, 5, CAST(0x0000A78900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (649, 1, 1, 4, 2, 1, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (650, 1, 2, 8, 2, 2, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (651, 1, 3, 9, 2, 3, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (652, 1, 4, 4, 2, 4, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (653, 1, 5, 10, 2, 5, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (654, 1, 6, 2, 2, 6, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (655, 1, 7, 9, 2, 5, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (656, 1, 8, 8, 2, 6, CAST(0x0000A78A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (657, 1, 1, 10, 3, 1, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (658, 1, 2, 9, 3, 2, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (659, 1, 3, 4, 3, 3, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (660, 1, 4, 2, 3, 4, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (661, 1, 5, 8, 3, 5, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (662, 1, 6, 10, 3, 6, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (663, 1, 7, 2, 3, 1, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (664, 1, 8, 9, 3, 5, CAST(0x0000A78B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (665, 1, 1, 2, 4, 1, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (666, 1, 2, 4, 4, 2, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (667, 1, 3, 8, 4, 3, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (668, 1, 4, 9, 4, 4, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (669, 1, 5, 10, 4, 5, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (670, 1, 6, 8, 4, 6, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (671, 1, 7, 4, 4, 4, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (672, 1, 8, 8, 4, 3, CAST(0x0000A78C00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (673, 1, 1, 4, 5, 1, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (674, 1, 2, 8, 5, 2, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (675, 1, 3, 9, 5, 3, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (676, 1, 4, 2, 5, 4, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (677, 1, 5, 9, 5, 6, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (678, 1, 6, 4, 5, 1, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (679, 1, 7, 9, 5, 2, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (680, 1, 8, 2, 5, 4, CAST(0x0000A78D00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (681, 1, 1, 2, 1, 1, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (682, 1, 2, 4, 1, 2, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (683, 1, 3, 8, 1, 3, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (684, 1, 4, 9, 1, 4, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (685, 1, 5, 10, 1, 5, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (686, 1, 6, 4, 1, 6, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (687, 1, 7, 10, 1, 3, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (688, 1, 8, 4, 1, 5, CAST(0x0000A79000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (689, 1, 1, 4, 2, 1, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (690, 1, 2, 8, 2, 2, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (691, 1, 3, 9, 2, 3, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (692, 1, 4, 4, 2, 4, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (693, 1, 5, 10, 2, 5, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (694, 1, 6, 2, 2, 6, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (695, 1, 7, 9, 2, 5, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (696, 1, 8, 8, 2, 6, CAST(0x0000A79100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (697, 1, 1, 10, 3, 1, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (698, 1, 2, 9, 3, 2, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (699, 1, 3, 4, 3, 3, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (700, 1, 4, 2, 3, 4, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (701, 1, 5, 8, 3, 5, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (702, 1, 6, 10, 3, 6, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (703, 1, 7, 2, 3, 1, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (704, 1, 8, 9, 3, 5, CAST(0x0000A79200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (705, 1, 1, 2, 4, 1, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (706, 1, 2, 4, 4, 2, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (707, 1, 3, 8, 4, 3, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (708, 1, 4, 9, 4, 4, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (709, 1, 5, 10, 4, 5, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (710, 1, 6, 8, 4, 6, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (711, 1, 7, 4, 4, 4, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (712, 1, 8, 8, 4, 3, CAST(0x0000A79300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (713, 1, 1, 4, 5, 1, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (714, 1, 2, 8, 5, 2, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (715, 1, 3, 9, 5, 3, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (716, 1, 4, 2, 5, 4, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (717, 1, 5, 9, 5, 6, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (718, 1, 6, 4, 5, 1, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (719, 1, 7, 9, 5, 2, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (720, 1, 8, 2, 5, 4, CAST(0x0000A79400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (721, 1, 1, 2, 1, 1, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (722, 1, 2, 4, 1, 2, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (723, 1, 3, 8, 1, 3, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (724, 1, 4, 9, 1, 4, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (725, 1, 5, 10, 1, 5, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (726, 1, 6, 4, 1, 6, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (727, 1, 7, 10, 1, 3, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (728, 1, 8, 4, 1, 5, CAST(0x0000A79700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (729, 1, 1, 4, 2, 1, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (730, 1, 2, 8, 2, 2, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (731, 1, 3, 9, 2, 3, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (732, 1, 4, 4, 2, 4, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (733, 1, 5, 10, 2, 5, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (734, 1, 6, 2, 2, 6, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (735, 1, 7, 9, 2, 5, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (736, 1, 8, 8, 2, 6, CAST(0x0000A79800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (737, 1, 1, 10, 3, 1, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (738, 1, 2, 9, 3, 2, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (739, 1, 3, 4, 3, 3, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (740, 1, 4, 2, 3, 4, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (741, 1, 5, 8, 3, 5, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (742, 1, 6, 10, 3, 6, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (743, 1, 7, 2, 3, 1, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (744, 1, 8, 9, 3, 5, CAST(0x0000A79900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (745, 1, 1, 2, 4, 1, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (746, 1, 2, 4, 4, 2, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (747, 1, 3, 8, 4, 3, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (748, 1, 4, 9, 4, 4, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (749, 1, 5, 10, 4, 5, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (750, 1, 6, 8, 4, 6, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (751, 1, 7, 4, 4, 4, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (752, 1, 8, 8, 4, 3, CAST(0x0000A79A00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (753, 1, 1, 4, 5, 1, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (754, 1, 2, 8, 5, 2, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (755, 1, 3, 9, 5, 3, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (756, 1, 4, 2, 5, 4, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (757, 1, 5, 9, 5, 6, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (758, 1, 6, 4, 5, 1, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (759, 1, 7, 9, 5, 2, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (760, 1, 8, 2, 5, 4, CAST(0x0000A79B00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (761, 1, 1, 2, 1, 1, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (762, 1, 2, 4, 1, 2, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (763, 1, 3, 8, 1, 3, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (764, 1, 4, 9, 1, 4, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (765, 1, 5, 10, 1, 5, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (766, 1, 6, 4, 1, 6, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (767, 1, 7, 10, 1, 3, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (768, 1, 8, 4, 1, 5, CAST(0x0000A79E00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (769, 1, 1, 4, 2, 1, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (770, 1, 2, 8, 2, 2, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (771, 1, 3, 9, 2, 3, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (772, 1, 4, 4, 2, 4, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (773, 1, 5, 10, 2, 5, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (774, 1, 6, 2, 2, 6, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (775, 1, 7, 9, 2, 5, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (776, 1, 8, 8, 2, 6, CAST(0x0000A79F00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (777, 1, 1, 10, 3, 1, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (778, 1, 2, 9, 3, 2, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (779, 1, 3, 4, 3, 3, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (780, 1, 4, 2, 3, 4, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (781, 1, 5, 8, 3, 5, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (782, 1, 6, 10, 3, 6, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (783, 1, 7, 2, 3, 1, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (784, 1, 8, 9, 3, 5, CAST(0x0000A7A000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (785, 1, 1, 2, 4, 1, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (786, 1, 2, 4, 4, 2, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (787, 1, 3, 8, 4, 3, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (788, 1, 4, 9, 4, 4, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (789, 1, 5, 10, 4, 5, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (790, 1, 6, 8, 4, 6, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (791, 1, 7, 4, 4, 4, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (792, 1, 8, 8, 4, 3, CAST(0x0000A7A100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (793, 1, 1, 4, 5, 1, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (794, 1, 2, 8, 5, 2, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (795, 1, 3, 9, 5, 3, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (796, 1, 4, 2, 5, 4, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (797, 1, 5, 9, 5, 6, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (798, 1, 6, 4, 5, 1, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (799, 1, 7, 9, 5, 2, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (800, 1, 8, 2, 5, 4, CAST(0x0000A7A200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (801, 1, 1, 2, 1, 1, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (802, 1, 2, 4, 1, 2, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (803, 1, 3, 8, 1, 3, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (804, 1, 4, 9, 1, 4, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (805, 1, 5, 10, 1, 5, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (806, 1, 6, 4, 1, 6, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (807, 1, 7, 10, 1, 3, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (808, 1, 8, 4, 1, 5, CAST(0x0000A7A500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (809, 1, 1, 4, 2, 1, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (810, 1, 2, 8, 2, 2, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (811, 1, 3, 9, 2, 3, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (812, 1, 4, 4, 2, 4, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (813, 1, 5, 10, 2, 5, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (814, 1, 6, 2, 2, 6, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (815, 1, 7, 9, 2, 5, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (816, 1, 8, 8, 2, 6, CAST(0x0000A7A600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (817, 1, 1, 10, 3, 1, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (818, 1, 2, 9, 3, 2, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (819, 1, 3, 4, 3, 3, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (820, 1, 4, 2, 3, 4, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (821, 1, 5, 8, 3, 5, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (822, 1, 6, 10, 3, 6, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (823, 1, 7, 2, 3, 1, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (824, 1, 8, 9, 3, 5, CAST(0x0000A7A700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (825, 1, 1, 2, 4, 1, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (826, 1, 2, 4, 4, 2, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (827, 1, 3, 8, 4, 3, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (828, 1, 4, 9, 4, 4, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (829, 1, 5, 10, 4, 5, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (830, 1, 6, 8, 4, 6, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (831, 1, 7, 4, 4, 4, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (832, 1, 8, 8, 4, 3, CAST(0x0000A7A800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (833, 1, 1, 4, 5, 1, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (834, 1, 2, 8, 5, 2, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (835, 1, 3, 9, 5, 3, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (836, 1, 4, 2, 5, 4, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (837, 1, 5, 9, 5, 6, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (838, 1, 6, 4, 5, 1, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (839, 1, 7, 9, 5, 2, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (840, 1, 8, 2, 5, 4, CAST(0x0000A7A900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (841, 1, 1, 2, 1, 1, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (842, 1, 2, 4, 1, 2, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (843, 1, 3, 8, 1, 3, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (844, 1, 4, 9, 1, 4, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (845, 1, 5, 10, 1, 5, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (846, 1, 6, 4, 1, 6, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (847, 1, 7, 10, 1, 3, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (848, 1, 8, 4, 1, 5, CAST(0x0000A7AC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (849, 1, 1, 4, 2, 1, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (850, 1, 2, 8, 2, 2, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (851, 1, 3, 9, 2, 3, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (852, 1, 4, 4, 2, 4, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (853, 1, 5, 10, 2, 5, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (854, 1, 6, 2, 2, 6, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (855, 1, 7, 9, 2, 5, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (856, 1, 8, 8, 2, 6, CAST(0x0000A7AD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (857, 1, 1, 10, 3, 1, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (858, 1, 2, 9, 3, 2, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (859, 1, 3, 4, 3, 3, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (860, 1, 4, 2, 3, 4, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (861, 1, 5, 8, 3, 5, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (862, 1, 6, 10, 3, 6, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (863, 1, 7, 2, 3, 1, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (864, 1, 8, 9, 3, 5, CAST(0x0000A7AE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (865, 1, 1, 2, 4, 1, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (866, 1, 2, 4, 4, 2, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (867, 1, 3, 8, 4, 3, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (868, 1, 4, 9, 4, 4, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (869, 1, 5, 10, 4, 5, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (870, 1, 6, 8, 4, 6, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (871, 1, 7, 4, 4, 4, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (872, 1, 8, 8, 4, 3, CAST(0x0000A7AF00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (873, 1, 1, 4, 5, 1, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (874, 1, 2, 8, 5, 2, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (875, 1, 3, 9, 5, 3, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (876, 1, 4, 2, 5, 4, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (877, 1, 5, 9, 5, 6, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (878, 1, 6, 4, 5, 1, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (879, 1, 7, 9, 5, 2, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (880, 1, 8, 2, 5, 4, CAST(0x0000A7B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (881, 1, 1, 2, 1, 1, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (882, 1, 2, 4, 1, 2, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (883, 1, 3, 8, 1, 3, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (884, 1, 4, 9, 1, 4, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (885, 1, 5, 10, 1, 5, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (886, 1, 6, 4, 1, 6, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (887, 1, 7, 10, 1, 3, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (888, 1, 8, 4, 1, 5, CAST(0x0000A7B300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (889, 1, 1, 4, 2, 1, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (890, 1, 2, 8, 2, 2, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (891, 1, 3, 9, 2, 3, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (892, 1, 4, 4, 2, 4, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (893, 1, 5, 10, 2, 5, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (894, 1, 6, 2, 2, 6, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (895, 1, 7, 9, 2, 5, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (896, 1, 8, 8, 2, 6, CAST(0x0000A7B400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (897, 1, 1, 10, 3, 1, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (898, 1, 2, 9, 3, 2, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (899, 1, 3, 4, 3, 3, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (900, 1, 4, 2, 3, 4, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (901, 1, 5, 8, 3, 5, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (902, 1, 6, 10, 3, 6, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (903, 1, 7, 2, 3, 1, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (904, 1, 8, 9, 3, 5, CAST(0x0000A7B500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (905, 1, 1, 2, 4, 1, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (906, 1, 2, 4, 4, 2, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (907, 1, 3, 8, 4, 3, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (908, 1, 4, 9, 4, 4, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (909, 1, 5, 10, 4, 5, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (910, 1, 6, 8, 4, 6, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (911, 1, 7, 4, 4, 4, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (912, 1, 8, 8, 4, 3, CAST(0x0000A7B600000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (913, 1, 1, 4, 5, 1, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (914, 1, 2, 8, 5, 2, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (915, 1, 3, 9, 5, 3, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (916, 1, 4, 2, 5, 4, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (917, 1, 5, 9, 5, 6, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (918, 1, 6, 4, 5, 1, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (919, 1, 7, 9, 5, 2, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (920, 1, 8, 2, 5, 4, CAST(0x0000A7B700000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (921, 1, 1, 2, 1, 1, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (922, 1, 2, 4, 1, 2, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (923, 1, 3, 8, 1, 3, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (924, 1, 4, 9, 1, 4, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (925, 1, 5, 10, 1, 5, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (926, 1, 6, 4, 1, 6, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (927, 1, 7, 10, 1, 3, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (928, 1, 8, 4, 1, 5, CAST(0x0000A7BA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (929, 1, 1, 4, 2, 1, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (930, 1, 2, 8, 2, 2, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (931, 1, 3, 9, 2, 3, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (932, 1, 4, 4, 2, 4, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (933, 1, 5, 10, 2, 5, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (934, 1, 6, 2, 2, 6, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (935, 1, 7, 9, 2, 5, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (936, 1, 8, 8, 2, 6, CAST(0x0000A7BB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (937, 1, 1, 10, 3, 1, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (938, 1, 2, 9, 3, 2, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (939, 1, 3, 4, 3, 3, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (940, 1, 4, 2, 3, 4, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (941, 1, 5, 8, 3, 5, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (942, 1, 6, 10, 3, 6, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (943, 1, 7, 2, 3, 1, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (944, 1, 8, 9, 3, 5, CAST(0x0000A7BC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (945, 1, 1, 2, 4, 1, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (946, 1, 2, 4, 4, 2, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (947, 1, 3, 8, 4, 3, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (948, 1, 4, 9, 4, 4, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (949, 1, 5, 10, 4, 5, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (950, 1, 6, 8, 4, 6, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (951, 1, 7, 4, 4, 4, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (952, 1, 8, 8, 4, 3, CAST(0x0000A7BD00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (953, 1, 1, 4, 5, 1, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (954, 1, 2, 8, 5, 2, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (955, 1, 3, 9, 5, 3, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (956, 1, 4, 2, 5, 4, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (957, 1, 5, 9, 5, 6, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (958, 1, 6, 4, 5, 1, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (959, 1, 7, 9, 5, 2, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (960, 1, 8, 2, 5, 4, CAST(0x0000A7BE00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (961, 1, 1, 2, 1, 1, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (962, 1, 2, 4, 1, 2, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (963, 1, 3, 8, 1, 3, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (964, 1, 4, 9, 1, 4, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (965, 1, 5, 10, 1, 5, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (966, 1, 6, 4, 1, 6, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (967, 1, 7, 10, 1, 3, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (968, 1, 8, 4, 1, 5, CAST(0x0000A7C100000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (969, 1, 1, 4, 2, 1, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (970, 1, 2, 8, 2, 2, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (971, 1, 3, 9, 2, 3, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (972, 1, 4, 4, 2, 4, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (973, 1, 5, 10, 2, 5, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (974, 1, 6, 2, 2, 6, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (975, 1, 7, 9, 2, 5, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (976, 1, 8, 8, 2, 6, CAST(0x0000A7C200000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (977, 1, 1, 10, 3, 1, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (978, 1, 2, 9, 3, 2, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (979, 1, 3, 4, 3, 3, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (980, 1, 4, 2, 3, 4, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (981, 1, 5, 8, 3, 5, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (982, 1, 6, 10, 3, 6, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (983, 1, 7, 2, 3, 1, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (984, 1, 8, 9, 3, 5, CAST(0x0000A7C300000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (985, 1, 1, 2, 4, 1, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (986, 1, 2, 4, 4, 2, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (987, 1, 3, 8, 4, 3, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (988, 1, 4, 9, 4, 4, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (989, 1, 5, 10, 4, 5, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (990, 1, 6, 8, 4, 6, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (991, 1, 7, 4, 4, 4, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (992, 1, 8, 8, 4, 3, CAST(0x0000A7C400000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (993, 1, 1, 4, 5, 1, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (994, 1, 2, 8, 5, 2, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (995, 1, 3, 9, 5, 3, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (996, 1, 4, 2, 5, 4, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (997, 1, 5, 9, 5, 6, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (998, 1, 6, 4, 5, 1, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (999, 1, 7, 9, 5, 2, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1000, 1, 8, 2, 5, 4, CAST(0x0000A7C500000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1001, 1, 1, 2, 1, 1, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1002, 1, 2, 4, 1, 2, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1003, 1, 3, 8, 1, 3, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1004, 1, 4, 9, 1, 4, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1005, 1, 5, 10, 1, 5, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1006, 1, 6, 4, 1, 6, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1007, 1, 7, 10, 1, 3, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1008, 1, 8, 4, 1, 5, CAST(0x0000A7C800000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1009, 1, 1, 4, 2, 1, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1010, 1, 2, 8, 2, 2, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1011, 1, 3, 9, 2, 3, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1012, 1, 4, 4, 2, 4, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1013, 1, 5, 10, 2, 5, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1014, 1, 6, 2, 2, 6, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1015, 1, 7, 9, 2, 5, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1016, 1, 8, 8, 2, 6, CAST(0x0000A7C900000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1017, 1, 1, 10, 3, 1, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1018, 1, 2, 9, 3, 2, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1019, 1, 3, 4, 3, 3, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1020, 1, 4, 2, 3, 4, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1021, 1, 5, 8, 3, 5, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1022, 1, 6, 10, 3, 6, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1023, 1, 7, 2, 3, 1, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1024, 1, 8, 9, 3, 5, CAST(0x0000A7CA00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1025, 1, 1, 2, 4, 1, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1026, 1, 2, 4, 4, 2, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1027, 1, 3, 8, 4, 3, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1028, 1, 4, 9, 4, 4, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1029, 1, 5, 10, 4, 5, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1030, 1, 6, 8, 4, 6, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1031, 1, 7, 4, 4, 4, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1032, 1, 8, 8, 4, 3, CAST(0x0000A7CB00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1033, 1, 1, 4, 5, 1, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1034, 1, 2, 8, 5, 2, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1035, 1, 3, 9, 5, 3, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1036, 1, 4, 2, 5, 4, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1037, 1, 5, 9, 5, 6, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1038, 1, 6, 4, 5, 1, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1039, 1, 7, 9, 5, 2, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[timetablemaster] ([id], [courseid], [slotid], [subjectid], [dayid], [locationid], [ttDate], [description], [verify], [material], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1040, 1, 8, 2, 5, 4, CAST(0x0000A7CC00000000 AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[timetablemaster] OFF
GO
SET IDENTITY_INSERT [dbo].[timetablemasterbkp] ON 

GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (1, 1, 1, 2, 1, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (3, 1, 2, 4, 1, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (6, 1, 3, 8, 1, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (7, 1, 4, 9, 1, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (8, 1, 5, 10, 1, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (9, 1, 6, 4, 1, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (10, 1, 7, 10, 1, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (11, 1, 8, 4, 1, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (12, 1, 1, 4, 2, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (13, 1, 2, 8, 2, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (14, 1, 3, 9, 2, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (15, 1, 4, 4, 2, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (16, 1, 5, 10, 2, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (17, 1, 6, 2, 2, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (18, 1, 7, 9, 2, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (19, 1, 8, 8, 2, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (20, 1, 1, 10, 3, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (21, 1, 2, 9, 3, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (22, 1, 3, 4, 3, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (23, 1, 4, 2, 3, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (24, 1, 5, 8, 3, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (25, 1, 6, 10, 3, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (26, 1, 7, 2, 3, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (27, 1, 8, 9, 3, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (28, 1, 1, 2, 4, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (29, 1, 2, 4, 4, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (30, 1, 3, 8, 4, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (31, 1, 4, 9, 4, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (32, 1, 5, 10, 4, 5)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (33, 1, 6, 8, 4, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (34, 1, 7, 4, 4, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (35, 1, 8, 8, 4, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (36, 1, 1, 4, 5, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (37, 1, 2, 8, 5, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (38, 1, 3, 9, 5, 3)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (39, 1, 4, 2, 5, 4)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (40, 1, 5, 9, 5, 6)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (41, 1, 6, 4, 5, 1)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (42, 1, 7, 9, 5, 2)
GO
INSERT [dbo].[timetablemasterbkp] ([id], [courseid], [slot], [subjectid], [dayid], [location]) VALUES (43, 1, 8, 2, 5, 4)
GO
SET IDENTITY_INSERT [dbo].[timetablemasterbkp] OFF
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
