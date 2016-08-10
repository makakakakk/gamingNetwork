
--teftekro el mafroud a3mel el not null wl 7agat dy? 
--created table Members wohoo 
CREATE TABLE Members(
email varchar(50) PRIMARY KEY,
pass varchar(50),
preferred_game_genre varchar(50)) ;


/* 
Normal User (e-mail, first_name, last_name, date_of_birth, age)
Normal User.e-mail references Members,
Where: Normal User.age = current date – Normal User.date_of_birth.*/


CREATE TABLE Normal_Users(
email varchar(50),
first_name varchar(50),
last_name VARCHAR(50),
birth_year date NOT NULL,
age AS (YEAR(CURRENT_TIMESTAMP)) - YEAR(birth_year),
PRIMARY KEY (email),
FOREIGN KEY(email) REFERENCES Members ON DELETE CASCADE ,
--FOREIGN KEY (email) REFERENCES Members(email)
);


/*add_friend (e-mail1, e-mail2, accept)
add_friend.e-mail1 references Normal User,
add_friend.e-mail2 references Normal User.*/ 

CREATE TABLE Normal_User_adds_normal_user(
email1 varchar(50),
email2 varchar(50),
accept bit NOT NULL,
PRIMARY KEY (email1, email2),
FOREIGN KEY (email1) REFERENCES Normal_Users,
FOREIGN KEY (email2) REFERENCES Normal_Users,
);


/*Messages (Messages_ID, sender,reciever, date, content)
Messages.sender references Normal User, f+p
Messages.reciever references Normal User. f+p */

CREATE TABLE Messages(
 Messages_ID int IDENTITY(1,1) ,
sender varchar(50), --dah el howa el email ya3ny?
reciever varchar(50), --same thing as above xD
date_of_messages date ,
content varchar(500),
PRIMARY KEY (Messages_ID, sender, reciever),
FOREIGN KEY (sender) REFERENCES Normal_Users, 
FOREIGN KEY (reciever) REFERENCES Normal_Users, 
);


/* Development Team (e-mail, team_name, company, formation_date)
Devlopment Team.e-mail references Members.p+f */

CREATE TABLE Development_Teams (
email varchar (50) PRIMARY KEY,
team_name varchar(50),
company varchar(50),
formation_date date,

--PRIMARY KEY (email),
FOREIGN KEY (email) REFERENCES Members,
);



/*Verified Reviewer (e-mail, first_name, last_name, years_of_experience)
Verified Reviewer.e-mail references Members p+f*/

CREATE TABLE Verified_Reviewers(
email varchar (50) PRIMARY KEY,
first_name varchar(50),
last_name VARCHAR(50),
 years_of_experience int,
FOREIGN KEY (email) REFERENCES Members
);



--Communities (theme, name, description).
CREATE TABLE Communities(
theme varchar(50) PRIMARY KEY,
name varchar (50),
descriptionn varchar (500) --double n 3shan el bta3 msh 3agbo n wa7da 
);



/*create (theme, normal_user_ID, accept)
create.theme references Communities
create.normal_user_ID references Normal User */

CREATE TABLE Creates(
theme  varchar(50) PRIMARY KEY,
normal_user_id varchar(50),
accept bit,
FOREIGN KEY (theme) REFERENCES Communities,
FOREIGN KEY (normal_user_id) REFERENCES Normal_Users
);




/*join (theme,Members_ID)
join.theme references Communities.theme
join.Members_id references Members*/
  
CREATE TABLE Joins (
theme  varchar(50),
members_id varchar(50),
PRIMARY KEY (theme, members_ID),
FOREIGN KEY (theme) REFERENCES Communities,
FOREIGN KEY (members_ID) REFERENCES Members
);


/*Topics (theme, Topics_ID, title, description,Members_ID)
Topics.theme refernces Communities pf
Topics.Members_id references Members p*/



CREATE TABLE Topics(
theme  varchar(50),
topic_ID int IDENTITY(1,1) ,
title varchar(50),
descriptionn varchar (500),
 members_id varchar(50),
PRIMARY KEY (theme, topic_ID),
FOREIGN KEY (theme) REFERENCES Communities,
FOREIGN KEY (members_ID) REFERENCES Members
);



/*Topics_Comment(theme, topic_ID, comment_ID, content, date, Members_ID)
Topic_comments.theme references Topic
Topic_comments.topic_ID references Topic
Topic_comments.Members_id references Members*/


