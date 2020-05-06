-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 11:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoesauction`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `id_bid` varchar(10) NOT NULL,
  `id_product` varchar(10) DEFAULT NULL,
  `total_bid` bigint(20) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `email` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`email`, `username`, `password`, `type`) VALUES
('admin@admin.com', 'admin', 'admin', 'A'),
('bagas123f@gmail.com', 'bagas', 'bagas', 'U'),
('nanda@gmail.com', 'nanda', 'nanda', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` varchar(10) NOT NULL,
  `nama_product` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `start_bid` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `nama_product`, `stock`, `start_bid`, `start_date`, `end_date`) VALUES
('PR0001', 'Servare Vitas', 1, 2000000, '2020-04-30', '2020-05-05'),
('PR0002', 'Compass x PMP Darahku Biru', 1, 3000000, '2020-04-30', '2020-05-02'),
('PR0003', 'Compass x PMP Darahku Biru', 1, 155, '2020-04-30', '2020-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_bid` varchar(10) DEFAULT NULL,
  `id_product` varchar(10) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `end_bid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`id_bid`),
  ADD KEY `fk_username` (`username`),
  ADD KEY `fk_product` (`id_product`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_bid` (`id_bid`),
  ADD KEY `fk_product2` (`id_product`),
  ADD KEY `fk_username2` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_bid` FOREIGN KEY (`id_bid`) REFERENCES `bid` (`id_bid`),
  ADD CONSTRAINT `fk_product2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `fk_username2` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
