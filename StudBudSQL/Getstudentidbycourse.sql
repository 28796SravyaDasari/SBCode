USE [Okyc]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEvent]    Script Date: 5/10/2017 11:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC spGetStudidbyCourses 'GetStudentidByCourses','1'


Alter proc [dbo].[spGetStudidbyCourses]
(
@flag varchar(100),
@Courseid int=0
)
as
set nocount on
Begin

if(@flag='GetStudentidByCourses')
BEGIN

Select studentid from assignstudent  where courseid =@Courseid
END



END


