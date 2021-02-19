--truncate table teachermaster

select * from teachermaster
--insert into teachermaster(username,password,name,description,longi,lati,reportedat)
select username,Password, [First Name]+' '+[Last Name],'','0.0000','0.0000',getdate() from Sheet2$

--=================================================================================================


select * from studentmaster
select * from sheet1$
--truncate table studentmaster


--insert into studentmaster(enrollmentno,password,name,longi,lati,reportedat)
select [Enrollment No],Password, [First Name],'0.0000','0.0000',getdate() from Sheet1$

--===============================================================================================

--truncate table  subjectmaster

select * from teachermaster
select * from subjectmaster

select * from assignsubject
--=================================================================================================
--truncate table  Assignstudent
select * from Assignstudent
--insert into assignstudent(studentid,courseid)
 select id,1 from studentmaster
---- ================================================================================================
 --Create Timetable
 select * from timetablemaster
 select * from timetablemasterbkp

  select fromdate,todate from coursemaster where id=1
  select courseid,slot,subjectid,dayid,location,dayname into #master from timetablemasterbkp a left outer join daymaster b on a.dayid=b.id

  select * into #temp from calendermaster	 where (date between '2017-02-13 00:00:00' and '2017-08-13 00:00:00' ) and day not in('saturday','sunday')

  select * into #data from #temp a left outer join #master b on a.day=b.Dayname

 
--insert into timetablemaster(courseid,slotid,subjectid,dayid,locationid,ttDate,verify)
   select courseid,slot,subjectid,dayid,location,date,1  from #data