--Subid	SubName	Total	Attended	Per
--1	   1	       9       8	   88.89

--total 10 lecture, need to attend =80%

--no of lect need to attend



Declare @sid numeric(18,0)			--UserInput
Set @sid=1
Declare @Subid numeric(18,0)			--UserInput
Set @Subid=2			
Declare @percent numeric(18,0)		--UserInput
Set @percent=80
	
Declare @courseid numeric(18,0)
set @courseid=(select courseid from assignstudent where studentid=@sid)
Declare @Fromdate datetime
set @Fromdate=(select fromdate from coursemaster where id=@courseid)
Declare @Todate datetime
set @Todate=(select Todate from coursemaster where id=@courseid)


declare @total numeric(18,2)
set @total=
(Select isnull(
(select sum(totalcnt) as Total from
(
select *,(a.datecnt* b.subcnt)as totalcnt from 
(select count(date) as datecnt,day from calendermaster where date between @Fromdate and @Todate group by day)a 
left outer join 
(SELECT count(subjectid) as subcnt, subjectid, dayid,dayname  FROM timetablemaster a 
left outer join daymaster b on a.dayid=b.id WHERE subjectid=@Subid group by dayid,subjectid,dayname) b on a.day=b.dayname
)a),0))--Total


declare @required numeric(18,2)
set @required=(select round(isnull(cast(((@percent*@total)/100) as numeric(18,2)),0),0)) --(80*10)/100

declare @Attended numeric(18,2)
Set @Attended=(SELECT count(*) as Attended FROM [dbo].[attendence] where subjectid=@Subid and studentid=@sid  and Attendencedatae between @Fromdate and @Todate)

declare @needToBeMarked numeric(18,2)
set @needToBeMarked=(@required-@Attended)--8 - 3 = 5

--select * from [attendence]
select @sid ,@Subid as subjid,@percent as [percent],@courseid as courseid,@Fromdate,@Todate
,@total,@required,@Attended,@needToBeMarked

select *--,(a.datecnt* b.subcnt)as totalcnt 
into #master from 
(
select date,day from calendermaster where date between @Fromdate and @Todate --group by day
)a 
left outer join 
(SELECT * FROM [dbo].[attendence] where subjectid=2 and studentid=1 ) b on a.date=b.Attendencedatae

--declare @required numeric(18,2)
--set @required=11.0
Declare @sql varchar(Max)
set @Sql ='insert into #insertdata select Top  '+convert(varchar(20),(convert(int, @required))) +' * from #master where day not in(''sunday'',''saturday'') and Attendencestatus is  null'
set @Sql=@Sql+' select * from #insertdata'
--print(@Sql)
--insert into #insertdata
execute(@Sql)


select * from #insertdata
--select Top 5 and insert query to exceptional tables

--select Top  11  * from #master where day not in('sunday','saturday') and Attendencestatus is  null

--select studentid	,courseid	,teacherid,	slotid,	dayid,	Entrydate,	Attendencedatae,	Attendencestatus,	Subjectid from attendence