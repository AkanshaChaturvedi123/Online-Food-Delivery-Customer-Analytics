CREATE DATABASE food_delivery_project;
USE food_delivery_project;

CREATE TABLE food_orders (
order_id INT,
customer_name VARCHAR(50),
city VARCHAR(50),
restaurant_name VARCHAR(50),
cuisine VARCHAR(50),
order_amount INT,
payment_method VARCHAR(20),
delivery_time INT,
delivery_status VARCHAR(20)
);

SELECT * FROM food_orders;

-- Total Revenue
SELECT SUM(order_amount)
FROM food_orders;

-- Total Orders
SELECT COUNT(order_id) AS total_orders
FROM food_orders;

-- Revenue By City
SELECT city,
SUM(order_amount) AS revenue
FROM food_orders
GROUP BY city
ORDER BY revenue DESC;

-- Most Popular Cuisine
SELECT cuisine,
COUNT(order_id) AS total_orders
FROM food_orders
GROUP BY cuisine
ORDER BY  total_orders DESC;

-- Average Delivery Time
SELECT AVG(delivery_time) AS avg_delivery_time
FROM food_orders;

-- Late Deliveries
SELECT *
FROM food_orders
WHERE delivery_status = 'Late';

-- Top Customers
SELECT customer_name,
SUM(order_amount) AS total_spent
FROM food_orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;