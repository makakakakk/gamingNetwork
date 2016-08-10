
--Sign up by providing my email, password, preffered game genre and the type of my membership
--(normal user, verified reviewer or a development team).

CREATE PROC NormalSignUp
@email varchar(50),
@password varchar(50),
@preferred_game_genre varchar(50),
@first_name varchar(50),
@last_name varchar(50),
@date_of_birth datetime
AS
BEGIN
INSERT INTO Members(email,pass,preferred_game_genre)
VALUES(@email,@password,@preferred_game_genre)

INSERT INTO Normal_Users(email,first_name,last_name,birth_year)
VALUES(@email,@first_name,@last_name,@date_of_birth)
END
GO

CREATE PROC DevTeamSignUp
@email varchar(50),
@password varchar(50),
@preferred_game_genre varchar(50),
@team_name varchar(50),
@company varchar(50),
@formation_date datetime
AS
BEGIN
INSERT INTO Members(email,pass,preferred_game_genre)
VALUES(@email,@password,@preferred_game_genre)

INSERT INTO Development_Teams(email,team_name,company,formation_date)
VALUES(@email,@team_name,@company,@formation_date)
END
GO

CREATE PROC VerifiedReviewerSignUp
@email varchar(50),
@password varchar(50),
@preferred_game_genre varchar(50),
@first_name varchar(50),
@last_name varchar(50),
@years_of_experience int
AS
BEGIN
INSERT INTO Members(email,pass,preferred_game_genre)
VALUES(@email,@password,@preferred_game_genre)

INSERT INTO Verified_Reviewers(email,first_name,last_name,years_of_experience)
VALUES(@email,@first_name,@last_name,@years_of_experience)
END
GO
------------------------------

--Search by name for different games, conferences, communities, verified reviewers and development teams

CREATE PROC NameSearch
@gameName varchar(50),
@conName varchar(50),
@commName varchar(50),
@reviewerFName varchar(50),
@reviewerLName varchar(50),
@devName varchar(50),
@normalFName varchar(50),
@normalLName varchar(50)
AS
DECLARE @gameId int
DECLARE @conid int
DECLARE @commtheme varchar(50)
oDECLARE @reviewerId varchar(50)
DECLARE @devId varchar(50)
DECLARE @email varchar(50)
SELECT @gameId = game_ID
FROM Games WHERE [name] = @gameName
SELECT @conid = conference_ID
FROM Conferences WHERE [name] = @conName
SELECT @commtheme = theme
FROM Communities WHERE [name] = @commName
SELECT @reviewerId = email
FROM Verified_Reviewers WHERE [first_name] = @reviewerFName
SELECT @reviewerId = email
FROM Verified_Reviewers WHERE [last_name] = @reviewerLName
SELECT @devId = email
FROM Development_Teams WHERE [team_name] = @devName
SELECT @email =email
FROM Normal_Users WHERE [first_name] = @normalFName
SELECT @email = email
FROM Normal_Users WHERE [last_name] = @normalLName
GO

---------------------------------------------
--Add a conference to my list of attended conferences.

CREATE PROC AddAttendedCon
@email varchar(50),
@conference int
AS
INSERT INTO Attend(email,conference_id)
VALUES (@email,@conference)
GO
----------------------
-- Add a conference review to a conference that I have attended.

CREATE PROC ConReview
@confid int,
@email varchar(50),
@content varchar(250),
@date datetime
AS
INSERT INTO Conference_Reviews(conference_id,email,content,datee)
VALUES(@confid,@email,@content,@date)
GO
--------------------
--10 Delete a conference review that I have written.

CREATE PROC DeleteConReview
@conid int
AS
DELETE FROM Conference_Reviews
WHERE conference_id = @conid
GO

------------------------
--Join a comunity

CREATE PROC JoinCommunity
@theme varchar(50),
@mid int
AS
INSERT INTO Joins(theme,members_ID)
VALUES(@theme,@mid)
GO
--------------
--Delete a conference review that I have written.

