--lab-1
--22-06-2022

--1. Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
--in
select name from student where sem in (3,5)

--or
select name from student where sem=3 or sem=5

--2. Find Student Name & Enrollment No in which Student Id between 103 to 105.
--between
select name,enrollmentno from student where stuid between 103 and 105

--graterless than
select name,enrollmentno from student where stuid>103 and stuid<105

--3. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.
select name,enrollmentno,email from student where sem=5

--4. Display All the Details of first three students.
select top 3* from student

--5. Display Name & Enrollment no of first 30% Students who’s contact number ends with 7.
select top 30 percent name,enrollmentno from student

--6. Display Unique Semesters.
select distinct sem from student

--7. Retrieve All the Students who have no Enrollment.
select * from student where enrollmentno is null

--8. Find All Students whose Name does not start with ‘V’.
select * from student where name not like 'v%'

--9. Find All Students in which Email Contains ‘3@G’ & Only Six Characters.
select * from student where email like '%3@g%' and email like '______'

--10. Find Out All the Students whose First Name Starts with F And third character must be R.
select * from student where name like 'f_r%' 

--11. Find All the Student Details whose Contact No contains 877.
select * from student where contactno like '%877%'

--12. Display Student Name in Which Student belongs to Semester 3 & Contact Number Does Not Contains 8 & 9.
select name from student where sem=3 and contactno not like '%8%' and contactno not like '%9%'

select name from student where sem=3 and contactno not like '%[8,9]%'
--13. Find Students who born after date 01-01-1990.
select * from student where birthdate>01-01-1990

--14. Update Division to BCX-5 & Semester 5 whose Student Id Is 102.
update student set division='bcx-5',sem=5 where stuid=102
 
--15. Change the Student’s Name to Firoz Sherasiya in which Email is Firoz.Me@Gmail.Com & Contact No is 8885999922.
update student set name='firoz sherasiya' where email='firoz.me@Gmail.Com' and contactno=8885999922.

--16. Add one more Column City Varchar (50) in Student Table.
alter table student add city varchar(50)

--17. Remove All BCX-3 Division Students.
delete from student where division='bcx-3'

--18. Change Column Name Email to EmailAddress.
sp_rename 'student.email','emailaddress'

--19. Write an SQL query to clone a new table Student_New from Student table with all data.
select * into student_new from student

--20. Remove All the Data from Student Table Using Truncate.
truncate table student
