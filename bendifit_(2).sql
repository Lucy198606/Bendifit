-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2023 a las 13:50:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bendifit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL,
  `idSala` int(2) NOT NULL,
  `IdCliente` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `idClase` int(2) NOT NULL DEFAULT 0,
  `Capacidad` int(3) NOT NULL,
  `NombreClase` varchar(30) NOT NULL,
  `Duracion` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`idClase`, `Capacidad`, `NombreClase`, `Duracion`) VALUES
(1, 20, 'Yoga', 60),
(2, 15, 'Pilates', 45),
(3, 30, 'Zumba', 60),
(4, 25, 'Spinning', 45),
(5, 18, 'CrossFit', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_salon`
--

CREATE TABLE `clase_salon` (
  `idCursada` int(2) NOT NULL DEFAULT 0,
  `idCliente` int(3) NOT NULL,
  `idClase` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(3) NOT NULL DEFAULT 0,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `DNI` int(8) NOT NULL,
  `FechaNac` date NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Altura` decimal(3,2) NOT NULL,
  `Peso` decimal(5,2) NOT NULL,
  `AptoFisico` tinyint(1) NOT NULL,
  `ObraSocial` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `Nombre`, `Apellido`, `DNI`, `FechaNac`, `Telefono`, `Altura`, `Peso`, `AptoFisico`, `ObraSocial`) VALUES
