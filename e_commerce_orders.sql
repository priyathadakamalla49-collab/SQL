-- Create the e-commerce orders table
use ds;
CREATE TABLE e_commerce_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    order_date DATE
);

-- Insert sample data (20 rows) with customer names like Ravi
INSERT INTO e_commerce_orders (order_id, customer_name, product_name, quantity, price, total_amount, order_date)
VALUES
(1, 'Ravi Kumar', 'Smartphone', 1, 699.99, 699.99, '2025-10-01'),
(2, 'Amit Sharma', 'Laptop', 1, 999.99, 999.99, '2025-10-02'),
(3, 'Raj Patel', 'Headphones', 2, 49.99, 99.98, '2025-10-03'),
(4, 'Neha Gupta', 'Smartwatch', 1, 199.99, 199.99, '2025-10-04'),
(5, 'Priya Mehta', 'Tablet', 1, 329.99, 329.99, '2025-10-05'),
(6, 'Vikram Singh', 'Keyboard', 1, 89.99, 89.99, '2025-10-06'),
(7, 'Sonia Reddy', 'Mouse', 2, 19.99, 39.98, '2025-10-07'),
(8, 'Ravi Sharma', 'Monitor', 1, 249.99, 249.99, '2025-10-08'),
(9, 'Ananya Iyer', 'Phone Case', 3, 15.99, 47.97, '2025-10-09'),
(10, 'Karan Joshi', 'Smartphone', 2, 699.99, 1399.98, '2025-10-10'),
(11, 'Maya Desai', 'Gaming Console', 1, 399.99, 399.99, '2025-10-11'),
(12, 'Rohit Kapoor', 'Speakers', 2, 79.99, 159.98, '2025-10-12'),
(13, 'Simran Chawla', 'Laptop', 1, 849.99, 849.99, '2025-10-13'),
(14, 'Amitabh Reddy', 'Smartwatch', 1, 199.99, 199.99, '2025-10-14'),
(15, 'Tanya Gupta', 'Smartphone', 1, 799.99, 799.99, '2025-10-15'),
(16, 'Harish Kaur', 'Tablet', 1, 299.99, 299.99, '2025-10-16'),
(17, 'Deepak Singh', 'Keyboard', 2, 69.99, 139.98, '2025-10-17'),
(18, 'Neelam Verma', 'Headphones', 1, 89.99, 89.99, '2025-10-18'),
(19, 'Kunal Joshi', 'Gaming Console', 1, 499.99, 499.99, '2025-10-19'),
(20, 'Pooja Shah', 'Monitor', 1, 199.99, 199.99, '2025-10-20');

-- Optional: Query the table to check the inserted data
SELECT * FROM e_commerce_orders;
-- Display all orders where the price is greater than 500.
select * from e_commerce_orders where price > 500;
-- Retrieve all orders placed by the customer 'Ravi Kumar'.
select * from e_commerce_orders where customer_name = 'Ravi Kumar';
-- Show all orders for the product 'Laptop'.
select * from e_commerce_orders where product_name = 'Laptop';
-- List all orders placed between '2025-10-05' and '2025-10-15'.
select * from e_commerce_orders where order_date between '2025-10-05' and '2025-10-15';
-- Find all distinct product names from the e_commerce_orders table.
select distinct product_name from e_commerce_orders;
-- Display all unique customer names who bought a 'Smartphone'.
select distinct customer_name from e_commerce_orders where product_name = 'Smartphone';
-- Show all orders sorted by order_date in ascending order.
select * from e_commerce_orders order by order_date;
-- Display all orders sorted by total_amount in descending order.
select * from e_commerce_orders order by total_amount desc;
-- Retrieve the first 5 orders using the LIMIT clause.
select * from e_commerce_orders limit 5;
-- Display the last 3 orders when sorted by order_date.
select * from e_commerce_orders order by order_date desc limit 3;
-- Find all orders where the customer_name starts with the letter 'R'.
select * from e_commerce_orders where customer_name like 'R%';
-- Show all products where the price is between 100 and 500.
select distinct product_name from e_commerce_orders where price between 100 and 500;
-- List all orders where the quantity is more than 1.
select * from e_commerce_orders where quantity > 1;
-- Display all orders where the product_name is not 'Smartphone'.
select * from e_commerce_orders where product_name <> 'Smartphone'; 
-- Show all distinct customers who ordered on '2025-10-10'.
select distinct customer_name from e_commerce_orders where order_date = '2025-10-10';

