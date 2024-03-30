-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql107.infinityfree.com
-- Generation Time: Mar 30, 2024 at 01:04 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyip`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'Dayton', 'Josee101');

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `investment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `investment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `plan_id` int(11) DEFAULT NULL,
  `plan_name` varchar(255) NOT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `duration_days` int(11) NOT NULL,
  `ending_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `payout` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`investment_id`, `user_id`, `amount`, `investment_date`, `plan_id`, `plan_name`, `interest_rate`, `duration_days`, `ending_date`, `payout`) VALUES
(14, 2, '500.00', '2023-12-23 20:08:58', 2, 'Silver Plan', '3.00', 30, '2024-01-22 20:08:58', '1667.17'),
(15, 2, '500.00', '2024-01-09 07:12:02', 2, 'Silver Plan', '3.00', 30, '2024-02-08 07:12:02', '1667.17');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `duration_days` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`plan_id`, `plan_name`, `interest_rate`, `duration_days`, `amount`) VALUES
(7, 'Silver', '90.00', 30, 15);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `winning_sector` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('deposit','withdraw','profit') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'active',
  `withdrawal_method` varchar(255) DEFAULT NULL,
  `paypal_email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `deposit_method` varchar(255) DEFAULT NULL,
  `ResultCode` varchar(500) NOT NULL,
  `CheckoutRequestID` varchar(500) NOT NULL,
  `MpesaReceiptNumber` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `amount`, `transaction_type`, `transaction_date`, `status`, `withdrawal_method`, `paypal_email`, `contact_number`, `plan_id`, `deposit_method`, `ResultCode`, `CheckoutRequestID`, `MpesaReceiptNumber`) VALUES
(2, 2, '1200.00', 'deposit', '2023-12-23 08:21:10', 'completed', 'mpesa', '', '0702185047', NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone_number` int(11) NOT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `referrer_id` int(11) DEFAULT NULL,
  `home_country` varchar(11) NOT NULL,
  `referral_earnings` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `balance`, `registration_date`, `phone_number`, `referral_code`, `referrer_id`, `home_country`, `referral_earnings`) VALUES
(1, 'free', '$2y$10$b91Sh0kZI5A5Xu3UChmP0e/sPFxvGVNlCoD/oVVs.EdYeDnvIdb7m', 'joegatimu200@gmail.com', '0.00', '2023-12-20 08:48:08', 702185047, 'REF7c5f321c', 2, '', '0.00'),
(2, 'frey', '$2y$10$mywO9HiJV6mWqdWGGywGUuCTnZd5GY3lw4GfVXN3hHUoAF5RkQ0ou', 'joegatimu20@gmail.com', '0.00', '2023-12-20 09:14:46', 701541335, 'REF6c5be381', NULL, '', '0.00'),
(11, 'mary', '$2y$10$a3lryIDH0y3U1u69mQQ12uO4YLeAsvD0HKdQgWHJvQsOXNUw8Y.6e', 'marym@gmail.com', '0.00', '2023-12-20 12:47:04', 702345678, NULL, 1, 'AF', '0.00'),
(12, 'freeme', '$2y$10$zOBywDyrPIg7708Y72lvYuxSB96etigDFwPgPef5Brgji8RAmh6Ca', 'freeme@gmail.com', '0.00', '2023-12-20 12:53:59', 702345678, '872634ec', NULL, 'AF', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `user_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `investment_id` int(11) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`investment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD KEY `investment_id` (`investment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `investment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD CONSTRAINT `user_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_plans_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
