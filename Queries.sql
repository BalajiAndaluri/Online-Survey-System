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

/*INSERTING RELEVENT DATA:*/

INSERT INTO Surveys VALUES
  (1,”tooth paste”,”popularly used tooth paste”),
  (2,”Life ambition”,”Ultimate goal in in his/her life”),
  (3,”Greatest of all time”,”People’s favourite”),
  (4,”favourite cartoon”,”favourite cartoon during their childhood”),
  (5,’Customer Reviews’, “Customer satisfactory for a mall”);

INSERT INTO Users VALUES
  (1,”Ram”,”ram001@gmail.com”),
  (2,”Ravi”,”ravi002@gmail.com”),
  (3,”Rahul”,”rahul003@gmail.com”),
  (4,”Lalitha”,”lalitha004@gmail.com”),
  (5,”Nikshita”,”nikshita005@gmail.com”),
  (6,”Raju”,”raju006@gmail.com”),
  (7,”Srinu”,”srinu007@gmail.com”);

INSERT INTO Questions VALUES
  (1,1,”What toothpaste do you use?”),
  (2,2,”What do you want to become in the future?”),
  (3,3,”Who is the best actor ccording to you?”),
  (4,4,”what is the favourite cartoon of yours?”),
  (5,5, ‘how would you rate our services in the mall?’);

INSERT INTO Responses VALUES
  (1,1,1,1,“Colgate”),
  (2,2,1,1, “Dabour Red”),
  (3,3,1,1, “Pepsodent”),
  (4,4,1,1, “Colgate”),
  (5,5,1,1, “Colgate”),
  (6,6,1,1, “Closeup”),
  (7,7,1,1, “Colgate”),
  (8,7,2,2, “Doctor”),
  (9,6,2,2, “Actor”),
  (10,5,2,2, “Singer”),
  (11,4,2,2, “Engineer”),
  (12,3,2,2, “Doctor”),
  (13,2,2,2, “Politician”),
  (14,1,2,2, “Teacher”),
  (15,1,3,3, “Robert De Niro”),
  (16,2,3,3, “Leonardo Dicaprio”),
  (17,3,3,3, “Jhonny Depp”),
  (18,4,3,3, “Jack Nicholson”),
  (19,5,3,3, “Jonny Depp”),
  (20,6,3,3, “Health Ledger”),
  (21,7,3,3, “Kamal Hasan”),
  (22,1,4,4, “power rangers”),
  (23,2,4,4, “Jackie chan”),
  (24,3,4,4, “Heidi”),
  (25,4,4,4, “tom&amp;jerry”),
  (26,5,4,4, “doremon”),
  (27,6,4,4, “doremon”),
  (28,7,4,4, “dora”),
  (29,1,5,5, “good”),
  (30,2,5,5, “not bad”),
  (31,3,5,5, “excellent”),
  (32,4,5,5, “not bad”),
  (33,5,5,5, “very good”),
  (34,6,5,5, “poor”),
  (35,7,5,5, “not bad”);

/*SELECT QUERIES:*/

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
