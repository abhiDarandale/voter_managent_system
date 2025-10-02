-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306:3306
-- Generation Time: Nov 30, 2023 at 01:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `user1`
--

CREATE TABLE `user1` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `cpassword` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user1`
--

INSERT INTO `user1` (`id`, `name`, `mobile`, `password`, `cpassword`, `address`, `photo`, `role`, `status`, `votes`) VALUES
(1, 'Mahesh Babu', 9988776655, '123', '123', 'Benglur', 'mahesh.jpg', 1, 1, 0),
(2, 'Raja', 0, '', '', '', '', 1, 0, 0),
(3, 'Rajanikant', 5967995533, '123', '123', '', 'rajani.jpg', 1, 1, 0),
(4, 'Rajkumar', 9876347322, '123', '123', 'chennai', 'rajkumar.jpg', 1, 1, 0),
(5, 'Aam Adami', 9857983311, '123', '123', 'Delhi', 'aam.jpg', 2, 0, 7),
(6, 'Congress', 9955443321, '123', '123', 'Lakhanau', 'congress.png', 2, 0, 8),
(7, 'Tina', 9863254622, '123', '123', 'Ahmednagar', 'tina.jpg', 1, 1, 0),
(8, 'MIna', 9966332210, '123', '123', 'pune', 'mina.jpg', 1, 1, 0),
(9, 'Jaclina', 9717663311, '123', '123', 'shirur', 'jaclin.jpg', 1, 0, 0),
(10, 'Alyx star', 9955332277, '123', '123', 'beed', 'alyxstar.jpg', 1, 1, 0),
(11, 'Dani Daniels', 7766883344, '123', '123', 'shevgaon', 'danidaniel.jpg', 1, 1, 0),
(12, 'Gopinath Munde', 9944110021, '123', '123', 'Parali', 'gopinath.jpg', 1, 1, 0),
(13, 'Himesh Reshmiya', 9966228810, '123', '123', 'Aamrutsar', 'himesh.jpg', 1, 1, 0),
(14, 'Hindustani bhau', 9921222200, '123', '123', 'Jhodhapur', 'hindustani.jpg', 1, 1, 0),
(15, 'Mia Maloka', 9900880022, '123', '123', 'Nashik', 'mia_maloka.jpg', 1, 1, 0),
(16, 'August Ames', 9900000022, '123', '123', 'Nagpur', 'august_ames.jpg', 1, 1, 0),
(17, 'Virat Kohali', 9911223344, '123', '123', 'Thane', 'virat.jpg', 1, 1, 0),
(18, 'MS Dhoni', 9934315364, '123', '123', 'Ranchi', 'dhoni.jpg', 1, 1, 0),
(19, 'Smruti Mandhana', 9911223311, '123', '123', 'mohali', 'smruti.jpg', 1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user1`
--
ALTER TABLE `user1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote_records`
--

CREATE TABLE `vote_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `vote_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voter_id` (`voter_id`),
  KEY `party_id` (`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'admin',
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `email`, `role`, `status`) VALUES
(1, 'admin', 'admin123', 'admin@votingsystem.com', 'admin', 1);

--
-- Insert sample parties data
--

INSERT INTO `parties` (`id`, `name`, `symbol`, `photo`, `description`, `created_by`, `status`) VALUES
(1, 'BJP', 'Lotus', 'bjp.png', 'Bharatiya Janata Party', 1, 1),
(2, 'Congress', 'Hand', 'congress.png', 'Indian National Congress', 1, 1),
(3, 'Shiv Sena', 'Bow and Arrow', 'shivsena.png', 'Shiv Sena Party', 1, 1);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
