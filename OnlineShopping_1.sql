create database Online_Shopping;

use Online_Shopping;

create table Users
(user_id  INT Primary Key AUTO_INCREMENT,
first_name  VARCHAR(55),
last_name VARCHAR(55),
created_at TIMESTAMP,
updated_at TIMESTAMP );

create table User_ADDRESS 
(user_address_id INT PRIMARY KEY,
User_id INT ,
address VARCHAR(55),
city VARCHAR(55),
state VARCHAR(55),
zip_code VARCHAR(55),
Foreign key(User_id) references Users(User_id));

create table USER_CONTACT 
(USER_contact_id int primary key,
User_id int,
email VARCHAR(55),
phone_number VARCHAR(12),
Foreign Key(User_id) references Users(User_id));

create table products
(product_id  INT Primary Key AUTO_INCREMENT,
name VARCHAR(55),
description TEXT(55),
price DECIMAL(7,2),
stock_quantity INT,
category_id  INT,
seller_id  INT,
created_at TIMESTAMP,
updated_at TIMESTAMP,
foreign key(category_id) references categories (category_id),
foreign key(seller_id) references sellers (seller_id));

create table  orders
(order_id  INT Primary Key AUTO_INCREMENT,
user_id  INT,
order_date TIMESTAMP,
status VARCHAR(55),
total_amount DECIMAL(7,2),
shipping_address VARCHAR(55),
billing_address VARCHAR(55),
created_at TIMESTAMP,
updated_at TIMESTAMP,
Foreign Key(User_id) references Users(User_id));

create table order_items
(order_item_id  INT Primary Key AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT,
price DECIMAL(7,2),
total DECIMAL(7,2),
created_at TIMESTAMP,
updated_at TIMESTAMP,
Foreign Key(order_id) references orders(order_id),
Foreign Key(product_id) references products(product_id));

create table categories
(category_id INT Primary Key AUTO_INCREMENT,
name VARCHAR(55),
description TEXT(55),
created_at TIMESTAMP,
updated_at TIMESTAMP);

create table reviews
(review_id  INT primary key AUTO_INCREMENT,
user_id  INT,
product_id  INT,
rating INT,
comment TEXT(55),
created_at TIMESTAMP,
updated_at TIMESTAMP,
Foreign Key(User_id) references Users(User_id),
Foreign Key(product_id) references products(product_id));

create table payments
( payment_id  INT Primary Key AUTO_INCREMENT,
order_id INT,
amount DECIMAL(7,2),
payment_method VARCHAR(55),
payment_date TIMESTAMP,
created_at TIMESTAMP,
updated_at TIMESTAMP,
Foreign Key(order_id) references orders(order_id));

create table shipping
( shipping_id  INT Primary Key AUTO_INCREMENT,
order_id  INT,
shipping_date TIMESTAMP,
shipping_method VARCHAR(55),
tracking_number VARCHAR(55),
created_at TIMESTAMP,
updated_at TIMESTAMP,
Foreign Key(order_id) references orders(order_id));

create table employee
(employee_id  INT Primary Key AUTO_INCREMENT,
first_name VARCHAR(55),
last_name VARCHAR(55),
salary int,
department varchar(55));

create table employee_ADDRESS
(employee_address_id  INT PRIMARY KEY,
employee_id INT,
address VARCHAR(55),
city VARCHAR(55),
state enum('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal',
'Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry','Jammu and Kashmir','Ladakh'),
zip_code VARCHAR(22),
Foreign Key(employee_id) references employee(employee_id));

create table employee_CONTACT 
( employee_contact_id int primary key,
employee_id int,
email VARCHAR(55),
phone_number VARCHAR(55),
Foreign Key(employee_id) references employee(employee_id));

create table sellers
( seller_id  INT Primary Key AUTO_INCREMENT,
name VARCHAR(55),
email VARCHAR(55),
phone_number VARCHAR(12),
address VARCHAR(55),
city VARCHAR(55),
state enum('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal',
'Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry','Jammu and Kashmir','Ladakh'),
zip_code int check (zip_code between 000000 and 999999),
rating float(7,2) check(rating >= 0 and rating <= 5 ));


