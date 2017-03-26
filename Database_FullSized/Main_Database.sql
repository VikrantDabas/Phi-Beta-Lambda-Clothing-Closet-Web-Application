/*****************************************************************************************************************************************************
 *  Team Name: AlphaTeam
 *  TEAM LEAD: Vikrant Dabas [UNC ID: 800936479]
 *  MEMBER 2: Rudhra Simha Reddy Balankari [UNC ID: 800962658]
 *  MEMBER 3: Yuvaraj Sundarrajan [UNC ID: 800903707]
 *  MEMBER 4: Ajinkya Mohapatra [UNC ID: 800963333]
 *  Class: ITCS 6160
 *  Date:10/31/2016
*****************************************************************************************************************************************************/

/*
        SET SQL_SAFE_UPDATES = 0;  --> disable safe mode in MySQL
        ALL TABLES HAVE BEEN CREATED IN InnoDB Storage Engine
*/


DROP DATABASE catsawaba; /* Drop the database if it is already created */
CREATE DATABASE catsawaba; /* Create the fresh database */
USE catsawaba; /* Use the newly created database to create tables and insert data */

/******************************************************* CREATE TABLES ******************************************************************************/
# define tables
/*create table person*/
CREATE TABLE `catsawaba`.`person` (
    `SSN` INT NOT NULL,
    `Login_id` VARCHAR(50) ,
    `Password` VARCHAR(20) ,
    `First_name` VARCHAR(20) ,
    `Last_name` VARCHAR(50) ,
    `Address` VARCHAR(50) ,
    `Phone_number` VARCHAR(20) ,
    `Email` VARCHAR(50) ,
    `Gender` VARCHAR(50) ,
    `Date_of_birth` DATE ,
    PRIMARY KEY (`Ssn`)
);

/*create table staff*/
CREATE TABLE `catsawaba`.`staff` (
    `SSN` INT ,
    `Type` VARCHAR(20) ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn)
);

/*create table donator*/
CREATE TABLE `catsawaba`.`donator` (
    `SSN` INT ,
    `type` VARCHAR(30) ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn)
);

/*create table faculty*/
CREATE TABLE `catsawaba`.`faculty` (
    `SSN` INT ,
    `Department` VARCHAR(30) ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn)
);

/*create table alumni*/
CREATE TABLE `catsawaba`.`alumni` (
    `SSN` INT ,
    `Batch` VARCHAR(20) ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn)
);

/*create table student*/
CREATE TABLE `catsawaba`.`student` (
    `SSN` INT ,
    `Department` VARCHAR(30) ,
    `Year` VARCHAR(20) ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn)
);

/*create table friend*/
CREATE TABLE `catsawaba`.`friend` (
    `SSN` INT ,
    `Connection_To` INT ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn),
    FOREIGN KEY (Connection_To)
        REFERENCES person (Ssn)
);

/*create table shoppingcart*/
CREATE TABLE `catsawaba`.`shoppingcart` (
    `Cart_id` INT NOT NULL,
    `Total_cost` FLOAT(20,3) NULL CHECK(Total_cost >= 0),
    `Number_of_items` INT NULL CHECK(Number_of_items >= 0),
	`ssn` int,
	`added_time` datetime,
    PRIMARY KEY (`Cart_id`)
);

/*create table buyer*/
CREATE TABLE `catsawaba`.`buyer` (
    `SSN` INT ,
    `Receive_newsletter` TINYINT(1) ,
    `Cart_id` INT ,
    FOREIGN KEY (Ssn)
        REFERENCES person (Ssn),
    FOREIGN KEY (Cart_id)
        REFERENCES shoppingcart (Cart_id)
);

/*create table tax_document*/
CREATE TABLE `catsawaba`.`tax_document` (
    `Id` INT NOT NULL,
    `Donater_id` INT ,
    PRIMARY KEY (`Id`),
    FOREIGN KEY (Donater_id)
        REFERENCES person (Ssn)
);

/*create table category*/
CREATE TABLE `catsawaba`.`category` (
    `id` INT NOT NULL,
    `Name` VARCHAR(20) ,
    PRIMARY KEY (`id`)
);

CREATE TABLE `catsawaba`.`shoppingcart_item` (
    `Cart_id` INT NOT NULL,
    `Item_id` INT NOT NULL,
    `added_time` datetime,
    PRIMARY KEY (`Cart_id`, `Item_id`)
);

