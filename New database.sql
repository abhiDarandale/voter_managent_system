-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2025 at 09:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

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
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'admin',
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `email`, `role`, `status`, `created_at`) VALUES
(1, 'admin', 'admin123', 'admin@votingsystem.com', 'admin', 1, '2025-10-01 17:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `symbol`, `photo`, `created_by`, `status`, `created_at`) VALUES
(1, 'Bjp', 'Lotus', 'bjp.png', 1, 1, '2025-10-01 18:49:42'),
(2, 'Manase', 'Railway Engine', 'Manase.jpg', 1, 1, '2025-10-01 18:50:19'),
(3, 'shivsena', 'bow and arrow', 'shivsena.jpg', 1, 1, '2025-10-01 18:51:45');

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
(1, 'Abhishek Rambhau Darandale', 8788303325, '8788', '8788', 'Sonai', '1759344789_My imagaes.jpg', 1, 1, 0),
(2, 'Sushant Kailas Jarhad', 1234567890, '12345', '12345', 'Bhalavani', '1759345320_My imagaes.jpg', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vote_records`
--

CREATE TABLE `vote_records` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `vote_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vote_records`
--

INSERT INTO `vote_records` (`id`, `voter_id`, `party_id`, `vote_time`, `ip_address`) VALUES
(1, 1, 1, '2025-10-01 18:54:07', '::1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_records`
--
ALTER TABLE `vote_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `party_id` (`party_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user1`
--
ALTER TABLE `user1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vote_records`
--
ALTER TABLE `vote_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