CREATE TABLE Topic_comments(
theme  varchar(50),
topic_ID int,
comment_ID int,
members_id varchar(50),
content varchar(300),
datee date,
PRIMARY KEY (theme, topic_ID, comment_ID),
FOREIGN KEY (theme, topic_ID) REFERENCES Topics,
--FOREIGN KEY (topic_ID) REFERENCES Topic,
FOREIGN KEY (members_ID) REFERENCES Members,
);



/*Conference (conference_ID, name, duration, start_date, end_date, venue).
*/

CREATE TABLE Conferences (
conference_ID int PRIMARY KEY IDENTITY(1,1) ,
name varchar(50),
duration int,
start_datee date, 
end_date date,
venue varchar(50),
--duration AS end_date - start_date,

);


/*Attend(e-mail, conference_ID)
Attend.e-mail references Members,
Attend.conference_ID references Conference */

CREATE TABLE Attend (
email varchar (50),
conference_ID int,
PRIMARY KEY(email,conference_ID),
FOREIGN KEY (email) REFERENCES Members,
FOREIGN KEY (conference_ID) REFERENCES Conferences
);


/*Conference Review(conference_review_ID, conference_ID, e-mail, content, date)
Conference Review.conference_ID references Conference,
Conference Review.e-mail references Members */

CREATE TABLE Conference_Reviews (
conference_review_ID int IDENTITY(1,1),
conference_ID int,
email varchar(50),
content varchar(500),
datee date,
PRIMARY KEY(conference_review_ID),
FOREIGN KEY (conference_ID) REFERENCES Conferences,
FOREIGN KEY (email) REFERENCES Members
);


/*Conference Review Comment(conference_review_comment_ID, prim 
conference_review_ID, conference_ID, --p + f  content, e-mail f )
Conference Review Comment. conference_review_ID refrences Conference
Review
Conference Review Comment. conference_ID refrences Conference Review
Conference Review Comment.e-mail references Member*/ 


CREATE TABLE Conference_Review_Comments(
conference_review_comment_ID int,
conference_review_ID int,
conference_ID int,
content varchar(500),
email varchar(50),
PRIMARY KEY (conference_review_comment_ID, conference_review_ID, conference_ID, email),
FOREIGN KEY (conference_review_ID) REFERENCES Conference_Reviews,
FOREIGN KEY (conference_ID) REFERENCES Conferences,
FOREIGN KEY (email) REFERENCES Members

);


/* Game(game_ID, name, release_date, rating, age_limit,
development_team_e-mail, release_conference)
Game.development_team_e-mail references Development Team.e-mail,
Game.release_conference references Conference.conference_ID
*/ 

CREATE TABLE Games(
game_ID int IDENTITY(1,1) ,
name varchar(50) ,
release_date date NOT NULL ,
rating int ,
age_limit int,
development_team_email varchar(50) ,
release_conference int ,
PRIMARY KEY(game_ID) ,
FOREIGN KEY (development_team_email) REFERENCES Development_Teams);

;
/*Screenshots(screen_shot_ID, game_ID, description, date)
Screenshots.game_ID references Game
*/ 
CREATE TABLE Screenshots(
screenshot_ID int IDENTITY(1,1) ,
game_ID int ,
descript varchar(50), /*changed from description because its a keyword*/
content varchar(50) , /*this is not in the original schema but the screen should have content duh*/
post_date date ,   /*changed from date because its a keyword*/
PRIMARY KEY (game_ID , screenshot_ID),
FOREIGN KEY (game_ID) REFERENCES Games);

 
 /*Video(video_ID, game_ID, description,date)
Video.game_ID references Game.game_ID */
 
CREATE TABLE Videos (
video_ID int IDENTITY(1,1) ,
game_ID int ,
descript varchar(50) , /*changed from description because its a keyword*/
content varchar(50) , /*this is not in the original schema but the screen should have content duh*/
post_date datetime ,   /*changed from date because its a keyword*/
PRIMARY KEY (game_ID , video_ID),
FOREIGN KEY (game_ID) REFERENCES Games);
 
 /*Strategies(real_time,game)
Strategies.game references Game
 */

CREATE TABLE Strategies(
real_time bit ,
game int  ,
PRIMARY KEY (game),
FOREIGN KEY (game) REFERENCES Games);



/*Action(sub_genre,game)
Action.game references Game
 */

CREATE TABLE ActionG( /*action is a keyword*/
sub_genre varchar(50),
game int  ,
PRIMARY KEY (game),
FOREIGN KEY (game) REFERENCES Games);

 
 /*Sport(type,game)
Sport.game references Game
 */

CREATE TABLE Sports(
typeg varchar(50),   /*type is a keyword*/
game int  ,
PRIMARY KEY (game),
FOREIGN KEY (game) REFERENCES Games);


/*RPG(story_line,PvP,game)
RPG.game references Game */ 

