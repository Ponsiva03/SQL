-- table for login details

create table LoginDetails
(
LoginId int primary key AUTO_INCREMENT,
Username varchar(50) unique Not null,
Password varchar(50) Not Null,
Role varchar(50) Not Null,
Contact bigint Not Null,
Address varchar(100) Not Null
)




insert into LoginDetails values ('ponsiva','ponsiva','python developer',9523432345,'saiba calany')

insert into LoginDetails values ('sivanesan','Sivanesan','HR',9566925369,'coimbatore')
select * from LoginDetails


create table YearLeave_Details
(
yearleaveID int primary key AUTO_INCREMENT,
HolidaysList varchar(200) null,
Date date not null,
Days varchar Not null,
CompensatoryDays varchar(200) not null
)

select * from YearLeave_Details;

ALTER TABLE Leave_Management.dbo.YearLeave_Details
ALTER COLUMN Days VARCHAR(20);

select * from YearLeave_Details where YEAR(Date) = YEAR(CURDATE())

SELECT *
FROM Leave_Management.dbo.YearLeave_Details
WHERE YEAR(Date) = YEAR(GETDATE());


insert into YearLeave_Details (HolidaysList,Date,Days,CompensatoryDays) values ('New year holiday','01-01-2022','monday','no compensentory');


insert into YearLeave_Details (HolidaysList,Date,Days,CompensatoryDays) values ('New year holiday','01-01-2023','monday','no compensentory');

-- table for storing leave
create table LeaveDetails
(
Leaveid int primary key AUTO_INCREMENT,
LoginId INT FOREIGN KEY REFERENCES LoginDetails(LoginId) NOT NULL,
LeaveReason varchar(200) Not Null,
Fromdate date Not Null,
Todate date Null,
LeaveStatus varchar(500) DEFAULT 'Not Approved',
Description varchar(500) null,
ApprovedDate datetime null
)


SELECT ld.LeaveReason, CONVERT(date, ld.Fromdate) as Fromdate,CONVERT(date, ld.Todate) as Todate,ld.LeaveStatus,ld.Description,CONVERT(date, ld.ApprovedDate) as ApprovedDate FROM LeaveDetails ld JOIN LoginDetails l ON ld.LoginId = l.LoginId WHERE ld.LoginId = 1 ORDER BY ld.Leaveid DESC;








select * from LeaveDetails

-- Inserting a record with only Description and ApprovedDate
INSERT INTO LeaveDetails (LoginId, LeaveReason, Fromdate, Todate)
VALUES
    (1, ';od morning', '2023-01-01', '2023-01-05');


select * from LeaveDetails




update LeaveDetails set LeaveStatus='Waiting' where Leaveid=17;


SELECT Username, Password, Role,Contact,Address,LeaveReason,Fromdate,Todate,LeaveStatus,LoginDetails.LoginId,Leaveid
FROM LoginDetails
INNER JOIN LeaveDetails ON LoginDetails.LoginId = LeaveDetails.Leaveid where LoginDetails.LoginId=1;



SELECT ld.*, ld.LoginId AS LeaveLoginId, l.Username, l.Role, l.Contact, l.Address
FROM LeaveDetails ld
JOIN LoginDetails l ON ld.LoginId = l.LoginId
WHERE ld.LoginId = 1;

SELECT ld.LeaveReason,ld.Fromdate,ld.Todate,ld.LeaveStatus  FROM LeaveDetails ld JOIN LoginDetails l ON ld.LoginId = l.LoginId WHERE ld.LoginId = @LoginId;

SELECT ld.LeaveReason,ld.Fromdate,ld.Todate,ld.LeaveStatus  FROM LeaveDetails ld JOIN LoginDetails l ON ld.LoginId = l.LoginId WHERE ld.LoginId = 1;

SELECT ld.LeaveReason,ld.Fromdate,ld.Todate,ld.LeaveStatus  FROM LeaveDetails ld JOIN LoginDetails l ON ld.LoginId = l.LoginId WHERE ld.LoginId = 1 ORDER BY ld.Leaveid DESC;


