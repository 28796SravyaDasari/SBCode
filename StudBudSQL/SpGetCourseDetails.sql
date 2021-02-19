USE [studbud]
GO
/****** Object:  StoredProcedure [dbo].[SpGetCourseDetails]    Script Date: 4/25/2017 1:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SpGetCourseDetails]
(
@teacherid int=0,
@Courseid int=0,
@flag varchar(25)
)
as begin
if(@flag='LoadCourseByTeacher')
begin
select * from assignsubject a
left outer join subjectmaster b on a.subid=b.id
left outer join coursemaster c on b.course=c.id
where a.teacherid=@teacherid
End
if(@flag='LoadstudByCourse')
begin
select * from studentmaster a
left outer join assignstudent b on b.studentid=a.id
where b.courseid=@Courseid
End

End