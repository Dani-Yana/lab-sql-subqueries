USE sakila;

/* Write SQL queries to perform the following tasks using the Sakila database:
1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system. */

SELECT COUNT(*) AS num_copies
FROM inventory inv
JOIN film fil ON inv.film_id = fil.film_id
WHERE fil.title = 'Hunchback Impossible';

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT film_id, title, length
FROM film
WHERE length > (
    SELECT AVG(length) 
    FROM film);
    
-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film
    JOIN film_actor ON film.film_id = film_actor.film_id
    WHERE film.title = 'Alone Trip');
    
-- 4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.

SELECT film.film_id, film.title, category.name AS category
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';