CREATE TABLE RPG (
story_line varchar(50),
PVP bit ,
game int  ,
PRIMARY KEY (game),
FOREIGN KEY (game) REFERENCES Games);


/*Rate(rate_ID,game,member_email,graphics,level design,interactivity,uniqueness)
Rate.game references Game,
Rate.member_email references Member. */ 

CREATE TABLE Rate(
rate_ID int IDENTITY(1,1) ,
game int ,
member_email varchar(50),
graphics int ,
level_design int,
interactivity int ,
uniqueness int,
PRIMARY KEY (rate_ID),
FOREIGN KEY (game) REFERENCES Games);


/*Game Review(game_review_ID,game,verified_reviewer,date,content)
Game Review.game references Game,
Game Review.verified_reviewer references Verified Reviewer. */ 

CREATE TABLE Review(
game_review_ID int IDENTITY(1,1) ,
game int ,
verified_reviewer varchar(50) ,
dater date,
content varchar(250) NOT NULL ,
PRIMARY KEY (game_review_ID),
FOREIGN KEY (game) REFERENCES Games,
FOREIGN KEY (verified_reviewer) REFERENCES verified_reviewers);


/*Game Review Comment(comment_ID,game_review,member)
Game Review Comment.game_review references Game Review,
Game Review Comment.member references Member. */

CREATE TABLE Review_comment(
comment_ID int IDENTITY(1,1) ,
game_review int ,
member varchar(50) ,
content varchar(100),
PRIMARY KEY (comment_ID),
FOREIGN KEY (game_review) REFERENCES Review,
FOREIGN KEY (member) REFERENCES Members);


/*Present(conference_ID,game_ID,development_team_ID)
Present.conference_id references Conference,
Present.game_id references Game,
Present.development_team_id references Development Team. */ 

CREATE TABLE Present(
conference_ID int, 
game_ID int,
development_team_ID varchar(50),
PRIMARY KEY (conference_ID , game_ID),
FOREIGN KEY (conference_ID) REFERENCES Conferences,
FOREIGN KEY (game_ID) REFERENCES Games,
FOREIGN KEY (development_team_ID) REFERENCES Development_teams);


/*Recommended(normal_user1,normal_user2,game_ID)
Recommended.normail_user1 references Normal User
Recommended.normail_user2 references Normal User
Recommended.game_ID references Game */ 

CREATE TABLE Recommended(
normal_user1 varchar(50) ,
normal_user2 varchar(50) ,
game_ID int,
PRIMARY KEY (normal_user1 , normal_user2 , game_ID),
FOREIGN KEY (normal_user1) REFERENCES normal_users,
FOREIGN KEY (normal_user2) REFERENCES normal_users,
FOREIGN KEY (game_ID) REFERENCES Games);


Insert INTO Members 
VALUES ( 'omarh200111@hotmail.com', 'shithappens', 'roleplay'); --normal
Insert INTO Members
 VALUES ('lalalal@hotmail.com', 'leeehehhe', 'strategy'); --normal
 Insert INTO Members
 VALUES ('bateekha@gmail.com', 'mwahaha', 'sports');  --dev
 Insert INTO Members 
 VALUES ('ma7shy@yahoo.com', 'btengan', 'strategy');  --dev
 Insert INTO Members
 VALUES ('ebrahem.sa@gmail.com', 'anareweshgedan', 'action'); --verrev
 Insert INTO Members
 VALUES ('omar_hossam_95@hotmail.com', 'anasocool', 'sport'); --normal
 Insert INTO Members
 VALUES ('toota@gmail.com', 'LALALALA', 'roleplay'); --verrev
 Insert INTO Members
 VALUES ('wednoshaklahawe7esh@hotmail.com', 'gedanwallahy', 'action'); --normal


 ---------------
 
INSERT INTO Normal_Users VALUES ('wednoshaklahawe7esh@hotmail.com', 'fawzy', 'mostafa', '1950'); --howa el age howa el hay-caluclate it, sa7?
INSERT INTO Normal_Users VALUES ('omar_hossam_95@hotmail.com', 'omar', 'hossam', '1994');
INSERT INTO Normal_Users VALUES ('lalalal@hotmail.com', 'lala', 'land', '1990');
INSERT INTO Normal_Users VALUES ('omarh200111@hotmail.com', 'omar', 'wahed tany', '1967');
---------


INSERT INTO Normal_User_adds_normal_user VALUES 
('omarh200111@hotmail.com', 'lalalal@hotmail.com', 0);


