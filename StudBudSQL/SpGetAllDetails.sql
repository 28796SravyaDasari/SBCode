USE [Okyc]
GO
/****** Object:  StoredProcedure [dbo].[SpGetAllDetails]    Script Date: 5/11/2017 11:40:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SpGetAllDetails] 2,0,'LoadSubjectsForTech'
ALTER proc [dbo].[SpGetAllDetails]
(
@teacherid int=0,
@Studentid int=0,
@flag varchar(25)='',
@material varchar(MAX)='',
@timetableid int=0
)
as
set nocount on
begin
if(@flag='LoadCourseByTeacher')
begin
select * from teachermaster
where id=@teacherid
End
if(@flag='LoadstudByCourse')
begin
select * from studentmaster
where id=@Studentid
End
if(@flag='LoadSubjectsForStud')
begin
select id, name as SubjectName from subjectmaster
where course in (select courseid from [assignstudent] where studentid=@Studentid )
End
if(@flag='LoadSubjectsForTech')
begin
select id, name as SubjectName from subjectmaster
where id in (select subid from [assignsubject] where teacherid=@teacherid )
End
if(@flag='GetStudMaster')
begin
select * from studentmaster
End
if(@flag='GetCourseMaster')
begin
select * from coursemaster
End
if(@flag='LoadEvent')
begin
select * from EventMaster where Status='Active'
End
if(@flag='UpdateMaterial')
Begin
Declare @content varchar(max)
set @content =(select isnull(material,'') from contentmaster where timetableid=@timetableid)+','
Update contentmaster set material=@content+@material where timetableid=@timetableid
select 'Updated Successfuly' as Message
End
if(@flag='LoadEvent')
begin


Select Distinct pl.eventid,EventName from PendingAttendenceLog pl
left outer join EventMaster em on pl.eventid=em.Eventid

End


End
