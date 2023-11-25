CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age
INTEGER);
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
 name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");

SELECT * FROM persons;
SELECT * FROM hobbies;

INSERT INTO persons (name, age) VALUES ("Anita Gnadig", 15);
INSERT INTO hobbies (person_id, name) VALUES (7, "eating");

SELECT persons.name, hobbies.name FROM persons JOIN hobbies
ON hobbies.person_id = persons.id;

SELECT persons.name, hobbies.name FROM persons JOIN hobbies
ON hobbies.person_id = persons.id WHERE persons.name = "Bobby McBobbyFace";

CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "TARDIS", 1000000.00);
 
 SELECT * FROM customers;
 SELECT * FROM orders;
 
 SELECT customers.name, customers.email, orders.item, orders.price
 FROM customers LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id;
 
SELECT customers.name, customers.email, SUM(orders.price) AS total_amount
FROM customers LEFT OUTER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name, customers.email
ORDER BY total_amount DESC;

CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

SELECT * FROM  movies;

SELECT sequels.title AS movie, movies.title AS sequel
FROM movies RIGHT OUTER JOIN movies AS sequels 
ON movies.id = sequels.sequel_id;

/*SELECT sequels.title AS movie, movies.title AS sequel
FROM movies AS sequels LEFT OUTER JOIN movies
ON movies.id = sequels.sequel_id;*/

SELECT movies.title, sequel_table.title
FROM movies LEFT OUTER JOIN movies AS sequel_table
on movies.sequel_id = sequel_table.id;

USE cohort23;
CREATE TABLE students (id INTEGER PRIMARY KEY AUTO_INCREMENT, first_name TEXT, last_name TEXT, email
TEXT, phone TEXT, birthdate TEXT);
INSERT INTO students (first_name, last_name, email, phone, birthdate)
VALUES ("Theo", "Rabbit", "theo@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
VALUES ("Naa", "Wonderland", "naa@wonderland.com", "555-4444", "2002-07-04");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
VALUES ("Fatima", "Lampland", "fatima@lampland.com", "555-3333", "2001-05-10");
INSERT INTO students (first_name, last_name, email, phone, birthdate)
VALUES ("Sam", "Kingston", "sam@kingston.com", "555-1111", "2001-12-24");

CREATE TABLE student_projects (id INTEGER PRIMARY KEY AUTO_INCREMENT,student_id INTEGER,title TEXT);
INSERT INTO student_projects (student_id, title)
VALUES (1, "Carrotapault");
INSERT INTO student_projects (student_id, title)
VALUES (2, "Mad Hattery");
INSERT INTO student_projects (student_id, title)
VALUES (3, "Carpet Physics");
INSERT INTO student_projects (student_id, title)
VALUES (4, "Hyena Habitats");

CREATE TABLE project_pairs (id INTEGER PRIMARY KEY AUTO_INCREMENT, project1_id INTEGER, project2_id
INTEGER);
INSERT INTO project_pairs (project1_id, project2_id)
VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id)
VALUES(3, 4);

SELECT * FROM students;
SELECT * FROM student_projects;
SELECT * FROM project_pairs;

SELECT *, student_projects.title FROM project_pairs
JOIN student_projects;

SELECT p1.title, p2.title FROM project_pairs
JOIN student_projects AS p1
ON project_pairs.project1_id = p1.id
JOIN student_projects AS p2
ON project_pairs.project2_id = p2.id;


CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age
INTEGER);
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER,
person2_id INTEGER);
INSERT INTO friends (person1_id, person2_id)
VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
VALUES (2, 3);

SELECT * FROM persons;
SELECT * FROM hobbies;
SELECT * FROM friends;

SELECT persons.fullname, hobbies.name
FROM persons JOIN hobbies
ON persons.id = hobbies.person_id;

SELECT p1.fullname AS Person, p2.fullname AS Friend
FROM friends 
JOIN persons AS p1
ON friends.person1_id = p1.id
JOIN persons AS p2
ON friends.person2_id = p2.id;

CREATE TABLE exercise_logs (id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT, minutes
INTEGER, calories INTEGER, heart_rate INTEGER);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70,
90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72,
80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);




CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE books (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT, author TEXT, genre TEXT, published_year INTEGER, price INTEGER, quantity INTEGER);

INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Atomic Habits", "James Claire", "Self Help", 2010, 20, 10);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Meet me at the lake", "Carley Fortune", "Novel", 2022, 7, 5);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Shoe Dog", "Phil Knight", "Memoir", 2020, 8, 12);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Deep Work", "Carl Newport", "Self Help", 2009, 7, 15);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Finding Me", "James Claire", "Self Help", 2010, 20, 10);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("This is not Yvonne", "Yvonne Nelson", "Memoir", 2023, 20, 15);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Harry Porter and the goblin of fire", "JK Rowling", "Fanfiction", 2000, 15, 12);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Into Spaces", "Theo Rabbit", "Sci-fi", 2023, 30, 4);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Take the risk", "Ben Carson", "Self Help", 2011, 12, 9);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Bias Agenda", "Fathima Gnad", "Romance", 2021, 15, 4);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Whispers in the Wilderness", "Wilder Moon", "Fantasy", 2022, 15, 8);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Love's Illusion", "Illiana Twilight", "Romance", 2021, 14, 5);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Savior's Champion", "Jenna Moreci", "Fantasy", 2018, 7, 8);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Book Lovers", "Emily Henry", "Novel", 2020, 20, 6);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Quantum Quasar", "Quinlan Starcruiser", "Sci-fi", 2018, 19, 12);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Building a second brain", "Tiago Forte", "Self Help", 2023, 44, 2);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Cursed Carousel", "Carousel Darkwood", "Horror", 2019, 17, 3);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Alice in Wonderland", "Lewis Carroll", "Fantasy", 2009, 8, 8);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Pride and prejudice", "Jane Austen", "Novel", 1983, 27, 10);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("One Hundred Years of Solitude", "Gabriel Garcia Marquez", "Romance", 2022, 12, 3);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Notebook", "Nicholas Sparks", "Romance", 2014, 8, 10);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Chronicles of Cosmos", "Cosmo Starlight", "Fiction", 2017, 16, 5);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Ephemeral Elegance", "Elara Moon", "Romance", 2022, 18, 8);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Astral Alchemist", "Astrid Stardust", "Fantasy", 2021, 21, 4);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("99 Precent Mine", "Sally Thorne", "Novel", 2019, 17, 6);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Children of Blood and Bone", "Tomi Adeyemi", "Horror", 2018, 18, 5);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Vanishing Velvet", "Velvet Nightshade", "Mystery", 2018, 14, 7);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Murder She Wrote", "Dennis Bill", "Mystery",1981, 12, 2);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Phantom's Reverie", "Reverie Shadow", "Horror", 2018, 18, 5);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("The Alchemist", "Paulo Choelho", "Fiction", 1988, 28, 7);
INSERT INTO books(title, author, genre, published_year, price, quantity)
VALUES ("Gracia Mille Per Titto", "Theophilus Acquah", "Romance", 2023, 50 , 2);

SELECT * FROM books;

/* List of books ordered by price*/
SELECT * FROM books ORDER BY price DESC;

/*Count of Distinct Books */
SELECT COUNT(*) AS bookcount FROM books;

/*Total quantity of books */
SELECT SUM(quantity) AS totalbooks FROM books;

/* Average price of books*/
SELECT ROUND(AVG(price),2) AS Average_price FROM books;

/* Most Expensive books*/
SELECT title, price
FROM books
WHERE price = (SELECT MAX(price) FROM books);

/* Least Expensive books*/
SELECT title, price
FROM books
WHERE price = (SELECT MIN(price) FROM books)
ORDER BY published_year;

/* Title of books in each genre*/
SELECT genre, title FROM books
ORDER BY genre;

/*Distinct book count by genre*/
SELECT genre, COUNT(*) AS BookCount FROM books
GROUP BY genre;

/*Total number of books in each genre*/
SELECT genre, SUM(quantity) AS TotalBooks FROM books
GROUP BY genre;