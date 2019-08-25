-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2019 a las 03:54:34
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemareinscripcion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `IDADMINISTRADOR` varchar(50) NOT NULL,
  `ADNOMBRE` varchar(50) NOT NULL,
  `ADPATERNO` varchar(50) NOT NULL,
  `ADMATERNO` varchar(50) NOT NULL,
  `ADCONTRASEÑA` varchar(50) NOT NULL,
  `ADPRIMERINGRESO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `AMATRICULA` varchar(40) NOT NULL,
  `ANOMBRE` varchar(40) NOT NULL,
  `AAPATERNO` varchar(40) NOT NULL,
  `AAMATERNO` varchar(40) NOT NULL,
  `ACONTRASENA` varchar(40) NOT NULL,
  `ACREDITOS` int(11) NOT NULL,
  `APRIMERINGRESO` int(11) NOT NULL,
  `NCARRERA` int(11) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  `TASIGNADO` int(11) NOT NULL,
  `APROYECCION` int(11) NOT NULL,
  `AMAPA` int(11) NOT NULL,
  `PRIMERMAPA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `NCARRERA` int(11) NOT NULL,
  `CLAVECARRERA` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clavesmateria`
--

CREATE TABLE `clavesmateria` (
  `MCLAVE` int(11) NOT NULL,
  `CLAVEREAL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ECLAVE` int(11) NOT NULL,
  `EESTADO` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `NSTATUS` int(11) NOT NULL,
  `ESTATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `MCLAVE` int(11) NOT NULL,
  `AMATRICULA` varchar(40) NOT NULL,
  `ECLAVE` int(11) NOT NULL,
  `NUMOPTATIVA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaerrores`
--

CREATE TABLE `listaerrores` (
  `CLAVEPROBLEMA` int(11) NOT NULL,
  `DESCRIPCION` varchar(300) NOT NULL,
  `SOLUCION` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `MCLAVE` int(11) NOT NULL,
  `MNOMBRE` varchar(50) NOT NULL,
  `CREDITOS` int(11) NOT NULL,
  `NCLAVE` int(11) NOT NULL,
  `NCARRERA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `NCLAVE` int(11) NOT NULL,
  `NNIVEL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema`
--

CREATE TABLE `problema` (
  `CLAVEPROBLEMA` int(11) NOT NULL,
  `IDTUTOR` varchar(50) NOT NULL,
  `AMATRICULA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `IDTUTOR` varchar(50) NOT NULL,
  `TNOMBRE` varchar(50) NOT NULL,
  `TPATERNO` varchar(50) NOT NULL,
  `TMATERNO` varchar(50) NOT NULL,
  `TCONTRASENA` varchar(50) NOT NULL,
  `PPRIMERINGRESO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion`
--

CREATE TABLE `proyeccion` (
  `AMATRICULA` varchar(40) NOT NULL,
  `MCLAVE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `IDTUTOR` varchar(50) NOT NULL,
  `AMATRICULA` varchar(40) NOT NULL,
  `BLOQUE` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IDADMINISTRADOR`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`AMATRICULA`),
  ADD KEY `NCARRERA` (`NCARRERA`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`NCARRERA`);

--
-- Indices de la tabla `clavesmateria`
--
ALTER TABLE `clavesmateria`
  ADD KEY `MCLAVE` (`MCLAVE`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ECLAVE`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD KEY `MCLAVE` (`MCLAVE`),
  ADD KEY `AMATRICULA` (`AMATRICULA`),
  ADD KEY `ECLAVE` (`ECLAVE`);

--
-- Indices de la tabla `listaerrores`
--
ALTER TABLE `listaerrores`
  ADD PRIMARY KEY (`CLAVEPROBLEMA`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`MCLAVE`),
  ADD KEY `NCLAVE` (`NCLAVE`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`NCLAVE`);

--
-- Indices de la tabla `problema`
--
ALTER TABLE `problema`
  ADD KEY `CLAVEPROBLEMA` (`CLAVEPROBLEMA`),
  ADD KEY `IDTUTOR` (`IDTUTOR`),
  ADD KEY `AMATRICULA` (`AMATRICULA`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`IDTUTOR`);

--
-- Indices de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD KEY `AMATRICULA` (`AMATRICULA`),
  ADD KEY `MCLAVE` (`MCLAVE`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD KEY `IDTUTOR` (`IDTUTOR`),
  ADD KEY `AMATRICULA` (`AMATRICULA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`NCARRERA`) REFERENCES `carrera` (`NCARRERA`);

--
-- Filtros para la tabla `clavesmateria`
--
ALTER TABLE `clavesmateria`
  ADD CONSTRAINT `clavesmateria_ibfk_1` FOREIGN KEY (`MCLAVE`) REFERENCES `materia` (`MCLAVE`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`MCLAVE`) REFERENCES `materia` (`MCLAVE`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`AMATRICULA`) REFERENCES `alumno` (`AMATRICULA`),
  ADD CONSTRAINT `historial_ibfk_3` FOREIGN KEY (`ECLAVE`) REFERENCES `estado` (`ECLAVE`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`NCLAVE`) REFERENCES `nivel` (`NCLAVE`);

--
-- Filtros para la tabla `problema`
--
ALTER TABLE `problema`
  ADD CONSTRAINT `problema_ibfk_1` FOREIGN KEY (`CLAVEPROBLEMA`) REFERENCES `listaerrores` (`CLAVEPROBLEMA`),
  ADD CONSTRAINT `problema_ibfk_2` FOREIGN KEY (`IDTUTOR`) REFERENCES `profesor` (`IDTUTOR`),
  ADD CONSTRAINT `problema_ibfk_3` FOREIGN KEY (`AMATRICULA`) REFERENCES `alumno` (`AMATRICULA`);

--
-- Filtros para la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD CONSTRAINT `proyeccion_ibfk_1` FOREIGN KEY (`AMATRICULA`) REFERENCES `alumno` (`AMATRICULA`),
  ADD CONSTRAINT `proyeccion_ibfk_2` FOREIGN KEY (`MCLAVE`) REFERENCES `materia` (`MCLAVE`);

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`IDTUTOR`) REFERENCES `profesor` (`IDTUTOR`),
  ADD CONSTRAINT `tutor_ibfk_2` FOREIGN KEY (`AMATRICULA`) REFERENCES `alumno` (`AMATRICULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
