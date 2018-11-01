-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2018 a las 21:45:03
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final_utp`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estudiante_crud` (IN `estudiant_id` INT, IN `nombr` VARCHAR(50), IN `apellid` VARCHAR(50), IN `nombre_complet` VARCHAR(100), IN `cedul` VARCHAR(20), IN `celula` VARCHAR(20), IN `corre` VARCHAR(100))  BEGIN


IF operacion = 'I' THEN
 INSERT INTO estudiante(estudiante_id,nombre,apellido,nombre_completo,cedula,celular,correo)
  VALUES(estudiant_id,nombr,apellid,nombre_complet,cedul,celula,corre);
END IF ; 
   
IF operacion = 'U' THEN 
   
   if estudiant_id <> 0 then 
          update estudiante
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 cedula           = cedul,
                 celular          = celula,
                 correo           = corre
           where estudiante_id      = estudiant_id;
   end if;
      
   if cedul <> '' then 
          update estudiante
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 celular          = celula,
                 correo           = corre
           where cedula = cedul;
   end if;
END IF;
   
IF operacion = 'D' THEN
   
   if estudiant_id <> 0 then 
   delete from estudiante 
    where estudiante_id = estudiant_id;
   end if;
   
   if cedul <> '' then 
   delete from estudiante 
    where cedula = cedul;
   end if;
   
END IF ;
   
   
IF operacion = 'Q' THEN
 
   if estudiant_id <> 0 then 
      select * 
        from estudiante 
       where estudiante_id = estudiant_id;
   end if;
   
   if cedul <> '' then 
      select * 
        from estudiante 
       where cedula = cedul;
   end if;

END IF ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_profesor_crud` (IN `profeso_id` INT, IN `nombr` VARCHAR(50), IN `apellid` VARCHAR(50), IN `nombre_complet` VARCHAR(100), IN `cedul` VARCHAR(20), IN `celula` VARCHAR(20), IN `corre` VARCHAR(100))  BEGIN


IF operacion = 'I' THEN
 INSERT INTO profesor(profesor_id,nombre,apellido,nombre_completo,cedula,celular,correo)
  VALUES(profeso_id,nombr,apellid,nombre_complet,cedul,celula,corre);
END IF ; 
   
IF operacion = 'U' THEN 
   
   if profeso_id <> 0 then 
          update profesor
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 cedula           = cedul,
                 celular          = celula,
                 correo           = corre
           where profesor_id      = profeso_id;
   end if;
      
   if cedul <> '' then 
          update profesor
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 celular          = celula,
                 correo           = corre
           where cedula = cedul;
   end if;
END IF;
   
IF operacion = 'D' THEN
   
   if profeso_id <> 0 then 
   delete from profesor 
    where profesor_id = profeso_id;
   end if;
   
   if cedul <> '' then 
   delete from profesor 
    where cedula = cedul;
   end if;
   
END IF ;
   
   
IF operacion = 'Q' THEN
 
   if profeso_id <> 0 then 
      select * 
        from profesor 
       where profesor_id = profeso_id;
   end if;
   
   if cedul <> '' then 
      select * 
        from profesor 
       where cedula = cedul;
   end if;

END IF ; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `carrera_id` int(11) NOT NULL,
  `secuencial` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `materia_id` int(11) NOT NULL,
  `nombre_materia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `valor` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `estudiante_id` int(11) NOT NULL,
  `nomrbe` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `grupo_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `materia_id` int(11) NOT NULL,
  `secuencial` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `turno` char(2) NOT NULL,
  `horario_inicial` varchar(20) NOT NULL,
  `horario_salida` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `matricula_id` int(11) NOT NULL,
  `secuencial` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `nombre_estudiante` varchar(100) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `nombre_carrera` varchar(255) NOT NULL,
  `materia_id` int(11) NOT NULL,
  `nombre_materia` varchar(255) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `nombre_profesor` varchar(100) NOT NULL,
  `estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `profesor_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `salon_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `cantidad_estudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`carrera_id`,`secuencial`),
  ADD UNIQUE KEY `carrera_id` (`carrera_id`);

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`valor`),
  ADD UNIQUE KEY `valor` (`valor`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`estudiante_id`,`cedula`),
  ADD UNIQUE KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia_id`,`secuencial`),
  ADD UNIQUE KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`matricula_id`,`secuencial`,`estudiante_id`),
  ADD UNIQUE KEY `matricula_id` (`matricula_id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`profesor_id`,`cedula`),
  ADD UNIQUE KEY `profesor_id` (`profesor_id`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`salon_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
