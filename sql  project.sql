CREATE DATABASE sales_practice;
USE sales_practice;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Arun Kumar', 'arun@gmail.com', 'Chennai'),
(2, 'Priya Sharma', 'priya@gmail.com', 'Bengaluru'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Hyderabad'),
(4, 'Divya Raj', 'divya@gmail.com', 'Chennai'),
(5, 'Karthik S', 'karthik@gmail.com', 'Coimbatore'),
(6, 'Meena Devi', 'meena@gmail.com', 'Madurai'),
(7, 'Vijay Anand', 'vijay@gmail.com', 'Salem'),
(8, 'Sneha Patel', 'sneha@gmail.com', 'Mumbai'),
(9, 'Ravi Teja', 'ravi@gmail.com', 'Hyderabad'),
(10, 'Anitha M', 'anitha@gmail.com', 'Chennai');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000, 15),
(102, 'Mouse', 'Accessories', 750, 120),
(103, 'Keyboard', 'Accessories', 1200, 80),
(104, 'Monitor', 'Electronics', 12500, 25),
(105, 'USB Cable', 'Accessories', 250, 200),
(106, 'Office Chair', 'Furniture', 6500, 18),
(107, 'Desk', 'Furniture', 9000, 12),
(108, 'Headphones', 'Electronics', 2200, 60),
(109, 'Printer', 'Electronics', 8500, 10),
(110, 'Notebook', 'Stationery', 180, 300);

INSERT INTO orders VALUES
(1001, 1, '2026-01-10', 'Delivered'),
(1002, 2, '2026-01-12', 'Shipped'),
(1003, 3, '2026-01-15', 'Pending'),
(1004, 4, '2026-02-01', 'Delivered'),
(1005, 5, '2026-02-05', 'Cancelled'),
(1006, 6, '2026-02-10', 'Delivered'),
(1007, 7, '2026-03-01', 'Shipped'),
(1008, 8, '2026-03-05', 'Pending'),
(1009, 9, '2026-03-10', 'Delivered'),
(1010, 10, '2026-03-15', 'Shipped');

-- Display all customers
SELECT * FROM customers;

-- Display all products
SELECT * FROM products;

-- Find products costing more than 1000
SELECT * FROM products
WHERE price > 1000;

-- Find customers from Chennai
SELECT * FROM customers
WHERE city = 'Chennai';

-- Count orders by status
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Join customers and orders
SELECT
    customers.customer_name,
    orders.order_id,
    orders.order_date,
    orders.status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- Sort products by price
SELECT * FROM products
ORDER BY price DESC;

USE sales_practice;

-- Count customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Count orders by status
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Average price for each product category
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category;

-- Total stock in each category
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- INNER JOIN: Customers and their orders
SELECT
    customers.customer_name,
    orders.order_id,
    orders.order_date,
    orders.status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- LEFT JOIN: Show all customers and their orders
SELECT
    customers.customer_name,
    orders.order_id,
    orders.status
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- JOIN products and orders is not direct;
-- this example joins customers and orders
SELECT
    c.customer_name,
    c.city,
    o.order_id
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Sort products by price (low to high)
SELECT * FROM products
ORDER BY price ASC;

-- Sort products by price (high to low)
SELECT * FROM products
ORDER BY price DESC;

-- Sort customers alphabetically
SELECT * FROM customers
ORDER BY customer_name ASC;

-- Sort orders by newest date first
SELECT * FROM orders
ORDER BY order_date DESC;

-- Sort by city and then customer name
SELECT * FROM customers
ORDER BY city ASC, customer_name ASC;

SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;
