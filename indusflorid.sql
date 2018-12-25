-- Dropping database indusflorid if exists
DROP DATABASE IF EXISTS `indusflorid`;

-- Creating database indusflorid
CREATE DATABASE `indusflorid`;

-- Use database indusflorid
USE `indusflorid`;

-- Dropping table authors if exists
DROP TABLE IF EXISTS `authors`;


-- Creating table authors
CREATE TABLE `authors` (
	`AuthorNo` int(10) NOT NULL,
	`FirstName` varchar(30) NOT NULL,
	`LastName` varchar(30) NOT NULL,
	`Address1` varchar(50) DEFAULT NULL,
	`Address2` varchar(50) DEFAULT NULL,
	`CityState` varchar(50) DEFAULT NULL,
	`PinCode` varchar(20) DEFAULT NULL,
	`Country` varchar(30) DEFAULT NULL,
	`Degree` varchar(30) DEFAULT NULL,
	`EmailAddress` varchar(50) NOT NULL,
	`Photograph` longblob,
	`Speciality` varchar(4000) NOT NULL,
	`DOB` date NOT NULL,
	`Status` varchar(20) DEFAULT 'Active',
	PRIMARY KEY ( `AuthorNo` ),
	UNIQUE KEY `EmailAddress` (`EmailAddress`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;
	
	
	
	
	

-- Dropping table publishers if exists
DROP TABLE IF EXISTS `publishers`;

-- Creating table publishers
CREATE TABLE `publishers` (
	`PublisherNo` int(10) NOT NULL,
	`PublisherName` varchar(50) NOT NULL,
	`Address1` varchar(50) DEFAULT NULL,
	`Address2` varchar(50) DEFAULT NULL,
	`CityState` varchar(50) DEFAULT NULL,
	`PinCode` varchar(20) DEFAULT NULL,
	`Country` varchar(30) DEFAULT NULL,
	`EmailAddress` varchar(50) NOT NULL,
	`Status` varchar(20) DEFAULT 'Active',
	PRIMARY KEY (`PublisherNo`),
	UNIQUE KEY `PublisherName` (`PublisherName`),
	UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






-- Dropping table categories if exists
DROP TABLE IF EXISTS `categories`;


-- Creating table categories
CREATE TABLE `categories` (
	`CategoryNo` int(10) NOT NULL,
	`Category` varchar(30) NOT NULL,
	`Description` varchar(4000) NOT NULL,
	PRIMARY KEY (`CategoryNo`),
	UNIQUE KEY `Category` (`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





	
	
	
	
-- Dropping table books if it exists
DROP TABLE IF EXISTS `books`;

-- Creating table books
CREATE TABLE `books` (
	`BookNo` int(10) NOT NULL,
	`BookName` varchar(255) NOT NULL,
	`Author1No` int(10) NOT NULL,
	`Author2No` int(10) DEFAULT NULL,
	`Author3No` int(10) DEFAULT NULL,
	`Author4No` int(10) DEFAULT NULL,
	`PublisherNo` int(10) NOT NULL,
	`CategoryNo` int(10) NOT NULL,
	`CoverPage` longblob,
	`ISBN` varchar(20) NOT NULL,
	`Edition` varchar(20) NOT NULL,
	`Year` int(4) NOT NULL,
	`Cost` int(12) NOT NULL,
	`Synopsis` varchar(4000) NOT NULL,
	`AboutAuthors` varchar(4000) NOT NULL,
	`TopicsCovered` varchar(4000) NOT NULL,
	`ContentsCDROM` varchar(4000) NOT NULL,
	`TOC` longblob,
	`SampleChapter` longblob,
	`Hits` int(11) DEFAULT 0,
	PRIMARY KEY (`BookNo`),
	UNIQUE KEY `ISBN` (`ISBN`),
	KEY `fk_Author1No` (`Author1No`),
	KEY `fk_Author2No` (`Author2No`),
	KEY `fk_Author3No` (`Author3No`),
	KEY `fk_Author4No` (`Author4No`),	
	KEY `fk_CategoryNo` (`CategoryNo`),
	KEY `fk_PublisherNo` (`PublisherNo`),
	CONSTRAINT `fk_Author1No` FOREIGN KEY (`Author1No`) REFERENCES `authors` (`AuthorNo`),
	CONSTRAINT `fk_Author2No` FOREIGN KEY (`Author2No`) REFERENCES `authors` (`AuthorNo`),
	CONSTRAINT `fk_Author3No` FOREIGN KEY (`Author3No`) REFERENCES `authors` (`AuthorNo`),
	CONSTRAINT `fk_Author4No` FOREIGN KEY (`Author4No`) REFERENCES `authors` (`AuthorNo`),
	CONSTRAINT `fk_CategoryNo` FOREIGN KEY (`CategoryNo`) REFERENCES `categories` (`CategoryNo`),
	CONSTRAINT `fk_PublisherNo` FOREIGN KEY (`PublisherNo`) REFERENCES publishers (`PublisherNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;







-- Drop table citystate if exists
DROP TABLE IF EXISTS `citystate`;

-- Creating table citystate
CREATE TABLE `citystate` (
	`CityStateNo` int(10) NOT NULL DEFAULT 0,
	`State` varchar(50) NOT NULL,
	`City` varchar(50) NOT NULL,
	PRIMARY KEY (`CityStateNo`),
	UNIQUE KEY `City` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Drop table countries if exists
DROP TABLE IF EXISTS `countries`;

-- Creating table countries
CREATE TABLE `countries` (
	`CountryNo` int(10) NOT NULL DEFAULT 0,
	`Country` varchar(50) NOT NULL,
	PRIMARY KEY (`CountryNo`),
	UNIQUE KEY `Country` (`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Drop table customers if exists
DROP TABLE IF EXISTS `customers`;

-- Creating table customers
CREATE TABLE `customers` (
	`CustomerNo` int(10) NOT NULL,
	`Username` varchar(30) NOT NULL,
	`Password` varchar(30) NOT NULL,
	`EmailAddress` varchar(50) NOT NULL,
	`FirstName` varchar(30) NOT NULL,
	`LastName` varchar(30) NOT NULL,
	`Address1` varchar(50) DEFAULT NULL,
	`Address2` varchar(50) DEFAULT NULL,
	`CityState` varchar(30) DEFAULT NULL,
	`PinCode` varchar(20) DEFAULT NULL,
	`Country` varchar(30) DEFAULT NULL,
	`DOB` date NOT NULL,
	`Anniversary` date DEFAULT NULL,
	`NewRelease` varchar(30) DEFAULT NULL,
	`BookUpdates` varchar(30) DEFAULT NULL,
	`Status` varchar(30) NOT NULL DEFAULT 'Active',
	`LastLogin` varchar(25) DEFAULT NULL,
	`LastIP` varchar(25) DEFAULT NULL,
	PRIMARY KEY (`CustomerNo`),
	UNIQUE KEY `Username` (`Username`),
	UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Dropping table newsletter if exists
DROP TABLE IF EXISTS `newsletter`;

-- Creating table newsletter
CREATE TABLE `newsletter` (
	`NewsletterNo` int(10) DEFAULT NULL,
	`Name` varchar(100) DEFAULT NULL,
	`Content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Dropping table popularsearches if exists
DROP TABLE IF EXISTS `popularsearches`;

-- Creating table popularsearches
CREATE TABLE `popularsearches` (
	`SearchNo` int(10) NOT NULL,
	`Criteria` varchar(10) DEFAULT NULL,
	`Value` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`SearchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- Dropping table systemusers if exists
DROP TABLE IF EXISTS `systemusers`;

-- Creating table systemusers
CREATE TABLE `systemusers` (
	`UserNo` int(10) NOT NULL,
	`Username` varchar(30) NOT NULL,
	`Password` varchar(30) NOT NULL,
	`EmailAddress` varchar(50) NOT NULL,
	`FirstName` varchar(30) NOT NULL,
	`LastName` varchar(30) NOT NULL,
	`ManageCountries` varchar(10) DEFAULT NULL,
	`ManageCityState` varchar(10) DEFAULT NULL,
	`ManageAuthors` varchar(10) DEFAULT NULL,
	`ManagePublishers` varchar(10) DEFAULT NULL,
	`ManageCategories` varchar(10) DEFAULT NULL,
	`ManageUsers` varchar(10) DEFAULT NULL,
	`ManageBooks` varchar(10) DEFAULT NULL,
	`ManageCustomers` varchar(10) DEFAULT NULL,
	`ManageTransactions` varchar(10) DEFAULT NULL,
	`ManageNewsletter` varchar(10) DEFAULT NULL,
	`Status` varchar(20) DEFAULT 'Active',
	`LastLogin` date DEFAULT NULL,
	PRIMARY KEY (`UserNo`),
	UNIQUE KEY `Username` (`Username`),
	UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Dropping table transactionmaster if exists
DROP TABLE IF EXISTS `transactionmaster`;

-- Creating table transactionmaster
CREATE TABLE `transactionmaster` (
	`TransactionNo` int(10) NOT NULL,
	`TransactionDate` date NOT NULL,
	`Username` varchar(25) NOT NULL,
	`Amount` int(12) NOT NULL DEFAULT 0,
	`PaymentStatus` varchar(50) NOT NULL DEFAULT 'Pending',
	`DeliveryStatus` varchar(50) NOT NULL DEFAULT 'Pending',
	PRIMARY KEY (`TransactionNo`),
	KEY Username (`Username`),
	CONSTRAINT `transactionmaster_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `customers` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Dropping table transactiondetails if exists
DROP TABLE IF EXISTS `transactiondetails`;

-- Creating table transactiondetails
CREATE TABLE `transactiondetails` (
	`TransactionNo` int(10) NOT NULL,
	`BookName` varchar(255) NOT NULL,
	`Cost` int(12) NOT NULL,
	`Qty` int(5) NOT NULL,
	KEY `TransactionNo` (`TransactionNo`),
	CONSTRAINT `transactiondetails_ibfk_1` FOREIGN KEY (`TransactionNo`) REFERENCES `transactionmaster` (`TransactionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;