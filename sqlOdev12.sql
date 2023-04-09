--1. film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(title) FROM film
WHERE length>
(
SELECT AVG(length) FROM film
);

--answer: 489

--2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(title) FROM film
WHERE rental_rate =
(
SELECT MAX(rental_rate) FROM film
);

-- answer: 336

--3. film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT * FROM film
WHERE rental_rate =
(
SELECT MIN(rental_rate) FROM film
) 
AND replacement_cost =
(
SELECT MIN(replacement_cost) FROM film
);

-- answer: 15

--4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT customer_id, COUNT(customer_id) FROM payment
GROUP BY customer_id
ORDER BY COUNT(customer_id) DESC;

--5. payment tablosunda en fazla sayıda alışveriş yapan müşterinin/lerin ilk ve son adını(first_name, last_name) bulunuz.

SELECT customer.first_name, customer.last_name  FROM customer
WHERE customer.customer_id IN
(
SELECT payment.customer_id FROM payment
GROUP BY payment.customer_id
HAVING COUNT(payment.customer_id) =
(
SELECT MAX(grouppayment.countt) FROM 
(
SELECT COUNT(payment.customer_id) AS countt FROM payment
GROUP BY payment.customer_id
) AS grouppayment
)
);

--answer: Eleanor Hunt

