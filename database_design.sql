/*Chrons.db*/
CREATE TABLE if not EXISTS account(
	ID INTEGER PRIMARY KEY ASC,
	name TEXT,
	alcohol INTEGER,
	smoking INTEGER,
	alergies INTEGER,
	family_history INTEGER

);

--/*CREATE TABLE Chrons.meal if not EXISTS Chrons.meal(
--	ID INTEGER PRIMARY KEY ASC,
--	cooked TEXT,
--	time date,
--	sauce TEXT,
--	drinks TEXT,
--	description TEXT,
--	spices TEXT,
--	size text
--);*/

CREATE TABLE if not EXISTS meal(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	cooked TEXT,
	time TEXT,
	sauce TEXT,
	drinks TEXT,
	description TEXT,
	spices TEXT,
	size TEXT
);

CREATE TABLE if not exists foodAtMeal (
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	meal INTEGER 
);

CREATE TABLE IF NOT EXISTS food (
	name TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS pain (
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	time TEXT,
	rating INT,
	location TEXT,
	description TEXT
);

CREATE TABLE IF NOT EXISTS bm (
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	time TEXT,
	size TEXT,
	color TEXT,
	blood INT,
	urgency INT,
	description TEXT,
	constipation INT,
	diarrhea INT
);

CREATE TABLE IF NOT EXISTS color(
	ID TEXT PRIMARY KEY NOT NULL
);

/*CREATE TABLE IF NOT EXISTS mood (
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	time TEXT,
	mood TEXT,
	description TEXT
);*/

CREATE TABLE IF NOT EXISTS medTimes(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	time TEXT,
	day TEXT
);

/* While we don't make use of these tables right now, the goal is
to eventually use them to insert other information within each type.
For example we can say frying in the cooked table has a health value of x
and use that in our analytics. */

CREATE TABLE IF NOT EXISTS cooked(
	ID text NOT NULL
);

CREATE TABLE IF NOT EXISTS sauce(
	ID text NOT NULL
);

CREATE TABLE IF not exists drinks (
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS spices (
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS consistency(
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS size(
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS blood (
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS urgency(
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS painLocations(
	ID TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS mood(
	ID TEXT NOT NULL
);

/*would like to use this table for a
 controlled vocabulary and drop down menu
 eventually
*/
CREATE TABLE IF NOT EXISTS medName(
	ID TEXT NOT NULL
);

/*used to populate database originally,
although we might have changed to other inputs later on
*/

--/* insert medName */

INSERT INTO medName VALUES ("Acytal");
INSERT INTO medName VALUES ("Example Medicine");

--/* insert into mood */
INSERT INTO mood VALUES ("Sad");
INSERT INTO mood VALUES ("Stressed");
INSERT INTO mood VALUES ("Calm");
INSERT INTO mood VALUES ("Happy");
INSERT INTO mood VALUES ("Fucked up");
INSERT INTO mood VALUES ("In Pain");

--/* painLocations */
INSERT INTO painLocations VALUES("Stomach");
INSERT INTO painLocations VALUES("Head");
INSERT INTO painLocations VALUES("Bladder");
INSERT INTO painLocations VALUES("Rectum");
INSERT INTO painLocations VALUES("Abdomonal");
INSERT INTO painLocations VALUES("Belly button");
INSERT INTO painLocations VALUES("Right of Bladder");
INSERT INTO painLocations VALUES("Left of Bladder");

--/* urgency */
INSERT INTO urgency VALUES("Urgent");
INSERT INTO urgency VALUES("Not Urgent");
INSERT INTO urgency VALUES("Regular");

--/* blood */
INSERT INTO blood VALUES("BLOODY HELL");
INSERT INTO blood VALUES("None");
INSERT INTO blood VALUES("Medium");

--/* size */
INSERT INTO size VALUES("Large");
INSERT INTO size VALUES("Watermelon");
INSERT INTO size VALUES("Sringbeans size");
INSERT INTO size VALUES("Little Plops");

--/* consistency */
INSERT INTO consistency VALUES("Loose");
INSERT INTO consistency VALUES("Solid");
INSERT INTO consistency VALUES("Inbetween");

--/*insert into spices*/
INSERT INTO spices VALUES("Oregano");

--/*insert into drinks */
INSERT INTO drinks VALUES("Soda");
INSERT INTO drinks VALUES("Orange Juice");
INSERT INTO drinks VALUES("Seltzer");
INSERT INTO drinks VALUES("Water");


--/* insert into sauce */
INSERT INTO sauce VALUES("BBQ");

--/* insert into cooked */
INSERT INTO cooked VALUES("Steamed");
INSERT INTO cooked VALUES("Fryed");

--/* insert into medTimes */
INSERT INTO medTimes VALUES(null, "Acytal", "08:30", null);
INSERT INTO medTimes VALUES (null, "Acytal", "15:00",null);
INSERT INTO medTimes VALUES (null, "Acytal", "00:00",null);

--/* insert into color */
INSERT INTO color VALUES("Normal");
INSERT INTO color VALUES("Green");
INSERT INTO color VALUES("Red");


--/*insert into moood
--CREATE TABLE mood (
--	ID INT PRIMARY KEY ASC,
--	time TEXT,
--	mood TEXT,
--	description TEXT
--	YYYY-MM-DDTHH:MM:SS
--);
--*/

--/*CREATE TABLE pain (
--	ID INT PRIMARY KEY ASC,
--	time TEXT,
--	rating INT,
--	location TEXT,
--	description TEXT
--);
--*/

INSERT INTO pain VALUES(null, "2014-02-23 08:30", 5, "Abdomonal", "Hurt a lot underneath belly button and while pooping.");
INSERT INTO pain VALUES(null, "2014-02-23 12:00", 9, "Abdomonal", "Hurt a lot underneath belly button.");
INSERT INTO pain VALUES(null, "2014-02-24 22:00", 9, "Abdomonal", "Hurt a lot underneath belly button.");

--/*CREATE TABLE food (
--	name TEXT PRIMARY KEY NOT NULL
--);
--*/	

INSERT INTO food VALUES("Chicken");
INSERT INTO food VALUES("Sushi");
INSERT INTO food VALUES("Shnitzel");
INSERT INTO food VALUES("Beef");
INSERT INTO food VALUES("Salad");
INSERT INTO food VALUES("Carrots");
INSERT INTO food VALUES("Potatoes");
INSERT INTO food VALUES("Peas");

--/*
--CREATE TABLE foodAtMeal (
--	ID INT PRIMARY KEY ASC,
--	name TEXT,
--	meal INT 
--);
--*/

INSERT INTO foodAtMeal VALUES(null, "Chicken", 1);
INSERT INTO foodAtMeal VALUES(null, "Peas", 1);

INSERT INTO foodAtMeal VALUES(null, "Sushi", 2);
INSERT INTO foodAtMeal VALUES(null, "Potatoes", 2);

INSERT INTO foodAtMeal VALUES(null, "Potatoes", 3);
INSERT INTO foodAtMeal VALUES(null, "Carrots", 3);
INSERT INTO foodAtMeal VALUES(null, "Salad", 3);
INSERT INTO foodAtMeal VALUES(null, "Chicken", 3);
INSERT INTO foodAtMeal VALUES(null, "Beef", 4);
INSERT INTO foodAtMeal VALUES(null, "Beef", 5);
INSERT INTO foodAtMeal VALUES(null, "Beef", 6);
INSERT INTO foodAtMeal VALUES(null, "Chicken", 7);
INSERT INTO foodAtMeal VALUES(null, "Chicken", 8);

/*
CREATE TABLE if not EXISTS meal(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	cooked TEXT,
	time TEXT,
	sauce TEXT,
	drinks TEXT,
	description TEXT,
	spices TEXT,
	size TEXT
);
--*/

INSERT INTO meal VALUES(null, "Steamed", "2014-02-23 07:00", null, "Water", "Ate breakfast this morning.", "Oregano", "Large");
INSERT INTO meal VALUES(null, null, "2014-02-23 12:30", "BBQ", "Seltzer", "Ate full meal", null, "Large");
INSERT INTO meal VALUES(null, null, "2014-02-23 12:00", null, "Water", null, null, "Large");
INSERT INTO meal VALUES(null, "Steamed", "2014-02-23 06:00", null, "Water", "Ate breakfast this morning.", null, "Large");
INSERT INTO meal VALUES(null, "Baked", "2014-02-24 07:45", null, "Coke", null, null, "medium");
INSERT INTO meal VALUES(null, "Baked", "2014-02-24 12:45", null, "Coke", null, null, "medium");
INSERT INTO meal VALUES(null, "Baked", "2014-02-24 20:45", null, "Coke", null, null, "medium");
INSERT INTO meal VALUES(null, "Baked", "2014-02-25 07:00", null, "Coke", null, null, "medium");
--/*CREATE TABLE bm (
--	ID INT PRIMARY KEY ASC,
--	time TEXT,
--	size TEXT,
--	color TEXT,
--	blood int,
--	urgency int,
--	description TEXT
--	constipation INT,
--	diarrhea INT
--);
--*/

INSERT INTO bm VALUES(null, "2014-02-23 08:00", "Little Plops", "red", 0, 1, null, 1, 0);
INSERT INTO bm VALUES(null, "2014-02-23 20:00", "Little Plops","green", 5, 6, null, 0, 1);
INSERT INTO bm VALUES(null, "2014-02-24 08:00", "Tiny", "yellow", 3, 4, null, 1, 0);
INSERT INTO bm VALUES(null, "2014-02-24 12:00", "Tiny", "yellow", 3, 4, null, 1, 0);
INSERT INTO bm VALUES(null, "2014-02-24 22:00", "Tiny", "yellow", 3, 4, null, 1, 0);

/*not all of these work, I left them in to show the progression of my query writing*/

--finding all food in meals
SELECT fm.meal, fm.name, m.time
	FROM foodAtMeal fm, meal m
	Inner JOIN food f ON (fm.name = f.name)
	Inner JOIN meal ON (fm.meal = m.ID)
	GROUP BY fm.ID
	ORDER BY m.time DESC
	;

--find when you had pain
SELECT p.time 
	FROM pain p 
	ORDER BY p.time DESC;


--get last meal 
SELECT max(m.time)
	FROM meal m, pain p
	WHERE m.time <=  p.time
	;

--select last eaten item after logging pain
SELECT fm.meal, fm.name, m.time
	FROM foodAtMeal fm, meal m
	INNER JOIN food f ON (fm.name = f.name)
	INNER JOIN meal ON (fm.meal = m.ID)
	WHERE m.time = (SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time)
	GROUP BY fm.ID
	ORDER BY m.time;

-- select food before last bm
SELECT fm.meal, fm.name
	FROM foodAtMeal fm
	INNER JOIN food f ON (fm.name = f.name)
	INNER JOIN meal m ON (fm.meal = m.ID)
	WHERE m.time BETWEEN (SELECT max(b.time) FROM bm b WHERE b.time < (SELECT max(b.time) FROM bm b)) AND (SELECT max(b.time) FROM bm b)
	ORDER BY m.time;

--all times between last bm and prior bm
SELECT max(b.time) FROM bm b WHERE b.time < (SELECT max(b.time) FROM bm b);

--food that gives the most pain
--count the number of times you register pain after each food
-- should say chicken
-- select max and then print everything with that max value
SELECT max(
	(SELECT 
	count(fm.name)
	FROM foodAtMeal fm
	WHERE fm.name = (SELECT fm.name
	FROM foodAtMeal fm, meal m
	INNER JOIN food f ON (fm.name = f.name)
	INNER JOIN meal ON (fm.meal = m.ID)
	WHERE m.time = (SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time)
	GROUP BY fm.ID
	ORDER BY m.time)
	)
	), SELECT fm.name
	FROM foodAtMeal fm
	WHERE (SELECT 
	count(fm.name)
	FROM foodAtMeal fm
	WHERE fm.name = (SELECT fm.name
	FROM foodAtMeal fm, meal m
	INNER JOIN food f ON (fm.name = f.name)
	INNER JOIN meal ON (fm.meal = m.ID)
	WHERE m.time = (SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time)
	GROUP BY fm.ID
	ORDER BY m.time)
	)
	;


--% of times food gives you pain

SELECT count (SELECT fm.name, m.time
	FROM foodAtMeal fm, meal m
	Inner JOIN food f ON (fm.name = f.name)
	Inner JOIN meal ON (fm.meal = m.ID)
	GROUP BY fm.ID
	ORDER BY m.time DESC)

--select total number of times you've had item
SELECT count  (fm.name) as TotalCount, fm.name
	FROM foodAtMeal fm
	GROUP BY fm.name
	ORDER BY TotalCount
	;

--select number of times you've had item and registered pain after
SELECT count(
SELECT fm.name
	FROM foodAtMeal fm, meal m
	INNER JOIN food f ON (fm.name = f.name)
	INNER JOIN meal ON (fm.meal = m.ID)
	WHERE m.time = (SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time)
	GROUP BY fm.ID
	ORDER BY m.time)
FROM foodAtMeal fm
GROUP BY fm.name
;

SELECT count(fm.name), fm.name
	FROM foodAtMeal fm
	INNER JOIN meal m ON (fm.meal = m.ID)
	WHERE m.time = (SELECT m.time FROM meal m, pain p WHERE m.time <= p.time AND m.time > 
		(SELECT m.time FROM meal m, pain p WHERE m.time <=  p.time))
	GROUP BY fm.ID
	;

SELECT count(fm.name), fm.name
	FROM foodAtMeal fm, pain p
	INNER JOIN meal m ON (fm.meal = m.ID)
 	WHERE p.time >= m.time
	GROUP BY fm.name
	;	

SELECT m.time FROM meal m, pain p WHERE m.time <= p.time AND m.time>= 
(SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time) 
GROUP BY m.time;

--subtract count of when its lower from count of when its above time

--find pain 

SELECT 
	(SELECT count(fm.name)	
	FROM foodAtMeal fm, pain p
	INNER JOIN meal m ON (fm.meal = m.ID)
 	WHERE p.time >= m.time
	GROUP BY fm.id)
	-
	(SELECT count(fm.name)
	FROM foodAtMeal fm, pain p
	INNER JOIN meal m ON (fm.meal = m.ID)
 	WHERE p.time <= m.time
	GROUP BY fm.id)
	FROM foodAtMeal
;

SELECT count(fm.name), fm.name
	FROM pain p
	INNER JOIN meal m, foodAtMeal fm ON (fm.meal = m.ID)
 	WHERE (SELECT max(m.time) FROM meal m, pain p WHERE m.time <=  p.time)
	GROUP BY fm.name
;


SELECT p.time
FROM pain p, meal m
WHERE p.time <= (m.time + "12:00") OR p.time >=

SELECT m.time, m.time + "0000-00-00T01:00"
FROM meal m, pain p
WHERE (m.time + "0000-00-00T01:00") >= p.time AND (m.time <p.time)
GROUP BY m.time;

SELECT m.time
FROM pain p, meal m
WHERE datetime(p.time) <= (datetime(m.time, '+12 hours')) AND datetime(p.time) > datetime(m.time)
GROUP BY m.time;

SELECT fm.name, m.time
FROM meal m, foodAtMeal fm
WHERE m.time == (SELECT m.time
	FROM pain p, meal m
	WHERE datetime(p.time) <= (datetime(m.time, '+12 hours')) AND datetime(p.time) > datetime(m.time)
	GROUP BY m.time) 
AND m.ID == fm.meal
GROUP BY fm.name;





















/* Everything past here is working */

--all foods that give you pain
SELECT fm.name, m.time
FROM meal m, foodAtMeal fm
WHERE m.time IN (SELECT m.time
	FROM pain p, meal m
	WHERE datetime(p.time) <= (datetime(m.time, '+12 hours')) AND datetime(p.time) >= datetime(m.time)
	GROUP BY m.time) 
AND m.ID = fm.meal
GROUP BY fm.name
ORDER BY m.time DESC;


--number of times a food gives you pain
SELECT count(fm.name) as numOfTimes, fm.name
FROM foodAtMeal fm
WHERE fm.name IN (
	SELECT fm.name
	FROM meal m, foodAtMeal fm
	WHERE m.time IN (SELECT m.time
	FROM pain p, meal m
	WHERE datetime(p.time) <= (datetime(m.time, '+12 hours')) AND datetime(p.time) >= datetime(m.time)
	GROUP BY m.time) 
	AND m.ID = fm.meal
	ORDER BY m.time DESC
	)
	GROUP BY fm.name
	ORDER BY numOfTimes DESC
;


--food that gives you diahreah
SELECT fm.name, m.time
FROM meal m, foodAtMeal fm
WHERE m.time IN (SELECT m.time
	FROM bm bm, meal m
	WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.diarrhea >= 1)
	GROUP BY m.time) 
AND m.ID = fm.meal
GROUP BY fm.name
ORDER BY m.time DESC;

-- food before going to the bthrm with urgent
 
SELECT fm.name, m.time
FROM meal m, foodAtMeal fm
WHERE m.time IN (SELECT m.time
	FROM bm bm, meal m
	WHERE datetime(bm.time) <= (datetime(m.time, '+12 hours')) AND datetime(m.time) <= datetime(bm.time) AND bm.urgency >= 1
	GROUP BY m.time) 
AND (m.ID = fm.meal)
GROUP BY fm.name
ORDER BY m.time DESC;


--food that gives you constipation

SELECT fm.name, m.time
FROM meal m, foodAtMeal fm
WHERE m.time IN (SELECT m.time
	FROM bm bm, meal m
	WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.constipation >= 1)
	GROUP BY m.time) 
AND m.ID = fm.meal
GROUP BY fm.name
ORDER BY m.time DESC;

-- % of times a food gives you pain

	--(#times gives pain  x  100)  / total times eaten = %


	--get the food that gives you pain and number of times


SELECT count(m.ID) AS numTimes, fm.name
FROM meal m
INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)
WHERE m.time IN (SELECT m.time
	FROM pain p, meal m
	WHERE (datetime(p.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(p.time))
	GROUP BY m.time)
GROUP BY fm.name
ORDER BY numTimes DESC;

	--count the number of times the fm.name from previous query appears total

SELECT count(fm.name) as numTimes, fm.name
FROM foodAtMeal fm
WHERE fm.name = "Chicken";

-- % times food that gives you diarreah

	--(#times gives diarreah  x  100)  / total times eaten = %


	--get the food that gives you diarreah and number of times


SELECT count(m.ID), fm.name
FROM meal m
INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)
WHERE m.time IN (SELECT m.time
	FROM bm bm, meal m
	WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.diarrhea >= 1)
	GROUP BY m.time)
GROUP BY fm.name;
	--count the number of times the fm.name from previous query appears total

SELECT count(fm.name) as numTimes, fm.name
FROM foodAtMeal fm
WHERE fm.name = "Chicken";

-- % times food that gives you constipation


	--(#times gives constipation  x  100)  / total times eaten = %


	--get the food that gives you constipation and number of times

SELECT count(m.ID), fm.name
FROM meal m
INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)
WHERE m.time IN (SELECT m.time
	FROM bm bm, meal m
	WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.constipation >= 1)
	GROUP BY m.time)
GROUP BY fm.name;

	--count the number of times the fm.name from previous query appears total

SELECT count(fm.name) as numTimes, fm.name
FROM foodAtMeal fm
WHERE fm.name = "Chicken";


-- all incidents for a specific food





--worst pain
SELECT pain.time, pain.description, pain.location, pain.rating
FROM pain
ORDER BY pain.rating DESC LIMIT 5
;