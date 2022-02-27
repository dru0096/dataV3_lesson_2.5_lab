
/* MUST 

/* 1. Select all the actors with the first name ‘Scarlett’. */

USE sakila;
SELECT first_name FROM actor
WHERE first_name = 'Scarlett';

/* 2. How many films (movies) are available for rent and how many films have been rented? 

4581 films, of which 958 have been rented. */

SELECT count(distinct(inventory_id)), count(distinct(film_id)) FROM sakila.inventory;

/*3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
Minimum is 46 minutes and Max is 185 minutes */

SELECT MIN(length), MAX(length) FROM sakila.film;

/* 4. What's the average movie duration expressed in format (hours, minutes)?
Struggled with this - how to convert minutes into hours and minutes */

/* 5. How many distinct (different) actors' last names are there? 
Answer: 121 distinct actor last names*/ 

SELECT count(distinct (a.last_name)) FROM sakila.actor as a;


/* 6. Since how many days has the company been operating (check DATEDIFF() function)?

Use rental */ 

SELECT MIN(r.rental_date), MAX(r.rental_date) FROM sakila.rental as r;

/* Below did not work */
SELECT DATEDIFF(DAY, '2005-05-24', '2006-02-14') AS 'Day_Diff' FROM sakila.rental;

SELECT rental_date, DATEDIFF(DAY, MIN(rental_date), MAX(rental_date)) AS 'Day_Diff' FROM sakila.rental;

SELECT rental_date, 
date_format(Convert(left(rental_date, 10),date), '%Y-%m-%d') AS 'Rental-Date' FROM sakila.rental;

SELECT sakila.rental_date, DATEDIFF(DAY, '2005-05-24 22:53:30', '2006-02-14 15:16:03') AS "Day_Diff" FROM sakila.rental;


/* 7. Show rental info with additional columns month and weekday. Get 20 results. */ 

SELECT *, Weekday(rental_date) as "Weekday", EXTRACT(month FROM rental_date) as "Month" FROM sakila.rental
LIMIT 20;

/* 8. Get release years. */

SELECT release_year FROM sakila.film;

/* 9. Get all films with ARMAGEDDON in the title. */

SELECT title FROM sakila.film
WHERE title like '%ARMAGEDDON%';

/* 10. Get all films which title ends with APOLLO. */


SELECT title FROM sakila.film
WHERE title regexp 'APOLLO$';

/* 11. Get 10 the longest films. */ 

SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;


/* 12. How many films include Behind the Scenes content?
	   Answer: 538 films */

Select count(special_features) From sakila.film
WHERE special_features like '%Behind the Scenes%';
