/*
Steven Han - steven.han@nbcuni.com
Week 3 Assignment – SQL One to Many Relationships

1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources.

2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos.

3. Report on Video Reviews. Write a JOIN statement that shows information from both tables. 
*/

DROP TABLE IF EXISTS mySQLtutorials;
DROP TABLE IF EXISTS viewerActivity; 

CREATE TABLE mySQLtutorials
(
	video_id VARCHAR(30) PRIMARY KEY,
    video_title VARCHAR(60) NOT NULL,
    video_length INT NOT NULL,
    video_url VARCHAR(100) NOT NULL
);

INSERT INTO mySQLtutorials
(video_id, video_title, video_length, video_url)
VALUES
('yPu6qV5byu4','MySQL Tutorial',2470,'https://www.youtube.com/watch?v=yPu6qV5byu4'),
('nN4Kjdverzs','MySQL Beginner Tutorial 1 - Introduction to MySQL',621,'https://www.youtube.com/watch?v=nN4Kjdverzs'),
('KgiCxe-ZW8o','MySQL Database Tutorial - 1 - Introduction to Databases',452,'https://www.youtube.com/watch?v=KgiCxe-ZW8o'),
('K6w0bZjl_Lw','Create MySQL Database - MySQL Workbench Tutorial',1035,'https://www.youtube.com/watch?v=K6w0bZjl_Lw'),
('6pbxQQG25Jw','MySQL Tutorial 1 - What is MySQL',572,'https://www.youtube.com/watch?v=6pbxQQG25Jw'),
('mpQts3ezPVg','PHP MySQL Tutorial',1162,'https://www.youtube.com/watch?v=mpQts3ezPVg'),
('7Vtl2WggqOg','SQL for Beginners. Learn basics of SQL in 1 Hour',3433,'https://www.youtube.com/watch?v=7Vtl2WggqOg'),
('lQx7qZ7XApI','MySQL Database Tutorial - 17 - Functions',374,'https://www.youtube.com/watch?v=lQx7qZ7XApI'),
('X_umYKqKaF0','MySQL Workbench Tutorial',828,'https://www.youtube.com/watch?v=X_umYKqKaF0'),
('es_t9QXpXY4','Lesson 6: Doing Advanced Queries - MySQL Course',2916,'https://www.youtube.com/watch?v=es_t9QXpXY4'),
('X7WBmlK8GLo','MySQL For Beginners - Tutorial 1 - Introduction to Basics',450,'https://www.youtube.com/watch?v=X7WBmlK8GLo'),
('JLxZysIQyuc','MySQL tutorial SQL data types explained',609,'https://www.youtube.com/watch?v=JLxZysIQyuc'),
('Pz5CbLqdGwM','Login System Tutorial with PHP and MYSQL Database',1966,'https://www.youtube.com/watch?v=Pz5CbLqdGwM'),
('7Pwj7nV-oRM','MySQL 5 Tutorial | MySQL Workbench Data Modeling Intro',553,'https://www.youtube.com/watch?v=7Pwj7nV-oRM'),
('6BfofgkrI3Y','MySQL Database Tutorial - 22 - How to Join Tables',509,'https://www.youtube.com/watch?v=6BfofgkrI3Y'),
('93aSVSR4E6Y','MySQL Tutorials - 02 MySQL Architecture Part 1',2621,'https://www.youtube.com/watch?v=93aSVSR4E6Y');

-- Check if the mySQLtutorial table returns valid data
SELECT *
FROM mySQLtutorials;

CREATE TABLE viewerActivity
(
	user_id VARCHAR(30) NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    video_id VARCHAR(30) NOT NULL REFERENCES mySQLtutorials(video_id),
    user_rating INT NOT NULL,
    user_comment VARCHAR(300) NOT NULL,
    PRIMARY KEY(user_id, video_id)
);

