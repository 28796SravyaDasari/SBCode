Alter proc splecturemaster
(
@flag varchar(100),
@Studid varchar(100)='',
@TeacherId varchar(100)='',
@date datetime
)
as
set nocount on
Begin
if(@flag='todayslecturestud')
Begin
if(@date='' or @date=null)
Begin
set @date=getdate()
end
select f.fromslot as LectStart,f.toslot as LectEnd,DATEDIFF(MINUTE, f.fromslot ,f.toslot) AS LectDuration,c.name as subjectName,b.description ,b.verify,b.material ,d.location from timetablemaster a
LEFT OUTER JOIN contentmaster b ON a.id = b.timetableid
LEFT OUTER JOIN subjectmaster c ON a.subjectid = c.id
LEFT OUTER JOIN location d ON a.id = d.timetableid
left outer join daymaster e on a.dayid=e.id
left outer join slotmaster f on a.slot=f.id
where e.dayname=DATENAME(dw,@date) and cast(b.date as date)=cast(@date as date) and
a.courseid in (select a.id from coursemaster a left outer join assignstudent b on a.id=b.courseid where b.studentid=@Studid)
End
if(@flag='todayslectureTeacher')
Begin
if(@date='' or @date=null)
Begin
set @date=getdate()
end
select f.fromslot as LectStart,f.toslot as LectEnd,DATEDIFF(MINUTE, f.fromslot ,f.toslot) AS LectDuration,c.name as subjectName,b.description ,b.verify,b.material ,d.location, b.timetableid as TimeTableId from timetablemaster a
LEFT OUTER JOIN contentmaster b ON a.id = b.timetableid
LEFT OUTER JOIN subjectmaster c ON a.subjectid = c.id
LEFT OUTER JOIN location d ON a.id = d.timetableid
left outer join daymaster e on a.dayid=e.id
left outer join slotmaster f on a.slot=f.id
where e.dayname=DATENAME(dw,@date) and cast(b.date as date)=cast(@date as date)
and a.subjectid in (select subid from assignsubject where teacherid = @TeacherId)
End
End