/*create table item*/
CREATE TABLE `catsawaba`.`item` (
    `Item_id` INT NOT NULL,
    `Donater_id` INT ,
    `Staff_id` INT ,
    `Tax_id` INT ,
    `Color` VARCHAR(20) ,
    `Condition` VARCHAR(200) ,
    `Asking_price` FLOAT(20,3) CHECK(Asking_price >= 0),
    `Brand` VARCHAR(30) ,
    `Size` VARCHAR(10) ,
    `Description` VARCHAR(50) ,
    `Date_Acquired` DATE ,
    `Date_Posted` DATE ,
    `Sold_Indicator` TINYINT(1) ,
    `Reduction` TINYINT(1) ,
    `Value` FLOAT(20,3) CHECK(Value >= 0),
    `Selling_Price` FLOAT(20,3) CHECK(Selling_Price >= 0),
    `For_gender` VARCHAR(5) ,
    `Posted_to_instagram` TINYINT(1) ,
    `Picture` BLOB ,
    PRIMARY KEY (`Item_id`),
    FOREIGN KEY (Donater_id)
        REFERENCES person (Ssn),
    FOREIGN KEY (Staff_id)
        REFERENCES person (Ssn),
    FOREIGN KEY (Tax_id)
        REFERENCES tax_document (Id)
);

/*create table item_category*/
CREATE TABLE `catsawaba`.`item_category` (
    `Item_id` INT ,
    `Category_id` INT ,
    FOREIGN KEY (Item_id)
        REFERENCES item (Item_id),
    FOREIGN KEY (Category_id)
        REFERENCES category (id)
);


/*create table invoice*/
CREATE TABLE `catsawaba`.`invoice` (
    `Invoice_id` INT NOT NULL,
    `Cart_id` INT ,
    `Invoice_Amount` FLOAT(20,3) NULL CHECK(Invoice_Amount >= 0),
    `Payment_method` VARCHAR(20) ,
    `Status` VARCHAR(20) ,
    PRIMARY KEY (`Invoice_id`),
    FOREIGN KEY (Cart_id)
        REFERENCES shoppingcart (Cart_id)
);

/**************************************************************** INSERT DATA ***********************************************************************/

