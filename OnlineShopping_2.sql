-- // Views Easy: //

-- 1 Create a view named CustomerDetails that displays the customer names and their ratings from the CUSTOMER table.
create view CustomerDetails
as
select Name, Rating
from customer;

select CURDATE();
SELECT NOW();
SELECT GETDATE();
SELECT sysdate();
select *
from users;

-- 2 Write a query to retrieve all data from the CustomerDetails view.
select *
from CustomerDetails;
select views CustomerDetails;
-- 3 Create a view named TripSummary that shows the trip ID, customer ID, driver ID, fare, and status from the TRIPS table.
create view TripSummary
as
select Trip_ID, Driver_ID, Fare, Status
from Trips;

-- 4 Write a query to update the rating of a customer through the CustomerDetails view.
update CustomerDetails
set Rating = 5
where name = 'Jane Smith';

-- 5 Create a view named ActiveTrips that displays trips with status 'Active'.
create view ActiveTrips
as
select *
from trips
where Status = 'Active';

-- 6 Write a query to drop the ActiveTrips view.
drop view ActiveTrips;

-- ~~~~~~~ Moderate: ~~~~~~~~

-- 7 Create a view named DriverPerformance that displays the driver name, email, and average rating of all drivers.
create view DriverPerformance
as
select Name, Email, avg(Rating) as Rating
from driver
group by Driver_ID;
drop view riverPerformance;

-- 8 Write a query to retrieve all drivers with an average rating greater than 4 using the DriverPerformance view.
select *
from DriverPerformance
where Rating > 4;

-- 9 Create a view named VehicleUsage that shows the vehicle ID, model, and the total number of trips each vehicle has been used in.
create view VehicleUsage
as
select Trips.Vehicale_ID, Model, count(Trip_ID)
from Trips join vehicale
on Trips.Vehicale_ID = Vehicale.Vehicale_ID
group by Trips.Vehicale_ID;

-- 10 Write a query to update the email of a driver through the DriverPerformance view.
Update  DriverPerformance
set Email = 'abc@gmail.com'
where Name = 'Sarah Johnson';

select *
from DriverPerformance;

-- 11 Create a view named TopCustomers that displays the customer ID, name, and total fare for customers who have spent more than 5000.
create view TopCustomers
as 
select customer.Name, count(trips.Trip_ID), trips.Customer_ID, sum(Fare)
from customer join trips
on customer.Customer_ID = trips.Customer_ID
group by trips.Customer_ID
having sum(Fare) > 5000;

-- 12 Write a query to delete the TopCustomers view.
Drop view TopCustomers;

-- ~~~~~~~~~~ Hard: ~~~~~~~~~~~~~

-- 13 Create a view named DetailedTripInfo that combines data from TRIPS, CUSTOMER, DRIVER, and VEHICLE tables to show detailed information about each trip.
create view DetailedTripInfo
as
select Trips.Driver_ID, Trips.Customer_ID, Trips.Vehicale_ID,Customer.Name as Customer_Name, Customer.Email as Customer_Email, Customer.Rating as Customer_Rating, Driver.Name as Driver_Name, Driver.Email as Driver_Email, Driver.Rating as Driver_Rating, Vehicale.Model as Vehicale_Model, Vehicale.Year as Vehicale_Year, Vehicale.Category as Vehicale_Category, Trips.Fare as Trip_Fare, Trips.Distance as Trips_Distance, Trips.Start_Date_Time, Trips.End_Date_Time, Trips.Payment_Mode
from Customer join Trips
on Customer.Customer_ID = Trips.Customer_ID
join Driver
on Trips.Driver_ID = Driver.Driver_ID
join Vehicale
on Trips.Vehicale_ID = Vehicale.Vehicale_ID;

-- 14 Write a query to retrieve all trips where the driver rating is less than 3 using the DetailedTripInfo view.
select *
from DetailedTripInfo
where Driver_Rating < 3;

-- 15 Create a view named MonthlyTrips that shows the month, total trips, and total fare for each month.
create view MonthlyTrips
as
select month(Start_Date_Time), count(Trip_ID), Sum(Fare)
from trips
group by month(Start_Date_Time)
order by month(Start_Date_Time);

select *
from customerDetails;

-- 16 Write a query to insert a new customer through the CustomerDetails view.
insert into CustomerDetails(Name, Rating)
values ('Sujata Pandey', 5);

-- 17 Create a view named FrequentDrivers that displays drivers who have completed more than 20 trips in the last month.
create view FrequentDrivers
as
select Driver_ID, count(Trip_ID), month(End_Date_Time)
from trips
where month(End_Date_Time)=month(now()) -1
and year(End_Date_Time) = year(now())
group by Driver_ID
having count(Trip_ID) > 20;

-- 18 Write a query to retrieve all vehicles that have traveled more than 100,000 KM using the VehicleUsage view.
select Model, Distance
from VehicleUsage
where Distance > 100000;

-- ~~~~~~~~~~~~ Indexes ~~~~~~~~~~~~~~~
-- /// Easy: ////

-- 19 Create an index on the EMAIL column of the CUSTOMER table.
create index Cust_Email on Customer(Email);

-- 20 Drop the index on the EMAIL column of the CUSTOMER table.
drop index Cust_Email on customer;

-- 21 Create an index on the RATING column of the DRIVER table.
create index Driver_Rating on Driver(Rating);

-- 22 Drop the index on the RATING column of the DRIVER table.
Drop index Driver_Rating on Driver;

-- 23 Create a unique index on the CONTACT column of the CUSTOMER_CONTACT table.
create unique index Customer_contact on customer_contact(Contact);

-- 24 Drop the unique index on the CONTACT column of the CUSTOMER_CONTACT table.
drop index Customer_contact on customer_contact;

-- ~~~~~~~~~~~~ Moderate: ~~~~~~~~~~~

-- 25 Create a composite index on the MODEL and CATEGORY columns of the VEHICLE table.
create index MOD_CAT on vehicale(Model, Category);

-- 26 Drop the composite index on the MODEL and CATEGORY columns of the VEHICLE table.
drop index MOD_CAT on vehicale;

-- 27 Create an index on the START_DATE_TIME column of the TRIPS table.
create index Date_trip on Trips(Start_Date_Time);

-- 28 Drop the index on the START_DATE_TIME column of the TRIPS table.
Drop index Date_trip on Trips;

-- 29 Create an index on the TEXT column of the COUPONS table.
create index Text_Coup on Coupons(Text);

-- 30 Drop the index on the TEXT column of the COUPONS table.
Drop index Text_Coup on coupons;

-- ~~~~~~~ Hard: ~~~~~~~~~~~

-- 31 Create a composite index on the CUSTOMER_ID and DRIVER_ID columns of the TRIPS table.
create index CID_DID_TRIPID on Trips(Driver_ID, Customer_ID);

-- 32 Drop the composite index on the CUSTOMER_ID and DRIVER_ID columns of the TRIPS table.
Drop index CID_DID_TRIPID on Trips;

-- 33 Create an index on the KM column of the VEHICLE table.
create index KM_VEHICALE on Vehicale(KM);

-- 34 Drop the index on the KM column of the VEHICLE table.
Drop index KM_VEHICALE on Vehicale;

-- 35 Create an index on the DOB column of the CUSTOMER table.
create index Dob on customer(DOB);

-- 36 Drop the index on the DOB column of the CUSTOMER table.
Drop index Dob on customer;
