
--spmarkEventAttendance 'AttendanceLogInsert',1,1,'2017-05-02','2017-05-09',1
CREATE proc [dbo].[spmarkEventAttendance]
(
@flag varchar(100),
@Studid int=0,
@eventid int=0,
@fromdate date=null,
@todate date=null,
@ApprovedBy int=0
)
as
set nocount on
Begin
if(@flag='AttendanceLogInsert')
Begin

select date,day into #daycountlogic  from calendermaster where  cast(date as date) between cast(@fromdate as date) and cast(@todate as date) and day not IN ('Sunday','Saturday') 

Insert into PendingAttendenceLog (studentid,courseid,teacherid,slotid,dayid,Entrydate,Attendencedatae,Attendencestatus,Subjectid,eventid,ApprovalStatus,Approvedby,approvalremark)
 (SELECT studentid,asmm.courseid,teacherid,sm.id as slotid,tm.dayid,GetDate(),dcl.date,'Present',tm.subjectid,@eventid,'Pending',@ApprovedBy,'Test' FROM assignstudent asmm
left outer join slotmaster sm on asmm.courseid = sm.courseid
left outer join timetablemaster tm on sm.slotnumber=tm.slot
left outer join assignsubject asb on tm.subjectid=asb.subid
left outer join daymaster dm on dm.id=tm.dayid
left outer join coursemaster cm on cm.id=tm.courseid
left outer join #daycountlogic dcl on dcl.day=dm.Dayname
where studentid=@Studid)
END


End






