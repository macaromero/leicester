-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2020 a las 01:11:59
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `leicester`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `ts_create`, `ts_update`) VALUES
(1, 'Licester', '2020-11-04 23:58:27', '2020-11-04 23:58:39'),
(2, 'Barcelona', '2020-11-04 23:58:58', '2020-11-04 23:58:58'),
(3, 'Manchester', '2020-11-04 23:58:58', '2020-11-04 23:58:58'),
(4, 'Liverpool', '2020-11-04 23:59:42', '2020-11-04 23:59:42'),
(5, 'Real Madrid', '2020-11-04 23:59:42', '2020-11-04 23:59:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `figuras`
--

CREATE TABLE `figuras` (
  `id` int(255) NOT NULL,
  `idPartido` int(255) DEFAULT NULL,
  `idJugador` int(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `figuras`
--

INSERT INTO `figuras` (`id`, `idPartido`, `idJugador`, `img`, `ts_create`, `ts_update`) VALUES
(1, 1, 1, 'null', '2020-11-05 00:02:08', '2020-11-05 00:02:08'),
(2, 2, 3, 'null', '2020-11-05 00:02:08', '2020-11-05 00:02:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `ts_create`, `ts_update`) VALUES
(1, 'Lionel Messi', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(2, 'Angel Di Maria', '2020-11-05 00:00:00', '2020-11-05 00:00:00'),
(3, 'Sergio Aguero', '2020-11-05 00:00:14', '2020-11-05 00:00:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id` int(255) NOT NULL,
  `idEquipo` int(255) DEFAULT NULL,
  `golLocal` int(255) DEFAULT NULL,
  `golVisitante` int(255) DEFAULT NULL,
  `puntaje` int(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id`, `idEquipo`, `golLocal`, `golVisitante`, `puntaje`, `fecha`, `hora`, `ts_create`, `ts_update`) VALUES
(1, 2, 5, 2, 3, '2020-11-01', '21:00:00', '2020-11-05 00:01:39', '2020-11-05 00:01:39'),
(2, 3, 2, 5, 0, '2020-11-02', '17:00:00', '2020-11-05 00:01:39', '2020-11-05 00:01:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `figuras`
--
ALTER TABLE `figuras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_partidos_id` (`idPartido`),
  ADD KEY `fk_jugadores_id` (`idJugador`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipo_id` (`idEquipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `figuras`
--
ALTER TABLE `figuras`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `figuras`
--
ALTER TABLE `figuras`
  ADD CONSTRAINT `fk_jugadores_id` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `fk_partidos_id` FOREIGN KEY (`idPartido`) REFERENCES `partidos` (`id`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `fk_equipo_id` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
