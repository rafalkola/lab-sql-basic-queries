SHOW DATABASES;

USE sakila;

-- 1 Display all available tables in the Sakila database.
SHOW TABLES;
-- 2 Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor, film, customer;
-- 3.1 Titles of all films from the film table
SELECT title FROM film;
-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name AS language FROM language;
-- 3.3 list of first names of all employees from staff table
SELECT first_name FROM staff;
-- 4 unique release years of films
SELECT DISTINCT release_year FROM film;
-- 5.1 number of stores
SELECT * FROM address;
SELECT COUNT(store_id) FROM store;
-- 5.2 number of emplyes
SELECT * FROM staff_list;
SELECT COUNT(name) FROM staff_list;
-- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT * FROM inventory;
SELECT COUNT(*) AS total_films FROM inventory;
SELECT * FROM rental;
SELECT COUNT(*) AS rented_films FROM rental WHERE return_date IS NULL;
SELECT 
    (SELECT COUNT(*) FROM inventory) - 
    (SELECT COUNT(*) FROM rental WHERE return_date IS NULL) 
    AS available_copies;
-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT * FROM actor;
SELECT COUNT(DISTINCT last_name) FROM actor;
-- 6 Retrieve the 10 longest films.
SELECT * FROM film;
SELECT title
FROM film
ORDER BY length DESC
LIMIT 10;
-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor;
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name='SCARLETT';
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT * FROM film;
SELECT title FROM film 
WHERE title LIKE '%ARMAGEDDON%'
AND LENGTH > 100;
-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT * FROM film;
SELECT COUNT(title) FROM film
WHERE special_features LIKE '%Behind the Scenes%';