CREATE PROC DeleteTopic
@tid int,
@myemail varchar(50)
AS
DELETE FROM Topics 
WHERE topics.topic_ID = @tid and topics.members_id = @myemail 
GO

---------------------------------
--15 Add a comment on a conference review, a game review, or a topic posted in a community that I have joined
CREATE PROC AddConferenceReviewComment
@conrevcommentid int,
@conrevid int,
@conid int,
@content varchar(250),
@email varchar(50)
AS
INSERT INTO Conference_Review_Comments(conference_review_comment_ID,conference_review_ID,conference_ID,content,email)
VALUES(@conrevcommentid,@conrevid,@conid,@content,@email)
GO

Alter PROC AddGameReviewComment
--@commentid int,
@reviewid int,
@memberid varchar(50),
@content varchar(250)
AS
INSERT INTO Review_comment(game_review,member,content)VALUES (@reviewid,@memberid,@content)
GO

CREATE PROC AddTopicComment
@theme varchar(50),
@tid int,
@cid int,
@content varchar(250),
@date datetime,
@mid int
AS
INSERT INTO Topic_comments(theme, topic_ID, comment_ID, content, datee, members_ID)
VALUES (@theme,@tid,@cid,@content,@date,@mid)
GO
--------------------------------
--Rate a game based on the following criteria: graphics, interactivity, uniqueness, and level design
CREATE PROC RateGame
@game int,
@mememail varchar(50),
@gfx int,
@lvldes int,
@interact int,
@unique int
AS
INSERT INTO Rate(game,member_email,graphics,level_design,interactivity,uniqueness)
VALUES(@game,@mememail,@gfx,@lvldes,@interact,@unique)
GO

CREATE PROC DelGame
@gid int
AS
DELETE FROM Games
WHERE game_id=@gid
GO

CREATE PROC DelCom
@ctheme varchar(50)
AS
DELETE FROM Communities
WHERE theme=@ctheme
GO

CREATE PROC DelCon
@cid int
AS
DELETE FROM Conferences
WHERE conference_id=@cid
GO

Alter PROC AddGameReview
@gid int,
@vrid int,
@date datetime,
@content varchar(500)
AS
INSERT INTO Review(game,verified_reviewer,dater,content)
VALUES(@gid,@vrid,@date,@content)
GO

CREATE PROC AddGame
@gid int,
@name varchar(50),
@rdate datetime,
@rate int,
@minage int,
@devteam varchar(50),
@releasecon int
AS
INSERT INTO Games(game_ID,name,release_date,rating,age_limit,development_team_email,release_conference)
VALUES(@gid,@name,@rdate,@rate,@minage,@devteam,@releasecon)
GO

CREATE PROC AddCon
@conid int,
@name varchar(50),
@duration int,
@sdate datetime,
@edate datetime,
@venue varchar(50)
AS
INSERT INTO Conferences (conference_ID,name,duration,start_datee,end_date,venue)
VALUES(@conid,@name,@duration,@sdate,@edate,@venue)
GO

CREATE PROC DeleteGameReview
@grid int
AS
DELETE FROM Review
WHERE game_review_id=@grid
GO

CREATE PROC ViewFriends
@email1 varchar(50)
AS
DECLARE @email2 varchar(50)
SELECT @email2 = email2
FROM Normal_User_adds_normal_user 
WHERE email1 = @email1 AND accept=1 
GO


CREATE PROC AcceptFriend
@email1 varchar(50),
@email2 varchar(50)
AS
UPDATE Normal_User_adds_normal_user
SET accept=1
WHERE email1=@email1 AND email2=@email2
GO

CREATE PROC RejecttFriend
@email1 varchar(50),
@email2 varchar(50)
AS
UPDATE Normal_User_adds_normal_user
SET accept=2
WHERE email1=@email1 AND email2=@email2
GO

