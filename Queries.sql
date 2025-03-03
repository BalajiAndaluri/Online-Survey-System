/*1.SURVEYS TABLE:*/

CREATE TABLE IF NOT EXISTS 'System'.'surveys' (
'SurveyID' INT NOT NULL,
'Title' VARCHAR(100) NOT NULL,
'Description' TEXT NULL DEFAULT NULL,
PRIMARY KEY ('SurveyID'));

/*2.QUESTIONS TABLE:*/

CREATE TABLE IF NOT EXISTS 'System'.'questions' (
'QuestionID' INT NOT NULL,
'SurveyID' INT NULL DEFAULT NULL,
'QuestionText' TEXT NOT NULL,
PRIMARY KEY ('QuestionID'),
INDEX 'SurveyID' ('SurveyID' ASC) VISIBLE,
CONSTRAINT 'questions_ibfk_1'
FOREIGN KEY ('SurveyID')
REFERENCES 'System'.'surveys' ('SurveyID'));

/*3.USERS TABLE:*/

CREATE TABLE IF NOT EXISTS 'System'.'users' (
'UserID' INT NOT NULL,
'Username' VARCHAR(50) NOT NULL,
'Email' VARCHAR(100) NOT NULL,
PRIMARY KEY ('UserID'));

/*4.RESPONSES TABLE:*/

CREATE TABLE IF NOT EXISTS 'System'.'responses' (
'ResponseID' INT NOT NULL,
'UserID' INT NULL DEFAULT NULL,
'SurveyID' INT NULL DEFAULT NULL,
'QuestionID' INT NULL DEFAULT NULL,
'ResponseText' TEXT NULL DEFAULT NULL,
PRIMARY KEY (`ResponseID`),
INDEX `UserID` (`UserID` ASC) VISIBLE,
INDEX `SurveyID` (`SurveyID` ASC) VISIBLE,
INDEX `QuestionID` (`QuestionID` ASC) VISIBLE,
CONSTRAINT `responses_ibfk_1`
FOREIGN KEY (`UserID`)
REFERENCES `System`.`users` (`UserID`),
CONSTRAINT `responses_ibfk_2`
FOREIGN KEY (`SurveyID`)
REFERENCES `System`.`surveys` (`SurveyID`),
CONSTRAINT `responses_ibfk_3`
FOREIGN KEY (`QuestionID`)
REFERENCES `System`.`questions` (`QuestionID`));

Select* from response;
Select* from users;
Select* from questions;

/*VIEWS QUERIES:*/

/*POPULAR RESPONSES FROM 1 st SURVEY:*/

create view S1 as select responsetext,count(responseid) as count from responses where
questionid = 1 group by responsetext order by count desc;
select * from S1;

/*POPULAR RESPONSES FROM 2 nd SURVEY:*/

create view S2 as select responsetext,count(responseid) as count from responses where
questionid = 2 group by responsetext order by count desc;
select * from S2;

/*POPULAR RESPONSES FROM 3 rd SURVEY:*/

create view S3 as select responsetext,count(responseid) as count from responses where
questionid = 3 group by responsetext order by count desc;
select * from S3;

/*POPULAR RESPONSES FROM 4 th SURVEY:*/

create view S4 as select responsetext,count(responseid) as count from responses where
questionid = 4 group by responsetext order by count desc;
select * from S4;

/*POPULAR RESPONSES FROM 5 th SURVEY:*/

create view S5 as select responsetext,count(responseid) as count from responses where
questionid = 5 group by responsetext order by count desc;
select * from S5;
