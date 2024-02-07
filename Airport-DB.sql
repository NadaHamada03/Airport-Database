-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 08, 2024 at 06:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Airport-DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Baggage`
--

CREATE TABLE `Baggage` (
  `bag_id` int(11) NOT NULL,
  `weight` float NOT NULL DEFAULT 0,
  `pass_id` int(11) DEFAULT NULL,
  `weight_status` varchar(50) DEFAULT '''Normal''',
  `destination` varchar(255) DEFAULT '''pending''',
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Baggage`
--

INSERT INTO `Baggage` (`bag_id`, `weight`, `pass_id`, `weight_status`, `destination`, `status`) VALUES
(1, 15, 2, 'Normal', 'Dubai International Airport', 'Checked-In'),
(2, 18.5, 3, 'Overweight', 'San Francisco International Airport', 'Lost'),
(3, 22.4, 5, 'Overweight', 'John F. Kennedy International Airport', 'Arrived'),
(4, 12.2, 7, 'Normal', 'Hong Kong International Airport', 'In-Transit'),
(5, 14.6, 8, 'Normal', 'London Gatwick Airport', 'Checked-In'),
(6, 16.3, 9, 'Normal', 'London Gatwick Airport', 'Checked-In'),
(7, 0, 16, 'Pending', 'Dubai International Airport', 'pending'),
(8, 0, 17, 'Pending', 'Dubai International Airport', 'pending');

