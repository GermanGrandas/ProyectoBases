-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2017 a las 02:33:21
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `andapez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calzado`
--

CREATE TABLE `calzado` (
  `id` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `matSuela` int(11) NOT NULL,
  `matCorte` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `calzado`
--

INSERT INTO `calzado` (`id`, `ref`, `matSuela`, `matCorte`, `precio`) VALUES
(1, 124, 1, 2, 0),
(2, 126, 2, 1, 0),
(6, 135, 2, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte`
--

CREATE TABLE `corte` (
  `id` int(11) NOT NULL,
  `materialC` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idProv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `corte`
--

INSERT INTO `corte` (`id`, `materialC`, `idProv`) VALUES
(1, 'Cuero', 1),
(2, 'sintetico', 3),
(3, 'charol', 7),
(4, 'sasa', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `idProv` int(11) NOT NULL,
  `idMat` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `idProv`, `idMat`, `valor`) VALUES
(1, 1, 1, 10000),
(5, 2, 4, 10000),
(12, 7, 3, 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `para` varchar(10) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id`, `name`, `para`) VALUES
(1, 'PVC', 'suela'),
(2, 'neolite', 'suela'),
(3, 'cuero', 'corte'),
(4, 'sintético', 'corte'),
(5, 'sasa', 'cuero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
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
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `RUT`, `nombre`, `direccion`, `tel`, `ciudad`) VALUES
(2, 15487897, 'SuelasA', 'mz c cs 4878', 7878978, 'cali'),
(7, 102878, 'Casermir', 'Cs 1254 CS 121', 14787897, 'Cali'),
(8, 213, 'sasa', 'mc c cs 10', 23421, 'Pereira');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suelas`
--

CREATE TABLE `suelas` (
  `id` int(11) NOT NULL,
  `materialS` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `idProv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `suelas`
--

INSERT INTO `suelas` (`id`, `materialS`, `idProv`) VALUES
(1, 'PVC', 1),
(2, 'neolite', 3),
(4, 'plastico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `ref`, `cantidad`, `estado`) VALUES
(7, 135, 32, 'SIN TERMINAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `usertype` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `username` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `disenos` int(11) DEFAULT NULL,
  `pares` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`DNI`, `nombre`, `usertype`, `tel`, `username`, `password`, `disenos`, `pares`) VALUES
(1, 'Germán', 'administrador', 311321, 'admin', 'root', NULL, NULL),
(213123, 'nilson', 'obrero', 1232131, 'nilson', '12345', NULL, 122),
(18276537, 'Juan ', 'diseñador', 321213, 'juand', 'root', 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calzado`
--
ALTER TABLE `calzado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matSuela` (`matSuela`),
  ADD KEY `matCorte` (`matCorte`);

--
-- Indices de la tabla `corte`
--
ALTER TABLE `corte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProv` (`idProv`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suelas`
--
ALTER TABLE `suelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProv` (`idProv`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calzado`
--
ALTER TABLE `calzado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `corte`
--
ALTER TABLE `corte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `suelas`
--
ALTER TABLE `suelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