/* Load data in table person */
INSERT INTO person VALUES(111111111,'1', 'abcd' ,'Yuvaraj','Sundarr','4310 Barton Creek Drive Apt D Charlotte NC', '7049061299','ysundarr@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111112,'2', 'abcd' ,'Ram','kumar','4301 Barton Creek Drive Apt D Charlotte NC', '7049061299','Ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111113,'3', 'abcd' ,'Vikrant','darbas','4320 Barton Creek Drive Apt D Charlotte NC', '7049061299','vikrant@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111114,'4', 'abcd' ,'akinkaye','rahane','43230 Barton Creek Drive Apt D Charlotte NC', '7049061299','Ajinkya@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111115,'5', 'abcd' ,'vamsee','yaram','43034 Barton Creek Drive Apt D Charlotte NC', '7049061299','vamsee@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111116,'6', 'abcd' ,'rudra','chaitan','43043 Barton Creek Drive Apt D Charlotte NC', '7049061299','rami@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111117,'7', 'abcd' ,'ganesh','sunrar','43044 Barton Creek Drive Apt D Charlotte NC', '7049061299','ganesh@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111118,'8', 'abcd' ,'raghav','rajesh','43043 Barton Creek Drive Apt D Charlotte NC', '7049061299','raghav@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111119,'9', 'abcd' ,'rimbu','Rama','433 Barton Creek Drive Apt D Charlotte NC', '7049061299','rimbu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111120,'10', 'abcd' ,'raj','Sundarr','434 Barton Creek Drive Apt D Charlotte NC', '7049061299','raj@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111121,'11', 'abcd' ,'karthik','krishnam','4343 Barton Creek Drive Apt D Charlotte NC', '7049061299','karthik@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111122,'12', 'abcd' ,'rinku','Stephen','4334 Barton Creek Drive Apt D Charlotte NC', '7049061299','rinku@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111123,'13', 'abcd' ,'manu','somu','43022 Barton Creek Drive Apt D Charlotte NC', '7049061299','manu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111124,'14', 'abcd' ,'somu','ramu','430221 Barton Creek Drive Apt D Charlotte NC', '7049061299','somu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111125,'15', 'abcd' ,'ramu','chandar','430221 Barton Creek Drive Apt D Charlotte NC', '7049061299','ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111126,'16', 'abcd' ,'mani','Sundarr','43031 Barton Creek Drive Apt D Charlotte NC', '7049061299','mani@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111127,'17', 'abcd' ,'palani','ramu','43034 Barton Creek Drive Apt D Charlotte NC', '7049061299','palani@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111128,'18', 'abcd' ,'bala','chandar','43055 Barton Creek Drive Apt D Charlotte NC', '7049061299','bala@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111129,'19', 'abcd' ,'tom','chan','430556 Barton Creek Drive Apt D Charlotte NC', '7049061299','tom@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111130,'20', 'abcd' ,'harry','potter','43023 Barton Creek Drive Apt D Charlotte NC', '7049061299','harry@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111131,'21', 'abcd' ,'larry','Page','43023 Barton Creek Drive Apt D Charlotte NC', '7049061299','larry@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111132,'22', 'abcd' ,'peter','king','430115 Barton Creek Drive Apt D Charlotte NC', '7049061299','peter@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111133,'23', 'abcd' ,'viki','Sram','430114 Barton Creek Drive Apt D Charlotte NC', '7049061299','viki@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111134,'24', 'abcd' ,'ajay','kumar','430112 Barton Creek Drive Apt D Charlotte NC', '7049061299','ajay@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111135,'25', 'abcd' ,'raju','sundarram','4302311 Barton Creek Drive Apt D Charlotte NC', '7049061299','raju@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111136,'26', 'abcd' ,'kanda','sumi','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','kanda@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111137,'27', 'abcd' ,'ravi','ram','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111138,'28', 'abcd' ,'ajith','kumar','4301124 Barton Creek Drive Apt D Charlotte NC', '7049061299','ajith@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111139,'29', 'abcd' ,'surya','siva','430114 Barton Creek Drive Apt D Charlotte NC', '7049061299','surya@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111140,'30', 'abcd' ,'simbu','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','simbu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));

