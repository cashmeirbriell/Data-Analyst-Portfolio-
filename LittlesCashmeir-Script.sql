/* Example database */
CREATE DATABASE IF NOT exists CASH ;
/* database that was created.*/
USE CASH; 
/* First table information */
CREATE TABLE Employee(
VolunteerID INT auto_increment PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Address VARCHAR(50 ) NOT NULL
);
/*Created 2nd table information */
CREATE TABLE TaskList(
AssignmentID int auto_increment PRIMARY KEY,
Training_ID INT, 
VolunteerID INT,
Task_Name VARCHAR(50) NOT NULL,
Description_Info VARCHAR(100) NOT NULL,
Status_Info VARCHAR(50) NOT NULL,
foreign key(Training_ID)references Training(Training_ID),
foreign key(VolunteerID) references Employee(VolunteerID)
);

/*Creat Table 3 information */
CREATE TABLE Training(
Training_ID int auto_increment PRIMARY KEY,
Training_Name VARCHAR(50) NOT NULL,
Event_Date VARCHAR(50) NOT NULL,
Location VARCHAR(50) NOT NULL, 
Description_T VARCHAR(100) NOT NULL
);

/*Insert Information for the table employee table */
INSERT INTO Employee (First_Name, Last_Name , Email , Address)
VALUES
('Taylor', 'Moon', 'taylorMoon1@aol.com','122 Lakeview Way, Orange County'),
('Steve' , 'Smith', 'stevesmith@aol.com', '124 Leaf St, Orange County'), 
('Morgan', 'Elve', 'morganelve@aol.com', '234 Reads RD, Orange County'),
('Ryder', 'Ricks', 'ryderricks@aol.com', '654 Taylor ST, Orange County'),
('Cathy', 'Fox', 'cathyfox@aol.com', '329 House Way, Orange County');

/*Insert Information for the tables now we are going to do to the Task List*/
INSERT INTO tasklist (Training_ID, VolunteerID, Task_Name , Description_Info , Status_Info )
Values
('0987'  ,'1', 'Isolation', 'Perform a neat Isolation','Completed'), 
('8765', '2','Application','Perform Precise Application','Not Completed'), 
('5673', '3', 'Patching', 'Apply Patching', 'Not Completed'),
('4564', '4','Bottom Lashes', 'Apply bottom lashes', 'Completed'), 
('5676', '5', 'Isolation', 'Perform A Neat Isolation', 'In Progress');

/*Insert Information for the training table */
INSERT INTO Training (Training_ID , Training_Name , Event_Date , Location , Description_T)
VALUES
('0987', 'Volume', '2024-08-09', 'Room 1', 'Advanced level volume training'), 
('8765', 'Hybrid', '2024-08-07', 'Room 4' , 'Intermediate level hybrid training'), 
('5673', 'Classic', '2024-08-12', 'Room 6' , 'Beginners Level classic training'),
('4564', 'Hybrid', '2024-08-30', 'Room 4', 'Intermediate level hybrid training'), 
('5676', 'Volume', '2024-08-21', 'Room 1', 'Advanced level volume training');
/* Had to drop the task list table because i had the foreign key information wrong at first */
drop table 
tasklist;

 /*1. Using Inner join , im going to join the employee table and task list */
 SELECT First_Name , Task_Name 
 FROM employee INNER JOIN tasklist
 ON employee.VolunteerID = tasklist.VolunteerID
 ORDER BY First_Name;
 
/*2. See how many of the task are completed , not completed and in progress USING COUNT & Grouping in DESC  */
SELECT Status_Info, Count(*) AS Task_Total
FROM tasklist
group by Status_Info
Order by Task_Total DESC;

/*3. Try to see when the training are coming up using there dates using The WHEre clause*/
SELECT training_name , event_date
FROM training
WHERE Event_Date > curdate()
Order By Event_date;

/*4. another count but this time im trying to see the number of trainings at each location */
SELECT Location, Count(*) AS Each_Room
FROM training
group by Location
order by each_room desc;

/*5. join first and last name using concat */
select first_name , last_name, CONCAT(first_name ,' ',last_name)
FROM employee;

/*drop tables in order:  employee , tasklist , training */
DROP TABLE 
tasklist;

DROP TABLE 
employee;

DROP TABLE 
training;

DROP DATABASE
cash;

