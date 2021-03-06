USE [Okyc]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEvent]    Script Date: 5/10/2017 11:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC spInsertEvent 'EnterEvent','1,2,3,4','pend,ing','Alegria','2017-05-10','2017-05-20','03:00:00','04:00:00',1
--Exec spEventAttendence 'APPROVED','',1,'','',2,''

ALTER proc [dbo].[spInsertEvent]
(
@flag varchar(100),
@Studid varchar(max)='',
@status varchar(50)='',
@eventname varchar(150)='',
@fromdate datetime=null,
@todate datetime=null,
@fromtime time='',
@totime time='',

@AddedBy int=0
)
as
set nocount on
Begin

if(@flag='EnterEvent')
BEGIN
Declare @eventmasterid int



Insert into EventMaster (EventName ,EventAddedBy ,EventEnterydate,Fromdate,todate,fromtime,totime,studentid) Values(@eventname,@AddedBy,getdate(),@fromdate,@todate,@fromtime,@totime,@Studid)


set @eventmasterid =( select @@IDENTITY as eventmasterid)


select date,day into #daycountlogic  from calendermaster where  cast(date as date) between cast(@fromdate as date) and cast(@todate as date)
 and day not IN ('Sunday','Saturday') 


DECLARE @t TABLE
(
studentid varchar(500)
)

INSERT @t VALUES (@Studid)
SELECT LTRIM(RTRIM(m.n.value('.[1]','varchar(MAX)'))) AS studentid into #ToBemarked
FROM
(
SELECT CAST('<XMLRoot><RowData>' + REPLACE(studentid,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM @t
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)




Insert into PendingAttendenceLog (studentid,courseid,teacherid,slotid,dayid,Entrydate,Attendencedatae,Attendencestatus,Subjectid,eventid,ApprovalStatus,Approvedby,approvalremark)
 (SELECT studentid,asmm.courseid,teacherid,sm.id as slotid,tm.dayid,GetDate(),dcl.date,'Present',tm.subjectid,@eventmasterid,'Pending',@AddedBy,'Test' FROM assignstudent asmm
left outer join slotmaster sm on asmm.courseid = sm.courseid
left outer join timetablemaster tm on sm.slotnumber=tm.slot
left outer join assignsubject asb on tm.subjectid=asb.subid
left outer join daymaster dm on dm.id=tm.dayid
left outer join coursemaster cm on cm.id=tm.courseid
left outer join #daycountlogic dcl on dcl.day=dm.Dayname
where studentid In (select *  from #tobemarked) and sm.fromslot  BETWEEN dateadd(hour,-1,CONVERT (time, @fromtime)) AND dateadd(hour,+1,CONVERT (time, @totime))

)



END



END