INSERT INTO Users (first_name, last_name, created_at, updated_at)
VALUES
('Amit', 'Sharma', '2024-01-01 10:00:00', '2024-01-02 15:30:00'),
('Priya', 'Patel', '2024-02-03 09:15:00', '2024-02-04 12:45:00'),
('Rahul', 'Gupta', '2024-03-05 08:30:00', '2024-03-06 14:20:00'),
('Sneha', 'Sinha', '2024-04-07 11:45:00', '2024-04-08 17:10:00'),
('Kiran', 'Reddy', '2024-05-09 07:00:00', '2024-05-10 11:55:00'),
('Neha', 'Menon', '2024-06-11 13:20:00', '2024-06-12 16:40:00');

INSERT INTO User_ADDRESS (user_address_id, User_id, address, city, state, zip_code)
VALUES
(1,1, '123 Main St', 'Hyderabad', 'Telangana', '500001'),
(2,2, '456 Oak Ave', 'Bengaluru', 'Karnataka', '560001'),
(3,3,'789 Pine Rd', 'Mumbai', 'Maharashtra', '400001'),
(4,4,'101 Elm Blvd', 'Delhi', 'Delhi', '110001'),
(5,5, '202 Maple Ln', 'Chennai', 'Tamil Nadu', '600001'),
(6,6, '303 Cedar Dr', 'Kolkata', 'West Bengal', '700001');


INSERT INTO USER_CONTACT (USER_contact_id,User_id, email, phone_number)
VALUES
(1,1, 'amit.sharma@example.com', '1234567890'),
(2,2, 'priya.patel@example.com', '2345678901'),
(3,3, 'rahul.gupta@example.com', '3456789012'),
(4,4, 'sneha.sinha@example.com', '4567890123'),
(5,5, 'kiran.reddy@example.com', '5678901234'),
(6,6, 'neha.menon@example.com', '6789012345');


INSERT INTO products (name, description, price, stock_quantity, category_id, seller_id, created_at, updated_at)
VALUES
('Laptop', '15-inch display, 8GB RAM', 799.99, 50, 1, 1, '2024-07-18 12:00:00', '2024-07-18 12:00:00'),
('Smartphone', '64GB storage, 12MP camera', 499.99, 200, 2, 2, '2024-07-18 12:05:00', '2024-07-18 12:05:00'),
('Headphones', 'Noise-cancelling, wireless', 199.99, 150, 3, 3, '2024-07-18 12:10:00', '2024-07-18 12:10:00'),
('Smartwatch', 'Heart rate monitor, GPS', 249.99, 100, 4, 4, '2024-07-18 12:15:00', '2024-07-18 12:15:00'),
('Camera', '24MP, 4K video', 999.99, 75, 5, 5, '2024-07-18 12:20:00', '2024-07-18 12:20:00'),
('Tablet', '10-inch display, 128GB storage', 399.99, 80, 6, 6, '2024-07-18 12:25:00', '2024-07-18 12:25:00');

INSERT INTO orders (user_id, order_date, status, total_amount, shipping_address, billing_address)
VALUES
(1, '2024-07-18 10:00:00', 'Pending', 150.00, '123 Main St, Hyderabad', '123 Billing St, Hyderabad'),
(2, '2024-07-18 11:00:00', 'Shipped', 200.00, '456 Oak Ave, Bengaluru', '456 Billing Ave, Bengaluru'),
(3, '2024-07-18 12:00:00', 'Delivered', 100.00, '789 Pine Rd, Mumbai', '789 Billing Rd, Mumbai'),
(4, '2024-07-18 13:00:00', 'Pending', 250.00, '101 Elm Blvd, Delhi', '101 Billing Blvd, Delhi'),
(5, '2024-07-18 14:00:00', 'Cancelled', 180.00, '202 Maple Ln, Chennai', '202 Billing Ln, Chennai'),
(6, '2024-07-18 15:00:00', 'Shipped', 300.00, '303 Cedar Dr, Kolkata', '303 Billing Dr, Kolkata');

update orders
set updated_at = '2024-07-18 10:00:00', created_at = '2024-07-18 12:00:00'
where order_id = 6;

