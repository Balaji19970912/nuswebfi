-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2022 at 02:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nusneww`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientcompanydata`
--

CREATE TABLE `clientcompanydata` (
  `id` int(11) NOT NULL,
  `parentcompany` varchar(255) NOT NULL,
  `clientcompany` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientcompanydata`
--

INSERT INTO `clientcompanydata` (`id`, `parentcompany`, `clientcompany`, `country`) VALUES
(3, 'Qualesce', 'NUS Consulting Group', 'India'),
(4, 'Qualesce', 'Ji Solutions', 'Canada'),
(5, 'Ji Inc', 'Ji Trips', 'United Arab');

-- --------------------------------------------------------

--
-- Table structure for table `nususerdata`
--

CREATE TABLE `nususerdata` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `accountstatus` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `parentcompany` varchar(100) NOT NULL,
  `businessunit` varchar(255) NOT NULL,
  `active` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nususerdata`
--

INSERT INTO `nususerdata` (`id`, `role`, `username`, `emailId`, `accountstatus`, `password`, `parentcompany`, `businessunit`, `active`) VALUES
(62, 'Admin', 'Admin', 'admin@nusconsulting.com', 'Confirmed', '$argon2i$v=19$m=65536,t=4,p=1$a085aUQyc3hKdHFSMllyQQ$bKQT8rWb/gTK6IOlavJ1BWa0mpMzrcQ9pQjfXAMBVP0', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `nus_countries`
--

CREATE TABLE `nus_countries` (
  `countryId` int(11) NOT NULL,
  `countryName` varchar(255) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_countries`
--

INSERT INTO `nus_countries` (`countryId`, `countryName`, `addedOn`) VALUES
(1, 'India', '2022-05-19 13:20:42'),
(2, 'Sri Lanka', '2022-05-19 13:20:42'),
(3, 'United Kingdom', '2022-07-20 15:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `nus_pricing_mechanisam`
--

CREATE TABLE `nus_pricing_mechanisam` (
  `priMechId` int(11) NOT NULL,
  `pricingMechName` varchar(128) NOT NULL,
  `priceMechDesc` varchar(255) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_pricing_mechanisam`
--

INSERT INTO `nus_pricing_mechanisam` (`priMechId`, `pricingMechName`, `priceMechDesc`, `addedOn`) VALUES
(1, 'Day Ahead', 'Spot Daily Market', '2022-05-23 13:07:28'),
(2, 'Day Ahead', 'Spot Average for month', '2022-05-23 13:08:14'),
(3, 'Month Ahead', 'Last Value', '2022-05-23 13:08:14'),
(4, 'Month Ahead', 'Average Value', '2022-05-23 13:09:07'),
(5, 'Quarter Ahead', 'Last Value', '2022-05-23 13:09:07'),
(6, 'Quarter Ahead', 'Average Value', '2022-05-23 13:09:46'),
(7, 'Calendar Ahead', 'Last Value', '2022-05-23 13:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `nus_supply_contract`
--

CREATE TABLE `nus_supply_contract` (
  `supplierId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `contract_id` varchar(128) NOT NULL,
  `countryName` varchar(64) NOT NULL,
  `commodityName` varchar(64) NOT NULL,
  `commodityUnits` varchar(32) NOT NULL,
  `supplyName` varchar(255) NOT NULL,
  `contractType` varchar(32) NOT NULL,
  `contractIndexId` varchar(64) NOT NULL,
  `contractTermfromDate` date NOT NULL,
  `contractTermtoDate` date NOT NULL,
  `commodityPrice` int(11) NOT NULL,
  `totalAnualConsumption` int(11) NOT NULL,
  `totlconsumption` int(11) NOT NULL,
  `allmonts` text NOT NULL,
  `contractpricetype` varchar(30) NOT NULL,
  `indexStructureType` varchar(64) NOT NULL,
  `consumMinsize` varchar(64) NOT NULL,
  `clickTrancheminsize` int(11) NOT NULL,
  `openPrizemechanism` varchar(255) NOT NULL,
  `contractstatus` varchar(16) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_supply_contract`
--

INSERT INTO `nus_supply_contract` (`supplierId`, `clientId`, `contract_id`, `countryName`, `commodityName`, `commodityUnits`, `supplyName`, `contractType`, `contractIndexId`, `contractTermfromDate`, `contractTermtoDate`, `commodityPrice`, `totalAnualConsumption`, `totlconsumption`, `allmonts`, `contractpricetype`, `indexStructureType`, `consumMinsize`, `clickTrancheminsize`, `openPrizemechanism`, `contractstatus`) VALUES
(3, 3, 'NUS-elec-3', 'India', 'electricity', '', 'SONY', 'fixed', '', '2022-01-01', '2022-12-31', 1000, 72000, 72000, '2022-1-01,2022-2-01,2022-3-01,2022-4-01,2022-5-01,2022-6-01,2022-7-01,2022-8-01,2022-9-01,2022-10-01,2022-11-01,2022-12-01', 'Euro', '', '', 0, '', 'A'),
(4, 3, 'NUS-gas-4', 'India', 'natural gas', 'MWh', 'Samsung', 'fixed', '', '2022-01-01', '2022-12-31', 12000, 120000, 120000, '2022-1-01,2022-2-01,2022-3-01,2022-4-01,2022-5-01,2022-6-01,2022-7-01,2022-8-01,2022-9-01,2022-10-01,2022-11-01,2022-12-01', 'Euro', '', '', 0, '', 'A'),
(5, 4, 'Ji-elec-5', 'Canada', 'electricity', '', 'Apple Inc', 'indexed', 'xlts', '2022-08-05', '2023-12-09', 0, 120000, 120000, '2022-8-01,2022-9-01,2022-10-01,2022-11-01,2022-12-01,2023-1-01,2023-2-01,2023-3-01,2023-4-01,2023-5-01,2023-6-01,2023-7-01,2023-8-01,2023-9-01,2023-10-01,2023-11-01,2023-12-01', 'Dollars', 'Consumption(MWh)', '', 0, 'Month Ahead,Average Value', 'A'),
(6, 5, 'Ji-elec-6', 'United Arab', 'electricity', '', 'Spice Trip', 'fixed', '', '2020-01-01', '2020-12-31', 1234, 120000, 120000, '2020-1-01,2020-2-01,2020-3-01,2020-4-01,2020-5-01,2020-6-01,2020-7-01,2020-8-01,2020-9-01,2020-10-01,2020-11-01,2020-12-01', 'Euro', '', '', 0, '', 'A'),
(7, 5, 'Ji-gas-7', 'United Arab', 'natural gas', 'MWh', 'Safe Wheels', 'indexed', 'xlts', '2022-03-01', '2022-12-31', 0, 72000, 60000, '2022-3-01,2022-4-01,2022-5-01,2022-6-01,2022-7-01,2022-8-01,2022-9-01,2022-10-01,2022-11-01,2022-12-01', 'Euro', 'Consumption(MWh)', '', 0, 'Day Ahead,Spot Average for month', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `nus_tradeperiods`
--

CREATE TABLE `nus_tradeperiods` (
  `tradePerId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `periodsId` varchar(128) NOT NULL,
  `clicktracnches` int(11) NOT NULL,
  `clicktranches` varchar(50) NOT NULL,
  `tranchesvalue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_tradeperiods`
--

INSERT INTO `nus_tradeperiods` (`tradePerId`, `supplierId`, `periodsId`, `clicktracnches`, `clicktranches`, `tranchesvalue`) VALUES
(2, 5, 'Calendar Yearly', 10, '% consumption', 7),
(3, 7, 'Calendar Yearly', 10, '% consumption', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nus_trade_periods_list`
--

CREATE TABLE `nus_trade_periods_list` (
  `tPeriodsId` int(11) NOT NULL,
  `periodsName` varchar(128) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parentcompanydata`
--

CREATE TABLE `parentcompanydata` (
  `id` int(11) NOT NULL,
  `parentcompany` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parentcompanydata`
--

INSERT INTO `parentcompanydata` (`id`, `parentcompany`) VALUES
(3, 'Qualesce'),
(4, 'Ji Inc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientcompanydata`
--
ALTER TABLE `clientcompanydata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nususerdata`
--
ALTER TABLE `nususerdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`emailId`),
  ADD UNIQUE KEY `username_2` (`username`,`emailId`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `emailId` (`emailId`);

--
-- Indexes for table `nus_countries`
--
ALTER TABLE `nus_countries`
  ADD PRIMARY KEY (`countryId`);

--
-- Indexes for table `nus_pricing_mechanisam`
--
ALTER TABLE `nus_pricing_mechanisam`
  ADD PRIMARY KEY (`priMechId`);

--
-- Indexes for table `nus_supply_contract`
--
ALTER TABLE `nus_supply_contract`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `nus_tradeperiods`
--
ALTER TABLE `nus_tradeperiods`
  ADD PRIMARY KEY (`tradePerId`);

--
-- Indexes for table `nus_trade_periods_list`
--
ALTER TABLE `nus_trade_periods_list`
  ADD PRIMARY KEY (`tPeriodsId`);

--
-- Indexes for table `parentcompanydata`
--
ALTER TABLE `parentcompanydata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientcompanydata`
--
ALTER TABLE `clientcompanydata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nususerdata`
--
ALTER TABLE `nususerdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `nus_countries`
--
ALTER TABLE `nus_countries`
  MODIFY `countryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nus_pricing_mechanisam`
--
ALTER TABLE `nus_pricing_mechanisam`
  MODIFY `priMechId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nus_supply_contract`
--
ALTER TABLE `nus_supply_contract`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nus_tradeperiods`
--
ALTER TABLE `nus_tradeperiods`
  MODIFY `tradePerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nus_trade_periods_list`
--
ALTER TABLE `nus_trade_periods_list`
  MODIFY `tPeriodsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parentcompanydata`
--
ALTER TABLE `parentcompanydata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
