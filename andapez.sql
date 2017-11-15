-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2017 at 11:27 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andapez`
--

-- --------------------------------------------------------

--
-- Table structure for table `calzado`
--

CREATE TABLE `calzado` (
  `ref` int(11) NOT NULL,
  `matSuela` int(11) NOT NULL,
  `matCorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `corte`
--

CREATE TABLE `corte` (
  `id` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `idProv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `idProv` int(11) NOT NULL,
  `idMat` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cuentas`
--

INSERT INTO `cuentas` (`id`, `idProv`, `idMat`, `valor`) VALUES
(3, 1, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `name`) VALUES
(1, 'PVC'),
(2, 'neolite'),
(3, 'cuero'),
(4, 'sintético');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `RUT` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `ciudad` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `RUT`, `nombre`, `direccion`, `tel`, `ciudad`) VALUES
(1, 15487, 'prov1', 'dhokjjoja', 12345, 'Cali'),
(2, 15487897, 'SuelasA', 'mz c cs 4878', 7878978, 'cali'),
(7, 102878, 'Casermir', 'Cs 1254 CS 121', 14787897, 'Cali'),
(9, 0, 'undefined', 'undefined', 0, 'undefined'),
(10, 0, 'undefined', 'undefined', 0, 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `suelas`
--

CREATE TABLE `suelas` (
  `id` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `idProv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `usertype` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `username` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `diseños` int(11) DEFAULT NULL,
  `pares` int(11) DEFAULT NULL,
  `refcalzado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`DNI`, `nombre`, `usertype`, `tel`, `username`, `password`, `diseños`, `pares`, `refcalzado`) VALUES
(1, 'Germán', 'administrador', 311321, 'admin', 'root', NULL, NULL, NULL),
(213123, 'nilson', 'obrero', 1232131, 'nilson', '12345', NULL, 121, 1),
(1239884776, 'German', 'obrero', 3157484, 'gg', '1212', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calzado`
--
ALTER TABLE `calzado`
  ADD PRIMARY KEY (`ref`),
  ADD KEY `matSuela` (`matSuela`),
  ADD KEY `matCorte` (`matCorte`),
  ADD KEY `ref` (`ref`) USING BTREE;

--
-- Indexes for table `corte`
--
ALTER TABLE `corte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMaterial` (`idMaterial`),
  ADD KEY `idProv` (`idProv`);

--
-- Indexes for table `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suelas`
--
ALTER TABLE `suelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProv` (`idProv`),
  ADD KEY `idMaterial` (`idMaterial`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calzado`
--
ALTER TABLE `calzado`
  MODIFY `ref` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `corte`
--
ALTER TABLE `corte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `suelas`
--
ALTER TABLE `suelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