INSERT INTO order_items (order_id, product_id, quantity, price, total)
VALUES
(1, 1, 2, 50.00, 100.00),
(1, 2, 1, 200.00, 200.00),
(2, 3, 3, 30.00, 90.00),
(2, 4, 1, 150.00, 150.00),
(3, 5, 2, 80.00, 160.00),
(3, 6, 1, 120.00, 120.00);
select * from order_items;
INSERT INTO categories (name, description)
VALUES
('Electronics', 'Products related to electronic devices.'),
('Clothing', 'Apparel and fashion accessories.'),
('Books', 'Literature and educational materials.'),
('Home Decor', 'Decorative items for home interiors.'),
('Sports', 'Equipment and gear for sports activities.'),
('Beauty', 'Cosmetics and personal care products.');


INSERT INTO reviews (user_id, product_id, rating, comment)
VALUES
(1, 1, 4, 'Great product! Very satisfied with the quality.'),
(2, 2, 5, 'Excellent service and fast delivery.'),
(3, 3, 3, 'Average product, could be better.'),
(4, 4, 2, 'Disappointed with the packaging.'),
(5, 5, 4, 'Good value for money.'),
(6, 6, 5, 'Highly recommend this product, exceeded expectations.');

update reviews
set updated_at = '2024-07-18 10:00:00', created_at = '2024-07-18 12:00:00'
where review_id = 6;

INSERT INTO payments (order_id, amount, payment_method, payment_date)
VALUES
(1, 150.00, 'Credit Card', '2024-07-18 10:00:00'),
(2, 200.00, 'PayPal', '2024-07-18 11:00:00'),
(3, 100.00, 'Debit Card', '2024-07-18 12:00:00'),
(4, 250.00, 'Bank Transfer', '2024-07-18 13:00:00'),
(5, 180.00, 'Cash on Delivery', '2024-07-18 14:00:00'),
(6, 300.00, 'Credit Card', '2024-07-18 15:00:00');

INSERT INTO shipping (order_id, shipping_date, shipping_method, tracking_number)
VALUES
(1, '2024-07-18 10:00:00', 'Standard Shipping', 'ABC123'),
(2, '2024-07-18 11:00:00', 'Express Shipping', 'DEF456'),
(3, '2024-07-18 12:00:00', 'Standard Shipping', 'GHI789'),
(4, '2024-07-18 13:00:00', 'Free Shipping', 'JKL012'),
(5, '2024-07-18 14:00:00', 'Standard Shipping', 'MNO345'),
(6, '2024-07-18 15:00:00', 'Express Shipping', 'PQR678');

update shipping
set updated_at = '2024-07-18 10:00:00', created_at = '2024-07-18 12:00:00'
where shipping_id = 6;

INSERT INTO employee (first_name, last_name, salary, department)
VALUES
('John', 'Doe', 50000, 'Sales'),
('Jane', 'Smith', 60000, 'Marketing'),
('Alice', 'Johnson', 70000, 'Engineering'),
('Bob', 'Williams', 55000, 'HR'),
('Charlie', 'Brown', 65000, 'Finance'),
('Emily', 'Davis', 60000, 'Operations');

INSERT INTO employee_ADDRESS (employee_address_id, employee_id, address, city, state, zip_code)
VALUES
(1, 1, '123 Main St', 'Hyderabad', 'Telangana', '500001'),
(2, 2, '456 Oak Ave', 'Bengaluru', 'Karnataka', '560001'),
(3, 3, '789 Pine Rd', 'Mumbai', 'Maharashtra', '400001'),
(4, 4, '101 Elm Blvd', 'Delhi', 'Delhi', '110001'),
(5, 5, '202 Maple Ln', 'Chennai', 'Tamil Nadu', '600001'),
(6, 6, '303 Cedar Dr', 'Kolkata', 'West Bengal', '700001');

INSERT INTO employee_CONTACT (employee_contact_id, employee_id, email, phone_number)
VALUES
(1, 1, 'john.doe@example.com', '123-456-7890'),
(2, 2, 'jane.smith@example.com', '234-567-8901'),
(3, 3, 'alice.johnson@example.com', '345-678-9012'),
(4, 4, 'robert.white@example.com', '456-789-0123'),
(5, 5, 'charlie.green@example.com', '567-890-1234'),
(6, 6, 'emily.davis@example.com', '678-901-2345');

