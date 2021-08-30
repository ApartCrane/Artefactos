-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2021 a las 02:06:54
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aparatos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar` (IN `x_idApa` INT(20), IN `x_idDirect` INT(20), IN `x_nombre` VARCHAR(255), IN `x_direccion` VARCHAR(255), IN `x_urb` VARCHAR(255), IN `x_postal` INT(20), IN `x_estado` VARCHAR(255), IN `x_pais` VARCHAR(255), IN `x_dia` DATE)  BEGIN

UPDATE direct SET direccion = x_direccion, urb = x_urb, postal = x_postal, estado = x_estado, pais = x_pais WHERE idDirect = x_idDirect;

UPDATE registro_apa SET nombreApa = x_nombreApa, diaApa = x_diaApa WHERE idApa = x_diaApa;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busquedaApa` (IN `x_idApa` VARCHAR(255))  BEGIN

SELECT * FROM registro_apa AS D INNER JOIN direct AS G ON (D.directApa = G.idDirect) WHERE idApa = x_idApa ;

SELECT * FROM registro_apa AS D INNER JOIN address AS G ON (D.directApa = G.idDirect);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busquedaId` (IN `x_idApa` VARCHAR(255))  BEGIN

SELECT * FROM registro_apa AS D INNER JOIN direct AS G ON (D.directApa = G.idDirect) WHERE idApa = x_idApa ;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crear` (IN `x_nombre` VARCHAR(255), IN `x_direccion` VARCHAR(255), IN `x_urb` VARCHAR(255), IN `x_postal` INT(20), IN `x_estado` VARCHAR(255), IN `x_pais` VARCHAR(255), IN `x_dia` DATE)  BEGIN

DECLARE y_idAppa INT;

	INSERT INTO direct(direccion, urb, postal, estado, pais) 
    VALUES(x_direccion, x_urb, x_postal, x_estado, x_pais);
    
    SELECT LAST_INSERT_ID() INTO y_idAppa;
    
    INSERT INTO registro_apa(nombreApa, diaApa, directApa, statusAppa) 
    VALUES(x_nombre,x_dia,x_idDirect,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar` (IN `x_idApa` INT(20))  BEGIN
    UPDATE registro_apa SET statusApa = 0 WHERE idApa = x_idApa;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direct`
--

CREATE TABLE `direct` (
  `idDirect` int(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `urb` varchar(255) NOT NULL,
  `postal` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_apa`
--

CREATE TABLE `registro_apa` (
  `idApa` int(20) NOT NULL,
  `nombreApa` varchar(255) NOT NULL,
  `diaApa` date NOT NULL,
  `directApa` int(120) NOT NULL,
  `statusApa` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro_apa`
--

INSERT INTO `registro_apa` (`idApa`, `nombreApa`, `diaApa`, `directApa`, `statusApa`) VALUES
(3, 'telefono Rayo Joaquin', '2021-05-17', 10, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direct`
--
ALTER TABLE `direct`
  ADD PRIMARY KEY (`idDirect`);

--
-- Indices de la tabla `registro_apa`
--
ALTER TABLE `registro_apa`
  ADD PRIMARY KEY (`idApa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direct`
--
ALTER TABLE `direct`
  MODIFY `idDirect` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_apa`
--
ALTER TABLE `registro_apa`
  MODIFY `idApa` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
