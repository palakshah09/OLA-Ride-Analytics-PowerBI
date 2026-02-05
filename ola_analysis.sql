CREATE DATABASE OLA;
USE OLA;
show databases;
show tables;
USE `ola`;

#1. Retrieve all successful bookings:
Create view Successful_Booking As
Select * From `3.ola` Where Booking_Status='Success';

Select * From Successful_Booking;


#2. Find the average ride distance for each vehicle type:
Create View Average_Ride_Distance As
Select Vehicle_Type, AVG(Ride_Distance) As Average_Ride_Distance
From `3.ola`
Group By Vehicle_Type;

Select * From Average_Ride_Distance;


#3. Get the total number of cancelled rides by customers:
Create View Canceled_Rides_by_Customers As
Select COUNT(*) From `3.ola`
Where Booking_Status='Canceled by Customer';

Select * From Canceled_rides_by_Customers;


#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5 As
Select Customer_ID, COUNT(Booking_ID) As Total_Rides
From `3.ola`
Group by Customer_ID 
Order By Total_Rides desc Limit 5;

Select * From Top_5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Canceled_by_Drivers As
Select COUNT(Canceled_Rides_by_Driver)
From `3.ola`
Where Canceled_Rides_by_Driver='Personal & Car related issue';

Select * From Canceled_by_Drivers;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Driver_Ratings As
Select MAX(Driver_Ratings), MIN(Driver_Ratings)
From `3.ola`
Group By Vehicle_Type='Prime Sedan';

Select * From Driver_Ratings;


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
Select * From `3.ola`
Where Payment_Method='UPI';

Select * From UPI_Payment;


#8. Find the average customer rating per vehicle type:
Create View Avg_Customer_Rating As
Select Vehicle_Type, AVG(Customer_Rating) As Average_Customer_Rating 
From `3.ola`
Group By Vehicle_Type;

Select * From Avg_Customer_Rating;


#9. Calculate the total booking value of rides completed successfully:
Create View Total_Successfull_Booking_Value As
Select SUM(Booking_Value)
From `3.ola`
Where Booking_Status='Success';

Select * From Total_Successfull_Booking_Value;


#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides As
Select Incomplete_Rides, Incomplete_Rides_Reason
From `3.ola`
Where Incomplete_Rides='Yes';

Select * From Incomplete_Rides;