INSERT INTO viewerActivity
(user_id, user_name, video_id, user_rating, user_comment)
VALUES
('UCA6ai42QruEZIuDuxU-YPkA','Sh1z0DagStab','yPu6qV5byu4',4,'man how fast can you type'),
('UCTqDfkwmnUHg7k9s9jdxKqw','Akash Perera','yPu6qV5byu4',5,'You are a god! Thanks man!'),
('UCzghVEPKh_Ns1Mpmd_VHkaA','Brendan Crowther','yPu6qV5byu4',5,'Awesome video!'),
('UCcfqNBWozYYlsRqB8SkL3tg','daisy 5565','nN4Kjdverzs',3,'dear i wonna download mysql. give me a website. i am new learner'),
('UCA7CZDWsoHu1GRQPWMYvkXg','Yash Raj Singh','KgiCxe-ZW8o',5,'very useful ... especially a day before the exam'),
('UCdbGL1QAa3G3cbccnYMluxA','Harris Scoggins','KgiCxe-ZW8o',5,'Your the man I appreciate all your videos they are very helpful.'),
('UCiJLKGnZC27kZNwVgTq5z1w','Kirill Kanshin','6pbxQQG25Jw',2,'Why everything is done in terminal / console, what is the use of workbench then?'),
('UCiJLKGnZC27kZNwVgTq5z1w','Kirill Kanshin','mpQts3ezPVg',2,'What is the advantage of terminal? Cross-platform?'),
('UC5CUDBYNIbGPNtXwunEvYWA','Christian Batista','mpQts3ezPVg',5,'Great!!!! thanks!'),
('UCnkmax-ogEp_6ch4QjRCaYw','Seerat','lQx7qZ7XApI',5,'THIS IS WOWIE.THANKS'),
('UCH2CEQykhCGqFMvUQwIYhyw','sujith jayaraj','X_umYKqKaF0',3,'Understandable video'),
('UCb3xtB3PKD8_hko-n195DeA','Wale Mandela','X_umYKqKaF0',5,'He practically blew me off... amazing amount of knowledge given out here with a great deal of dexterity. Muchas gracias senor'),
('UCobQE6gsyMitGYailbn-0rQ','Arti Keshari','X_umYKqKaF0',5,'awesome.... you are doing a great job.... people like me who cannot stuck with books and tutorials for long is the best way to learn... specially these videos give us confidence that we know almost everything about this topic and can go ahead for work with this language... thanku so much...'),
('UCapC872pQQh29QX186SHsWQ','Mairaj Pirzada','JLxZysIQyuc',5,'THIS IS THE BEST MYSQL TUTORIAL I HAVE SEEN TILL DATE. JUST MARVELLEOUS! PLEASE KEEP PRODUCING MORE VIDEOS AS DETAILED AS THIS!'),
('UCweKS48H88ixllu5WHR6aKA','Politiekman','Pz5CbLqdGwM',4,'Yeah I watched the whole thing, this was very helpful go get going with mySQL, which is good because my website is going to rely heavily on it.'),
('UCnoCQRkNLeUn7p7zgZgkMJA','Massimo Bertolla','Pz5CbLqdGwM',5,'Thank you for showing us this innovative SQL knowledge. Keep going!'),
('UCLtY3De6owVQo_j_yKjTJzg','Nemanja','6BfofgkrI3Y',5,'This is awesome!'),
('UCp6TnTKbysh4j4ZvyFmEKzA','Gopal Bogati','6BfofgkrI3Y',5,'you are just awesome ..keep on making tutorials');

-- Check if the mySQLtutorial table returns valid data
SELECT *
FROM viewerActivity;

-- LEFT JOIN from mySQLtutorial on viewerActivity table to include videos where no comments / ratings were made

SELECT
Videos.video_title AS `Title`,
Videos.video_length AS `Video Length`,
IFNULL(AVG(Viewers.user_rating), 0) AS `Average Rating`,
IFNULL(COUNT(Viewers.user_comment), 0) AS `Total Comments`,
IFNULL(COUNT(DISTINCT Viewers.user_id), 0) AS `Commenters`

FROM mySQLtutorials AS `Videos`
LEFT JOIN viewerActivity as `Viewers`
ON Videos.video_id = Viewers.video_id

GROUP BY `Title`, `Video Length`
ORDER BY `Average Rating` DESC;