CREATE PROC DeleteGameReviewComment
@grcid int
AS
DELETE FROM Review_comment
WHERE comment_id=@grcid
GO

CREATE PROC DeleteConReviewComment
@crcid int
AS
DELETE FROM Conference_Review_Comments
WHERE conference_review_comment_ID=@crcid
GO

CREATE PROC DeleteCommunitTopicComment
@ctcid int
AS
DELETE FROM Topic_comments
WHERE comment_id=@ctcid
GO

CREATE PROC SendFriendship
@email1 varchar(50),
@email2 varchar(50)
AS
UPDATE Normal_User_adds_normal_user
SET accept=0
WHERE email1=@email1 AND email2=@email2
GO

CREATE PROC ViewPendingFriends
@email varchar(50)
AS
DECLARE @email2 varchar(50)
SELECT @email2=email2
FROM Normal_User_adds_normal_user 
WHERE email1 = @email AND accept=0
GO
CREATE proc gamesIrated
@myemail varchar(50)
AS 
SELECT Review.content, Rate.game

FROM Review INNER JOIN Verified_reviewers on 

Verified_reviewers.email = Review.verified_reviewer INNER JOIN 

Rate on Review.game = Rate.game

WHERE Rate.member_email = @myemail 

go

CREATE PROC commIJoined
@myemail varchar(50)
AS 
SELECT Joins.members_ID, Topics.title
FROM Communities INNER JOIN Joins on Communities.theme = Joins.theme INNER JOIN Topics on Communities.theme = Topics.theme
WHERE Joins.members_id = @myemail
go

CREATE PROCEDURE spAddGame
@Game_ID int,
@name VARCHAR (120),
@realease_date DATE,
@rating int ,
@age_limit int,
@development VARCHAR (50),
@realease_conference int 
as
BEGIN 
UPDATE Games 
SET game_ID=@Game_ID,name=@name,release_date=@realease_date,rating=@rating,age_limit=@age_limit,development_team_email=@development,release_conference=@realease_conference
WHERE development_team_email=@development
END
GO

CREATE PROCEDURE spAddScreenShots
@screen_shot_ID int,
@game_ID int,
@description VARCHAR (250),
@content varchar(50),
@date DATE
as 
BEGIN 
INSERT INTO Screenshots(screenshot_ID,game_ID,descript,content,post_date)
VALUES (@screen_shot_ID,@game_ID,@description,@content,@date)
END
GO

CREATE  PROCEDURE spAddVideo
@video_ID int,
@game_ID int, 
@description VARCHAR (250),
@content varchar(50),
@date DATE
AS
BEGIN 
INSERT INTO Videos(video_ID,game_ID,descript,content,post_date)
VALUES (@video_ID,@game_ID,@description,@content,@date)
END
GO

CREATE PROCEDURE spThreadMessages
@email VARCHAR (50)
AS
BEGIN 
SELECT * 
FROM Messages
WHERE sender=@email or reciever = @email
END
GO

---- View my top 10 game reviews based on the number of comments on them.

CREATE PROCEDURE spTop10
AS
BEGIN 
SELECT TOP 10 v.content,COUNT(comment_ID) AS C
FROM Review v inner join Review_Comment r ON (v.game_review_ID=r.game_review)
GROUP BY v.content
ORDER By C DESC
END
GO

Alter PROCEDURE spGameRecommended
@myemail varchar(50),
@emailuser  varchar(50),
@game_ID int
as 
BEGIN 
Insert into Recommended VALUES (@myemail, @emailuser, @game_ID)
END 
GO	
	
CREATE PROCEDURE spRecommend
@game VARCHAR (50),
@normalUser VARCHAR (50)
AS 
BEGIN
select name
FROM Games g , Normal_Users n
WHERE g.name=@game AND n.email=@normalUser
END
GO	

