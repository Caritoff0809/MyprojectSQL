2--Películas con clasificación 'R'
SELECT title 
FROM film 
WHERE rating = 'R';

3--Actores con ID entre 30 y 40
SELECT first_name, last_name 
FROM actor 
WHERE actor_id 
BETWEEN 30 AND 40;

4--Películas cuyo idioma coincide con el original
SELECT title 
FROM film 
WHERE language_id = original_language_id;

5--Películas ordenadas por duración (ascendente)
SELECT title, 
length FROM film ORDER BY length ASC;

6--Actores con ‘Allen’ en el apellido
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE '%Allen%';

7--Total de películas por clasificación
SELECT rating, 
COUNT(*) AS total 
FROM film GROUP BY rating;

8--Películas ‘PG-13’ o duración > 3h
FROM film 
WHERE rating = 'PG-13' OR length > 180;

9--Varianza del coste de reemplazo 
SELECT VARIANCE(replacement_cost) 
FROM film;

10 Duracion maxima y minina
SELECT MAX(length) AS max_duracion, 
MIN(length) AS min_duracion 
FROM film;

11
SELECT amount 
FROM payment 
ORDER BY payment_date DESC OFFSET 2 LIMIT 1;

12
SELECT title 
FROM film 
WHERE rating NOT IN ('NC-17', 'G');

13
SELECT rating, 
AVG(length) AS promedio_duracion 
FROM film 
GROUP BY rating;

14
SELECT title 
FROM film 
WHERE length > 180;

15
SELECT SUM(amount) 
AS total_ingresos 
FROM payment;

16
SELECT * 
FROM customer 
ORDER BY customer_id 
DESC LIMIT 10;

17
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Egg Igby';

18
SELECT DISTINCT title 
FROM film;

19
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Comedy' AND f.length > 180;

20
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Comedy' AND f.length > 180;

21
SELECT AVG(rental_duration) 
AS promedio_duracion 
FROM film;

22
SELECT CONCAT(first_name, ' ', last_name) 
AS nombre_completo 
FROM actor;

23
SELECT DATE(rental_date) AS fecha, COUNT(*) AS total_alquileres
FROM rental
GROUP BY DATE(rental_date)
ORDER BY total_alquileres DESC;

24
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

25
SELECT DATE_TRUNC('month', rental_date) AS mes, COUNT(*) AS total_alquileres
FROM rental
GROUP BY mes
ORDER BY mes;

26
SELECT 
    AVG(amount) AS promedio,
    STDDEV(amount) AS desviacion_estandar,
    VARIANCE(amount) AS varianza
FROM payment;

27
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

28
SELECT actor_id, COUNT(*) AS total_peliculas
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) > 40;

29
SELECT f.title, COUNT(i.inventory_id) AS cantidad
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title;

30
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS total_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;

31
SELECT f.title, CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id;

32
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor, f.title
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;

33
SELECT f.title, r.rental_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id>;

34
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_gastado
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_gastado DESC
LIMIT 5;

35
SELECT * 
FROM actor 
WHERE first_name = 'Johnny';

36
SELECT first_name 
AS "Nombre", last_name 
AS "Apellido" 
FROM actor;

37
SELECT MIN(actor_id) 
AS id_min, 
MAX(actor_id) 
AS id_max 
FROM actor;

38
SELECT COUNT(*) 
AS total_actores 
FROM actor;

39
SELECT * 
FROM actor 
ORDER BY last_name ASC;

40
SELECT * 
FROM film 
ORDER BY film_id 
ASC LIMIT 5;

41
SELECT first_name, COUNT(*) AS cantidad
FROM actor
GROUP BY first_name
ORDER BY cantidad DESC;

42
SELECT r.rental_id, c.first_name, c.last_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id;

43
SELECT c.first_name, c.last_name, r.rental_id
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id;

44
SELECT f.title, c.name
FROM film f
CROSS JOIN category c;

-- Esto genera todas las combinaciones posibles entre películas y categorías,
-- incluso aunque no estén relacionadas. NO aporta valor práctico real aquí.

45
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';

46
SELECT a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

47
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS cantidad
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;

48
CREATE VIEW actor_num_peliculas AS
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS cantidad
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;

49
SELECT customer_id, COUNT(*) AS total_alquileres
FROM rental
GROUP BY customer_id;

50
SELECT SUM(f.length) AS duracion_total
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';

51
CREATE TEMP TABLE cliente_rentas_temporal AS
SELECT customer_id, COUNT(*) AS total_alquileres
FROM rental
GROUP BY customer_id;

52
CREATE TEMP TABLE peliculas_alquiladas AS
SELECT i.film_id, COUNT(*) AS total_alquileres
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY i.film_id
HAVING COUNT(*) >= 10;

53
SELECT DISTINCT f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE c.first_name = 'Tammy' AND c.last_name = 'Sanders' AND r.return_date IS NULL
ORDER BY f.title;

54
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi'
ORDER BY a.last_name;

55
WITH primera_fecha AS 
  SELECT MIN(rental_date) AS fecha
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film f ON i.film_id = f.film_id
  WHERE f.title = 'Spartacus Cheaper'

SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.rental_date > (SELECT fecha FROM primera_fecha)
ORDER BY a.last_name;

56
SELECT a.first_name, a.last_name
FROM actor a
WHERE actor_id NOT IN (
  SELECT DISTINCT fa.actor_id
  FROM film_actor fa
  JOIN film_category fc ON fa.film_id = fc.film_id
  JOIN category c ON fc.category_id = c.category_id
  WHERE c.name = 'Music'
);

57
SELECT DISTINCT f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date - r.rental_date > INTERVAL '8 days';

58
WITH categoria_animacion AS (
  SELECT category_id
  FROM category
  WHERE name = 'Animation'
)
SELECT DISTINCT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id IN (SELECT category_id FROM categoria_animacion);

59
SELECT f2.title
FROM film f1
JOIN film f2 ON f1.length = f2.length
WHERE f1.title = 'Dancing Fever' AND f2.title <> 'Dancing Fever'
ORDER BY f2.title;

60
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.film_id) >= 7
ORDER BY c.last_name;

61
SELECT c.name, COUNT(*) AS total_alquileres
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

62
SELECT c.name, COUNT(*) AS total_peliculas
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE f.release_year = 2006
GROUP BY c.name;

63
SELECT s.first_name, s.last_name, st.store_id
FROM staff s
CROSS JOIN store st;

64
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_alquileres
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


