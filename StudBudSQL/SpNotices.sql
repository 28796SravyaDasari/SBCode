USE [Okyc]
GO
/****** Object:  StoredProcedure [dbo].[SpNotices]    Script Date: 5/13/2017 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SpNotices]
(
@flag varchar(50),
@title varchar(500)='', 
@content varchar(max), 
@poster int=0, 
@views int =0,
@attach varchar(max),
@courseid int=0,
@month int=0,
@postdate datetime
)
as
set nocount on
begin
if(@flag='InsertNotices')
Begin
Insert into notices(title,content,poster,views,attach,postdate) values( @title,@content,@poster,@views,@attach,@postdate)

Declare @noticesid int
set @noticesid =( select @@IDENTITY as noticesid)


Insert into noticemap (noticeid,courseid) values (@noticesid,@courseid)
End


if(@flag='DisplayNotices')
Begin
Select n.id,title,content,poster,views,attach,postdate,DATEPART(mm,postdate) AS OrderMonth from notices n
left outer join noticemap np on n.id=np.noticeid
where courseid=@courseid and DATEPART(mm,n.postdate)=@month
End

End
