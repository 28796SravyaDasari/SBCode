CREATE PROC loadsubjects (
@studentid varchar(200)
)
as
begin
SELECT b.id,b.name FROM assignstudent a
left outer join subjectmaster b on a.courseid=b.course
where a.studentid=@studentid
end