INSERT INTO sellers (name, email, phone_number, address, city, state, zip_code, rating)
VALUES
('John Traders', 'john.traders@example.com', '9876543210', '123 Market St', 'Mumbai', 'Maharashtra', 400001, 4.5),
('Tech Supplies', 'info@techsupplies.com', '8765432109', '456 Silicon Ave', 'Bengaluru', 'Karnataka', 560001, 4.2),
('Fashion Hub', 'contact@fashionhub.co.in', '7654321098', '789 Style Blvd', 'Delhi', 'Delhi', 110001, 4.7),
('Home Essentials', 'support@homeessentials.com', '6543210987', '101 Comfort Ln', 'Kolkata', 'West Bengal', 700001, 4.3),
('Gadget World', 'sales@gadgetworld.net', '5432109876', '202 Tech Park', 'Chennai', 'Tamil Nadu', 600001, 4.6),
('Book Haven', 'service@bookhaven.in', '4321098765', '303 Reader Rd', 'Hyderabad', 'Telangana', 500001, 4.8);

-- 01  Retrieve the names of users who have placed an order.
select first_name, last_name
from Users
where user_id  in (select user_id from orders);

-- 02 Find the products that have been ordered at least once.
select name
from products
where product_id in ( select product_id from order_items);

-- 03 List all users who have written a review for a product.
select first_name, last_name
from users
where user_id in (select user_id from reviews);

-- 04 Get the total amount spent by each user.
select  user_id, sum(total_amount)
from orders 
group by user_id;

-- 05 Find the names of users who have never placed an order.
select first_name, last_name
from users 
where user_id not in (select user_id from orders);

-- 06 Retrieve the products that have never been reviewed.
select product_id, name
from products
where product_id not in (select product_id from reviews);
select *
from reviews;

-- 07 List all users whose total spending exceeds $500.
select user_id, sum(total_amount)
from orders
group by user_id
having sum(total_amount) > 500;

-- 08 Get the highest rated product.
select product_id,price
from products
where price = (select max(price) from products);

select product_id , rating
from reviews
where rating = ( select max(rating) from reviews);

-- 09 Find the average rating of products in each category.
select products.category_id, avg(rating)
from reviews join products
on reviews.product_id = products.product_id
group by products.category_id; 

-- 10 Retrieve the names of users who live in the same city as the highest-rated seller.
select first_name, last_name, user_address.city
from users join user_address
on users.user_id = user_address.user_id
where user_address.city in (select distinct(city) from sellers
where rating in ( select max(rating) from sellers));

-- ~~~~ Date and Time ~~~~~

-- 11 Retrieve all orders placed in the last 30 days.
select *
from orders
where timestampdiff(day,now(),order_date) <30;

-- 12 Find users who registered in the current year.
select *
from users
where year(created_at) = year(now());

-- 13 List all products added in the last week.
select *
from products
where week(updated_at) = week(now()) -1
and year(updated_at) = year(now());

-- \\OR\\ not accepted
select *
from products
where timestampdiff(week,now(),updated_at) > 7; 

-- 14 Get the number of orders placed each month.
select  month(order_date), count(order_id)
from orders
where year(order_date) = year(now())
group by month(order_date)
order by month(order_date);

-- 15 Retrieve all orders that were shipped within 3 days of being placed.
select *
from orders left join shipping
on orders.order_id = shipping.order_id
where timestampdiff(day,order_date, shipping_date)<= 3;

-- 16 Find users who have not updated their profile in the last 6 months.
select first_name, last_name
from users
where timestampdiff(month,now(),updated_at)<6;

-- 17 List all products that were updated in the last month.
select *
from products
where updated_at in (select product_id from products
where month(updated_at)= month(now()) -1
and year(updated_at) = year(now()));

select *
from products
where month(updated_at) = month(now()) -1
and year(updated_at) = month(now());

