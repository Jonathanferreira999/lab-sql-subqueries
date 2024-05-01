#Write SQL queries to perform the following tasks using the Sakila database:

#Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
USE sakila
SELECT film.title, COUNT(inventory.inventory_id) as number_of_copies
FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Hunchback Impossible'
GROUP BY film.title;
#List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title 
FROM film 
WHERE length > (SELECT AVG(length) FROM film);
#Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film_actor
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'Alone Trip'
);