(1, 'Juan', 'García', 12345678, '1990-01-01', '123456789', '1.70', '70.50', 1, 1),
(2, 'María', 'López', 23456789, '1991-02-02', '234567890', '1.65', '65.00', 0, 1),
(3, 'Carlos', 'Martínez', 34567890, '1992-03-03', '345678901', '1.80', '80.00', 1, 0),
(4, 'Ana', 'Rodríguez', 45678901, '1993-04-04', '456789012', '1.75', '75.50', 0, 0),
(5, 'David', 'Hernández', 56789012, '1994-05-05', '567890123', '1.68', '68.00', 1, 1),
(6, 'Laura', 'Gómez', 67890123, '1995-06-06', '678901234', '1.82', '85.00', 1, 0),
(7, 'Pablo', 'Díaz', 78901234, '1996-07-07', '789012345', '1.77', '77.70', 0, 1),
(8, 'Sofía', 'Pérez', 89012345, '1997-08-08', '890123456', '1.69', '69.90', 1, 0),
(9, 'Elena', 'Sánchez', 90123456, '1998-09-09', '901234567', '1.81', '82.50', 0, 1),
(10, 'Diego', 'Muñoz', 12340123, '1999-10-10', '012345678', '1.72', '70.20', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dictado_clases`
--

CREATE TABLE `dictado_clases` (
  `idDictado` int(2) NOT NULL DEFAULT 0,
  `idInstructor` int(2) NOT NULL,
  `idClase` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dictado_clases`
--

INSERT INTO `dictado_clases` (`idDictado`, `idInstructor`, `idClase`) VALUES
(0, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `idDireccion` int(3) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `AlturaCalle` int(5) NOT NULL,
  `Piso` int(2) DEFAULT NULL,
  `Departamento` int(3) DEFAULT NULL,
  `Localidad` varchar(40) NOT NULL,
  `CodigoPostal` varchar(8) NOT NULL,
  `idCliente` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idDireccion`, `Calle`, `AlturaCalle`, `Piso`, `Departamento`, `Localidad`, `CodigoPostal`, `idCliente`) VALUES
(1, 'Avenida Mitre', 1200, 5, NULL, 'Avellaneda', '1870', 1),
(2, 'Calle Falsa', 123, 3, NULL, 'Quilmes Oeste', '1879', 2),
(3, 'Avenida Rivadavia', 3400, 10, NULL, 'Lanús Este', '1824', 3),
(4, 'Calle 9 de Julio', 500, NULL, NULL, 'San Isidro', '1642', 4),
(5, 'Avenida La Plata', 2100, NULL, NULL, 'La Plata', '1900', 5),
(6, 'Calle Corrientes', 800, NULL, NULL, 'Banfield', '1828', 6),
(7, 'Avenida General Paz', 2000, 4, NULL, 'Morón', '1708', 7),
(8, 'Avenida Espora', 650, 6, NULL, 'Adrogué', '1846', 8),
(9, 'Calle Buenos Aires', 300, NULL, NULL, 'Tigre', '1648', 9),
(10, 'Avenida del Libertador', 1500, NULL, NULL, 'Martínez', '1640', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `idInstructor` int(2) NOT NULL DEFAULT 0,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `DNI` int(8) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`idInstructor`, `Nombre`, `Apellido`, `Telefono`, `DNI`, `Email`) VALUES
(1, 'Juan', 'Pérez', '123456789', 12345678, 'juan@example.com'),
(2, 'María', 'Gómez', '234567890', 23456789, 'maria@example.com'),
(3, 'Carlos', 'Martínez', '345678901', 34567890, 'carlos@example.com'),
(4, 'Ana', 'Rodríguez', '456789012', 45678901, 'ana@example.com'),
(5, 'David', 'Hernández', '567890123', 56789012, 'david@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `idSala` int(2) NOT NULL DEFAULT 0,
  `Capacidad` int(2) NOT NULL,
  `NumeroSala` int(2) NOT NULL,
  `NombreSala` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`idSala`, `Capacidad`, `NumeroSala`, `NombreSala`) VALUES
(1, 20, 101, 'Sala A'),
(2, 15, 102, 'Sala B'),
(3, 25, 103, 'Sala C'),
(4, 25, 104, 'Sala D'),
(5, 18, 105, 'Sala E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `idx` int(11) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `nivel` tinyint(4) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `compañia` varchar(20) DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`idx`, `usuario`, `nombre`, `sexo`, `nivel`, `email`, `telefono`, `marca`, `compañia`, `saldo`, `activo`) VALUES
(1, 'BRE2271', 'BRENDA', 'M', 2, 'brenda@live.com', '655-330-5736', 'SAMSUNG', 'IUSACELL', 100, 1),
(2, 'OSC4677', 'OSCAR', 'H', 3, 'oscar@gmail.com', '655-143-4181', 'LG', 'TELCEL', 0, 1),
(3, 'JOS7086', 'JOSE', 'H', 3, 'francisco@gmail.com', '655-143-3922', 'NOKIA', 'MOVISTAR', 150, 1),
(4, 'LUI6115', 'LUIS', 'H', 0, 'enrique@outlook.com', '655-137-1279', 'SAMSUNG', 'TELCEL', 50, 1),
(5, 'LUI7072', 'LUIS', 'H', 1, 'luis@hotmail.com', '655-100-8260', 'NOKIA', 'IUSACELL', 50, 0),
(6, 'DAN2832', 'DANIEL', 'H', 0, 'daniel@outlook.com', '655-145-2586', 'SONY', 'UNEFON', 100, 1),
(7, 'JAQ5351', 'JAQUELINE', 'M', 0, 'jaqueline@outlook.com', '655-330-5514', 'BLACKBERRY', 'AXEL', 0, 1),
(8, 'ROM6520', 'ROMAN', 'H', 2, 'roman@gmail.com', '655-330-3263', 'LG', 'IUSACELL', 50, 1),
(9, 'BLA9739', 'BLAS', 'H', 0, 'blas@hotmail.com', '655-330-3871', 'LG', 'UNEFON', 100, 1),
(10, 'JES4752', 'JESSICA', 'M', 1, 'jessica@hotmail.com', '655-143-6861', 'SAMSUNG', 'TELCEL', 500, 1),
(11, 'DIA6570', 'DIANA', 'M', 1, 'diana@live.com', '655-143-3952', 'SONY', 'UNEFON', 100, 0),
(12, 'RIC8283', 'RICARDO', 'H', 2, 'ricardo@hotmail.com', '655-145-6049', 'MOTOROLA', 'IUSACELL', 150, 1),
(13, 'VAL6882', 'VALENTINA', 'M', 0, 'valentina@live.com', '655-137-4253', 'BLACKBERRY', 'AT&T', 50, 0),
(14, 'BRE8106', 'BRENDA', 'M', 3, 'brenda2@gmail.com', '655-100-1351', 'MOTOROLA', 'NEXTEL', 150, 1),
(15, 'LUC4982', 'LUCIA', 'M', 3, 'lucia@gmail.com', '655-145-4992', 'BLACKBERRY', 'IUSACELL', 0, 1),
(16, 'JUA2337', 'JUAN', 'H', 0, 'juan@outlook.com', '655-100-6517', 'SAMSUNG', 'AXEL', 0, 0),
(17, 'ELP2984', 'ELPIDIO', 'H', 1, 'elpidio@outlook.com', '655-145-9938', 'MOTOROLA', 'MOVISTAR', 500, 1),
(18, 'JES9640', 'JESSICA', 'M', 3, 'jessica2@live.com', '655-330-5143', 'SONY', 'IUSACELL', 200, 1),
(19, 'LET4015', 'LETICIA', 'M', 2, 'leticia@yahoo.com', '655-143-4019', 'BLACKBERRY', 'UNEFON', 100, 1),
(20, 'LUI1076', 'LUIS', 'H', 3, 'luis2@live.com', '655-100-5085', 'SONY', 'UNEFON', 150, 1),
(21, 'HUG5441', 'HUGO', 'H', 2, 'hugo@live.com', '655-137-3935', 'MOTOROLA', 'AT&T', 500, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `idSala` (`idSala`,`IdCliente`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`idClase`);

--
-- Indices de la tabla `clase_salon`
--
ALTER TABLE `clase_salon`
  ADD PRIMARY KEY (`idCursada`),
  ADD KEY `idCliente` (`idCliente`,`idClase`),
  ADD KEY `idClase` (`idClase`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `dictado_clases`
--
ALTER TABLE `dictado_clases`
  ADD PRIMARY KEY (`idDictado`),
  ADD KEY `idInstructor` (`idInstructor`,`idClase`),
  ADD KEY `idClase` (`idClase`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`idDireccion`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`idInstructor`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`idSala`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`idx`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`idSala`) REFERENCES `salas` (`idSala`);

--
-- Filtros para la tabla `clase_salon`
--
ALTER TABLE `clase_salon`
  ADD CONSTRAINT `clase_salon_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `clase_salon_ibfk_2` FOREIGN KEY (`idClase`) REFERENCES `clases` (`idClase`);

--
-- Filtros para la tabla `dictado_clases`
--
ALTER TABLE `dictado_clases`
  ADD CONSTRAINT `dictado_clases_ibfk_1` FOREIGN KEY (`idClase`) REFERENCES `clases` (`idClase`),
  ADD CONSTRAINT `dictado_clases_ibfk_2` FOREIGN KEY (`idInstructor`) REFERENCES `instructores` (`idInstructor`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
