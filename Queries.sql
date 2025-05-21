create database if not exists Systems;
use Systems;

CREATE TABLE IF NOT EXISTS Systems.surveys (
  SurveyID INT NOT NULL,
  Title VARCHAR(100) NOT NULL,
  About TEXT NULL DEFAULT NULL,
  PRIMARY KEY (SurveyID)
);
insert into Surveys values(1, "LeetCode Coding Experience", "5 Questions"),
(2, "Daily Productivity Habits", "3 Questions"),
(3, "Favourite Programming Language", "2 Questions");
select * from surveys;

CREATE TABLE IF NOT EXISTS Systems.questions (
  QuestionID INT NOT NULL,
  SurveyID INT NULL DEFAULT NULL,
  QuestionText TEXT NOT NULL,
  PRIMARY KEY (QuestionID),
  INDEX SurveyID (SurveyID ASC) VISIBLE,
  CONSTRAINT questions_ibfk_1
  FOREIGN KEY (SurveyID)
  REFERENCES Systems.surveys (SurveyID)
);

insert into questions values(1, 1,"How often do you practice on LeetCode? A.Daily B.Weekly C.Monthly D.Rarely"),
(2, 1,"What is your primary motivation for using LeetCode? A.Interview Prep B.Skill Improvement C.Problem Solving D.Fun"),
(3, 1,"On a scale of 1-5, how challenging do you find LeetCode problems? (1=Easy, 5=Very Hard)"),
(4, 1,"What data structures/algorithms do you find most difficult on LeetCode?"),
(5, 1,"Do you participate in LeetCode contests? (Yes/No)"),
(6, 2,"How many hours do you typically work/study per day? (Less than 4 or 4-6 or 6-8 or More than 8)"),
(7, 2,"Do you use any productivity tools? (Yes/No)"),
(8, 2,"What is your biggest productivity killer? A.Social Media B.Distractions C.Procrastination D.Lack of Planning"),
(9, 3,"What is your favorite programming language?"),
(10, 3,"Why is it your favorite?");
select * from questions;

CREATE TABLE IF NOT EXISTS Systems.users (
  UserID INT NOT NULL,
  Username VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PRIMARY KEY (UserID)
);
-- imported data from Users.csv
select * from users;

CREATE TABLE IF NOT EXISTS Systems.responses (
    responseID INT primary key,
    surveyID INT NOT NULL,
    userID INT NOT NULL,
    QuestionID INT NOT NULL,
    responseText VARCHAR(255) NOT NULL
);
-- imported data from Data.csv
select *from responses;
/* A way to check for number of tuples imported.
select count(*) from responses;
select count(*) from users;*/

-- popular responses from first survey
create view S1 as 
select responsetext,count(responseid) as count
from responses where
questionid = 1 group by responsetext order by count desc;
select * from S1;

-- similarly for all other surveys
create  view S2 as
select responsetext, count(responseid) as count
from responses where
questionid=2 group by responsetext order by count desc;
select * from s2;


create view S3 as select responsetext,count(responseid) as count from responses where
questionid = 3 group by responsetext order by count desc;
select * from S3;


create view S4 as select responsetext,count(responseid) as count from responses where
questionid = 4 group by responsetext order by count desc;
select * from S4;

create view S5 as select responsetext,count(responseid) as count from responses where
questionid = 5 group by responsetext order by count desc;
select * from S5;