-- 18 Get the total number of orders placed each day.
select count(order_id), date(order_date)
from orders
group by date(order_date);

select count(order_id), day(order_date)
from orders
group by day(order_date);

-- 19 Retrieve all orders placed on weekends.
select * from orders
where weekday(order_date) in (5,6);

-- 20 Find the average shipping time for orders.
select avg(abs(timestampdiff(hour,orders.created_at, shipping.created_at)))
from orders join shipping
on orders.order_id = shipping.order_id;

select weekday(now());
-- // Multiple Joins //

-- 21 Retrieve all orders along with the user's name and product details.
select orders.*, users.first_name, users.last_name, order_items.*
from users join orders
on users.user_id = orders.user_id
join order_items
join products
on order_items.product_ID = products.product_id
on orders.order_id = order_items.order_id;

-- 22 Find the reviews along with the user's name and product name.
select users.first_name, users.last_name, products.name, reviews.*
from users join reviews
on users.user_id = reviews.user_id
join products
on reviews.product_id = products.product_id;

-- 23 List all orders along with the shipping details.
select orders.*, shipping.*
from orders join shipping
on orders.order_id = shipping.order_id;

-- 24 Get the order items along with the product and order information.
select products.name, orders.*, order_items.*
from products join order_items
on products.product_id = order_items.product_id
join orders
on order_items.order_id = orders.order_id;

-- 25 Retrieve the names of users along with their contact and address details.
select first_name, last_name, user_contact.*, user_address.*
from users join user_contact
on users.user_id = user_contact.user_id
join user_address
on user_contact.user_id = user_address.user_id;

-- 26 Find the total amount of each order along with the user's name.
select order_id, first_name, last_name,sum(total_amount)
from users join orders
on users.user_id = orders.user_id
group by order_id;

-- 27 List all products along with the category and seller details.
select *
from products join sellers
on products.seller_id = sellers.seller_id;

-- 28 Get all orders along with the billing and shipping addresses.
select orders.*, shipping_address, billing_address
from orders join shipping
on orders.order_id = shipping.order_id;

-- 29 Retrieve the details of users who have placed orders and written reviews.
select users.*
from orders join users
on orders.user_id = users.user_id
join reviews
on reviews.user_id = users.user_id;

-- 30 Find the average rating of products along with the sellers name.
select avg(reviews.Rating), sellers.name, reviews.product_id
from products join reviews
on products.product_id = reviews.product_id
join sellers
on products.seller_id = sellers.seller_id
group by reviews.product_id;

-- // Union //

-- 31 Retrieve all users and sellers names and emails.
select first_name, email
from users join user_contact
on users.user_id = user_contact.user_id
union
select name, email
from sellers;

-- 32 Find all addresses (both user and employee addresses).
select *
from user_address
union
select *
from employee_address;

-- 33 List all phone numbers (both user and employee contacts).
select *
from user_contact
union 
select *
from employee_contact;

-- 34 Get the names and emails of all contacts (users, employees, and sellers).
select first_name, email
from users join user_contact
on users.user_id = user_contact.user_id
union 
select first_name, email
from employee join employee_contact
on employee.employee_id = employee_contact.employee_id
union
select name, email
from sellers;

-- 35 Retrieve all city and state combinations from user and employee addresses.
select city, state
from user_address
union
select city, state
from employee_address;

-- 36 Find all names from users, employees, and sellers.
select first_name
from users 
union 
select first_name
from employee 
union
select name
from sellers;

-- 37 List all IDs from users, employees, and sellers.
select user_id
from users
union
select employee_id
from employee
union
select seller_id
from sellers;

-- 38 Get all first names and last names from users and employees.
select first_name, last_name
from users
union
select first_name, last_name
from employee;

-- 39 Retrieve all email addresses from users, employees, and sellers.
select email
from user_contact
union
select email
from employee_contact
union
select email
from sellers;

-- 40 Find all phone numbers from users, employees, and sellers.
select phone_number
from user_contact
union
select phone_number
from employee_contact
union
select phone_number
from sellers;

-- /// Data Retrieval  ////
-- 41 Retrieve all products with a price greater than $50.
select *
from products
where price > '50' ;

