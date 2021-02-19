--spAttendance 'MarkAttendance','','2017-05-01 01:42:25.587','1','1,3','1','2','1','2'

Alter proc spAttendance
(
@flag varchar(100),
@Studid varchar(100)='',
@date datetime='',
@Teacherid varchar(100)='',
@attendance varchar(MAX)='',
@courseid varchar(100)='',
@slot varchar(100)='',
@dayid varchar(50)='',
@subjectid varchar(50)=''
)
as
set nocount on
Begin
--get RollNo for current lecture at teachers end
if(@flag='GetStudid')
Begin
SELECT studentid,sm.courseid,teacherid,slot,dayid,subjectid FROM assignstudent asmm
left outer join slotmaster sm on asmm.courseid = sm.courseid
left outer join timetablemaster tm on sm.slotnumber=tm.slot
left outer join assignsubject asb on tm.subjectid=asb.subid
left outer join daymaster dm on dm.id=tm.dayid
left outer join coursemaster cm on cm.id=tm.courseid
where dm.Dayname= DATENAME(weekday,@date) AND asb.teacherid=@Teacherid AND
--sm.fromslot BETWEEN CONVERT(varchar,dateadd(hour,-1,getdate()),108) AND CONVERT(varchar,GETDATE(),108)
cast(@date as time) BETWEEN sm.fromslot and sm.toslot
END
--Mark Attendance
if(@flag='MarkAttendance')
Begin
DECLARE @t TABLE
(
studentid VARCHAR(MAX),
courseid INT,
teacherid INT,
slot INT,
dayid INT,
subjectid INT,
Adate datetime
)
--INSERT @t VALUES ('1,13,6,15,8,9',1,1,2,1,2,'2017-04-24')
INSERT @t VALUES (@attendance,@courseid,@Teacherid,@slot,@dayid,@subjectid,@date)
SELECT courseid,teacherid,slot,dayid,subjectid,
LTRIM(RTRIM(m.n.value('.[1]','varchar(MAX)'))) AS studentid,Adate into #ToBemarked

FROM
(
SELECT courseid,teacherid,slot,dayid,subjectid,CAST('<XMLRoot><RowData>' + REPLACE(studentid,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x,adate
FROM @t
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
select *,ROW_NUMBER() OVER (ORDER BY studentid) as counter into #FinalMarked from #ToBemarked
Declare @RowCount INT
Set @RowCount=(Select Count(*) from #FinalMarked)
DECLARE @row INT
SET @row = 1
WHILE (@row <=@RowCount)
BEGIN
Declare @verifyID INT
Set @verifyID=(Select studentid from #FinalMarked where counter=@row)
if not exists(
Select * from Attendence where studentid=@verifyID and courseid=@courseid and teacherid=@Teacherid and slotid=@slot and dayid=@dayid and subjectid=@subjectid and cast(Attendencedatae as date)=cast(@date as date))
Begin
insert into attendence (studentid,courseid,teacherid,slotid,dayid,Entrydate,Attendencedatae,Attendencestatus,Subjectid)
--select top 0 * from attendence
select studentid,courseid,teacherid,slot,dayid,adate,adate,1,subjectid from #FinalMarked where counter=@row
End
SET @row = @row + 1
END
--Select * from Attendence where studentid=@verifyID and courseid=@courseid and teacherid=@Teacherid and slotid=@slot and dayid=@dayid and subjectid=@subjectid and cast(Attendencedatae as date)=cast(@date as date)
End
--Get todays teacher lecture list
--if(@flag='TeacherlecList')
--Begin
--SELECT *,CONVERT(varchar,dateadd(hour,0,getdate()),108) FROM slotmaster sm
--left outer join timetablemaster tm on sm.slotnumber=tm.slot
--left outer join assignsubject asb on tm.subjectid=asb.subid
--left outer join daymaster dm on dm.id=tm.dayid
--left outer join coursemaster cm on cm.id=tm.courseid
--left outer join contentmaster c on c.timetableid=tm.id And sm.slotnumber=c.slotnumber
--where dm.Dayname= DATENAME(weekday,getdate()) AND
--asb.teacherid=1 AND c.date=getdate() And sm.fromslot BETWEEN CONVERT(varchar,dateadd(hour,0,getdate()),108) AND CONVERT(VARCHAR, CAST('23:50:00' AS DATETIME), 108)
--END
END

