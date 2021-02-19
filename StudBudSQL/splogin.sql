create proc splogin
(
@flag varchar(100),
@userid varchar(100),
@password varchar(50)
)
as
set nocount on
Begin
if(@flag='StudLogin')
Begin
select * from studbud..studentmaster where enrollmentno=@userid and password=@password
End

if(@flag='TeacherLogin')
Begin
select * from studbud..Teachermaster where username=@userid and password=@password
End

End