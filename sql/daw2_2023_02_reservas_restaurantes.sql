-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2024 a las 13:38:15
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

-- ------------------------------------------------------------------------------
-- Esquema de la Base de Datos para una página de reservas de restaurantes online
-- (c) DAW2 - EPSZ - Universidad Salamanca
-- ------------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET AUTOCOMMIT=0;
START TRANSACTION;


-- --------------------------------------------------------
-- Base de datos: `daw2_2023_02_reservas_restaurantes`
-- --------------------------------------------------------
DROP DATABASE IF EXISTS `daw2_2023_02_reservas_restaurantes`;
CREATE DATABASE IF NOT EXISTS `daw2_2023_02_reservas_restaurantes`
  CHARACTER SET 'utf8'
  COLLATE 'utf8_general_ci';

USE `daw2_2023_02_reservas_restaurantes`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- -----------------------------   TABLAS GENERADAS POR EL SISTEMA RBAC  -----------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrador', '31', 1705667110),
('cliente', '1', 1705667110),
('cliente', '2', 1705667110),
('cliente', '3', 1705667110),
('cliente', '4', 1705667110),
('cliente', '5', 1705667110),
('cliente', '6', 1705667110),
('cliente', '7', 1705667110),
('cliente', '8', 1705667110),
('cliente', '9', 1705667110),
('cliente', '10', 1705667110),
('gestor', '16', 1705667110),
('gestor', '17', 1705667110),
('gestor', '18', 1705667110),
('gestor', '19', 1705667110),
('gestor', '20', 1705667110),
('moderador', '21', 1705667110),
('moderador', '22', 1705667110),
('moderador', '23', 1705667110),
('moderador', '24', 1705667110),
('moderador', '25', 1705667110),
('moderador', '26', 1705667110),
('moderador', '27', 1705667110),
('moderador', '28', 1705667110),
('moderador', '29', 1705667110),
('moderador', '30', 1705667110),
('propietario', '11', 1705667110),
('propietario', '12', 1705667110),
('propietario', '13', 1705667110),
('propietario', '14', 1705667110),
('propietario', '15', 1705667110);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrador', 1, 'Rol de administrador con permisos completos', NULL, NULL, 1705666635, 1705666635),
('cliente', 1, 'Rol de cliente con permisos de gestión', NULL, NULL, 1705667072, 1705667072),
('gestor', 1, 'Rol de gestor con permisos de gestión', NULL, NULL, 1705666635, 1705666635),
('moderador', 1, 'Rol de moderador con permisos de moderación', NULL, NULL, 1705666635, 1705666635),
('propietario', 1, 'Rol de propietario con permisos de gestión', NULL, NULL, 1705666854, 1705666854);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1705666193),
('m140506_102106_rbac_init', 1705666583),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1705666583),
('m180523_151638_rbac_updates_indexes_without_prefix', 1705666583),
('m200409_110543_rbac_update_mssql_trigger', 1705666583);

-- --------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------




-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador de cada usuario.',
  `nombre_usuario` varchar(50) NOT NULL COMMENT 'Nombre del usuario.',
  `email` varchar(32) NOT NULL COMMENT 'Email de regitro del usuario.',
  `password` varchar(200) NOT NULL COMMENT 'Contraseña de registro del usuario.',
  `id_foto_usuario` int(12) DEFAULT NULL COMMENT 'ID de la foto de perfil del usuario. NULL si no tiene.',
  `rol` varchar(15) DEFAULT NULL COMMENT 'Tipo de rol del usuario.',
  `bloqueado` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 normal, 1 bloqueado.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `id_foto_usuario`, `rol`, `bloqueado`, `notas`) VALUES
