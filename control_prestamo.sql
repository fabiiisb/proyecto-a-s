-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2022 a las 03:54:36
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: control_prestamo
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla libro
--

CREATE TABLE libro (
  id_libro int(11) NOT NULL,
  nombre_libro varchar(60) NOT NULL,
  editorial varchar(45) NOT NULL,
  autor varchar(45) NOT NULL,
  genero varchar(25) NOT NULL,
  numero_paginas int(11) NOT NULL,
  año_edicion year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla libro
--

INSERT INTO libro (id_libro, nombre_libro, editorial, autor, genero, numero_paginas, año_edicion) VALUES
(1, 'La llamada de cthulhu', 'Alma', 'H. P. Lovecraft', 'Terror', 96, 2017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla prestamo
--

CREATE TABLE prestamo (
  id_prestamo int(11) NOT NULL,
  fecha_salida date NOT NULL,
  fecha_devolucion date NOT NULL,
  usuario_id_usuario int(11) NOT NULL,
  libro_id_libro int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla prestamo
--

INSERT INTO prestamo (id_prestamo, fecha_salida, fecha_devolucion, usuario_id_usuario, libro_id_libro) VALUES
(1, '2022-01-21', '2022-02-21', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuario
--

CREATE TABLE usuario (
  id_usuario int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  apellidos varchar(80) NOT NULL,
  rut varchar(10) NOT NULL,
  ciudad varchar(45) NOT NULL,
  direccion varchar(45) NOT NULL,
  telefono int(11) NOT NULL,
  correo varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla usuario
--

INSERT INTO usuario (id_usuario, nombre, apellidos, rut, ciudad, direccion, telefono, correo) VALUES
(1, 'Javier', ' Perez Barrientos', '20061602-2', 'Osorno', 'Ramirez 123', 123456, 'javier@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla libro
--
ALTER TABLE libro
  ADD PRIMARY KEY (id_libro);

--
-- Indices de la tabla prestamo
--
ALTER TABLE prestamo
  ADD PRIMARY KEY (id_prestamo),
  ADD KEY fk_prestamo_usuario_idx (usuario_id_usuario),
  ADD KEY fk_prestamo_libro1_idx (libro_id_libro);

--
-- Indices de la tabla usuario
--
ALTER TABLE usuario
  ADD PRIMARY KEY (id_usuario);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla libro
--
ALTER TABLE libro
  MODIFY id_libro int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla prestamo
--
ALTER TABLE prestamo
  MODIFY id_prestamo int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla usuario
--
ALTER TABLE usuario
  MODIFY id_usuario int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla prestamo
--
ALTER TABLE prestamo
  ADD CONSTRAINT fk_prestamo_libro1 FOREIGN KEY (libro_id_libro) REFERENCES libro (id_libro) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_prestamo_usuario FOREIGN KEY (usuario_id_usuario) REFERENCES usuario (id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
