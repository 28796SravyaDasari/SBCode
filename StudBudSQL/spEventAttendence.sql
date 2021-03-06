USE [Okyc]
GO
/****** Object:  StoredProcedure [dbo].[spEventAttendence]    Script Date: 5/13/2017 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC spEventAttendence 'Mark',1,1,'2017-05-10','2017-05-20',1
--Exec spEventAttendence 'APPROVED','',1,'','',2,''

ALTER proc [dbo].[spEventAttendence]
(
@flag varchar(100),
@eventid int=0,
@fromdate date=null,
@todate date=null,
@ApprovedBy int=0,
@Approvedstatus varchar(50)='',

@Studid varchar(max)='',
--@status varchar(50)='',
@eventname varchar(150)='',
@fromtime time='',
@totime time='',
@AddedBy int=0
)
as
set nocount on
Begin

if(@flag='LoadCount')--Sandy
Begin

Select  pl.eventid,em.EventName,COUNT(distinct pl.studentid) StudCount,em.Fromdate,em.todate,em.fromtime,em.totime from PendingAttendenceLog pl
left outer join EventMaster em on pl.eventid=em.Eventid
Group by pl.eventid,em.EventName,em.Fromdate,em.todate,em.fromtime,em.totime

--select b.eventid,b.EventName,count(*) as cnt from   PendingAttendenceLog a left outer join eventmaster b on a.eventid=b.EventId where ApprovalStatus='Pending' group by  b.eventid,b.EventName
End

--Service:MarkEventAttendance
--Controller:MarkEventAttendanceController
if(@flag='EnterEvent')--Sandy
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


if(@flag='LoadStudentDetailByEventid')
begin


Select  pl.eventid,em.EventName,em.Fromdate,em.todate,em.fromtime,em.totime,em.studentid
 into #eventcopy  
 from PendingAttendenceLog pl
left outer join EventMaster em on pl.eventid=em.Eventid
Group by pl.eventid,em.EventName,em.Fromdate,em.todate,em.fromtime,em.totime,em.studentid  having pl.eventid=@eventid


declare @studentidvar varchar(500) 

set @studentidvar =(select studentid from #eventcopy )

DECLARE @t1 TABLE
(
studentid varchar(500)
)

INSERT @t1 VALUES (@studentidvar)
SELECT LTRIM(RTRIM(m.n.value('.[1]','varchar(MAX)'))) AS studentid into #loadstudevent
FROM
(
SELECT CAST('<XMLRoot><RowData>' + REPLACE(studentid,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM @t1
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)


Declare @vareventid int
set @vareventid=( Select eventid from #eventcopy)


Declare @vareventname varchar(500)
set @vareventname=( Select EventName from #eventcopy)

Select id as studentid,name as studentname,@vareventid,@vareventname from studentmaster
where id In(select *  from #loadstudevent)

End

if(@flag = 'APPROVED')--Vivek
Begin
BEGIN TRY 
BEGIN TRAN ApproveEvent  

select *,ROW_NUMBER() OVER (ORDER BY subjectid) as counter into #FinalMarkedind from PendingAttendenceLog where  eventid=@eventid and ApprovalStatus='Pending'
Declare @RowCountind INT
Set @RowCountind=(Select Count(*) from #FinalMarkedind)
DECLARE @rowind INT
SET @rowind = 1
WHILE (@rowind <=@RowCountind)
BEGIN
Declare @verifyIDind INT
Set @verifyIDind=(Select subjectid from #FinalMarkedind where counter=@rowind)

 Declare @courseidind int
 Declare @teacheridind int
 Declare @slotind int
 Declare @dayidind int
 Declare @LecDate Date
 set @courseidind =(select  top 1 courseid from  #FinalMarkedind where counter=@rowind )
 Set @teacheridind=(select  top 1 teacherid from  #FinalMarkedind where counter=@rowind )
 Set @slotind=(select  top 1 slotid from  #FinalMarkedind where counter=@rowind )
 Set @dayidind=(select  top 1  dayid from  #FinalMarkedind where counter=@rowind) 
 Set @LecDate=(select  top 1  Attendencedatae from  #FinalMarkedind where counter=@rowind)
 

if not exists(
Select * from attendence where cast(Attendencedatae as date)=cast(@LecDate as date)  and courseid=@courseidind and teacherid=@teacheridind and slotid=@slotind and dayid=@dayidind and subjectid=@verifyIDind
)
Begin
	insert into attendence (studentid,courseid,teacherid,slotid,dayid,Entrydate,Attendencedatae,Attendencestatus,Subjectid)
	select studentid,@courseidind,@teacheridind,@slotind,@dayidind,getdate(),@LecDate,1,subjectid from #FinalMarkedind where counter=@rowind
End
SET @rowind = @rowind + 1
END

Update PendingAttendenceLog set ApprovalStatus='Approved',Approvedby=@ApprovedBy  where eventid=@eventid
select 'Success'
--Select * from Attendence where studentid=@verifyID and courseid=@courseid and teacherid=@Teacherid and slotid=@slot and dayid=@dayid and subjectid=@subjectid and cast(Attendencedatae as date)=cast(@date as date)


  COMMIT TRAN ApproveEvent
    select 'Process Completed Successfully!!' as Message                                                    
  --RETURN 0     

End TRY
BEGIN CATCH    
  ROLLBACK TRAN ApproveEvent                                                      
  select 'Error Occured while processing... ' as Message               
 
  --RETURN 1       
END CATCH 
End
END