(1, 'cliente1', 'cliente1@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 61, 'cliente', 0, NULL),
(2, 'cliente2', 'cliente2@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 62, 'cliente', 0, NULL),
(3, 'cliente3', 'cliente3@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 63, 'cliente', 0, NULL),
(4, 'cliente4', 'cliente4@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 64, 'cliente', 0, NULL),
(5, 'cliente5', 'cliente5@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 65, 'cliente', 0, NULL),
(6, 'cliente6', 'cliente6@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 66, 'cliente', 0, NULL),
(7, 'cliente7', 'cliente7@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 67, 'cliente', 0, NULL),
(8, 'cliente8', 'cliente8@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 68, 'cliente', 0, NULL),
(9, 'cliente9', 'cliente9@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 69, 'cliente', 0, NULL),
(10, 'cliente10', 'cliente10@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 70, 'cliente', 0, NULL),
(11, 'propietario1', 'propietario1@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', 1, 'propietario', 0, NULL),
(12, 'propietario2', 'propietario2@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', 1, 'propietario', 0, NULL),
(13, 'propietario3', 'propietario3@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', 1, 'propietario', 0, NULL),
(14, 'propietario4', 'propietario4@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', 1, 'propietario', 0, NULL),
(15, 'propietario5', 'propietario5@prueba.com', '$2y$13$U8rfkTZJKE4toJ5S3s3u3u7olBvRwcXtwddYe2HkXaBQ7g72Odym6', 1, 'propietario', 0, NULL),
(16, 'gestor1', 'gestor1@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', 1, 'gestor', 0, NULL),
(17, 'gestor2', 'gestor2@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', 1, 'gestor', 0, NULL),
(18, 'gestor3', 'gestor3@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', 1, 'gestor', 0, NULL),
(19, 'gestor4', 'gestor4@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', 1, 'gestor', 0, NULL),
(20, 'gestor5', 'gestor5@prueba.com', '$2y$13$aQDTaChAD1GdPqfcTw5kQ.0siizNfMTKR5j8.0q.0TAPMMZFB2YlS', 1, 'gestor', 0, NULL),
(21, 'moderador1', 'moderador1@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(22, 'moderador2', 'moderador2@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(23, 'moderador3', 'moderador3@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(24, 'moderador4', 'moderador4@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(25, 'moderador5', 'moderador5@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(26, 'moderador6', 'moderador6@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(27, 'moderador7', 'moderador7@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(28, 'moderador8', 'moderador8@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(29, 'moderador9', 'moderador9@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(30, 'moderador10', 'moderador10@prueba.com', '$2y$13$Sed0Vf7aRoX1ewB19n77RObyn8Cfgo4c7taFrCPoIB8KVvvli6HBi', 1, 'moderador', 0, NULL),
(31, 'administrador1', 'administrador1@prueba.com', '$2y$13$VcfOxmSbPsYZ0Gy46Vze4.fY3vcd26Q4Fi7.W1eu1oBGqAgNg0QIS', 1, 'administrador', 0, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `moderadores`
--

CREATE TABLE `moderadores` (
  `id_moderador` int(12) NOT NULL COMMENT 'Identificador de cada moderador.',
  `ciudad_moderador` varchar(100) DEFAULT NULL COMMENT 'Ciudad de residencia del moderador.',
  `comunidad_autonoma_moderador` varchar(100) NOT NULL COMMENT 'Comunidad autónoma de residencia del moderador.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el Moderador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `moderadores`
--

INSERT INTO `moderadores` (`id_moderador`, `ciudad_moderador`, `comunidad_autonoma_moderador`, `id_usuario`, `notas`) VALUES
(1, 'Madrid', 'Comunidad de Madrid', 21, NULL),
(2, 'Zamora', 'Castilla y León', 22, NULL),
(3, 'Cádiz', 'Andalucía', 23, NULL),
(4, 'Sevilla', 'Andalucía', 24, NULL),
(5, 'Zaragoza', 'Aragón', 25, NULL),
(6, 'Badajoz', 'Extremadura', 26, NULL),
(7, 'Bilbao', 'País Vasco', 27, NULL),
(8, 'Vigo', 'Galicia', 28, NULL),
(9, 'Valencia', 'Comunidad Valenciana', 29, NULL),
(10, 'Barcelona', 'Cataluña', 30, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada restaurante.',
  `nombre_restaurante` varchar(100) NOT NULL COMMENT 'Nombre del restaurante.',
  `id_foto_restaurante` int(12) NOT NULL COMMENT 'ID de la foto de perfil del restaurante.',
  `id_carta` int(12) NOT NULL COMMENT 'ID de la foto de la carta.',
  `calle_restaurante` varchar(100) NOT NULL COMMENT 'Calle del restaurante.',
  `barrio_restaurante` varchar(100) DEFAULT NULL COMMENT 'Barrio del restaurante.',
  `ciudad_restaurante` varchar(100) NOT NULL COMMENT 'Ciudad del restaurante.',
  `comunidad_autonoma_restaurante` varchar(100) NOT NULL COMMENT 'Comunidad autónoma del restaurante.',
  `precio_medio_comensal` float NOT NULL COMMENT 'Precio por persona medio.',
  `id_propietario` int(12) NOT NULL COMMENT 'ID del propietario del restaurante.',
  `aforo_maximo`int(6) NOT NULL COMMENT 'Aforo máximo del restaurante.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el restaurante.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `aforo_maximo`, `notas`) VALUES
(1, 'Savory Haven', 11, 60, 'Rúa Fonte dos Ranchos', 'Casco Vello', 'Vigo', 'Galicia', 15.5, 14, 35, NULL),
(2, 'Culinary Oasis', 2, 60, 'Paseo de la Castellana', 'Chamartín', 'Madrid', 'Comunidad de Madrid', 21, 13, 35, NULL),
(3, 'Spice Symphony', 3, 60, 'Calle del Doctor Gómez Ulla', 'Salamanca', 'Madrid', 'Comunidad de Madrid', 50, 12, 35, NULL),
(4, 'Urban Palate', 4, 60, 'Carrer Aribau', 'Eixample', 'Barcelona', 'Cataluña', 15, 11, 70, NULL),
(5, 'Gourmet Grove', 5, 60, 'Calle de Serrano', 'Recoletos', 'Madrid', 'Comunidad de Madrid', 25.5, 14, 22, NULL),
(6, 'Fusion Junction', 6, 60, 'Carrer de Muntaner', 'Sant Gervasi - Galvany', 'Barcelona', 'Cataluña', 32.5, 11, 50, NULL),
(7, 'Epicurean Elegance', 7, 60, 'Avinguda Diagonal', 'Les Corts', 'Barcelona', 'Cataluña', 9, 14, 35, NULL),
(8, 'Sizzling Bites', 8, 60, 'Calle de Alcalá', 'El Viso', 'Madrid', 'Comunidad de Madrid', 8.5, 13, 35, NULL),
(9, 'Bistro Bliss', 9, 60, 'Carrer Gran de Gràcia', 'Gràcia', 'Barcelona', 'Cataluña', 30, 15, 35, NULL),
(10, 'Gastronomy Galore', 10, 60, 'Rúa Fonte dos Ranchos', 'Casco Vello', 'Vigo', 'Galicia', 14.5, 13, 35, NULL),
(11, 'Flavor Fiesta', 12, 60, 'Paseo de la Castellana', 'Chamartín', 'Madrid', 'Comunidad de Madrid', 16, 13, 40, NULL),
(12, 'Tantalizing Tastes', 13, 60, 'Carrer de Muntaner', 'Sant Gervasi - Galvany', 'Barcelona', 'Cataluña', 10, 13, 35, NULL),
(13, 'Amborisa Alley', 14, 60, 'Paseo de la Castellana', 'Chamartín', 'Madrid', 'Comunidad de Madrid', 21.5, 13, 35, NULL),
(14, 'Whisk & Whimsy', 15, 60, 'Calle de Serrano', 'Recoletos', 'Madrid', 'Comunidad de Madrid', 25, 13, 35, NULL),
(15, 'Heart & Harvest', 16, 60, 'Rúa Fonte dos Ranchos', 'Casco Vello', 'Vigo', 'Galicia', 17.5, 13, 35, NULL),
(16, 'Panorama Plates', 17, 60, 'Carrer Gran de Gràcia', 'Gràcia', 'Barcelona', 'Cataluña', 80, 13, 35, NULL),
(17, 'Mosaic Munch', 18, 60, 'Carrer de Muntaner', 'Sant Gervasi - Galvany', 'Barcelona', 'Cataluña', 58, 13, 35, NULL),
(18, 'Zenith Zest', 19, 60, 'Paseo de la Castellana', 'Chamartín', 'Madrid', 'Comunidad de Madrid', 18, 13, 35, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(12) NOT NULL COMMENT 'Identificador de cada evento de restaurante.',
  `titulo_evento` varchar(100) NOT NULL COMMENT 'Título del evento organizado.',
  `descripcion_evento` varchar(500) NOT NULL COMMENT 'Descripción del evento organizado.',
  `fecha_evento` date NOT NULL COMMENT 'Fecha de celebración del evento.',
  `id_imagen_promocional` int(12) NOT NULL COMMENT 'ID del la imagen aportada por el restaurante (Será la ruta+nombreArchivo de la imagen).',
  `incidencia_evento` tinyint(1) DEFAULT NULL COMMENT 'Marca de incidencia en una resena: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada restaurante asociada a la imagen.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el evento.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `titulo_evento`, `descripcion_evento`, `fecha_evento`, `id_imagen_promocional`, `incidencia_evento`, `id_restaurante`, `notas`) VALUES
(1, 'Noche de Cata de Vinos', 'Una velada dedicada a degustar una selección de vinos de alta calidad. Los comensales pueden disfrutar de maridajes de vino con platos especialmente preparados para realzar la experiencia.', '2023-12-22', 20, 0, 1, NULL),
(2, 'Noche Temática Culinary Around the World', 'Una experiencia gastronómica que transporta a los comensales a diferentes partes del mundo cada mes. El restaurante presenta platos auténticos de diversas culturas con música y decoración temática.', '2024-01-16', 21, 1, 2, NULL),
(3, 'Show de Cocina en Vivo', 'Un chef invitado o el chef principal realiza una demostración de cocina en vivo, compartiendo técnicas y secretos culinarios mientras prepara platos del menú. Los comensales pueden interactuar y hacer preguntas.', '2024-01-15', 22, 2, 3, NULL),
(4, 'Brunch Dominical con Entretenimiento en Vivo', 'Un brunch relajado con música en vivo, creando un ambiente animado. Ofrece una variedad de opciones de desayuno y almuerzo para satisfacer todos los gustos.', '2024-01-10', 23, 0, 4, NULL),
(5, 'Fiesta de Degustación de Tapas', 'Una celebración de la cocina española con una amplia variedad de tapas. Los comensales pueden probar pequeñas porciones de diferentes platos para compartir y experimentar una explosión de sabores.', '2024-01-05', 24, 0, 5, NULL),
(6, 'Noche de Mariscos Frescos', 'Un evento que destaca los productos del mar más frescos disponibles. Incluye una variedad de platillos de mariscos, como ostras, langostinos y cangrejos, preparados de diversas maneras.', '2023-12-22', 25, 0, 6, NULL),
(7, 'Festival de Cerveza y Comida', 'Una celebración que combina cervezas artesanales con deliciosos platillos. Se ofrecen maridajes específicos de cervezas con cada plato, resaltando la diversidad de sabores.', '2024-01-14', 26, 0, 7, NULL),
(8, 'Noche de Música en Vivo y Cena Romántica', 'Una velada especial con música en vivo que crea un ambiente romántico. Ofrece un menú exclusivo para parejas que desean disfrutar de una cena íntima.', '2023-12-28', 27, 0, 8, NULL),
(9, 'Clase de Cocina para Niños', 'Una actividad educativa donde los niños pueden aprender a preparar platos sencillos y saludables. Fomenta la participación activa y el interés por la cocina desde temprana edad.', '2023-12-29', 28, 0, 9, NULL),
(10, 'Fiesta de Celebración de Temporada', 'Un evento que celebra festividades o cambios de temporada con un menú especial y decoración temática. Puede incluir actividades y entretenimiento relacionados con la temporada, como música, juegos o espectáculos.', '2024-01-08', 29, 0, 10, NULL),
(11, 'Noche de Sushi y Sake', 'Una experiencia culinaria japonesa con una selección de sushi fresco y sake. Los comensales podrán disfrutar de la maestría de los chefs preparando deliciosos rollos.', '2024-02-05', 30, 0, 11, NULL),
(12, 'Cena con Estrellas Michelin', 'Una exclusiva cena donde el chef presenta platillos inspirados en la alta cocina con una clasificación Michelin. Los ingredientes de calidad se combinan para una experiencia gastronómica excepcional.', '2024-02-14', 31, 0, 12, NULL),
(13, 'Fiesta del Grill y BBQ', 'Un evento al aire libre dedicado a la parrilla y al barbecue. Ofrece una amplia variedad de carnes, marinadas y guarniciones para los amantes de los sabores ahumados.', '2024-02-21', 32, 0, 13, NULL),
(14, 'Noche de Jazz y Cócteles', 'Una velada sofisticada con música de jazz en vivo y una selección de cócteles artesanales. Ideal para aquellos que buscan una experiencia relajada y elegante.', '2024-02-28', 33, 0, 14, NULL),
(15, 'Festival Vegetariano', 'Un evento dedicado a la cocina vegetariana, presentando platos creativos y saludables. Incluye opciones veganas y destaca la versatilidad de los ingredientes vegetales.', '2024-03-08', 34, 0, 15, NULL),
(16, 'Noche de Pasta Fresca', 'Un banquete centrado en la pasta fresca hecha a mano. Los comensales pueden disfrutar de una variedad de salsas y rellenos, preparados por chefs expertos.', '2024-03-15', 35, 0, 16, NULL),
(17, 'Fiesta de la Trufa Negra', 'Un festín dedicado a la trufa negra, un manjar gourmet. Los platos están realzados con la delicada y distintiva trufa, ofreciendo una experiencia culinaria única.', '2024-03-22', 36, 0, 17, NULL),
(18, 'Noche de Cócteles Creativos', 'Una celebración de la coctelería creativa con mixólogos expertos. Ofrece cócteles únicos y creativos que complementan los sabores de la comida.', '2024-04-02', 37, 0, 18, NULL),
(19, 'Festival del Chocolate', 'Un evento dulce que destaca el chocolate en diversas formas. Desde postres extravagantes hasta bebidas especiales, los amantes del chocolate se deleitarán.', '2024-04-10', 38, 0, 1, NULL),
(20, 'Noche de Comida Picante', 'Una experiencia culinaria para los amantes de los sabores intensos. El menú presenta platos picantes de diferentes cocinas del mundo, desafiando los paladares.', '2024-04-18', 39, 0, 2, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_restaurantes`
--

CREATE TABLE `control_restaurantes` (
  `id_usuario` int(12) NOT NULL COMMENT 'Referencia del usuario asociado al restaurante.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado al gestor.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el control de restaurantes.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `control_restaurantes`
--

INSERT INTO `control_restaurantes` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(14, 1, NULL),
(13, 2, NULL),
(12, 3, NULL),
(11, 4, NULL),
(14, 5, NULL),
(11, 6, NULL),
(11, 7, NULL),
(11, 8, NULL),
(13, 9, NULL),
(15, 10, NULL),
(13, 11, NULL),
(13, 12, NULL),
(13, 13, NULL),
(13, 14, NULL),
(13, 15, NULL),
(13, 16, NULL),
(13, 17, NULL),
(13, 18, NULL),
(13, 19, NULL),
(13, 20, NULL),
(16, 1, NULL),
(16, 2, NULL),
(16, 3, NULL),
(17, 4, NULL),
(17, 5, NULL),
(17, 6, NULL),
(18, 7, NULL),
(18, 8, NULL),
(18, 9, NULL),
(19, 10, NULL),
(19, 11, NULL),
(19, 12, NULL),
(20, 13, NULL),
(20, 14, NULL),
(20, 15, NULL),
(20, 16, NULL),
(20, 17, NULL),
(20, 18, NULL),
(20, 19, NULL),
(20, 20, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador del usuario.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el favorito.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 6, NULL),
(2, 4, NULL),
(3, 9, NULL),
(4, 1, NULL),
(5, 3, NULL),
(6, 1, NULL),
(7, 5, NULL),
(8, 6, NULL),
(9, 1, NULL),
(10, 10, NULL),
(1, 12, NULL),
(2, 11, NULL),
(3, 13, NULL),
(4, 14, NULL),
(5, 15, NULL),
(6, 16, NULL),
(7, 17, NULL),
(8, 18, NULL),
(9, 18, NULL),
(10, 15, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(12) NOT NULL COMMENT 'Identificador de imagen.',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'Texto que describe la imagen y se muestra como pié de foto (opcional).',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la imagen.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_imagen`, `descripcion`, `notas`) VALUES
(1, 'foto de usuario default', NULL),
(2, 'Foto principal restaurante: Savory Haven', NULL),
(3, 'Foto principal restaurante: Culinary Oasis', NULL),
(4, 'Foto principal restaurante: Spice Symphony', NULL),
(5, 'Foto principal restaurante: Urban Palate', NULL),
(6, 'Foto principal restaurante: Gourmet Grove', NULL),
(7, 'Foto principal restaurante: Fusion Junction', NULL),
(8, 'Foto principal restaurante: Epicurean Elegance', NULL),
(9, 'Foto principal restaurante: Sizzling Bites', NULL),
(10, 'Foto principal restaurante: Bistro Bliss', NULL),
(11, 'Foto principal restaurante: Gastronomy Galore', NULL),
(12, 'Foto principal restaurante: Flavor Fiesta', NULL),
(13, 'Foto principal restaurante: Tantalizing Tastes', NULL),
(14, 'Foto principal restaurante: Amborisa Alley', NULL),
(15, 'Foto principal restaurante: Whisk & Whimsy', NULL),
(16, 'Foto principal restaurante: Heart & Harvest', NULL),
(17, 'Foto principal restaurante: Panorama Plates', NULL),
(18, 'Foto principal restaurante: Mosaic Munch', NULL),
(19, 'Foto principal restaurante: Zenith Zest', NULL),
(20, 'Imagen evento: Noche de Cata de Vinos', NULL),
(21, 'Imagen evento: Noche Temática Culinary Around the World', NULL),
(22, 'Imagen evento: Show de Cocina en Vivo', NULL),
(23, 'Imagen evento: Brunch Dominical con Entretenimiento en Vivo', NULL),
(24, 'Imagen evento: Fiesta de Degustación de Tapas', NULL),
(25, 'Imagen evento: Noche de Mariscos Frescos', NULL),
(26, 'Imagen evento: Festival de Cerveza y Comida', NULL),
(27, 'Imagen evento: Noche de Música en Vivo y Cena Romántica', NULL),
(28, 'Imagen evento: Clase de Cocina para Niños', NULL),
(29, 'Imagen evento: Fiesta de Celebración de Temporada', NULL),
(30, 'Imagen evento: Noche de Sushi y Sake', NULL),
(31, 'Imagen evento: Cena con Estrellas Michelin', NULL),
(32, 'Imagen evento: Fiesta del Grill y BBQ', NULL),
(33, 'Imagen evento: Noche de Jazz y Cócteles', NULL),
(34, 'Imagen evento: Festival Vegetariano', NULL),
(35, 'Imagen evento: Noche de Pasta Fresca', NULL),
(36, 'Imagen evento: Fiesta de la Trufa Negra', NULL),
(37, 'Imagen evento: Noche de Cócteles Creativos', NULL),
(38, 'Imagen evento: Festival del Chocolate', NULL),
(39, 'Imagen evento: Noche de Comida Picante', NULL),
(40, 'Imagen reseña', NULL),
(41, 'Imagen reseña', NULL),
(42, 'Imagen reseña', NULL),
(43, 'Imagen reseña', NULL),
(44, 'Imagen reseña', NULL),
(45, 'Imagen reseña', NULL),
(46, 'Imagen reseña', NULL),
(47, 'Imagen reseña', NULL),
(48, 'Imagen reseña', NULL),
(49, 'Imagen reseña', NULL),
(50, 'Imagen restaurante', NULL),
(51, 'Imagen restaurante', NULL),
(52, 'Imagen restaurante', NULL),
(53, 'Imagen restaurante', NULL),
(54, 'Imagen restaurante', NULL),
(55, 'Imagen restaurante', NULL),
(56, 'Imagen restaurante', NULL),
(57, 'Imagen restaurante', NULL),
(58, 'Imagen restaurante', NULL),
(59, 'Imagen restaurante', NULL),
(60, 'Imagen Carta Restaurantes General', NULL),
(61, 'Imagen usuario: cliente1', NULL),
(62, 'Imagen usuario: cliente2', NULL),
(63, 'Imagen usuario: cliente3', NULL),
(64, 'Imagen usuario: cliente4', NULL),
(65, 'Imagen usuario: cliente5', NULL),
(66, 'Imagen usuario: cliente6', NULL),
(67, 'Imagen usuario: cliente7', NULL),
(68, 'Imagen usuario: cliente8', NULL),
(69, 'Imagen usuario: cliente9', NULL),
(70, 'Imagen usuario: cliente10', NULL),
(71, 'Imagen registro propietarios index', NULL);


--
-- Estructura de tabla para la tabla `imagenes_resenas`
--

CREATE TABLE `imagenes_resenas` (
  `id_resena` int(12) NOT NULL COMMENT 'Identificador de cada imagen de resena.',
  `id_imagen` int(12) NOT NULL COMMENT 'Identificador de cada resena asociada a la imagen.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la relación imagen de resena.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagenes_resenas`
--

INSERT INTO `imagenes_resenas` (`id_resena`, `id_imagen`, `notas`) VALUES
(10, 40, NULL),
(8, 41, NULL),
(3, 42, NULL),
(2, 43, NULL),
(3, 44, NULL),
(8, 45, NULL),
(8, 46, NULL),
(9, 47, NULL),
(8, 48, NULL),
(10, 49, NULL);

--
-- Estructura de tabla para la tabla `imagenes_restaurantes`
--

CREATE TABLE `imagenes_restaurantes` (
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada imagen aportada por el restaurante.',
  `id_imagen` int(12) NOT NULL COMMENT 'Identificador la imagen.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la relación imagen del restaurante.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagenes_restaurantes`
--

INSERT INTO `imagenes_restaurantes` (`id_restaurante`, `id_imagen`, `notas`) VALUES
(4, 50, NULL),
(2, 51, NULL),
(3, 52, NULL),
(4, 53, NULL),
(4, 54, NULL),
(2, 55, NULL),
(9, 56, NULL),
(4, 57, NULL),
(9, 58, NULL),
(6, 59, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de cada categoria de restaurante.',
  `id_categoria_padre` int(12) DEFAULT NULL COMMENT 'Identificador de la categoría padre NULL si no tiene',
  `nombre_categoria` varchar(200) NOT NULL COMMENT 'Nombre de la categoria.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la categoria.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `id_categoria_padre`, `nombre_categoria`, `notas`) VALUES
(1, NULL, 'Ofertas', NULL),
(2, 4, 'Selección España', NULL),
(3, 4, 'Mejores de la semana', NULL),
(4, 9, 'Prestigio', NULL),
(5, 9, 'Mejores para Vegetarianos', NULL),
(6, 4, 'Ambiente tranquilo', NULL),
(7, 1, 'Familiar', NULL),
(8, 6, 'Cena romántica', NULL),
(9, NULL, 'Premiado', NULL),
(10, 1, 'Sin Gluten económicos', NULL);

--
-- Estructura de tabla para la tabla `categoria_restaurante`
--

CREATE TABLE `categoria_restaurante` (
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de la categoria.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la relacion.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_restaurante`
--

INSERT INTO `categoria_restaurante` (`id_categoria`, `id_restaurante`, `notas`) VALUES
(10, 1, NULL),
(1, 1, NULL),
(7, 1, NULL),
(8, 2, NULL),
(5, 2, NULL),
(9, 3, NULL),
(1, 3, NULL),
(2, 3, NULL),
(4, 4, NULL),
(6, 4, NULL),
(1, 5, NULL),
(10, 5, NULL),
(9, 5, NULL),
(3, 6, NULL),
(5, 6, NULL),
(6, 6, NULL),
(7, 7, NULL),
(3, 7, NULL),
(6, 8, NULL),
(2, 8, NULL),
(9, 9, NULL),
(8, 9, NULL),
(4, 9, NULL),
(3, 9, NULL),
(10, 10, NULL),
(7, 10, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_comida`
--

CREATE TABLE `tipos_comida` (
  `id_tipo_comida` int(12) NOT NULL COMMENT 'Identificador de cada tipo de comida de restaurante.',
  `id_tipo_padre` int(12) DEFAULT NULL COMMENT 'Identificador del tipo de comida padre NULL si no tiene',
  `nombre_tipo` varchar(200) NOT NULL COMMENT 'Nombre del tipo de comida.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el tipo.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_comida`
--

INSERT INTO `tipos_comida` (`id_tipo_comida`, `id_tipo_padre`, `nombre_tipo`, `notas`) VALUES
(1, NULL, 'Asiática', NULL),
(2, 5, 'Sushi', NULL),
(3, NULL, 'Americana', NULL),
(4, 3, 'Hamburguesería', NULL),
(5, 1, 'Japonesa', NULL),
(6, 3, 'Tex-Mex', NULL),
(7, 1, 'India', NULL),
(8, 7, 'Picante', NULL),
(9, 1, 'China', NULL),
(10, 5, 'Ramen', NULL);

--
-- Estructura de tabla para la tabla `tipo_restaurante`
--

CREATE TABLE `tipo_restaurante` (
  `id_tipo_comida` int(12) NOT NULL COMMENT 'Identificador del tipo de comida.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la relacion.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_restaurante`
--

INSERT INTO `tipo_restaurante` (`id_tipo_comida`, `id_restaurante`, `notas`) VALUES
(3, 1, NULL),
(10, 10, NULL),
(7, 3, NULL),
(5, 2, NULL),
(1, 9, NULL),
(5, 8, NULL),
(6, 4, NULL),
(8, 8, NULL),
(8, 10, NULL),
(10, 9, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(12) NOT NULL COMMENT 'Identificador del comentario.',
  `id_usuario` int(12) NULL COMMENT 'Identificador del usuario que hace el comentario.',
  `comentario` TEXT NOT NULL COMMENT 'El comentario en sí',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para los comentarios.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `comentario`, `notas`) VALUES
(1, 4, 'ayuda por favor', NULL),
(2, 7, 'como me convierto en moderador', NULL),
(3, 4, 'donde borro mi perfil', NULL),
(4, 6, 'quiero reportar un evento', NULL),
(5, 7, 'quiero ocultar una reseña, como lo hago', NULL),
(6, 1, 'donde se puede modificar una reserva', NULL),
(7, 9, 'que pasa si cancelo mi reserva', NULL),
(8, 6, 'como cambio mi contraseña', NULL),
(9, 5, 'cuantos restaurantes puedo tener como gestor', NULL),
(10, 8, 'como agrego un gestor a mi restaurante', NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_faq`
--

CREATE TABLE `respuestas_faq` (
  `id_pregunta` int(12) NOT NULL COMMENT 'Identificador de la pregunta FAQ.',
  `pregunta` varchar(500) NOT NULL COMMENT 'Pregunta a responder.',
  `respuesta` varchar(500) NOT NULL COMMENT 'Respuesta dada.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para las preguntas FAQ.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas_faq`
--

INSERT INTO `respuestas_faq` (`id_pregunta`, `pregunta`, `respuesta`, `notas`) VALUES
(1, '¿Cómo puedo hacer una reserva en su sitio web?', 'Para hacer una reserva, simplemente visita nuestra página de reservas en línea. Selecciona la fecha, hora y número de personas, y ¡listo!', NULL),
(2, '¿Ofrecen opciones de entrega a domicilio?', 'Sí, ofrecemos servicio de entrega a domicilio. Puedes realizar tu pedido directamente desde nuestra página web y recibir deliciosos platillos en la comodidad de tu hogar.', NULL),
(3, '¿Cómo puedo encontrar eventos y promociones actuales?', 'Consulta nuestra sección de "Eventos y Promociones" en la página principal. Allí encontrarás información actualizada sobre eventos especiales, promociones y ofertas exclusivas.', NULL),
(4, '¿Tienen un programa de lealtad o membresía?', 'Sí, ofrecemos un programa de lealtad. Regístrate en nuestra web para obtener beneficios exclusivos, acumular puntos con cada visita y disfrutar de descuentos especiales.', NULL),
(5, '¿Dónde puedo encontrar el menú actualizado del restaurante?', 'Encuentra nuestro menú más reciente en la sección "Menú" de nuestra web. Actualizamos regularmente nuestras ofertas y platos para ofrecerte lo mejor.', NULL),
(6, '¿Puedo solicitar alimentos especiales o personalizar mi pedido?', 'Sí, puedes personalizar tu pedido según tus preferencias. Utiliza la función de personalización en línea o comunícate con nuestro equipo a través de la sección de "Contacto" para solicitudes especiales.', NULL),
(7, '¿Cómo puedo dejar comentarios o reseñas sobre mi experiencia?', 'Apreciamos tus comentarios. Visita la sección "Opiniones" en nuestra web para dejar tus comentarios y reseñas. Tu retroalimentación es fundamental para mejorar nuestros servicios.', NULL),
(8, '¿Ofrecen opciones vegetarianas o para dietas especiales?', 'Sí, contamos con opciones vegetarianas y platos adaptados a diversas dietas. Explora nuestra sección de "Menú Especial" para descubrir nuestras opciones saludables y deliciosas.', NULL),
(9, '¿Tienen un servicio de asistencia en línea?', 'Sí, ofrecemos soporte en línea a través de nuestro chat en vivo. Puedes hacer preguntas, resolver problemas o recibir asistencia instantánea durante tu visita a nuestra web.', NULL),
(10, '¿Cómo puedo recibir notificaciones sobre nuevas ofertas y eventos?', 'Regístrate para recibir nuestro boletín informativo. Mantente al tanto de las últimas noticias, ofertas exclusivas y eventos emocionantes al suscribirte a través de nuestra web.', NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `nombre_variable` varchar(50) NOT NULL COMMENT 'Nombre de la variable.',
  `valor_variable` varchar(50) NOT NULL COMMENT 'Valor de la variable.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para las variables.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`nombre_variable`, `valor_variable`, `notas`) VALUES
('maxLoginAttempts', '4', 'Número máximo de intentos que tendrá el usuario para hacer login.'),
('loginBlockedUntil', '10', 'Tiempo que deberá essperar el usuario para que se le debloquee el login de nuevo.'),
('numElemsCONF', '10', 'Número de elementos que se mostrarán en la administración de configuraciones.'),
('numElemsBusquedaFiltrada', '8', 'Número de restaurantes que se mostrarán en la vista pública de búsqueda filtrada.'),
('numElemsReservas', '10', 'Número de reserva que se mostrarán en la administración de reservas.'),
('numElemsCAT', '10', 'Número de elementos que se mostrarán en la administración de categorías.'),
('numElemsFAQ', '10', 'Número de elementos que se mostrarán en la administración de categorías.'),
('numElemsIMG', '10', 'Número de elementos que se mostrarán en la administración de categorías.'),
('minCarruselesPortada', '3', 'Número de carruseles que se muestran en la portada al entrar.'),
('prueba', '123', NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id_log` int(12) NOT NULL COMMENT 'Identificador del log.',
  `tipo_log` varchar(100) NOT NULL COMMENT 'Tipo del log.',
  `texto_log` varchar(500) NOT NULL COMMENT 'Texto informatico dado.',
  `fecha_hora` varchar(50) NOT NULL COMMENT 'Fecha y hora del log.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para los log.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id_log`, `tipo_log`, `texto_log`, `fecha_hora`, `notas`) VALUES
(1, 'LOG_TIPO 1', '', '2015-08-27 14:59:04', NULL),
(2, 'LOG_TIPO 2', '', '1982-03-11 10:45:27', NULL),
(3, 'LOG_TIPO 3', '', '1987-06-22 23:04:26', NULL),
(4, 'LOG_TIPO 4', '', '1982-11-11 23:21:36', NULL),
(5, 'LOG_TIPO 5', '', '1985-03-25 13:09:22', NULL),
(6, 'LOG_TIPO 6', '', '2004-07-09 06:03:03', NULL),
(7, 'LOG_TIPO 7', '', '2006-06-15 03:26:09', NULL),
(8, 'LOG_TIPO 8', '', '2017-05-12 13:00:22', NULL),
(9, 'LOG_TIPO 9', '', '2011-10-08 15:36:51', NULL),
(10, 'LOG_TIPO 10', '', '1971-12-25 09:17:23', NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` int(12) NOT NULL COMMENT 'Identificador de cada resena.',
  `titulo_resena` varchar(100) DEFAULT NULL COMMENT 'Título de la resena.',
  `cuerpo_resena` varchar(500) DEFAULT NULL COMMENT 'Cuerpo de la resena.',
  `puntuacion` tinyint(1) NOT NULL COMMENT 'Puntuación de 0-5.',
  `precio_x_persona` float DEFAULT NULL COMMENT 'Precio por persona gastado.',
  `incidencia_resena` tinyint(1) DEFAULT NULL COMMENT 'Marca de incidencia en una resena: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `fecha_resena` date NOT NULL COMMENT 'Fecha de la resena.',
  `id_usuario` int(12) NOT NULL COMMENT 'Referencia del usuario asociado a la resena.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la resena.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la resena.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resenas`
--

INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Experiencia Aceptable', 'Tuve una experiencia aceptable en el restaurante. La comida estaba bien, pero creo que hay áreas en las que podrían mejorar. El ambiente era agradable y el servicio fue amable.', 3, NULL, 0, '2023-12-26', 1, 1, NULL),
(2, 'Buena Relación Calidad-Precio', 'Me pareció que la relación calidad-precio era justa. Los precios estaban acorde con la calidad de la comida y el servicio ofrecido. Pagué alrededor de $14.68 por persona.', 4, 14.5, 0, '2024-01-05', 2, 9, NULL),
(3, 'Servicio Excelente', 'El servicio fue excelente. El personal fue amable y atento, haciendo que mi experiencia fuera agradable. Sin duda, volvería a visitar este restaurante.', 1, NULL, NULL, '2024-01-03', 3, 0, NULL),
(4, 'Comida Bien, Precio Elevado', 'La comida estuvo bien, pero sentí que el precio por persona era un poco elevado para lo que recibí. Pagué alrededor de $31 y esperaba más por ese precio.', 3, 31, 0, '2024-01-11', 4, 6, NULL),
(5, 'Atención al Cliente Destacada', 'El personal fue muy atento y la atención al cliente fue destacada. Me sentí bien atendido durante toda mi visita. El restaurante tiene un buen servicio al cliente.', 3, NULL, 0, '2023-12-24', 5, 10, NULL),
(6, 'Deliciosa Comida', 'La comida estaba deliciosa y bien preparada. Los sabores eran sorprendentes, y la presentación también era atractiva. Definitivamente, recomendaría probar sus platos.', 5, 26, 0, '2024-01-17', 6, 8, NULL),
(7, 'Visita Sin Incidencias', 'No hubo ninguna incidencia durante mi visita. Todo transcurrió sin problemas, y la experiencia fue positiva en general.', 2, NULL, 0, '2024-01-10', 7, 6, NULL),
(8, 'Experiencia General Positiva', 'Mi experiencia general fue positiva. Disfruté de la comida, el ambiente y el servicio. Sin embargo, creo que siempre hay áreas en las que pueden mejorar.', 0, 8, 0, '2024-01-16', 8, 5, NULL),
(9, 'Visita Sin Problemas', 'Durante mi visita, no tuve problemas específicos. Todo fue bien, y la experiencia fue agradable. El restaurante brindó un servicio satisfactorio.', 1, NULL, 0, '2024-01-18', 9, 2, NULL),
(10, 'Excelente Calidad de Comida', 'La calidad de la comida fue excelente. Los sabores eran intensos y bien equilibrados. Considero que la comida justificó el precio pagado, que fue alrededor de $7.5 por persona.', 5, 7.5, 0, '2024-01-10', 10, 8, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(12) NOT NULL COMMENT 'Identificador de cada reserva.',
  `datos_pago` varchar(100) NOT NULL COMMENT 'Datos de pago dados por el cliente.',
  `num_comensales` int(3) NOT NULL COMMENT 'Número de comensales para la reserva.',
  `fecha_reserva` date NOT NULL COMMENT 'Fecha de la reserva.',
  `hora_reserva` varchar(5) NOT NULL COMMENT 'Hora seleccionada por el cliente para la reserva (Ej: 21:00).',
  `id_usuario` int(12) NOT NULL COMMENT 'Referencia del usuario asociado a la reserva.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la reserva.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la reserva.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_usuario`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 502030733906', 2, '2024-01-19', '21:00', 1, 1, NULL),
(2, 'Tarjeta 343030311814761', 6, '2024-02-15', '11:00', 2, 2, NULL),
(3, 'Tarjeta 4521750392861607', 4, '2024-01-20', '20:00', 3, 3, NULL),
(4, 'Tarjeta 38550649830650', 2, '2024-02-13', '10:00', 4, 4, NULL),
(5, 'Tarjeta 341877916231698', 1, '2024-01-28', '15:00', 5, 5, NULL),
(6, 'Tarjeta 2461887601090978', 9, '2024-02-15', '12:00', 6, 6, NULL),
(7, 'Tarjeta 36803166952205', 2, '2024-02-16', '21:00', 7, 7, NULL),
(8, 'Tarjeta 213190454290463', 9, '2024-02-11', '11:00', 8, 8, NULL),
(9, 'Tarjeta 676195221467', 5, '2024-02-15', '22:00', 9, 9, NULL),
(10, 'Tarjeta 341511082668611', 3, '2024-02-15', '21:30', 10, 10, NULL),
(11, 'Tarjeta 502030733906', 2, '2024-01-19', '11:30', 1, 11, NULL),
(12, 'Tarjeta 343030311814761', 6, '2024-02-15', '9:00', 2, 12, NULL),
(13, 'Tarjeta 4521750392861607', 4, '2024-01-20', '8:00', 3, 13, NULL),
(14, 'Tarjeta 38550649830650', 2, '2024-02-13', '20:30', 4, 14, NULL),
(15, 'Tarjeta 341877916231698', 1, '2024-01-28', '13:30', 5, 15, NULL),
(16, 'Tarjeta 2461887601090978', 9, '2024-02-15', '14:00', 6, 16, NULL),
(17, 'Tarjeta 36803166952205', 2, '2024-02-16', '15:30', 7, 17, NULL),
(18, 'Tarjeta 213190454290463', 9, '2024-02-11', '22:00', 8, 18, NULL),
(19, 'Tarjeta 676195221467', 5, '2024-04-15', '12:00', 9, 1, NULL),
(20, 'Tarjeta 502030733906', 3, '2022-02-15', '21:00', 10, 2, NULL),
(21, 'Tarjeta 502030733906', 4, '2022-02-15', '11:00', 1, 3, NULL),
(22, 'Tarjeta 502030733906', 5, '2022-12-05', '10:30', 1, 4, NULL),
(23, 'Tarjeta 502030733906', 3, '2024-01-01', '22:00', 1, 5, NULL),
(24, 'Tarjeta 502030733906', 2, '2024-03-10', '21:30', 1, 6, NULL),
(25, 'Tarjeta 502030733906', 1, '2021-05-15', '15:00', 1, 7, NULL),
(26, 'Tarjeta 502030733906', 2, '2021-10-25', '14:00', 1, 8, NULL),
(27, 'Tarjeta 502030733906', 3, '2020-08-30', '13:30', 1, 8, NULL),
(28, 'Tarjeta 502030733906', 3, '2024-01-30', '13:30', 1, 8, NULL),
(29, 'Tarjeta 343030311814761', 3, '2022-02-15', '21:00', 2, 2, NULL),
(30, 'Tarjeta 343030311814761', 4, '2022-02-15', '11:00', 2, 3, NULL),
(31, 'Tarjeta 343030311814761', 5, '2022-12-05', '10:30', 2, 4, NULL),
(32, 'Tarjeta 343030311814761', 3, '2024-01-01', '22:00', 2, 5, NULL),
(33, 'Tarjeta 343030311814761', 2, '2024-03-10', '21:30', 2, 6, NULL),
(34, 'Tarjeta 343030311814761', 1, '2021-05-15', '15:00', 2, 7, NULL),
(35, 'Tarjeta 343030311814761', 2, '2021-10-25', '14:00', 2, 8, NULL),
(36, 'Tarjeta 343030311814761', 3, '2020-08-30', '13:30', 2, 8, NULL),
(37, 'Tarjeta 343030311814761', 3, '2024-01-30', '13:30', 2, 8, NULL);



-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuesta` int(12) NOT NULL COMMENT 'Identificador de cada respuesta de resena.',
  `id_respuesta_padre` int(12) DEFAULT NULL COMMENT 'Identificador de la respuesta padre NULL si no tiene',
  `texto_respuesta` varchar(200) NOT NULL COMMENT 'Texto de la respuesta.',
  `incidencia_respuesta` tinyint(1) DEFAULT NULL COMMENT 'Marca de incidencia en una respuesta: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `id_resena` int(12) NOT NULL COMMENT 'Identificador de cada resena asociada a la respuesta.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la respuesta de resena.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_respuesta`, `id_respuesta_padre`, `texto_respuesta`, `incidencia_respuesta`, `id_resena`, `notas`) VALUES
(1, NULL, '¡Iré a probarlo!', 0, 10, NULL),
(2, NULL, 'Gracias por la recomendación.', 0, 3, NULL),
(3, NULL, '¡Interesante! Tomaré en cuenta esa sugerencia.', 0, 9, NULL),
(4, NULL, 'Buena observación. Estoy de acuerdo contigo.', 0, 10, NULL),
(5, NULL, '¡Eso suena genial! ¿Hay algún plato que recomiendes especialmente?', 0, 2, NULL),
(6, NULL, '¡Definitivamente lo consideraré en mi próxima visita!', 0, 4, NULL),
(7, 2, '¿Fuiste a probar?.', 0, 6, NULL),
(8, 2, 'Cómo fue tu experiencia', 0, 8, NULL),
(9, 5, '¿Qué plato elegiste?', 0, 2, NULL),
(10, 3, 'Deja tu reseña cunado vayas.', 0, 7, NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Estructura para la tabla horario
--

CREATE TABLE horario (
  id_horario int(12) NOT NULL COMMENT 'Identificador de cada horario.',
  id_restaurante int(12) NOT NULL COMMENT 'Identificador del restaurante',
  hora_apertura TIME NOT NULL COMMENT 'Hora en la que inicia el servicio.',
  hora_cierre TIME NOT NULL COMMENT 'Hora en la que termina el servicio.',
  dia ENUM('lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo') NOT NULL COMMENT 'Día de la semana en que se aplica este horario.',
  notas text DEFAULT NULL COMMENT 'Notas internas para los horarios.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_horario`,`id_restaurante`, `hora_apertura`, `hora_cierre`, `dia`, `notas`) VALUES
(1, 1, '9:00', '16:30', 'martes', NULL),
(2, 1, '20:00', '23:00', 'martes', NULL),
(3, 1, '9:00', '16:30', 'miércoles', NULL),
(4, 1, '20:00', '23:00', 'miércoles', NULL),
(5, 1, '9:00', '16:30', 'jueves', NULL),
(6, 1, '20:00', '23:00', 'jueves', NULL),
(7, 1, '9:00', '16:30', 'viernes', NULL),
(8, 1, '9:00', '16:30', 'sábado', NULL),
(9, 1, '20:00', '23:00', 'sábado', NULL),
(10, 1, '9:00', '16:30', 'domingo', NULL),
(11, 1, '20:00', '23:00', 'domingo', NULL),
(12, 2, '9:00', '16:30', 'martes', NULL),
(13, 2, '20:00', '23:00', 'martes', NULL),
(14, 2, '9:00', '16:30', 'miércoles', NULL),
(15, 2, '20:00', '23:00', 'miércoles', NULL),
(16, 2, '9:00', '16:30', 'jueves', NULL),
(17, 2, '20:00', '23:00', 'jueves', NULL),
(18, 2, '9:00', '16:30', 'viernes', NULL),
(19, 2, '20:00', '23:00', 'viernes', NULL),
(20, 2, '9:00', '16:30', 'sábado', NULL),
(21, 2, '20:00', '23:00', 'sábado', NULL),
(22, 2, '9:00', '16:30', 'domingo', NULL),
(23, 3, '9:00', '16:30', 'martes', NULL),
(24, 3, '20:00', '23:00', 'martes', NULL),
(25, 3, '9:00', '16:30', 'miércoles', NULL),
(26, 3, '20:00', '23:00', 'miércoles', NULL),
(27, 3, '9:00', '16:30', 'jueves', NULL),
(28, 3, '20:00', '23:00', 'jueves', NULL),
(29, 3, '20:00', '23:00', 'viernes', NULL),
(30, 3, '9:00', '16:30', 'sábado', NULL),
(31, 3, '20:00', '23:00', 'sábado', NULL),
(32, 3, '9:00', '16:30', 'domingo', NULL),
(33, 3, '20:00', '23:00', 'domingo', NULL),
(34, 4, '9:00', '16:30', 'martes', NULL),
(35, 4, '20:00', '23:00', 'martes', NULL),
(36, 4, '9:00', '16:30', 'miércoles', NULL),
(37, 4, '20:00', '23:00', 'miércoles', NULL),
(38, 4, '9:00', '16:30', 'jueves', NULL),
(39, 4, '20:00', '23:00', 'jueves', NULL),
(40, 4, '9:00', '16:30', 'viernes', NULL),
(41, 4, '20:00', '23:00', 'viernes', NULL),
(42, 4, '9:00', '16:30', 'sábado', NULL),
(43, 4, '20:00', '23:00', 'sábado', NULL),
(44, 4, '9:00', '16:30', 'domingo', NULL),
(45, 4, '20:00', '23:00', 'domingo', NULL),
(46, 5, '9:00', '16:30', 'martes', NULL),
(47, 5, '20:00', '23:00', 'martes', NULL),
(48, 5, '9:00', '16:30', 'miércoles', NULL),
(49, 5, '20:00', '23:00', 'miércoles', NULL),
(50, 5, '9:00', '16:30', 'jueves', NULL),
(51, 5, '20:00', '23:00', 'jueves', NULL),
(52, 5, '9:00', '16:30', 'viernes', NULL),
(53, 5, '20:00', '23:00', 'viernes', NULL),
(54, 5, '9:00', '16:30', 'sábado', NULL),
(55, 5, '20:00', '23:00', 'sábado', NULL),
(56, 5, '9:00', '16:30', 'domingo', NULL),
(57, 5, '20:00', '23:00', 'domingo', NULL),
(58, 6, '9:00', '16:30', 'martes', NULL),
(59, 6, '20:00', '23:00', 'martes', NULL),
(60, 6, '9:00', '16:30', 'miércoles', NULL),
(61, 6, '20:00', '23:00', 'miércoles', NULL),
(62, 6, '9:00', '16:30', 'jueves', NULL),
(63, 6, '20:00', '23:00', 'jueves', NULL),
(64, 6, '9:00', '16:30', 'viernes', NULL),
(65, 6, '20:00', '23:00', 'viernes', NULL),
(66, 6, '9:00', '16:30', 'sábado', NULL),
(67, 6, '20:00', '23:00', 'sábado', NULL),
(68, 6, '9:00', '16:30', 'domingo', NULL),
(69, 6, '20:00', '23:00', 'domingo', NULL),
(70, 7, '9:00', '16:30', 'martes', NULL),
(71, 7, '20:00', '23:00', 'martes', NULL),
(72, 7, '9:00', '16:30', 'miércoles', NULL),
(73, 7, '20:00', '23:00', 'miércoles', NULL),
(74, 7, '9:00', '16:30', 'jueves', NULL),
(75, 7, '20:00', '23:00', 'jueves', NULL),
(76, 7, '9:00', '16:30', 'viernes', NULL),
(77, 7, '20:00', '23:00', 'viernes', NULL),
(78, 7, '9:00', '16:30', 'sábado', NULL),
(79, 7, '20:00', '23:00', 'sábado', NULL),
(80, 7, '9:00', '16:30', 'domingo', NULL),
(81, 7, '20:00', '23:00', 'domingo', NULL),
(82, 8, '9:00', '16:30', 'martes', NULL),
(83, 8, '20:00', '23:00', 'martes', NULL),
(84, 8, '9:00', '16:30', 'miércoles', NULL),
(85, 8, '20:00', '23:00', 'miércoles', NULL),
(86, 8, '9:00', '16:30', 'jueves', NULL),
(87, 8, '20:00', '23:00', 'jueves', NULL),
(88, 8, '9:00', '16:30', 'viernes', NULL),
(89, 8, '20:00', '23:00', 'viernes', NULL),
(90, 8, '9:00', '16:30', 'sábado', NULL),
(91, 8, '20:00', '23:00', 'sábado', NULL),
(92, 8, '9:00', '16:30', 'domingo', NULL),
(93, 8, '20:00', '23:00', 'domingo', NULL),
(94, 9, '9:00', '16:30', 'martes', NULL),
(95, 9, '20:00', '23:00', 'martes', NULL),
(96, 9, '9:00', '16:30', 'miércoles', NULL),
(97, 9, '20:00', '23:00', 'miércoles', NULL),
(98, 9, '9:00', '16:30', 'jueves', NULL),
(99, 9, '20:00', '23:00', 'jueves', NULL),
(100, 9, '9:00', '16:30', 'viernes', NULL),
(101, 9, '20:00', '23:00', 'viernes', NULL),
(102, 9, '9:00', '16:30', 'sábado', NULL),
(103, 9, '20:00', '23:00', 'sábado', NULL),
(104, 9, '9:00', '16:30', 'domingo', NULL),
(105, 9, '20:00', '23:00', 'domingo', NULL),
(106, 10, '9:00', '16:30', 'martes', NULL),
(107, 10, '20:00', '23:00', 'martes', NULL),
(108, 10, '9:00', '16:30', 'miércoles', NULL),
(109, 10, '20:00', '23:00', 'miércoles', NULL),
(110, 10, '9:00', '16:30', 'jueves', NULL),
(111, 11, '9:00', '16:30', 'martes', NULL),
(112, 11, '20:00', '23:00', 'martes', NULL),
(113, 11, '9:00', '16:30', 'miércoles', NULL),
(114, 11, '20:00', '23:00', 'miércoles', NULL),
(115, 11, '9:00', '16:30', 'jueves', NULL),
(116, 12, '9:00', '16:30', 'martes', NULL),
(117, 12, '20:00', '23:00', 'martes', NULL),
(118, 12, '9:00', '16:30', 'miércoles', NULL),
(119, 12, '20:00', '23:00', 'miércoles', NULL),
(120, 12, '9:00', '16:30', 'jueves', NULL),
(121, 13, '9:00', '16:30', 'martes', NULL),
(122, 13, '20:00', '23:00', 'martes', NULL),
(123, 13, '9:00', '16:30', 'miércoles', NULL),
(124, 13, '20:00', '23:00', 'miércoles', NULL),
(125, 13, '9:00', '16:30', 'jueves', NULL),
(126, 14, '9:00', '16:30', 'martes', NULL),
(127, 14, '20:00', '23:00', 'martes', NULL),
(128, 14, '9:00', '16:30', 'miércoles', NULL),
(129, 14, '20:00', '23:00', 'miércoles', NULL),
(130, 14, '9:00', '16:30', 'jueves', NULL),
(131, 15, '9:00', '16:30', 'martes', NULL),
(132, 15, '20:00', '23:00', 'martes', NULL),
(133, 15, '9:00', '16:30', 'miércoles', NULL),
(134, 15, '20:00', '23:00', 'miércoles', NULL),
(135, 15, '9:00', '16:30', 'jueves', NULL),
(136, 16, '9:00', '16:30', 'martes', NULL),
(137, 16, '20:00', '23:00', 'martes', NULL),
(138, 16, '9:00', '16:30', 'miércoles', NULL),
(139, 16, '20:00', '23:00', 'miércoles', NULL),
(140, 16, '9:00', '16:30', 'jueves', NULL),
(141, 17, '9:00', '16:30', 'martes', NULL),
(142, 17, '20:00', '23:00', 'martes', NULL),
(143, 17, '9:00', '16:30', 'miércoles', NULL),
(144, 17, '20:00', '23:00', 'miércoles', NULL),
(145, 17, '9:00', '16:30', 'jueves', NULL),
(146, 18, '9:00', '16:30', 'martes', NULL),
(147, 18, '20:00', '23:00', 'martes', NULL),
(148, 18, '9:00', '16:30', 'miércoles', NULL),
(149, 18, '20:00', '23:00', 'miércoles', NULL),
(150, 18, '9:00', '16:30', 'jueves', NULL);

-- ---------------------------------------------------------------------------------------------------------------

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_restaurante`
--
ALTER TABLE `categoria_restaurante`
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`nombre_variable`);

--
-- Indices de la tabla `control_restaurantes`
--
ALTER TABLE `control_restaurantes`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_restaurante` (`id_restaurante`),
  ADD KEY `id_imagen_promocional` (`id_imagen_promocional`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `imagenes_resenas`
--
ALTER TABLE `imagenes_resenas`
  ADD KEY `id_resena` (`id_resena`),
  ADD KEY `id_imagen` (`id_imagen`);

--
-- Indices de la tabla `imagenes_restaurantes`
--
ALTER TABLE `imagenes_restaurantes`
  ADD KEY `id_restaurante` (`id_restaurante`),
  ADD KEY `id_imagen` (`id_imagen`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `moderadores`
--
ALTER TABLE `moderadores`
  ADD PRIMARY KEY (`id_moderador`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_resena` (`id_resena`);

--
-- Indices de la tabla `respuestas_faq`
--
ALTER TABLE `respuestas_faq`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`id_restaurante`),
  ADD KEY `id_foto_restaurante` (`id_foto_restaurante`),
  ADD KEY `id_carta` (`id_carta`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `tipos_comida`
--
ALTER TABLE `tipos_comida`
  ADD PRIMARY KEY (`id_tipo_comida`);

--
-- Indices de la tabla `tipo_restaurante`
--
ALTER TABLE `tipo_restaurante`
  ADD KEY `id_tipo_comida` (`id_tipo_comida`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `nombre_usuario_UNIQUE` (`nombre_usuario`),
  ADD KEY `id_foto_usuario` (`id_foto_usuario`);

-- 
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);


--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada categoria de restaurante.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del comentario.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada evento de restaurante.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de imagen.', AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del log.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `moderadores`
--
ALTER TABLE `moderadores`
  MODIFY `id_moderador` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada moderador.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada resena.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada reserva.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id_respuesta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada respuesta de resena.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `respuestas_faq`
--
ALTER TABLE `respuestas_faq`
  MODIFY `id_pregunta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la pregunta FAQ.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `id_restaurante` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada restaurante.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipos_comida`
--
ALTER TABLE `tipos_comida`
  MODIFY `id_tipo_comida` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada tipo de comida de restaurante.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuario.', AUTO_INCREMENT=32;

ALTER TABLE `horario`
  MODIFY `id_horario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada horario.', AUTO_INCREMENT=11;	

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categoria_restaurante`
--
ALTER TABLE `categoria_restaurante`
  ADD CONSTRAINT `categoria_restaurante_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categoria_restaurante_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `control_restaurantes`
--
ALTER TABLE `control_restaurantes`
  ADD CONSTRAINT `control_restaurantes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `control_restaurantes_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_imagen_promocional`) REFERENCES `imagenes` (`id_imagen`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_resenas`
--
ALTER TABLE `imagenes_resenas`
  ADD CONSTRAINT `imagenes_resenas_ibfk_1` FOREIGN KEY (`id_resena`) REFERENCES `resenas` (`id_resena`),
  ADD CONSTRAINT `imagenes_resenas_ibfk_2` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`);

--
-- Filtros para la tabla `imagenes_restaurantes`
--
ALTER TABLE `imagenes_restaurantes`
  ADD CONSTRAINT `imagenes_restaurantes_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`),
  ADD CONSTRAINT `imagenes_restaurantes_ibfk_2` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`);

--
-- Filtros para la tabla `moderadores`
--
ALTER TABLE `moderadores`
  ADD CONSTRAINT `moderadores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`id_resena`) REFERENCES `resenas` (`id_resena`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD CONSTRAINT `restaurantes_ibfk_1` FOREIGN KEY (`id_foto_restaurante`) REFERENCES `imagenes` (`id_imagen`),
  ADD CONSTRAINT `restaurantes_ibfk_2` FOREIGN KEY (`id_carta`) REFERENCES `imagenes` (`id_imagen`),
  ADD CONSTRAINT `restaurantes_ibfk_3` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tipo_restaurante`
--
ALTER TABLE `tipo_restaurante`
  ADD CONSTRAINT `tipo_restaurante_ibfk_1` FOREIGN KEY (`id_tipo_comida`) REFERENCES `tipos_comida` (`id_tipo_comida`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_restaurante_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_foto_usuario`) REFERENCES `imagenes` (`id_imagen`);
COMMIT;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
