-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2023 at 01:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `contact`, `address`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Ahmad', '08214', 'Kediri coy', 'ahmad', 'c4ca4238a0b923820dcc509a6f75849b', '2022-11-09 04:14:01', '2022-11-11 07:14:58'),
(8, 'Atharafi', '0811', 'Pagak', 'atharafi', 'c4ca4238a0b923820dcc509a6f75849b', '2022-11-11 07:13:28', '2022-11-11 07:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `author`, `publisher`, `category`, `stock`, `cover`, `createdAt`, `updatedAt`) VALUES
(6, '222', 'Alfin And The Tupai', 'Reyhan', 'Ahmad', 'Comedy', 1, 'cover-1668474362873.jpg', '2022-11-15 00:51:09', '2022-11-15 01:06:02'),
(7, '366', 'Alfin And Ahmad Love Story', 'Ahmad', 'Arlando', 'Anime', 1, 'cover-1668474277075.jpg', '2022-11-15 01:04:37', '2022-11-15 01:04:37'),
(8, '366', 'Tes', 'Ahmad', 'Arlando', 'Anime', 1, 'cover-1668495911661.jpg', '2022-11-15 07:05:11', '2022-11-15 07:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `id` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `date_of_borrow` datetime DEFAULT NULL,
  `date_of_return` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`id`, `memberID`, `adminID`, `date_of_borrow`, `date_of_return`, `status`, `createdAt`, `updatedAt`) VALUES
(13, 1, 1, '2022-05-05 00:00:00', '2022-11-16 00:00:00', 1, '2022-11-16 01:12:25', '2022-11-16 01:26:08'),
(14, 1, 1, '2022-05-05 00:00:00', NULL, 0, '2022-11-16 01:14:55', '2022-11-16 01:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `details_of_borrows`
--

CREATE TABLE `details_of_borrows` (
  `id` int(11) NOT NULL,
  `borrowID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `details_of_borrows`
--

INSERT INTO `details_of_borrows` (`id`, `borrowID`, `bookID`, `qty`, `createdAt`, `updatedAt`) VALUES
(2, 13, 6, 2, '2022-11-16 01:12:25', '2022-11-16 01:12:25'),
(3, 14, 7, 2, '2022-11-16 01:14:55', '2022-11-16 01:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `profilM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `gender`, `contact`, `address`, `createdAt`, `updatedAt`, `profilM`) VALUES
(1, 'naufal fakhri', 'laki-laki', '0821', 'sawojajar', '2022-11-08 03:21:41', '2022-11-08 12:12:01', NULL),
(5, 'zidane', 'laki-laki', '0821', 'sawojajar', '2022-11-09 02:29:40', '2022-11-09 02:29:40', NULL),
(6, 'reyhan', 'laki-laki', '0821', 'sawojajar', '2022-11-09 02:37:13', '2022-11-09 02:37:13', NULL),
(7, 'Naufal', 'Laki-laki', '999', 'malang', '2022-11-15 07:34:04', '2022-11-15 07:34:04', NULL),
(8, 'tes', 'Laki-laki', '011', 'malang', '2022-11-16 23:14:08', '2022-11-16 23:14:08', 'cover-1668640448420.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20221103132138-create-book.js'),
('20221103132847-create-member.js'),
('20221103133239-create-admin.js'),
('20221103133700-create-borrow.js'),
('20221103134353-create-details-of-borrow.js'),
('20221115133104-member.js'),
('20221116230342-member.js');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrowID` (`borrowID`),
  ADD KEY `bookID` (`bookID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admins` (`id`);

--
-- Constraints for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  ADD CONSTRAINT `details_of_borrows_ibfk_1` FOREIGN KEY (`borrowID`) REFERENCES `borrows` (`id`),
  ADD CONSTRAINT `details_of_borrows_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
