FROM actor;
FROM film;
FROM film_actor;
FROM address;
FROM category;
FROM city;
FROM country;
FROM customer;




SELECT
    title,
    length
FROM film
WHERE length > 180
ORDER BY length DESC;



SELECT title, length
FROM film
WHERE title ILIKE '%love%';


SELECT
    MIN(length)    AS shortest,
    AVG(length)    AS average,
    MEDIAN(length) AS median,
    MAX(length)    AS longest
FROM film;

SELECT
    title,
    rental_rate,
    rental_duration,
    rental_rate / rental_duration AS cost_per_day
FROM film
ORDER BY cost_per_day DESC
LIMIT 10;


SELECT rating, COUNT(*) AS count
FROM film
GROUP BY rating
ORDER BY count DESC;


SELECT
    c.name AS category,
    COUNT(fc.film_id) AS number_of_movies
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
GROUP BY category
ORDER BY number_of_movies DESC

SELECT
    MIN(length) AS shortest,
    AVG(length) AS average,
    MEDIAN(length) AS median,
    MAX(length) AS longest
FROM film;


SELECT
    c.first_name || ' ' || c.last_name AS customer,
    SUM(p.amount) AS total_spend
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY customer
ORDER BY total_spend DESC
LIMIT 5; 


SELECT
    c.name AS category,
    SUM(p.amount) AS total_revenue
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
JOIN film f
    ON fc.film_id = f.film_id
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
JOIN payment p
    ON r.rental_id = p.rental_id
GROUP BY category
ORDER BY total_revenue DESC;