INSERT INTO person VALUES(111111141,'31', 'abcd' ,'ram','chand','423 Barton Creek Drive Apt E Charlotte NC', '7049061299','ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111142,'32', 'abcd' ,'vijay','kumatr','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','vijay@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111143,'33', 'abcd' ,'ravi','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111144,'34', 'abcd' ,'sampath','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111145,'35', 'abcd' ,'simbu','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','simbu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111146,'36', 'abcd' ,'babu','raj','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','babu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111147,'37', 'abcd' ,'asish','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','asish@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111148,'38', 'abcd' ,'ramu','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ramu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111149,'39', 'abcd' ,'sam','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111150,'40', 'abcd' ,'ravi','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111151,'41', 'abcd' ,'ram','chand','423 Barton Creek Drive Apt E Charlotte NC', '7049061299','ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111152,'42', 'abcd' ,'vijay','kumatr','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','vijay@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111153,'43', 'abcd' ,'ravi','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111154,'44', 'abcd' ,'sampath','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111155,'45', 'abcd' ,'simbu','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','simbu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111156,'46', 'abcd' ,'babu','raj','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','babu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111157,'47', 'abcd' ,'asish','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','asish@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111158,'48', 'abcd' ,'ramu','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ramu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111159,'49', 'abcd' ,'sam','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111160,'50', 'abcd' ,'ravi','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111161,'51', 'abcd' ,'ram','chand','423 Barton Creek Drive Apt E Charlotte NC', '7049061299','ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111162,'52', 'abcd' ,'vijay','kumatr','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','vijay@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111163,'53', 'abcd' ,'ravi','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111164,'54', 'abcd' ,'sampath','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111165,'55', 'abcd' ,'simbu','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','simbu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111166,'56', 'abcd' ,'babu','raj','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','babu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111167,'57', 'abcd' ,'asish','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','asish@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111168,'58', 'abcd' ,'ramu','krish','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ramu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111169,'59', 'abcd' ,'sam','sundar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','sam@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111170,'60', 'abcd' ,'ravi','kumar','4301123 Barton Creek Drive Apt D Charlotte NC', '7049061299','ravi@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111171,'61', 'abcd' ,'karthik','krishnam','4343 Barton Creek Drive Apt D Charlotte NC', '7049061299','karthik@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111172,'62', 'abcd' ,'rinku','Stephen','4334 Barton Creek Drive Apt D Charlotte NC', '7049061299','rinku@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111173,'63', 'abcd' ,'manu','somu','43022 Barton Creek Drive Apt D Charlotte NC', '7049061299','manu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111174,'64', 'abcd' ,'somu','ramu','430221 Barton Creek Drive Apt D Charlotte NC', '7049061299','somu@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO person VALUES(111111175,'65', 'abcd' ,'ramu','chandar','430221 Barton Creek Drive Apt D Charlotte NC', '7049061299','ram@uncc.edu', 'M', STR_TO_DATE('1-01-2012', '%d-%m-%Y'));


/* Load data in table staff */
INSERT INTO staff VALUES(111111111,'admin');
INSERT INTO staff VALUES(111111112,'member');
INSERT INTO staff VALUES(111111113,'member');
INSERT INTO staff VALUES(111111114,'member');
INSERT INTO staff VALUES(111111115,'member');

INSERT INTO staff VALUES(111111141,'member');
INSERT INTO staff VALUES(111111142,'member');
INSERT INTO staff VALUES(111111143,'member');
INSERT INTO staff VALUES(111111144,'member');
INSERT INTO staff VALUES(111111145,'member');


/* Load data in table donator */
INSERT INTO donator VALUES(111111116,'alumni');
INSERT INTO donator VALUES(111111117,'alumni');
INSERT INTO donator VALUES(111111118,'alumni');
INSERT INTO donator VALUES(111111119,'alumni');
INSERT INTO donator VALUES(111111120,'alumni');
INSERT INTO donator VALUES(111111121,'student');
INSERT INTO donator VALUES(111111122,'student');
INSERT INTO donator VALUES(111111123,'student');
INSERT INTO donator VALUES(111111124,'student');
INSERT INTO donator VALUES(111111125,'student');
INSERT INTO donator VALUES(111111126,'faculty');
INSERT INTO donator VALUES(111111127,'faculty');
INSERT INTO donator VALUES(111111128,'faculty');
INSERT INTO donator VALUES(111111129,'faculty');
INSERT INTO donator VALUES(111111130,'faculty');
INSERT INTO donator VALUES(111111131,'friend');
INSERT INTO donator VALUES(111111132,'friend');
INSERT INTO donator VALUES(111111133,'friend');
INSERT INTO donator VALUES(111111134,'friend');
INSERT INTO donator VALUES(111111135,'friend');

INSERT INTO donator VALUES(111111146,'student');
INSERT INTO donator VALUES(111111147,'faculty');
INSERT INTO donator VALUES(111111148,'friend');
INSERT INTO donator VALUES(111111149,'alumni');
INSERT INTO donator VALUES(111111150,'student');

/* Load data in table faculty */
INSERT INTO faculty VALUES(111111126,'science');
INSERT INTO faculty VALUES(111111127,'maths');
INSERT INTO faculty VALUES(111111128,'computer science');
INSERT INTO faculty VALUES(111111129,'mechanical');
INSERT INTO faculty VALUES(111111130,'electrical');

INSERT INTO faculty VALUES(111111151,'physics');
INSERT INTO faculty VALUES(111111152,'computer science');
INSERT INTO faculty VALUES(111111153,'chemical');
INSERT INTO faculty VALUES(111111154,'mechanical');
INSERT INTO faculty VALUES(111111155,'electrical');

/* Load data in table alumni */
INSERT INTO alumni VALUES(111111116,'2009-2013');
INSERT INTO alumni VALUES(111111117,'2011-2013');
INSERT INTO alumni VALUES(111111118,'2013-2015');
INSERT INTO alumni VALUES(111111119,'2008-2012');
INSERT INTO alumni VALUES(111111120,'2007-2011');

INSERT INTO alumni VALUES(111111156,'2013-2015');
INSERT INTO alumni VALUES(111111157,'2008-2012');
INSERT INTO alumni VALUES(111111158,'2007-2011');
INSERT INTO alumni VALUES(111111159,'2008-2012');
INSERT INTO alumni VALUES(111111160,'2007-2011');

/* Load data in table student */
INSERT INTO student VALUES(111111121,'computer science', 'graduate');
INSERT INTO student VALUES(111111122,'Biology', 'sophmore');
INSERT INTO student VALUES(111111123,'Maths', 'Phd');
INSERT INTO student VALUES(111111124,'Mechanical', 'sophmore');
INSERT INTO student VALUES(111111125,'science', 'graduate');

INSERT INTO student VALUES(111111161,'computer science', 'graduate');
INSERT INTO student VALUES(111111162,'Biology', 'sophmore');
INSERT INTO student VALUES(111111163,'Maths', 'Phd');
INSERT INTO student VALUES(111111164,'Mechanical', 'sophmore');
INSERT INTO student VALUES(111111165,'science', 'graduate');

/* Load data in table friend */
INSERT INTO friend VALUES(111111131,111111121);
INSERT INTO friend VALUES(111111132,111111123);
INSERT INTO friend VALUES(111111133,111111127);
INSERT INTO friend VALUES(111111134,111111129);
INSERT INTO friend VALUES(111111135,111111118);

INSERT INTO friend VALUES(111111166,111111121);
INSERT INTO friend VALUES(111111167,111111123);
INSERT INTO friend VALUES(111111168,111111127);
INSERT INTO friend VALUES(111111169,111111129);
INSERT INTO friend VALUES(111111170,111111118);

/* Load data in table shoppingcart */
INSERT INTO shoppingcart VALUES(1, 2740.36, 2,111111157,'2016-12-11 00:00:00');
INSERT INTO shoppingcart VALUES(2, 4720.32, 4,111111157,'2016-11-11 00:00:00');

INSERT INTO shoppingcart VALUES(3, 5740.36, 2,111111156,'2016-10-11 00:00:00');
INSERT INTO shoppingcart VALUES(4, 4220.32, 4,111111158,'2016-09-11 00:00:00');
INSERT INTO shoppingcart VALUES(5, 2110.36, 2,111111158,'2016-05-11 00:00:00');
INSERT INTO shoppingcart VALUES(6, 1110.32, 4,111111157,'2016-11-11 00:00:00');

/* Load data in table buyer */
INSERT INTO buyer VALUES(111111136, 0, 1);
INSERT INTO buyer VALUES(111111137, 0, 2);
INSERT INTO buyer VALUES(111111138, 1, 1);
INSERT INTO buyer VALUES(111111139, 1, 2);
INSERT INTO buyer VALUES(111111140, 0, 1);

INSERT INTO buyer VALUES(111111171, 0, 1);
INSERT INTO buyer VALUES(111111172, 0, 2);
INSERT INTO buyer VALUES(111111173, 1, 1);
INSERT INTO buyer VALUES(111111174, 1, 2);
INSERT INTO buyer VALUES(111111175, 0, 1);

/* Load data in table tax_document */
INSERT INTO tax_document VALUES(1, 111111132);
INSERT INTO tax_document VALUES(2, 111111133);

INSERT INTO tax_document VALUES(3, 111111166);
INSERT INTO tax_document VALUES(4, 111111167);
INSERT INTO tax_document VALUES(5, 111111168);
INSERT INTO tax_document VALUES(6, 111111158);
INSERT INTO tax_document VALUES(7, 111111159);
INSERT INTO tax_document VALUES(8, 111111160);


/* Load data in table category */
INSERT INTO category VALUES(1, 'Formal');
INSERT INTO category VALUES(2, 'Semi-Formal');
INSERT INTO category VALUES(3, 'Part Wear');
INSERT INTO category VALUES(4, 'Casuals');
INSERT INTO category VALUES(5, 'Bedtime');

INSERT INTO category VALUES(6, 'Jerkin');
INSERT INTO category VALUES(7, 'Blazers');
INSERT INTO category VALUES(8, 'partyweat');
INSERT INTO category VALUES(9, 'sweatshirts');
INSERT INTO category VALUES(10, 'shorts');

/* Load data in table item */
INSERT INTO item VALUES(1, 111111132, 111111111, 1 , 'Blue', 'Good', 300, 'L.V.', 'XL', 'Just worn twice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 0, 0, 280, 280, 'Male', 1, "/acid.png");
INSERT INTO item VALUES(2, 111111132, 111111112, 1 , 'Red', 'Good', 350, 'Gap', 'L', 'Just worn thrice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 1, 0, 330, 330, 'Male', 1, "/penta.png");
INSERT INTO item VALUES(3, 111111132, 111111112, 1 , 'Violet', 'Good', 350, 'Gap', 'L', 'Just worn thrice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 1, 0, 330, 330, 'Male', 1, "/penta.png");
INSERT INTO item VALUES(4, 111111133, 111111114, 2 , 'Green', 'Good', 450, 'Gap.', 'M', 'Just worn four times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 1, 0, 430, 430, 'Male', 1, "/newa.png");
INSERT INTO item VALUES(5, 111111133, 111111115, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, "/nawaste.png");

INSERT INTO item VALUES(6, 111111156, 111111115, 1 , 'Blue', 'Good', 300, 'L.V.', 'XL', 'Just worn twice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 0, 0, 280, 280, 'Male', 1, "/acid.png");
INSERT INTO item VALUES(7, 111111157, 111111115, 1 , 'Red', 'Good', 350, 'Gap', 'L', 'Just worn thrice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 1, 0, 330, 330, 'Male', 1, "/penta.png");
INSERT INTO item VALUES(8, 111111158, 111111144, 1 , 'Violet', 'Good', 350, 'Gap', 'L', 'Just worn thrice', STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('31-10-2016', '%d-%m-%Y'), 1, 0, 330, 330, 'Male', 1, "/penta.png");
INSERT INTO item VALUES(9, 111111158, 111111144, 2 , 'Green', 'Good', 450, 'Gap.', 'M', 'Just worn four times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 1, 0, 430, 430, 'Male', 1, "/newa.png");
INSERT INTO item VALUES(10, 111111159, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, "/nawaste.png");

INSERT INTO item VALUES(11, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(12, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(13, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(14, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(15, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(16, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(17, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(18, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(19, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(20, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(21, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(22, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(23, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(24, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(25, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(26, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(27, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(28, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(29, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(30, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(31, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(32, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(33, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(34, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(35, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(36, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(37, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(38, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(39, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(40, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(41, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(42, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(43, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(44, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(45, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(46, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(47, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(48, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(49, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(50, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(51, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(52, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(53, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(54, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(55, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(56, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(57, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(58, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(59, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(60, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(61, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(62, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(63, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(64, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(65, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(66, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(67, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(68, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(69, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(70, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(71, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(72, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(73, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(74, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(75, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(76, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(77, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(78, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(79, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(80, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(81, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(82, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(83, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(84, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(85, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(86, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(87, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(88, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(89, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(90, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(91, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(92, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(93, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(94, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(95, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-9-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(96, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(97, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-6-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(98, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-4-2016', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');
INSERT INTO item VALUES(99, 111111156, 111111143, 2 , 'Red', 'Good', 500, 'Tommy Hill', 'S', 'Just worn fie times', STR_TO_DATE('28-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2015', '%d-%m-%Y'), 0, 0, 480, 480, 'Male', 1, '/nawaste.png');


/* Load data in table item_category */
INSERT INTO item_category VALUES(1, 1);
INSERT INTO item_category VALUES(2, 2);
INSERT INTO item_category VALUES(1, 3);
INSERT INTO item_category VALUES(2, 4);
INSERT INTO item_category VALUES(3, 1);
INSERT INTO item_category VALUES(5, 4);
INSERT INTO item_category VALUES(3, 3);
INSERT INTO item_category VALUES(4, 2);
INSERT INTO item_category VALUES(2, 3);
INSERT INTO item_category VALUES(5, 1);

INSERT INTO item_category VALUES(6, 1);
INSERT INTO item_category VALUES(6, 2);
INSERT INTO item_category VALUES(7, 3);
INSERT INTO item_category VALUES(7, 4);
INSERT INTO item_category VALUES(8, 1);
INSERT INTO item_category VALUES(8, 4);
INSERT INTO item_category VALUES(9, 3);
INSERT INTO item_category VALUES(9, 2);
INSERT INTO item_category VALUES(10, 3);
INSERT INTO item_category VALUES(10, 1);

/* Load data in table invoice */
INSERT INTO invoice VALUES(1, 1, 760.00, 'Credit Card', 'Shipped');
INSERT INTO invoice VALUES(2, 1, 380.00, 'Credit Card', 'Shipped');

INSERT INTO invoice VALUES(3, 2, 22.00, 'Debit Card', 'Shipped');
INSERT INTO invoice VALUES(4, 2, 223.00, 'Credit Card', 'Shipped');
INSERT INTO invoice VALUES(5, 3, 555.00, 'Credit Card', 'Shipped');
INSERT INTO invoice VALUES(6, 3, 380.00, 'Credit Card', 'Shipped');
INSERT INTO invoice VALUES(7, 4, 874.00, 'Credit Card', 'Shipped');
INSERT INTO invoice VALUES(8, 4, 222.00, 'Credit Card', 'Shipped');

/* Load data in table shoppingcart_item */
INSERT INTO shoppingcart_item VALUES(1, 1);
INSERT INTO shoppingcart_item VALUES(1, 5);
INSERT INTO shoppingcart_item VALUES(2, 5);

INSERT INTO shoppingcart_item VALUES(3, 1);
INSERT INTO shoppingcart_item VALUES(3, 5);
INSERT INTO shoppingcart_item VALUES(4, 6);
INSERT INTO shoppingcart_item VALUES(4, 2);
INSERT INTO shoppingcart_item VALUES(5, 4);
INSERT INTO shoppingcart_item VALUES(5, 3);

/******************************************************************** VIEWS **************************************************************************

1. View that contains all un-sold items.
2. View that contains all sold items.

*****************************************************************************************************************************************************/

/**************************************************************** SAMPLE VIEWS **********************************************************************/
/*VIEW 1 */
CREATE VIEW itemSold AS
SELECT *
FROM Item
WHERE Sold_Indicator = 1;

/*VIEW 2 */
CREATE VIEW itemNotSold AS
SELECT *
FROM Item
WHERE Sold_Indicator = 0;

/************************************************************* STORED PROCEDURES *********************************************************************
The following are advanced stored procedures[other that inserting and deleting data] which are useful:-

1. Get a list of top donators according to the total cost of the items donated every month(Bronze Coupon)/ 6-months(Silver Coupon)/ year(Gold Coupon).
2. Get all items which are on reduced price, ordered by price in increasing order and send a list of top 20 items to the user in newsletter.
3. Procedure called on monthly basis to find the profit earned by the clothing store for donation taking into consideration the reduction.
4. Procedure called to find the items donated in a month based on a category of interest to the customer /previous purchases of the customer.
5. Procedure called to get the users who have added items to the cart and the items have been added for more than 2 days.
6. Procedure to determine the top performer of a month - done

*****************************************************************************************************************************************************/

/******************************************************** SAMPLE STORED PROCEDURE CODE **************************************************************/
/* Un-Comment to Use

/*PROCEDURE 1 */
DELIMITER $$
USE catsawaba $$
CREATE PROCEDURE Get_top_10_Donators(IN timeLimit INT)  /* give timeLimit as number of months */
    BEGIN
        SELECT Donater_id, SUM(Value) AS AmtOfDonations FROM item
        WHERE Date_Acquired > DATE_SUB(now(), INTERVAL timeLimit MONTH)
        GROUP BY Donater_id
        ORDER BY AmtOfDonations DESC
        LIMIT 10;
    END; $$
DELIMITER ;

/*PROCEDURE 2 */
DELIMITER $$
USE catsawaba $$
CREATE PROCEDURE Get_reduced_Items()
    BEGIN
        SELECT Item_id, Color, Brand, Size, Description, Value FROM item
        WHERE Reduction = 1 AND Sold_Indicator = 0
        ORDER BY Value ASC
        LIMIT 20;
    END; $$
DELIMITER ;

/*PROCEDURE 3 */
DELIMITER $$
USE catsawaba $$
CREATE PROCEDURE Get_top_10_Donators(IN timeLimit INT)  /* give timeLimit as number of days */
    BEGIN
        SELECT SUM(Selling_Price) AS TotalProfit FROM item
        WHERE Date_Acquired > DATE_SUB(now(), INTERVAL timeLimit DAY) AND Sold_Indicator = 1
        LIMIT 10;
    END; $$
DELIMITER ;


/*Procedure 4*/
DELIMITER $$
USE catsawaba $$
Create Procedure userSuggestions(in ssn int)
BEGIN
	select distinct itm.item_id, itm.brand, itm.size, itm.description, itm.Condition, itm.asking_price from item itm, item_category itc where itm.item_id=itc.item_id and itc.category_id in (select distinct(ic.category_id) from invoice i,shoppingcart s,shoppingcart_item si,item it,category c,item_category ic where s.ssn=ssn and i.Cart_id=s.Cart_id and si.Item_id = ic.Item_id) and Sold_Indicator=0;
END;$$
DELIMITER ;

/*Procedure 5*/
DELIMITER $$
USE catsawaba $$
CREATE PROCEDURE getUncheckedCartDetails()         
BEGIN 
 SELECT 
    s.cart_id, s.ssn, p.First_name, p.Last_name, p.Email,i.Description,i.Brand,i.Color,i.Condition
FROM
    shoppingcart s,
    person p,
    shoppingcart_item si,
    item i
WHERE
    s.added_time < DATE_SUB(NOW(), INTERVAL 2 DAY)
        AND s.Cart_id NOT IN (SELECT 
            i.Cart_id
        FROM
            invoice i)
        AND s.ssn = p.SSN
        AND si.cart_id=s.cart_id
        AND si.Item_id=i.Item_id;
END; $$
DELIMITER ;


/*PROCEDURE 6*/
DELIMITER $$
USE catsawaba $$
CREATE PROCEDURE Get_top_performers(IN timeLimit INT)  /* give timeLimit as number of days */
    BEGIN
        select SSN,First_name,Last_name,Address,Phone_number,Email from person where ssn in (SELECT staff_id FROM item i where
         Date_Posted < DATE_SUB(now(), INTERVAL timeLimit DAY) group by Staff_id order by count(*) desc ) limit 1;
    END; $$
DELIMITER ;

/**************************************************************************************************************************************************/

/***************************************************************** TRIGGERS | EVENTS ************************************************************************

1. Update total for each cart when Item is added or deleted.
2. Remove the items from the cart if it is in a cart for more than two days.
3. Reduce the price of the items marked for reduction at the beginning of every month.

*****************************************************************************************************************************************************/

/************************************************************** SAMPLE TRIGGERS *********************************************************************/
/* Un-Comment to Use

/*Trigger 1 */
DELIMITER $$
USE catsawaba $$
CREATE trigger totalUpdateInsert
after insert on shoppingcart_item
for each row
    BEGIN
        UPDATE shoppingcart
        SET Total_cost = Total_cost + (SELECT Selling_Price FROM item where Item_id = new.Item_id)
        WHERE Cart.id = new.Cart_id;
    END; $$
CREATE trigger totalUpdateDelete
after delete on shoppingcart_item
for each row
    BEGIN
        UPDATE shoppingcart
        SET Total_cost = Total_cost + (SELECT Selling_Price FROM item where Item_id = old.Item_id)
        WHERE Cart.id = old.Cart_id;
    END; $$
DELIMITER ;

/*Event 2 */
DELIMITER $$

CREATE 
	EVENT `refresh_cart` 
	ON SCHEDULE EVERY 1 HOUR STARTS '2016-12-03 06:00:00' 
	DO BEGIN
	
		DELETE FROM shoppingcart_item WHERE added_time < DATE_SUB(NOW(), INTERVAL 24 HOUR);
	    
	END */$$

DELIMITER ;

/*Event 3 */
DELIMITER $$

CREATE 
	EVENT `reduce_Price` 
	ON SCHEDULE EVERY 1 HOUR STARTS '2016-12-03 06:00:00' 
	DO BEGIN
	
		UPDATE item
		SET Selling_Price = 0.5 * Selling_Price
		WHERE Sold_Indicator = 0 AND Sold_Indicator = 0 AND Date_Posted > DATE_SUB(NOW(), INTERVAL 15 DAY);
	    
	END */$$

DELIMITER ;

/**************************************************************************************************************************************************/


/* SAMPLE TRANSACTION

START TRANSACTION;

SELECT * FROM item;
SELECT * FROM shoppingcart_item;

UPDATE item SET Sold_Indicator=1 WHERE Item_id IN (SELECT Item_id from shoppingcart_item WHERE Cart_id=1);

DELETE FROM shoppingcart_item WHERE Item_id IN (SELECT Item_id FROM (SELECT Item_id from shoppingcart_item WHERE Cart_id=1) AS c);


SELECT * FROM item;
SELECT * FROM shoppingcart_item;
ROLLBACK;

*/
