

--Exec spAttendanaceStats 'DesiredAttendance',1,2,'2017-04-01','2017-04-30',80
--Exec spAttendanaceStats 'Defaulter',1,2,'2017-04-01','2017-04-30',18

Alter proc spAttendanaceStats
(
@flag varchar(100),
@Studid varchar(100),
@Subjid varchar(100),
@Fromdate datetime,
@Todate datetime,
@Percent numeric(18,0)
)
as
set nocount on
Begin
if(@flag='DesiredAttendance')
Begin

Select * into #Countmaster from(
select sum(totalcnt) as Total from
(
select *,(a.datecnt* b.subcnt)as totalcnt from 
(select count(date) as datecnt,day from calendermaster where date between @Fromdate and @Todate group by day)a 
left outer join 
(SELECT count(subjectid) as subcnt, subjectid, dayid,dayname  FROM timetablemaster a 
left outer join daymaster b on a.dayid=b.id WHERE subjectid=@Subjid group by dayid,subjectid,dayname) b on a.day=b.dayname
)a
) as TotalCnt,
(SELECT count(*) as LapseCnt FROM contentmaster a left outer join timetablemaster b on a.timetableid=b.id 
WHERE b.subjectid=@Subjid and  verify='0' and date between  @Fromdate and @Todate) as LapseCnt,
(SELECT count(id) LectDone FROM attendence where studentid = '0' and subjectid=@Subjid and (Attendencedatae  BETWEEN @Fromdate AND @Todate)) as DoneCnt,
(SELECT count(id) as presentcnt FROM attendence where studentid = @Studid and subjectid=@Subjid and (Attendencedatae  BETWEEN @Fromdate AND @Todate)) as PresentCnt

Select *,round(((Total-LapseCnt)*cast(@Percent as float)/cast(100 as float)),0) overallreq,(Total-LapseCnt-LectDone)Lectureremains,((Total-LapseCnt-LectDone)-presentcnt)NeededtoAttend from #Countmaster

END



if(@flag='Defaulter')
Begin

Select * into #Count1 from(
select sum(totalcnt) as Total from
(
select *,(a.datecnt* b.subcnt)as totalcnt from 
(select count(date) as datecnt,day from calendermaster where date between @Fromdate and @Todate group by day)a 
left outer join 
(SELECT count(subjectid) as subcnt, subjectid, dayid,dayname  FROM timetablemaster a 
left outer join daymaster b on a.dayid=b.id WHERE subjectid=@Subjid group by dayid,subjectid,dayname) b on a.day=b.dayname
)a
) as TotalCnt,
(SELECT count(*) as LapseCnt FROM contentmaster a left outer join timetablemaster b on a.timetableid=b.id 
WHERE b.subjectid=@Subjid and  verify='0' and date between  @Fromdate and @Todate) as LapseCnt
Declare @total numeric(18,2)
Declare @required numeric(18,2)
set @total= (select (Total-LapseCnt) from #Count1)
set @required=(Select ((Total-LapseCnt)*cast(@Percent as float)/cast(100 as float)) overallreq from #Count1)


SELECT studentid,count(*) as Attended,@total as Total,@required as required into #defaulter FROM [studbud].[dbo].[attendence] where subjectid=@Subjid group by studentid

select *,cast((Attended/total*100)as numeric(18,2))  as per from #defaulter where Attended<required

END
End