-- 42 Find all orders with a status of 'shipped'.
select *
from orders
where status = 'shipped';

-- 43 List all users with a zip code starting with '9'.
select *
from user_address
where zip_code like '9%';

-- 44 Get all reviews with a rating of 5.
select *
from reviews
where rating = 5;

-- 45 Retrieve all orders with a total amount less than $100.
select *
from orders
where total_amount < 100;

-- 46 Find all users with the last name 'Smith'.
select *
from users
where last_name = 'Smith';

-- 47 List all products with a stock quantity of 0.
select *
from products
where stock_quantity = 0;

-- 48 Get all employees with a salary greater than $50,000.
select *
from employee
where salary > 50000;

-- 49 Retrieve all orders with a shipping address in 'California'.
select *
from orders
where shipping_address = 'California';

-- 50 Find all products with a description containing the word 'premium'.
select *
from products
where description like '%premium%';


-- //// Data Manipulation ////

-- 51 Insert a new user into the users table.
INSERT INTO users (first_name, last_name, created_at, updated_at)
VALUES
('Anant', 'Ambani', '2024-01-08 20:00:00', '2024-01-08 15:30:00');

-- 52 Update the email address of a user.
update user_contact
set email = 'abc@gmail.com'
where User_id = 1;

-- 53 Delete a product from the products table.
delete from products
where product_id = 7;

-- 54 Insert a new order with order items.
INSERT INTO order_items (order_id, product_id, quantity, price, total)
VALUES
(6, 5, 2, 50.00, 100.00);

-- 55 Update the status of an order to 'shipped'.
update orders
set status = 'shippes'
where order_id = 2;

-- 56 Delete a review from the reviews table.
delete from reviews
where review_id = 7;

-- 57 Insert a new employee into the employee table.
INSERT INTO employee (first_name, last_name, salary, department)
VALUES
('Rahul', 'G', 500000, 'Civil');

-- 58 Update the salary of an employee.
update employee
set salary = 1000000
where employee_id = 1;

-- 59 Delete an address from the user_address table.
delete from user_address
where user_id = 7;

-- 60 Insert a new product into the products table.
INSERT INTO products (name, description, price, stock_quantity, category_id, seller_id, created_at, updated_at)
VALUES
('Tab', '15-inch display, 8GB RAM', 799.99, 50, 1, 1, '2024-07-18 12:00:00', '2024-07-18 12:00:00');

-- //// Aggregate Functions ////

-- 61 Get the total number of users.
select count(User_id)
from users;

-- 62 Find the average price of products.
select avg(price)
from products;

-- 63 List the total amount of all orders.
select sum(total_amount)
from orders;

-- 64 Get the number of reviews for each product.
select product_id, count(review_id)
from reviews
group by product_id;

-- 65 Find the total stock quantity of all products.
select sum(stock_quantity)
from products;

-- 66 Retrieve the average rating of each product.
select product_id, avg(rating)
from reviews
group by product_id;

-- 67 Get the total number of orders for each user.
select user_id, count(order_id)
from orders
group by user_id;

-- 68 Find the sum of salaries for each department.
select department, sum(salary)
from employee
group by department;

-- 69 List the average rating for each seller.
select seller_id, avg(rating)
from sellers
group by seller_id;

-- 70 Get the total number of products in each category.
select category_id, count(product_id)
from products
group by category_id;

-- ////Group By ////

-- 71 Retrieve the total number of orders for each status.
select count(order_id), status
from orders
group by status;

-- 72 Find the average price of products in each category.
select category_id, avg(price)
from products
group by category_id;

-- 73 List the total amount spent by each user.
select user_id,sum(total_amount)
from orders
group by user_id;

-- 74 Get the number of reviews for each rating.
select  rating, count(review_id)
from reviews
group by rating;

-- 75 Find the total quantity of products ordered in each order.
select order_id,sum(quantity)
from order_items
group by order_id;

-- 76 Retrieve the total number of users in each state.
select state, count(user_id)
from user_address
group by state;

-- 77 Get the total number of employees in each department.
select department, count(employee_id)
from employee
group by department;

