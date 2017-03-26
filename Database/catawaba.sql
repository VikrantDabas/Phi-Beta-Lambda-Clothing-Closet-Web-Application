-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2016 at 12:46 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catawaba`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `SSN` varchar(11) DEFAULT NULL,
  `Batch` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `Ssn` varchar(11) DEFAULT NULL,
  `Receive_newsletter` varchar(5) DEFAULT NULL,
  `Cart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`Ssn`, `Receive_newsletter`, `Cart_id`) VALUES
('shiva', '1', 1),
('105', '0', 105),
('106', '0', 106),
('107', 'no', 107),
('01010', 'yes', 1010),
('998', 'yes', 998),
('10112', 'yes', 10112),
('1021', 'yes', 1021),
('10101', 'yes', 10101),
('12345', 'yes', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donator`
--

CREATE TABLE `donator` (
  `Ssn` varchar(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donator`
--

INSERT INTO `donator` (`Ssn`, `type`) VALUES
('1031210035', 'Student'),
('1031210007', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `SSN` varchar(11) DEFAULT NULL,
  `Department` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `SSN` varchar(11) DEFAULT NULL,
  `Connection_To` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Order_id` varchar(10) NOT NULL,
  `Cart_id` varchar(10) NOT NULL,
  `Total_cost` int(10) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Order_id`, `Cart_id`, `Total_cost`, `Date`) VALUES
('121826', '1', 34, '2016-12-01'),
('174913', '1', 20, '2016-12-01'),
('213894', '1021', 19, '2016-12-02'),
('222330', '105', 34, '2016-12-01'),
('223144', '1', 20, '2016-12-01'),
('270914', '105', 20, '2016-12-01'),
('273166', '1', 20, '2016-12-01'),
('278238', '1', 20, '2016-11-25'),
('363199', '1', 14, '2016-11-25'),
('370415', '1', 34, '2016-11-19'),
('406060', '1', 34, '2016-12-01'),
('419379', '1', 22, '2016-12-02'),
('422553', '1', 34, '2016-11-20'),
('427924', '1', 34, '2016-11-25'),
('433132', '1', 20, '2016-11-25'),
('489529', '1', 20, '2016-12-01'),
('501844', '10101', 32, '2016-12-02'),
('522081', '1', 20, '2016-12-01'),
('528971', '1', 20, '2016-12-01'),
('531521', '1', 20, '2016-12-01'),
('534993', '106', 20, '2016-11-19'),
('535942', '1', 20, '2016-11-19'),
('540201', '1', 34, '2016-12-01'),
('544216', '1', 20, '2016-11-20'),
('555202', '1', 34, '2016-11-19'),
('563856', '1', 77, '2016-12-07'),
('599880', '10101', 19, '2016-12-02'),
('600775', '1', 34, '2016-12-01'),
('605007', '1', 14, '2016-11-22'),
('686686', '1', 20, '2016-12-01'),
('751573', '1', 22, '2016-12-02'),
('758165', '10101', 21, '2016-12-02'),
('766058', '1', 20, '2016-11-25'),
('772026', '1', 20, '2016-12-07'),
('786566', '1', 34, '2016-11-19'),
('791259', '1', 20, '2016-12-01'),
('821831', '1', 20, '2016-12-01'),
('827284', '105', 40, '2016-12-01'),
('838107', '12345', 27, '2016-12-02'),
('851888', '105', 20, '2016-12-01'),
('882595', '1', 20, '2016-12-01'),
('899766', '1', 20, '2016-11-19'),
('905137', '106', 54, '2016-11-19'),
('905436', '1', 20, '2016-11-19'),
('921440', '106', 34, '2016-11-19'),
('965684', '105', 14, '2016-12-01'),
('971408', '1', 14, '2016-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `ordersplaced`
--

CREATE TABLE `ordersplaced` (
  `Order_id` varchar(10) NOT NULL,
  `Product_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordersplaced`
--

INSERT INTO `ordersplaced` (`Order_id`, `Product_id`) VALUES
('121826', '102'),
('121826', '103'),
('174913', '101'),
('213894', '549'),
('222330', '101'),
('222330', '102'),
('223144', '101'),
('270914', '101'),
('273166', '103'),
('278238', '101'),
('363199', '102'),
('370415', '102'),
('370415', '103'),
('406060', '102'),
('406060', '103'),
('419379', '559'),
('422553', '102'),
('422553', '103'),
('427924', '102'),
('427924', '103'),
('433132', '103'),
('489529', '103'),
('501844', '82'),
('522081', '101'),
('528971', '101'),
('531521', '101'),
('534993', '101'),
('535942', '103'),
('540201', '102'),
('540201', '103'),
('544216', '103'),
('555202', '101'),
('555202', '102'),
('563856', '699'),
('563856', '701'),
('563856', '92'),
('599880', '904'),
('600775', '101'),
('600775', '102'),
('605007', '102'),
('686686', '101'),
('751573', '559'),
('758165', '616'),
('766058', '103'),
('772026', '824'),
('786566', '101'),
('786566', '102'),
('791259', '102'),
('821831', '101'),
('827284', '101'),
('827284', '102'),
('838107', '380'),
('838107', '40'),
('851888', '102'),
('899766', '103'),
('905137', '101'),
('905137', '102'),
('905137', '103'),
('905436', '103'),
('921440', '102'),
('921440', '103'),
('965684', '102'),
('971408', '102');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `Ssn` varchar(11) NOT NULL,
  `Login_id` varchar(50) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `First_name` varchar(100) DEFAULT NULL,
  `Last_name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone_number` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`Ssn`, `Login_id`, `Password`, `First_name`, `Last_name`, `Address`, `Phone_number`, `Email`, `Gender`, `Date_of_birth`, `Role`) VALUES
('01010', 'shiva', 'shiva', 'Shiva chaithanya Reddy', 'B', '9500 grove crest Lane, Apt #514', '9803093399', 'shivasporty07@gmail.com', 'yes', '2016-02-09', 'customer'),
('10101', 'rudra', 'shiva', 'Rudra Simha Reddy', 'B', '9500 grove crest Lane, Apt #514', '9803093399', 'shivasporty07@gmail.com', 'yes', '2016-11-27', 'customer'),
('10112', 'shiva', 'shiva', 'Shiva chaithanya Reddy', 'B', '9500 grove crest Lane, Apt #514', '9803093399', 'shivasporty07@gmail.com', 'no', '2016-02-15', 'customer'),
('1021', 'shiva001', 'shiva', 'Shiva chaithanya Reddy', 'B', '9500 grove crest Lane, Apt #514', '9803093399', 'shivasporty07@gmail.com', 'no', '2016-11-27', 'customer'),
('1031210007', NULL, 'shiva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
('1031210035', 'stkmkm', '', 'km', 'kmk', 'asasas', 'mkmkm', 'shivasporty07@gmail.com', 'yes', '2012-10-10', ''),
('104', 'shiva', 'shiva', 'shiva', 'B', '9500, Grove Crest Lane', '9803093399', 'shivasporty07@gmail.com', 'yes', '2015-04-14', ''),
('105', 'shiva', 'shiva', 'shiva', 'B', '9500, Grove Crest Lane', '9803093399', 'shivasporty07@gmail.com', 'yes', '2015-04-14', 'customer'),
('106', 'shiva', 'shiva', 'shiva', 'B', '9500, Grove Crest Lane', '9803093399', 'shivasporty07@gmail.com', 'yes', '2015-04-14', ''),
('107', 'shiva', 'shiva', 'shiva', 'B', '9500, Grove Crest Lane', '9803093399', 'shivasporty07@gmail.com', 'yes', '2015-04-14', ''),
('12345', 'Rudra2', 'shiva', 'Rudra Simha Reddy', 'Baaa', '9500 grove crest Lane, Apt #514', '9803093399', 'sbolla@uncc.edu', 'yes', '2016-11-27', 'customer'),
('998', '8171', 'shiva', 'Shiva chaithanya Reddy', 'B', '9500 grove crest Lane, Apt #514', '9803093399', 'shivasporty07@gmail.com', 'yes', '2016-05-30', 'customer'),
('shiva', 'mkmkm', 'shiva', 'Shiva Chaithanya Reddy', 'B', '9500, Grove Crest Lane', '980-309-3399', 'shivasporty07@gmail.com', 'yes', '2012-10-10', 'admin'),
('shiva1', 'asda', 'shiva', 'shiva', 'B', '9500, Grove Crest Lane', '9803093399', 'shivasporty07@gmail.com', 'yes', '2016-12-31', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_donor` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_donor`, `status`, `image`) VALUES
('168', 'Vero Moda - Shirt', 11, '1031210035', 0, '1.Vero-moda.jpg'),
('103', 'Fame Forever - ', 12, '1031210035', 0, '2.Fame-Forever.jpg'),
('726', 'Only Blue Shirt', 15, '1031210035', 0, 'Only-Blue.jpg'),
('92', 'Tommy Hilfigure', 22, '1031210035', 1, 'Tommy-Hilfigher.jpg'),
('701', 'Pepe Jeans Shirt', 21, '1031210035', 1, 'shirt.jpg'),
('699', 'Aramani Shirt', 34, '1031210035', 1, 'shirt2.jpg'),
('380', 'Women Black tshirt', 9, '1031210035', 1, 'shirt4.jpg'),
('397', 'Wrangler Formal', 41, '1031210035', 0, 'shirt5.jpg'),
('824', 'Wrangler Women tshirt', 20, '1031210035', 1, 'shirt8.jpg'),
('975', 'Forever 18 Women Shirt', 32, '1031210035', 0, 'shirt10.jpg'),
('904', 'Basics  Black jeans', 19, '1031210035', 1, 'bb.jpg'),
('616', 'Blackberry', 21, '1031210035', 1, 'blackberry.jpg'),
('40', 'Wrangler-black', 18, '1031210035', 1, 'bb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `Cart_id` int(11) NOT NULL,
  `Total_cost` float(20,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`Cart_id`, `Total_cost`) VALUES
(1, 0.000),
(104, 0.000),
(105, 0.000),
(106, 0.000),
(107, 0.000),
(998, 0.000),
(1010, 0.000),
(1021, 0.000),
(10101, 0.000),
(10112, 0.000),
(12345, 0.000),
(101011, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart_item`
--

CREATE TABLE `shoppingcart_item` (
  `Cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Ssn` varchar(11) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `SSN` varchar(11) DEFAULT NULL,
  `Department` varchar(30) DEFAULT NULL,
  `Year` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax_document`
--

CREATE TABLE `tax_document` (
  `Id` int(11) NOT NULL,
  `Donater_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD KEY `Ssn` (`Ssn`),
  ADD KEY `Cart_id` (`Cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donator`
--
ALTER TABLE `donator`
  ADD KEY `Ssn` (`Ssn`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD KEY `SSN` (`SSN`),
  ADD KEY `Connection_To` (`Connection_To`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Order_id`);

--
-- Indexes for table `ordersplaced`
--
ALTER TABLE `ordersplaced`
  ADD PRIMARY KEY (`Order_id`,`Product_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Ssn`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD KEY `product_donor` (`product_donor`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`Cart_id`);

--
-- Indexes for table `shoppingcart_item`
--
ALTER TABLE `shoppingcart_item`
  ADD PRIMARY KEY (`Cart_id`,`product_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD KEY `Ssn` (`Ssn`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `tax_document`
--
ALTER TABLE `tax_document`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Donater_id` (`Donater_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`Ssn`) REFERENCES `person` (`Ssn`),
  ADD CONSTRAINT `buyer_ibfk_2` FOREIGN KEY (`Cart_id`) REFERENCES `shoppingcart` (`Cart_id`);

--
-- Constraints for table `donator`
--
ALTER TABLE `donator`
  ADD CONSTRAINT `donator_ibfk_1` FOREIGN KEY (`Ssn`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`Ssn`),
  ADD CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`Connection_To`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `ordersplaced`
--
ALTER TABLE `ordersplaced`
  ADD CONSTRAINT `ordersplaced_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `invoice` (`Order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_donor`) REFERENCES `donator` (`Ssn`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Ssn`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`Ssn`);

--
-- Constraints for table `tax_document`
--
ALTER TABLE `tax_document`
  ADD CONSTRAINT `tax_document_ibfk_1` FOREIGN KEY (`Donater_id`) REFERENCES `person` (`Ssn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