---------------
INSERT INTO Messages (sender,reciever,date_of_messages,content) VALUES 
 ('omarh200111@hotmail.com', 'lalalal@hotmail.com', '11/16/2015','jhaskjhdjahdjkahdkjahdkjahdkjahdkjahjkahdkjahdjkahdkja');

--------

INSERT INTO Development_Teams VALUES 
('bateekha@gmail.com', 'gucians suck', 'guc', '02/03/1990');
INSERT INTO Development_Teams VALUES 
('ma7shy@yahoo.com', 'the oopa bloopians', 'oppa bloopa company','11/12/2013');


------------

INSERT INTO Verified_Reviewers VALUES 
('ebrahem.sa@gmail.com', 'now watch me', 'naenae', '12');
INSERT INTO Verified_Reviewers VALUES
 ('toota@gmail.com', 'fatoooomz', 'batta', '2');

 -------------
 
INSERT INTO Communities VALUES
('hakoona mattata', 'it means no worries', 'for the rest of your dayyyyyssssssssss');
INSERT INTO Communities VALUES ('nemoot', 'kolena', 'mente7reen :v' );
INSERT INTO Communities VALUES ('blabloop', 'bala neela', 'better work' );
--------------
INSERT INTO Creates VALUES ('nemoot', 'wednoshaklahawe7esh@hotmail.com', 1); --el user id hena eh? 
INSERT INTO Creates VALUES('hakoona mattata', 'omarh200111@hotmail.com',1);
INSERT INTO Creates VALUES('blabloop', 'lalalal@hotmail.com', 0);
--------------
INSERT INTO Joins VALUES ('nemoot', 'toota@gmail.com');  
--------------------
INSERT INTO Topics VALUES ('nemoot', 'title title', 'jadhjkahdkjahjkhaskjdashh description of Topics', 'lalalal@hotmail.com'); --msh el mafroud el int autoincrement?

-----------------
INSERT INTO Topic_comments VALUES ('nemoot', 1, 1, 'wednoshaklahawe7esh@hotmail.com', 'content ekjckljskljkladjlad', '1999/02/25');

--------------------
INSERT INTO Conferences VALUES ( 'con1', 7, '2015/12/12', '2015/12/19', 'masr' );

------------
INSERT INTO Attend VALUES ('bateekha@gmail.com', 1);

------------------
INSERT INTO Conference_Reviews VALUES (1, 'bateekha@gmail.com', 'very boring conference, needs improvment', '2015/12/23');

-------------
INSERT INTO Conference_Review_Comments VALUES (1,1,1,'SUCKAAAAAAAAAAAS', 'ma7shy@yahoo.com');

---------------
Insert into Games VALUES('strategy game', '10/10/1999', '4', '13' ,'bateekha@gmail.com',1 );
Insert into Games VALUES('act', '10/10/1999', '4', '13' ,'bateekha@gmail.com',1 );
Insert into Games VALUES('roleplay game', '10/10/1999', '4', '13' ,'bateekha@gmail.com',1 );
Insert into Games VALUES('sports game', '10/10/1999', '4', '13' ,'bateekha@gmail.com',1 )
------------------
--INSERT INTO Screenshots Values (1, 'akjdlkajdklajdlkdjlkjla', 'lskdlsklkdldkldks', '12/12/2000');
--DELETE from Screenshots where game_ID = 1;
INSERT INTO Screenshots Values (1, 'akjdlkajdklajdlkdjlkjla', 'C:\Users\Mena\Desktop', '12/12/2000');


---------------------
 INSERT INTO Videos VALUES (1, 'ldkadkadkad' , 'dljakdjakdja','12/12/2000');

 --------------
 INSERT INTO ActionG VALUES ('sub genre is blabla', 2);

 ----------------
 INSERT INTO Sports VALUES ('basketball', 4);

 ------------------
 INSERT INTO RPG values ('story line bla', 1,3);

 ----------------
 INSERT INTO Strategies VALUES (1,1);
-------
INSERT INTO Rate( graphics, level_design, interactivity, uniqueness) VALUES (1,2,3,4);
INSERT INTO Rate( graphics, level_design, interactivity, uniqueness) VALUES (2,6,7,8);
INSERT INTO Rate( graphics, level_design, interactivity, uniqueness) VALUES (3,2,3,4);
---------------------
INSERT INTO Review VALUES (1,'ebrahem.sa@gmail.com', '12/12/2000', 'excellent thing');

----------
INSERT INTO Review_comment VALUES (1, 'omar_hossam_95@hotmail.com', 'ja ja agreed');

-------------\
INSERT INTO Present VALUES (1,1, 'ma7shy@yahoo.com');

-----
--INSERT INTO Recommended VALUES ('omarh200111@hotmail.com','lalala@hotmail.com',1);




