--
-- Triggers `Baggage`
--
DELIMITER $$
CREATE TRIGGER `set_weight_status` BEFORE INSERT ON `Baggage` FOR EACH ROW BEGIN
    IF NEW.weight > 18 THEN
        SET NEW.weight_status = 'Overweight';
    ELSEIF NEW.weight = 0 THEN
        SET NEW.weight_status = 'Pending';
    ELSE
        SET NEW.weight_status = 'Normal';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE `Departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`dept_id`, `dept_name`) VALUES
(1, 'Airport Operations'),
(2, 'Security'),
(3, 'Customer Service'),
(4, 'Air Traffic Control'),
(5, 'Airlines and Ground Handling'),
(6, 'Retail and Concessions'),
(7, 'Maintenance and Facilities'),
(8, 'Finance'),
(9, 'Technology and IT'),
(10, 'Emergency Services'),
(11, 'Customs and Immigration'),
(12, 'Environmental and Sustainability'),
(13, 'Pilots'),
(14, 'Aircraft Maintenance'),
(15, 'Flight Operations'),
(16, 'Cabin Crew'),
(17, 'Aircraft Ground Handling'),
(18, 'Fueling and Logistics'),
(19, 'Aircraft Charter and Sales'),
(20, 'Aircraft Dispatch and Coordination'),
(21, 'Aircraft Safety and Compliance'),
(22, 'Aircraft Support Services');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `super_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`emp_id`, `first_name`, `middle_name`, `last_name`, `super_id`, `job_id`, `dept_id`, `phone_number`, `email`) VALUES
(1, 'John', 'Alexander', 'Smith', NULL, 1, 1, '555-123-4567', 'john.smith@gmail.com'),
(2, 'Emily', 'Grace', 'Johnson', 1, 2, 1, '555-234-5678', 'emily.johnson@hotmail.com'),
(3, 'Michael', 'Christopher', 'Davis', 1, 3, 1, '555-345-6789', 'michael.davis@yahoo.com'),
(4, 'Jessica', 'Lynn', 'Wilson', 1, 4, 1, '555-456-7890', 'jessica.wilson@outlook.com'),
(5, 'Brian', 'Patrick', 'Taylor', 1, 5, 1, '555-567-8901', 'brian.taylor@gmail.com'),
(6, 'Ashley', 'Marie', 'Anderson', NULL, 6, 2, '555-678-9012', 'ashley.anderson@hotmail.com'),
(7, 'David', 'William', 'Thompson', 6, 7, 2, '555-789-0123', 'david.thompson@yahoo.com'),
(8, 'Samantha', 'Nicole', 'Martinez', 6, 8, 2, '555-890-1234', 'samantha.martinez@outlook.com'),
(9, 'Christopher', 'James', 'Jackson', 6, 9, 2, '555-901-2345', 'christopher.jackson@gmail.com'),
(10, 'Olivia', 'Rose', 'White', 6, 10, 2, '555-012-3456', 'olivia.white@hotmail.com'),
(11, 'Daniel', 'Robert', 'Harris', NULL, 11, 3, '555-123-4567', 'daniel.harris@yahoo.com'),
(12, 'Sophia', 'Elizabeth', 'Nelson', 11, 12, 3, '555-234-5678', 'sophia.nelson@outlook.com'),
(13, 'Matthew', 'David', 'Baker', 11, 13, 3, '555-345-6789', 'matthew.baker@gmail.com'),
(14, 'Ava', 'Grace', 'Turner', 11, 14, 3, '555-456-7890', 'ava.turner@hotmail.com'),
(15, 'Andrew', 'Joseph', 'Wright', 11, 15, 3, '555-567-8901', 'andrew.wright@yahoo.com'),
(16, 'Emma', 'Katherine', 'Reed', NULL, 16, 4, '555-678-9012', 'emma.reed@outlook.com'),
(17, 'Joseph', 'Michael', 'Garcia', 16, 17, 4, '555-789-0123', 'joseph.garcia@gmail.com'),
(18, 'Mia', 'Catherine', 'Miller', 16, 18, 4, '555-890-1234', 'mia.miller@hotmail.com'),
(19, 'Ethan', 'Alexander', 'Scott', 16, 19, 4, '555-901-2345', 'ethan.scott@yahoo.com'),
(20, 'Isabella', 'Grace', 'King', 16, 20, 4, '555-012-3456', 'isabella.king@outlook.com'),
(21, 'Alexander', 'Thomas', 'Rivera', NULL, 21, 5, '555-123-4567', 'alexander.rivera@gmail.com'),
(22, 'Aria', 'Elizabeth', 'Cooper', 21, 22, 5, '555-234-5678', 'aria.cooper@hotmail.com'),
(23, 'James', 'Richard', 'Hayes', 21, 23, 5, '555-345-6789', 'james.hayes@yahoo.com'),
(24, 'Grace', 'Ann', 'Collins', 21, 24, 5, '555-456-7890', 'grace.collins@outlook.com'),
(25, 'Benjamin', 'Edward', 'Russell', 21, 25, 5, '555-567-8901', 'benjamin.russell@gmail.com'),
(26, 'Lily', 'Marie', 'Griffin', NULL, 26, 6, '555-678-9012', 'lily.griffin@hotmail.com'),
(27, 'Logan', 'Alexander', 'Simmons', 26, 27, 6, '555-789-0123', 'logan.simmons@yahoo.com'),
(28, 'Chloe', 'Nicole', 'Martinez', 26, 28, 6, '555-890-1234', 'chloe.martinez@outlook.com'),
(29, 'Samuel', 'Joseph', 'Perry', 26, 29, 6, '555-901-2345', 'samuel.perry@gmail.com'),
(30, 'Zoey', 'Marie', 'Edwards', 26, 30, 6, '555-012-3456', 'zoey.edwards@hotmail.com'),
(31, 'Jackson', 'William', 'Turner', NULL, 31, 7, '555-123-4567', 'jackson.turner@yahoo.com'),
(32, 'Madison', 'Elizabeth', 'Cox', 31, 32, 7, '555-234-5678', 'madison.cox@outlook.com'),
(33, 'Lucas', 'Benjamin', 'Ramirez', 31, 33, 7, '555-345-6789', 'lucas.ramirez@gmail.com'),
(34, 'Penelope', 'Grace', 'Bryant', 31, 34, 7, '555-456-7890', 'penelope.bryant@hotmail.com'),
(35, 'Dylan', 'Michael', 'Stewart', 31, 35, 7, '555-567-8901', 'dylan.stewart@yahoo.com'),
(36, 'Scarlett', 'Elizabeth', 'Washington', NULL, 36, 8, '555-678-9012', 'scarlett.washington@outlook.com'),
(37, 'Caleb', 'Matthew', 'Evans', 36, 37, 8, '555-789-0123', 'caleb.evans@gmail.com'),
(38, 'Hannah', 'Marie', 'Murphy', 36, 38, 8, '555-890-1234', 'hannah.murphy@hotmail.com'),
(39, 'Wyatt', 'Anthony', 'Parker', 36, 39, 8, '555-901-2345', 'wyatt.parker@yahoo.com'),
(40, 'Addison', 'Nicole', 'Richardson', 36, 40, 8, '555-012-3456', 'addison.richardson@outlook.com'),
(41, 'Gabriel', 'Alexander', 'Henderson', NULL, 41, 9, '555-123-4567', 'gabriel.henderson@gmail.com'),
(42, 'Leah', 'Marie', 'Coleman', 41, 42, 9, '555-234-5678', 'leah.coleman@hotmail.com'),
(43, 'Christopher', 'James', 'Reed', 41, 43, 9, '555-345-6789', 'christopher.reed@yahoo.com'),
(44, 'Lily', 'Rose', 'Russell', 41, 44, 9, '555-456-7890', 'lily.russell@outlook.com'),
(45, 'Zachary', 'Thomas', 'Morgan', 41, 45, 9, '555-567-8901', 'zachary.morgan@gmail.com'),
(46, 'Stella', 'Marie', 'Peterson', NULL, 46, 10, '555-678-9012', 'stella.peterson@hotmail.com'),
(47, 'Owen', 'Alexander', 'Brooks', 46, 47, 10, '555-789-0123', 'owen.brooks@yahoo.com'),
(48, 'Lillian', 'Grace', 'Henderson', 46, 48, 10, '555-890-1234', 'lillian.henderson@outlook.com'),
(49, 'Levi', 'Thomas', 'Cooper', 46, 49, 10, '555-901-2345', 'levi.cooper@gmail.com'),
(50, 'Nora', 'Rose', 'Hayes', NULL, 50, 11, '555-012-3456', 'nora.hayes@hotmail.com'),
(51, 'Evan', 'Michael', 'Simmons', 50, 51, 11, '555-123-4567', 'evan.simmons@yahoo.com'),
(52, 'Addison', 'Grace', 'Stewart', 50, 52, 11, '555-234-5678', 'addison.stewart@outlook.com'),
(53, 'William', 'Thomas', 'Perry', 50, 53, 11, '555-345-6789', 'william.perry@gmail.com'),
(54, 'Sofia', 'Grace', 'Cox', NULL, 54, 12, '555-456-7890', 'sofia.cox@hotmail.com'),
(55, 'Isaac', 'Benjamin', 'Murphy', 54, 55, 12, '555-567-8901', 'isaac.murphy@yahoo.com'),
(56, 'Amelia', 'Marie', 'Parker', 54, 56, 12, '555-678-9012', 'amelia.parker@outlook.com'),
(57, 'Aiden', 'Michael', 'Richardson', 54, 57, 12, '555-789-0123', 'aiden.richardson@gmail.com'),
(58, 'Harper', 'Elizabeth', 'Henderson', NULL, 58, 13, '555-890-1234', 'harper.henderson@hotmail.com'),
(59, 'Elijah', 'James', 'Coleman', 58, 59, 13, '555-901-2345', 'elijah.coleman@yahoo.com'),
(60, 'Grace', 'Elizabeth', 'Reed', 58, 60, 13, '555-012-3456', 'grace.reed@outlook.com'),
(61, 'Scarlett', 'Marie', 'Russell', NULL, 61, 14, '555-123-4567', 'scarlett.russell@gmail.com'),
(62, 'Owen', 'Michael', 'Morgan', 61, 62, 14, '555-234-5678', 'owen.morgan@hotmail.com'),
(63, 'Chloe', 'Marie', 'Peterson', 61, 63, 14, '555-345-6789', 'chloe.peterson@yahoo.com'),
(64, 'Noah', 'Alexander', 'Brooks', 61, 64, 14, '555-456-7890', 'noah.brooks@outlook.com'),
(65, 'Emma', 'Marie', 'Henderson', 61, 65, 14, '555-567-8901', 'emma.henderson@gmail.com'),
(66, 'Liam', 'Thomas', 'Cooper', NULL, 66, 15, '555-678-9012', 'liam.cooper@hotmail.com'),
(67, 'Ava', 'Marie', 'Hayes', 66, 67, 15, '555-789-0123', 'ava.hayes@yahoo.com'),
(68, 'Jackson', 'Thomas', 'Simmons', 66, 68, 15, '555-890-1234', 'jackson.simmons@outlook.com'),
(69, 'Sophia', 'Marie', 'Stewart', 66, 69, 15, '555-901-2345', 'sophia.stewart@gmail.com'),
(70, 'Lucas', 'Michael', 'Perry', NULL, 70, 16, '555-012-3456', 'lucas.perry@hotmail.com'),
(71, 'Isabella', 'Marie', 'Cox', 70, 71, 16, '555-123-4567', 'isabella.cox@yahoo.com'),
(72, 'Benjamin', 'Thomas', 'Murphy', 70, 72, 16, '555-234-5678', 'benjamin.murphy@outlook.com'),
(73, 'Mia', 'Marie', 'Parker', NULL, 73, 17, '555-345-6789', 'mia.parker@gmail.com'),
(74, 'Elijah', 'Thomas', 'Richardson', 73, 74, 17, '555-456-7890', 'elijah.richardson@hotmail.com'),
(75, 'Aria', 'Marie', 'Henderson', 73, 75, 17, '555-567-8901', 'aria.henderson@yahoo.com'),
(76, 'Oliver', 'Thomas', 'Coleman', 73, 76, 17, '555-678-9012', 'oliver.coleman@outlook.com'),
(77, 'Lily', 'Marie', 'Reed', 73, 77, 17, '555-789-0123', 'lily.reed@gmail.com'),
(78, 'James', 'Thomas', 'Russell', NULL, 78, 18, '555-890-1234', 'james.russell@hotmail.com'),
(79, 'Grace', 'Marie', 'Morgan', 78, 79, 18, '555-901-2345', 'grace.morgan@yahoo.com'),
(80, 'Jackson', 'Thomas', 'Peterson', 78, 80, 18, '555-012-3456', 'jackson.peterson@outlook.com'),
(81, 'Sophia', 'Marie', 'Brooks', NULL, 81, 19, '555-123-4567', 'sophia.brooks@gmail.com'),
(82, 'Liam', 'Michael', 'Henderson', 81, 82, 19, '555-234-5678', 'liam.henderson@hotmail.com'),
(83, 'Olivia', 'Marie', 'Cooper', NULL, 83, 20, '555-345-6789', 'olivia.cooper@yahoo.com'),
(84, 'Noah', 'Marie', 'Hayes', 83, 84, 20, '555-456-7890', 'noah.hayes@outlook.com'),
(85, 'Ava', 'Marie', 'Simmons', NULL, 85, 21, '555-567-8901', 'ava.simmons@gmail.com'),
(86, 'Lucas', 'Thomas', 'Stewart', 85, 86, 21, '555-678-9012', 'lucas.stewart@hotmail.com'),
(87, 'Chloe', 'Marie', 'Perry', NULL, 87, 22, '555-789-0123', 'chloe.perry@yahoo.com'),
(88, 'Owen', 'Michael', 'Cox', 87, 88, 22, '555-890-1234', 'owen.cox@outlook.com'),
(89, 'Emma', 'Marie', 'Murphy', 87, 89, 22, '555-901-2345', 'emma.murphy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Flights`
--

CREATE TABLE `Flights` (
  `flight_id` int(11) NOT NULL,
  `depart_airport` varchar(255) NOT NULL,
  `depart_time` datetime NOT NULL,
  `duration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` varchar(50) NOT NULL,
  `aircraft_type` varchar(50) NOT NULL,
  `gate` varchar(10) NOT NULL,
  `arr_airport` varchar(255) NOT NULL,
  `arr_time` datetime GENERATED ALWAYS AS (`depart_time` + interval time_to_sec(`duration`) second) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Flights`
--

INSERT INTO `Flights` (`flight_id`, `depart_airport`, `depart_time`, `duration`, `status`, `aircraft_type`, `gate`, `arr_airport`) VALUES
(1, 'Heathrow Airport', '2024-01-10 09:30:00', '2024-01-08 01:45:00', 'Delayed', 'Airbus A380', 'B3', 'Dubai International Airport'),
(2, 'Tokyo Haneda Airport', '2024-01-12 15:45:00', '2024-01-08 09:30:00', 'On Time', 'Boeing 777', 'C7', 'San Francisco International Airport'),
(3, 'Sydney Kingsford Smith Airport', '2024-01-15 21:00:00', '2024-01-08 06:15:00', 'On Time', 'Airbus A350', 'A2', 'John F. Kennedy International Airport'),
(4, 'Changi Airport', '2024-01-18 04:20:00', '2024-01-08 03:30:00', 'Boarding', 'Boeing 737', 'D5', 'Hong Kong International Airport'),
(5, 'Los Angeles International Airport', '2024-01-20 18:15:00', '2024-01-08 07:00:00', 'On Time', 'Airbus A320', 'A4', 'London Gatwick Airport'),
(6, 'Cairo International Airport', '2024-01-10 09:30:00', '2024-01-08 01:45:00', 'En-Route', 'Airbus A380', 'B3', 'Dubai International Airport'),
(7, 'Sharm Elsheikh Airport', '2024-01-13 10:30:00', '2024-01-08 01:45:00', 'On-Time', 'Airbus A380', 'B3', 'Borg Elarab International Airport');

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `salary` bigint(20) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`job_id`, `job_name`, `salary`, `hours`) VALUES
(1, 'Airport Operations Manager', 100000, 40),
(2, 'Operations Coordinator', 60000, 40),
(3, 'Airside Operations Specialist', 75000, 40),
(4, 'Landside Operations Officer', 65000, 40),
(5, 'Ground Operations Supervisor', 85000, 45),
(6, 'Airport Security Officer', 55000, 40),
(7, 'Security Screener', 45000, 40),
(8, 'Security Supervisor', 60000, 40),
(9, 'Aviation Security Manager', 80000, 45),
(10, 'Security Compliance Specialist', 70000, 40),
(11, 'Customer Service Representative', 45000, 40),
(12, 'Passenger Service Agent', 40000, 40),
(13, 'Airport Information Desk Attendant', 38000, 40),
(14, 'Lost and Found Coordinator', 42000, 40),
(15, 'Passenger Assistance Specialist', 48000, 40),
(16, 'Air Traffic Controller', 90000, 40),
(17, 'Tower Controller', 80000, 40),
(18, 'Approach and Departure Controller', 85000, 40),
(19, 'En Route Controller', 95000, 40),
(20, 'Air Traffic Control Specialist', 75000, 40),
(21, 'Ramp Agent', 35000, 40),
(22, 'Baggage Handler', 32000, 40),
(23, 'Aircraft Cleaner', 30000, 40),
(24, 'Passenger Service Supervisor', 50000, 40),
(25, 'Cargo Operations Coordinator', 45000, 40),
(26, 'Airport Retail Manager', 60000, 40),
(27, 'Concessions Coordinator', 50000, 40),
(28, 'Sales Associate', 35000, 40),
(29, 'Duty-Free Shop Attendant', 32000, 40),
(30, 'Food and Beverage Supervisor', 48000, 40),
(31, 'Facilities Manager', 70000, 40),
(32, 'Airport Maintenance Technician', 55000, 40),
(33, 'Janitorial Supervisor', 48000, 40),
(34, 'HVAC Technician', 60000, 40),
(35, 'Electrician', 65000, 40),
(36, 'Airport Finance Manager', 80000, 40),
(37, 'Budget Analyst', 60000, 40),
(38, 'Administrative Assistant', 40000, 40),
(39, 'Human Resources Specialist', 55000, 40),
(40, 'Procurement Officer', 65000, 40),
(41, 'Airport IT Manager', 85000, 40),
(42, 'Systems Administrator', 70000, 40),
(43, 'Network Engineer', 75000, 40),
(44, 'Help Desk Support', 50000, 40),
(45, 'Cybersecurity Analyst', 80000, 40),
(46, 'Emergency Operations Center Coordinator', 60000, 40),
(47, 'Emergency Medical Technician (EMT)', 50000, 40),
(48, 'Airport Rescue and Firefighting (ARFF) Specialist', 55000, 40),
(49, 'Airport Firefighter', 60000, 40),
(50, 'Customs Officer', 55000, 40),
(51, 'Immigration Officer', 55000, 40),
(52, 'Border Protection Agent', 60000, 40),
(53, 'Passport Control Officer', 50000, 40),
(54, 'Environmental Compliance Specialist', 65000, 40),
(55, 'Sustainability Coordinator', 60000, 40),
(56, 'Environmental Engineer', 70000, 40),
(57, 'Green Initiatives Manager', 75000, 40),
(58, 'Captain', 120000, 40),
(59, 'First Officer (Co-Pilot)', 80000, 40),
(60, 'Flight Engineer', 90000, 40),
(61, 'Aircraft Maintenance Technician (AMT)', 60000, 40),
(62, 'Avionics Technician', 65000, 40),
(63, 'Aircraft Inspector', 70000, 40),
(64, 'Line Maintenance Technician', 55000, 40),
(65, 'Aircraft Mechanic', 60000, 40),
(66, 'Flight Dispatcher', 70000, 40),
(67, 'Flight Operations Officer', 75000, 40),
(68, 'Flight Coordinator', 65000, 40),
(69, 'Load Planner', 60000, 40),
(70, 'Cabin Supervisor', 50000, 40),
(71, 'Flight Attendant', 45000, 40),
(72, 'Purser', 55000, 40),
(73, 'Ramp Supervisor', 60000, 40),
(74, 'Aircraft Cleaner', 35000, 40),
(75, 'Baggage Handler', 32000, 40),
(76, 'Cargo Loader', 40000, 40),
(77, 'Aircraft Marshaller', 45000, 40),
(78, 'Aircraft Fueler', 35000, 40),
(79, 'Fueling Supervisor', 50000, 40),
(80, 'Logistics Coordinator', 45000, 40),
(81, 'Aircraft Charter Sales Representative', 60000, 40),
(82, 'Aircraft Sales Manager', 80000, 40),
(83, 'Airline Operations Controller', 75000, 40),
(84, 'Operations Dispatcher', 60000, 40),
(85, 'Aviation Safety Inspector', 80000, 40),
(86, 'Compliance Officer', 70000, 40),
(87, 'Aircraft Tug Driver', 40000, 40),
(88, 'Lavatory Service Technician', 35000, 40),
(89, 'Catering Coordinator', 45000, 40);

-- --------------------------------------------------------

--
-- Table structure for table `Passengers`
--

CREATE TABLE `Passengers` (
  `pass_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `carry_on` tinyint(1) NOT NULL,
  `baggage` tinyint(1) NOT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Passengers`
--

INSERT INTO `Passengers` (`pass_id`, `first_name`, `last_name`, `phone_number`, `email`, `carry_on`, `baggage`, `flight_id`, `ticket_id`) VALUES
(1, 'Rachel', 'Zane', '123-456-789', 'mrs.ross@yahoo.com', 1, 0, 1, 1),
(2, 'Julia', 'Stiles', '123-456-789', 'j.stiles@yahoo.com', 0, 1, 1, 2),
(3, 'Samantha', 'Wheeler', '123-456-789', 'wheelersamantha@gmail.com', 0, 1, 2, 3),
(4, 'Harvey', 'Specter', '123-456-789', 'harv.specter@outlook.com', 0, 0, 2, 4),
(5, 'Donna', 'Paulsen', '123-456-789', 'thedonna@pearson.com', 1, 1, 3, 5),
(6, 'Jessica', 'Pearson', '123-456-789', 'j.pearson@pearson.com', 1, 0, 3, 6),
(7, 'Sheila', 'Sazs', '123-456-789', 'mrs.litt@outlook.com', 0, 1, 4, 7),
(8, 'Mike', 'Ross', '123-456-789', 'michael.ross@hotmail.com', 1, 0, 4, 8),
(9, 'Sean', 'Cahill', '123-456-789', 'sean_cahill@gmail.com', 0, 1, 5, 9),
(10, 'Louis', 'Litt', '123-456-789', 'litt.louis@pearsonspecter.com', 1, 1, 5, 10),
(16, 'Nada', 'Hamada', '01009503526', 'nadahamada1712@gmail.com', 1, 1, 1, NULL),
(17, 'Ahmed', 'Amr', '01009805746', 'ahmedamr@gmail.com', 1, 1, 6, NULL);

--
-- Triggers `Passengers`
--
DELIMITER $$
CREATE TRIGGER `after_insert_passenger` AFTER INSERT ON `Passengers` FOR EACH ROW BEGIN
    INSERT INTO tickets (pass_id, class, price)
    VALUES (NEW.pass_id, 'pending', 0);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_into_baggage` AFTER INSERT ON `Passengers` FOR EACH ROW BEGIN
    IF NEW.baggage = 1 THEN
        
        INSERT INTO Baggage (pass_id, destination, weight, status) 
        VALUES (
            NEW.pass_id, 
            (SELECT arr_airport FROM Flights WHERE flight_id = NEw.flight_id),DEFAULT, DEFAULT
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Tickets`
--

CREATE TABLE `Tickets` (
  `ticket_id` int(11) NOT NULL,
  `pass_id` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `class` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tickets`
--

INSERT INTO `Tickets` (`ticket_id`, `pass_id`, `price`, `class`) VALUES
(1, 1, 140, 'Business'),
(2, 2, 70, 'Economy'),
(3, 3, 150, 'Business'),
(4, 4, 180, 'First'),
(5, 5, 80, 'Economy'),
(6, 6, 100, 'Premium Economy'),
(7, 7, 150, 'Business'),
(8, 8, 190, 'First'),
(9, 9, 100, 'Premium Economy'),
(10, 10, 60, 'Economy'),
(11, 17, 0, 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Baggage`
--
ALTER TABLE `Baggage`
  ADD PRIMARY KEY (`bag_id`),
  ADD KEY `pass_id` (`pass_id`);

--
-- Indexes for table `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `super_id` (`super_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `Flights`
--
ALTER TABLE `Flights`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `Passengers`
--
ALTER TABLE `Passengers`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `pass_id` (`pass_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Baggage`
--
ALTER TABLE `Baggage`
  MODIFY `bag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Departments`
--
ALTER TABLE `Departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `Flights`
--
ALTER TABLE `Flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Jobs`
--
ALTER TABLE `Jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `Passengers`
--
ALTER TABLE `Passengers`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Tickets`
--
ALTER TABLE `Tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Baggage`
--
ALTER TABLE `Baggage`
  ADD CONSTRAINT `baggage_ibfk_1` FOREIGN KEY (`pass_id`) REFERENCES `Passengers` (`pass_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`super_id`) REFERENCES `employees` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Passengers`
--
ALTER TABLE `Passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `Tickets` (`ticket_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `Flights` (`flight_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`pass_id`) REFERENCES `Passengers` (`pass_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