CREATE PROCEDURE spCreateCommunity
@create int, 
@theme VARCHAR (50),
@name VARCHAR (50),
@description VARCHAR (50)
AS 
BEGIN 
UPDATE Communities
SET theme=@theme , name=@name,descriptionn=@description
WHERE @create=1
END
GO	

CREATE PROCEDURE spViewRequests
as 
BEGIN
SELECT *
FROM Creates	
END
GO

CREATE PROCEDURE spAddconference
@name VARCHAR(50),
@duration INT,
@start_date DATE,
@end_date DATE ,
@venue VARCHAR(50)
AS
BEGIN
INSERT INTO Conferences
VALUES (@name,@duration,@start_date,@end_date,@venue)
END
GO

CREATE PROC postoncomIjoined
@myemail varchar(50),
@comthemetoposton varchar(50),
@title varchar(50),
@desctext varchar(300)
AS 
BEGIN 
IF EXISTS ( 
SELECT * 
FROM Communities INNER JOIN Joins on Communities.theme = Joins.theme INNER JOIN Topics on Communities.theme = TopicS.theme
WHERE Joins.members_id = @myemail and Joins.theme=@comthemetoposton)
BEGIN
INSERT INTO Topics VALUES (@comthemetoposton, @title, @desctext, @myemail)
END 
ELSE 
PRINT 'you are not in this community' 
END
go

--Show top 5 members with the most attended conferences in common with me.
CREATE PROC mostAttendedConfWithMe 
@myemail varchar(50)
AS 
BEGIN 
SELECT TOP 5 Attend.email, COUNT(Attend.email) AS C 
FROM Attend inner join Conferences on Attend.conference_ID = Conferences.conference_ID and Attend.email = @myemail
GROUP BY Attend.email
ORDER BY C Desc
END 
go

-- View a friend’s profile. I should be able to view his/her information (first name, last name and age), 
--a list of the conferences that he/she have attended, as well as the list of games that he/she have rated along
 --with the rating he/she provided for each game.

 CREATE PROC viewFriendsProfile
 @friendemail varchar(50)
 AS 
 SELECT Normal_Users.first_name, Normal_Users.last_name, Normal_Users.age 
 FROM Members INNER JOIN Normal_Users on Members.email = Normal_Users.email
 WHERE Members.email = @friendemail 

 SELECT Conferences.name
 FROM Conferences INNER JOIN Attend on Conferences.conference_ID = Attend.conference_ID
 WHERE Attend.email = @friendemail 

 SELECT Rate.game,Rate.graphics, Rate.interactivity, Rate.level_design, Rate.uniqueness
 FROM Rate inner join Normal_Users on rate.member_email = Normal_Users.email
 WHERE Rate.member_email = @friendemail

 go 

 --View the overall rating of a game where the overall rating is calculated 
 --as the average of ratings provided by members of the network for that game.
 CREATE PROC overallRate
 @gameID int,
 @result int OUTPUT
 AS
 SELECT AVG(Rate.graphics) AS AvgGRAPHICS, AVG(Rate.interactivity) AS AvgINTERACT, AVG(Rate.level_design) AS AvgLevel_design, AVG(Rate.uniqueness) AS AvgUnique
 --SUM(AvgGRAPHICS, )
 FROM RATE
 WHERE Rate.game = @gameID
 go
 SELECT @result = 

 
--View the list of comments on a conference review, a game review or a Topics posted on a community
--that I have joined.

CREATE PROC commentsoncongametopic
@myemail varchar(50)
AS 
SELECT Topic_comments.content
FROM Communities INNER JOIN Joins on Communities.theme = Joins.theme 
INNER JOIN Topics on Communities.theme = Topics.theme
Inner join Topic_comments on Communities.theme = Topic_comments.theme
WHERE Joins.members_id = @myemail

Select Conference_Review_Comments.content 
From Conference_Review_Comments inner join Conference_Reviews on Conference_Review_Comments.conference_ID = Conference_Reviews.conference_ID