-- 78 Find the average rating of products in each category.
select  category_id, avg(rating)
from products join reviews
on products.product_id = reviews.product_id
group by category_id, reviews.product_id;

-- 79 List the total number of products sold by each seller.
select seller_id,count(product_id)
from products
group by seller_id;

-- 80 Get the total amount of payments for each payment method.
select payment_method, sum(amount)
from payments
group by payment_method;

-- //// Advanced Joins ////

select user_id, max(order_date)
from orders
group by user_id;

-- 81 Retrieve all products along with the number of orders for each product.
select products.*,count(order_items.order_id)
from products join order_items
on products.product_id = order_items.product_id
 group by order_items.product_id;
 
-- 82 Find the total amount spent by each user for each product.
select sum(total), orders.user_id, order_items.product_id
from orders join order_items
on orders.order_id = order_items.order_id
group by orders.user_id, order_items.product_id;

-- 83 List all users who have ordered more than 5 different products.
select users.*, count(order_items.product_id)
from users join orders
on users.user_id = orders.user_id
join order_items
on order_items.order_id = orders.order_id
group by orders.user_id
having count(order_items.product_id) > 5;

-- or
select orders.user_id, count( order_items.product_id)
from orders join order_items
on orders.order_id = order_items.order_id
group by orders.user_id
having count(order_items.product_id) > 5;

-- 84 Get the details of users who have written reviews for products they have ordered.
 Select distinct(orders.user_id)
 from orders join order_items
 on orders.order_id = order_items.order_id
 join reviews
 on orders.user_id = reviews.user_id;

-- 85 Retrieve all orders along with the total quantity of items in each order.
select orders.*, sum(quantity)
from orders join order_items
on orders.order_id = order_items.order_id
group by order_items.order_id;

-- 86 Find the total revenue generated by each seller.
select sum(price*stock_quantity) , seller_id
from products
group by seller_id;

-- 87 List all users who have placed an order and written a review on the same day.
select reviews.user_id, orders.order_date, reviews.created_at
from orders join order_items
on orders.order_id = order_items.order_id
join reviews
on orders.user_id = reviews.user_id
where orders.order_date = reviews.created_at
and orders.user_id = reviews.user_id
and reviews.product_id = order_items.product_id;	

-- 88 Get the details of products that have been ordered but not reviewed.
select products.*
from products join order_items
on products.product_id = order_items.product_id
join reviews
on order_items.product_id = reviews.product_id
where order_items.product_id not in (select product_id from reviews);

-- 89 Retrieve all orders along with the shipping method and tracking number.
select orders.*, shipping_method, tracking_number
from orders join shipping
on orders.order_id = shipping.order_id;

-- 90 Find the total number of reviews written by each user.
select user_id, count(review_id)
from reviews
group by user_id;

-- or

select users.user_id, count(review_id)
from users join reviews
on users.user_id = reviews.user_id
group by users.user_id; 

-- /// Miscellaneous ////

-- 91 Retrieve the details of the most expensive product.
select *
from products
where price = ( select max(price) from products);

-- 92 Find the user who has placed the most orders.
select user_id, count(order_id)
from orders
group by user_id
order by count(order_id) desc
limit 1;

-- 93 List the products that have the highest stock quantity.
select *
from products
where stock_quantity = ( select max(stock_quantity) from products);

-- 94 Get the employee with the highest salary.
select *
from employee
where salary = (select max(salary) from employee);

-- 95 Retrieve the details of the order with the largest total amount.
select *
from orders 
where total_amount = ( select max(total_amount) from orders);

-- 96 Find the user who has written the most reviews.
select user_id, count(review_id)
from reviews
group by user_id
order by count(review_id) desc
limit 1;

-- 97 List the categories with the most products.
select category_id, count(product_id)
from products
group by category_id
order by count(product_id) desc
limit 1;

-- 98 Get the details of the most recent order.
select *
from orders
order by order_date desc
limit 1;

-- 99 Retrieve the product with the most reviews.
select product_id, count(review_id)
from reviews
group by product_id
order by count(review_id) desc
limit 1;

-- 100 Find the seller with the highest rating.
select *
from sellers
where rating = (select max(rating) from sellers);
