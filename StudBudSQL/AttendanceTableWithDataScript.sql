USE [studbud]
GO
/****** Object:  Table [dbo].[attendence]    Script Date: 27-04-2017 00:00:00 ******/
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
SET IDENTITY_INSERT [dbo].[attendence] OFF
GO