SELECT Review_comment.content
FROM Review inner join Review_comment on Review.game_review_ID = Review_comment.game_review 

go


--View a game and preview its information which includes its name, release date, age limit, the team who devloped it (if any),
-- screenshots, videos, and a list of reviews written for that game.
--- For a Strategies game, I should be able to see if it’s real-time or not. For an action game, I should see its sub-genre. For a sport game, I should see its type. For an RPG game,
-- I should see if it has a storyline or not, and if it has the option of PvP or not.

CREATE PROC geebelrev
@gameID int
as
select * 
from Games INNER JOIN Review on games.game_ID= Review.game
where Games.game_ID = @gameID
go


CREATE PROCEDURE sendMessage
@sender varchar(50),
@reciever varchar(50),
@content varchar(250)
AS
BEGIN
INSERT INTO Messages(sender,reciever,date_of_messages,content) VALUES(@sender,@reciever,CURRENT_TIMESTAMP,@content)
END
GO

CREATE PROCEDURE viewConfrence
@confid int
AS
BEGIN
SELECT name , start_datee , venue
FROM Conferences
SELECT d.team_name , g.name
FROM Attend a inner join Development_Teams d on a.email = d.email  inner join Game g on d.email = g.development_team_email
WHERE a.conference_ID = @confid
SELECT name
FROM Games
WHERE release_conference = @confid
END
GO

CREATE PROC TopTenRecommendation
AS
BEGIN 
SELECT TOP 10  g.name ,COUNT(game_ID) AS C
FROM Recommended r inner join Game g ON (r.game_ID=g.game_ID) inner join Rate ra ON (g.game_ID=ra.game_ID)
WHERE NOT(ra.game_ID=g.game_ID) AND NOT(ra.member=r.member1)
GROUP BY Game
ORDER BY C DESC
END
GO



Alter PROC revPage
@gameid int,
@revid int
AS
BEGIN
SELECT review.verified_reviewer, Review.content, review.game_review_id,  review.game
FROM Review 
WHERE Review.game = @gameid and Review.game_review_ID = @revid
END 
go 

Alter PROC revpage2
@gameid int,
@revid int
as 
begin 
select review_comment.member, review_comment.content as comcon, Review_comment.comment_ID
from Review inner join Review_comment on Review.game_review_ID = Review_comment.game_review
where review.game_review_ID = @revid and Review.game = @gameid
end
go



CREATE PROC gameeNames 
as 
select games.name 
from games  
GO

CREATE PROC gameNameandID
as 
select games.name, games.game_ID 
from games 
go 

Alter PROC kolo 
@idelgame int
as 
select games.game_id, screeshots.content as sslink, videos.content as vidlink, review.review_id, review.verified_reviewer,
AVG(Rate.graphics) AS AvgGRAPHICS, AVG(Rate.interactivity) AS AvgINTERACT, 
AVG(Rate.level_design) AS AvgLevel_design, AVG(Rate.uniqueness) AS AvgUnique
from games inner join screenshots on games.game_id = screenshots.game_id 
inner join Videos on games.game_id = videos.game_id 
inner join review on games.game_id = review.game 

WHERE games.game_ID = @idelgame AND Rate.game = @idelgame
go 

 
Alter PROC viewGame
--@gameName varchar(50),
@gameID int
AS

SELECT  games.game_id, games.age_limit, games.rating, games.name, games.development_team_email,
screenshots.content as sslink, videos.content as vidlink, games.release_date
 
FROM Games INNER JOIN Screenshots on Games.game_ID = Screenshots.game_ID 
INNER JOIN Videos on Games.game_ID = Videos.game_ID
--Where Games.name = @gameName and 
where Games.game_ID = @gameID

IF ( EXISTS ( Select * from ActionG where ActionG.game = @gameID)) 
	select * from ActionG

IF ( EXISTS ( Select * from Sports where Sports.game = @gameID)) 
	select * from Sports

