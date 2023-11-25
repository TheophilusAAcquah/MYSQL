/* Querying our players table*/

SELECT * FROM players;

/*What are average, max, and min values in the data?*/
/*Average height_cm, average weight_kg, average age, max age
min age from our table*/

SELECT avg(Height_CM) AS Average_height, avg(Weight_KG) AS Average_weight, 
avg(Age) AS Average_age
FROM players;

SELECT max(Age) AS Max_age, min(Age) AS Minimum_age
FROM players;

/*Checking the max,min seasons in the league and the players associated with it*/
SELECT max(Seasons_in_league) AS Maximum_seasons_in_league,min(Seasons_in_league) 
AS Minimum_seasons_in_league 
FROM players;

SELECT Player, max(Seasons_in_league) AS Maximum_seasons_in_league
FROM players
GROUP BY Player
ORDER BY
Maximum_seasons_in_league DESC
LIMIT 1;

SELECT Player, min(Seasons_in_league) AS Minimum_seasons_in_league
FROM players
GROUP BY Player
ORDER BY 
Minimum_seasons_in_league ASC
LIMIT 1;

/*Selecting the maximum and minimum draft year*/
SELECT max(Draft_Year),min(Draft_Year)
FROM players;

/*What about those numbers per category in the data (using HAVING)?*/
/* Checking for teams that have average height greater than the overall average*/
SELECT Team, avg(Height_CM) AS Average_height
FROM players
GROUP BY Team
HAVING avg(Height_CM) >= 201;

/* Checking for teams that have average weight greater than the overall average*/
SELECT Team, avg(Weight_KG) AS Average_weight
FROM players
GROUP BY Team
HAVING avg(Weight_KG) >= 101;

/* Checking for teams that have average height less than the overall average*/
SELECT Team, avg(Height_CM) AS Average_height
FROM players
GROUP BY Team
HAVING avg(Height_CM) < 201;

/* Checking for teams that have average weight less than the overall average*/
SELECT Team, avg(Weight_KG) AS Average_weight
FROM players
GROUP BY Team
HAVING avg(Weight_KG) < 101;

/* Checking for players who have being in the league for more than 7 years */
SELECT Player, count(DISTINCT Seasons_in_league) 
FROM players
GROUP BY Player
HAVING count(DISTINCT Seasons_in_league) >7
ORDER BY count(DISTINCT Seasons_in_league)DESC;
SELECT * FROM players;

/*What ways are there to group the data values that don’t exist yet (using CASE)?*/
/* Selecting players and categorising them according to Tall and Average_height and short*/
SELECT Player, Team, Conference, Position, Height_CM, 
CASE 
WHEN Height_CM > 201 THEN "Tall"
     WHEN Height_CM BETWEEN 150 AND 201 THEN "Average_height"
     ELSE "Short"
     END
     FROM players;

/*Selecting players and assigning veteran,advance beginner and novice status to them
 base on the number of seasons they have played */
SELECT Player,Team,Draft_Year,Seasons_in_league,
CASE
WHEN Seasons_in_league > 10 THEN "Veteran"
WHEN Seasons_in_league BETWEEN 4 AND 10 THEN "Advance Beginner"
ELSE "Novice"
END
FROM players;


/*What interesting ways are there to filter the data (using AND/OR)?*/
SELECT * FROM players
WHERE Team = "Houston Rockets" 
AND Position = "PF";

SELECT * FROM players
WHERE (TEAM = "Lakers" AND Position ="PF") OR (TEAM = "Houston Rockets" AND Position ="PG");


SELECT * FROM players
WHERE (Conference = "East" OR Conference = "West") AND Seasons_in_league > 5;