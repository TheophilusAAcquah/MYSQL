/*creating our footballers table */
CREATE TABLE footballers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age INTEGER, position TEXT);

INSERT INTO footballers (name,age,position) VALUES ("Martin Odegard", 28, "Midfielder");
INSERT INTO footballers (name,age,position) VALUES ("Bukayo Saka", 27, "Winger");
INSERT INTO footballers (name,age,position) VALUES ("Aaron Ramsdale", 31, "Goalkeeper");
INSERT INTO footballers (name,age,position) VALUES ("Ben White", 28, "Defender");
INSERT INTO footballers (name,age,position) VALUES ("Enzo Fernandez", 26, "midfielder");
INSERT INTO footballers (name,age,position) VALUES ("Christopher Nkunku", 31, "forward");
INSERT INTO footballers (name,age,position) VALUES ("Richarlison", 27, "forward");
INSERT INTO footballers (name,age,position) VALUES ("Hugo lloris", 30, "Goal keeper");
INSERT INTO footballers (name,age,position) VALUES ("Mo Salah", 31, "Winger");
INSERT INTO footballers (name,age,position) VALUES ("Luis Diaz", 28, "Foward");

/* creating second table, teams */
CREATE TABLE teams (id INTEGER PRIMARY KEY AUTO_INCREMENT, football_id INTEGER,team TEXT, sign_year TEXT);
INSERT INTO teams (football_id,team,sign_year) VALUES ("1", "Arsenal", "2022");
INSERT INTO teams (football_id,team,sign_year) VALUES ("2", "Arsenal", "2021");
INSERT INTO teams (football_id,team,sign_year) VALUES ("3", "Arsenal", "2019");
INSERT INTO teams (football_id,team,sign_year) VALUES ("4", "Arsenal", "2022");
INSERT INTO teams (football_id,team,sign_year) VALUES ("5", "Chelsea", "2023");
INSERT INTO teams (football_id,team,sign_year) VALUES ("6", "Chelsea", "2020");
INSERT INTO teams (football_id,team,sign_year) VALUES ("7", "Tottenham", "2018");
INSERT INTO teams (football_id,team,sign_year) VALUES ("8", "Tottenham", "2019");
INSERT INTO teams (football_id,team,sign_year) VALUES ("9", "Liverpool", "2018");
INSERT INTO teams (football_id,team,sign_year) VALUES ("10", "Liverpool", "2022"); 

/*querying our tables*/
SELECT * FROM footballers;
SELECT * FROM teams;

/* arsenal players, their age and position */
SELECT name,age,position 
FROM footballers
JOIN teams
ON footballers.id = teams.football_id
WHERE teams.team = "Arsenal";

/* select players who were signed after 2020*/
SELECT name, sign_year
FROM footballers
JOIN teams
ON footballers.id = teams.football_id
WHERE teams.sign_year > "2020";
 
/* Using CASE to state whether the player is old or not*/
SELECT name, age, team, position,sign_year,
CASE 
WHEN age>30 THEN "OLD"
ELSE "YOUNG"
END AS Young_or_old
FROM footballers
JOIN teams
ON footballers.id = teams.football_id;

/* Average age of players where theaverage age >25*/
SELECT team,round(AVG(age),1)
FROM footballers
JOIN teams
ON footballers.id = teams.football_id 
GROUP BY team
HAVING AVG(age)>25;

/*forwards who are younger than 30 and their team */
SELECT name,position, age,team
FROM footballers
JOIN teams
ON footballers.id = teams.football_id
WHERE footballers.position = "forward"AND footballers.age < 30;

/*fowards who are younger than 30 and 
their team(wrongly spelt foward in one of the columns*/
SELECT name,position, age,team
FROM footballers
JOIN teams
ON footballers.id = teams.football_id
WHERE footballers.position = "foward"AND footballers.age < 30;


/* trying out the double join*/
DROP TABLE competiton;
CREATE TABLE competition (id INTEGER PRIMARY KEY AUTO_INCREMENT, COMP1_id INTEGER,COMP2_id INTEGER);
INSERT INTO competition (COMP1_id, COMP2_id) VALUES (1,2);
INSERT INTO competition (COMP1_id, COMP2_id) VALUES (3,4);
INSERT INTO competition (COMP1_id, COMP2_id) VALUES (5,6);
INSERT INTO competition (COMP1_id, COMP2_id) VALUES (7,8);
INSERT INTO competition (COMP1_id, COMP2_id) VALUES (9,10);

SELECT * FROM competition;

SELECT footballers.name, footballers2.name 
FROM competition
JOIN footballers
ON competition.COMP1_id = footballers.id 
JOIN footballers AS footballers2
ON competition.COMP2_ID = footballers2.id;