IF ( EXISTS ( Select * from RPG where RPG.game = @gameID)) 
	select * from RPG

IF ( EXISTS ( Select * from Strategies where Strategies.game = @gameID)) 
	select * from Strategies

go 

CREATE PROC normalEmail
AS 
Select * 
from Normal_users
go 

CREATE PROCEDURE getDvp
	as
	BEGIN 
	SELECT e_mail,game_ID,name
	FROM Games g
	INNER JOIN Development_team d ON (g.game_ID=d.game_ID)
	END
	go 

	CREATE PROCEDURE getReviewname
	as
	BEGIN 
	SELECT	 conference_review_ID
	FROM Conference_Review c
	INNER JOIN Conference f ON (c.conference_ID=c.conference_ID)
	end
	go

	CREATE PROCEDURE [dbo].[editNormalUser]
@email varchar(50),
@first_name varchar(50),
@last_name varchar(50),
@date_of_birth datetime
AS
	UPDATE Normal_Users SET first_name  = @first_name, last_name = @last_name, birth_year = @date_of_birth
	WHERE email = @email

	go

------------------------------

--Search by name for different games, conferences, communities, verified reviewers and development teams

Alter PROC NameSearch
@gameName varchar(50),
@conName varchar(50),
@commName varchar(50),
@reviewerFName varchar(50),
@reviewerLName varchar(50),
@devName varchar(50),
@normalFName varchar(50),
@normalLName varchar(50),
@type nvarchar(50) OUTPUT
AS
IF EXISTS (SELECT * FROM Games WHERE [name] = @gameName)
BEGIN
SELECT game_ID AS 'ID' FROM Games WHERE [name] = @gameName
SET @type = 'GAME'
END
ELSE IF EXISTS (SELECT * FROM Conferences WHERE [name] = @conName)
BEGIN
SELECT conference_ID AS 'ID' FROM Conferences WHERE [name] = @conName
SET @type = 'CONFERENCE'
END
ELSE IF EXISTS (SELECT * FROM Communities WHERE [name] = @commName)
BEGIN
SELECT theme AS 'ID' FROM Communities WHERE [name] = @commName
SET @type = 'COMMUNITY'
END
ELSE IF EXISTS (SELECT * FROM Verified_Reviewers WHERE [first_name] = @reviewerFName)
BEGIN
SELECT email as 'ID' FROM Verified_Reviewers WHERE [first_name] = @reviewerFName
SET @type = 'REVIEWER'
END
ELSE IF EXISTS (SELECT * FROM Verified_Reviewers WHERE [last_name] = @reviewerLName)
BEGIN
SELECT email as 'ID' FROM Verified_Reviewers WHERE [last_name] = @reviewerLName
SET @type = 'REVIWER'
END
ELSE IF EXISTS (SELECT * FROM Development_Teams WHERE [team_name] = @devName)
BEGIN
SELECT email as 'ID' FROM Development_Teams WHERE [team_name] = @devName
SET @type = 'DEVELOPMENT'
END
ELSE IF EXISTS (SELECT * FROM Normal_Users WHERE [first_name] = @normalFName)
BEGIN
SELECT email as 'ID' FROM Normal_Users WHERE [first_name] = @normalFName
SET @type = 'NORMAL'
END
ELSE IF EXISTS (SELECT * FROM Normal_Users WHERE [last_name] = @normalLName)
BEGIN
SELECT email as 'ID' FROM Normal_Users WHERE [last_name] = @normalLName
SET @type = 'NORMAL'
END

go
CREATE PROC login 
	@email nvarchar(50) ,
	@password nvarchar(50)
	as
	BEGIN
		DECLARE @user_mail nvarchar(50)
		SELECT @user_mail = email from Members where email = @email AND pass = @password
		if @user_mail != ''
		BEGIN
			SELECT * FROM Members where email = @email AND pass = @password
			RETURN 1
		END
		ELSE
		
			RETURN 0
	END

