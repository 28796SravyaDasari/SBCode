
--[SpNoticeDetails] '1','','4/25/2017','SltCoursebyTech'
--[SpNoticeDetails] '1','1','4/25/2017','LoadNoticeAtTech','NoticeTitle','NoticeContent','2'

ALter proc [dbo].[SpNoticeDetails]
(
@StudId int=0,
@courseid int=0,
@datepar datetime=null,
@flag varchar(25)='',
@title varchar(MAX)='',
@content varchar(MAX)='',
@poster int=''
)
as begin
if(@flag='LoadNoticeAtStud')
begin

Set @courseid=(select top 1  a.id from coursemaster a left outer join
assignstudent b on a.id=b.courseid
where b.studentid=@StudId)

SELECT a.title,a.content,a.views,b.name as teacher, d.name as course ,CONVERT(CHAR(4), a.postdate, 100) + CONVERT(CHAR(4), a.postdate, 120) as Ymonth FROM notices a 
left outer join teachermaster b on a.poster = b.id
left outer join noticemap c on a.id = c.noticeid
left outer join coursemaster d on c.courseid=d.id
Where c.courseid=@courseid and CONVERT(CHAR(4), a.postdate, 100)=CONVERT(CHAR(4), @datepar, 100) and CONVERT(CHAR(4), @datepar, 120)=CONVERT(CHAR(4), a.postdate, 120)
End

if(@flag='LoadNoticeAtTech')
begin
SELECT a.title,a.content,a.views,b.name as teacher, d.name as course ,CONVERT(CHAR(4), a.postdate, 100) + CONVERT(CHAR(4), a.postdate, 120) as Ymonth FROM notices a 
left outer join teachermaster b on a.poster = b.id
left outer join noticemap c on a.id = c.noticeid
left outer join coursemaster d on c.courseid=d.id
Where  CONVERT(CHAR(4), a.postdate, 100)=CONVERT(CHAR(4), @datepar, 100) and CONVERT(CHAR(4), @datepar, 120)=CONVERT(CHAR(4), a.postdate, 120) order by postdate desc
End

if(@flag='InsertNotice')
BEGIN
if not exists(select * from notices where postdate=getdate() and poster=@poster)
Begin
Insert into notices (title,content,poster,postdate) values(@title,@content,@poster,getdate())
Declare @id int
Set @id=(select @@IDENTITY)
Insert into noticemap (noticeid,courseid) values( @id,@courseid)
select 'Notice Created successfully' as Message
End

END

End


