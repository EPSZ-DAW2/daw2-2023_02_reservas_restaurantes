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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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
(1, NULL, 'Categoria1', NULL),
(2, NULL, 'Categoria2', NULL),
(3, NULL, 'Categoria3', NULL),
(4, NULL, 'Categoria4', NULL),
(5, NULL, 'Categoria5', NULL),
(6, NULL, 'Categoria6', NULL),
(7, 2, 'Categoria7', NULL),
(8, 2, 'Categoria8', NULL),
(9, 3, 'Categoria9', NULL),
(10, 3, 'Categoria10', NULL);

-- --------------------------------------------------------

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
(9, 2, NULL),
(6, 4, NULL),
(4, 4, NULL),
(1, 7, NULL),
(1, 3, NULL),
(10, 7, NULL),
(1, 4, NULL),
(1, 3, NULL),
(10, 4, NULL),
(8, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(12) NOT NULL COMMENT 'Identificador del comentario.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador del usuario que hace el comentario.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para los comentarios.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `notas`) VALUES
(1, 4, NULL),
(2, 7, NULL),
(3, 4, NULL),
(4, 6, NULL),
(5, 7, NULL),
(6, 1, NULL),
(7, 9, NULL),
(8, 6, NULL),
(9, 5, NULL),
(10, 8, NULL);

-- --------------------------------------------------------

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
('along', 'firm', NULL),
('another', 'item', NULL),
('hair', 'two', NULL),
('mind', 'skill', NULL),
('Mr', 'law', NULL),
('organization', 'understand', NULL),
('project', 'recently', NULL),
('require', 'performance', NULL),
('traditional', 'all', NULL),
('without', 'receive', NULL);

-- --------------------------------------------------------

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
(11, 1, NULL),
(12, 6, NULL),
(13, 8, NULL),
(14, 2, NULL),
(15, 2, NULL),
(16, 7, NULL),
(17, 6, NULL),
(18, 9, NULL),
(19, 2, NULL),
(20, 4, NULL);

-- --------------------------------------------------------

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
(1, 'Evento 1', 'Free social hard they keep catch. Arm worker term with my rise. Record teacher whole sell truth.\nAt decade anyone. Throw include feeling win participant.\nResult power yard. Security personal call population. Focus I may.\nPattern read give like result baby hundred public. Thank imagine shake station design focus. Dark figure free view everybody.\nMean season piece case attorney often difference. Word why case feeling decade.', '2023-12-22', 21, NULL, 1, NULL),
(2, 'Evento 2', 'Author them yeah test director how wonder hotel. So choose have cause receive fund lawyer.\nFire condition chance. Believe focus door must forget at financial machine. Measure health memory all scene action.\nProbably student turn in without. Like onto them animal week detail change why.\nOut else evening on pretty maintain. Half next itself throw. Sense term garden gun nice challenge left.\nEverything magazine road respond stand message.\nPurpose choose company fall. May generation wide skin.', '2024-01-16', 22, 0, 1, NULL),
(3, 'Evento 3', 'Which school close soon week smile. Often situation present magazine as.\nWhen participant listen. Radio politics cause son.\nFive although customer view that turn. Our one black from beat several. Soldier town fund today deep.\nRecent capital record song. Number interest fear result.\nWhole save world approach he cultural. Billion ok chair think.\nAround consumer through yet wide option. Capital place consider attorney positive seek positive. When treat public raise southern remember.', '2024-01-15', 23, NULL, 6, NULL),
(4, 'Evento 4', 'Improve prepare bank simply not occur health. Better military our fish treatment page blue.\nNumber national several thank be shoulder newspaper. Power husband natural letter safe.\nEffort nearly east participant early allow. Million process herself eight medical easy.\nParticularly bit laugh technology lay put join. Now something certainly resource alone. Sit actually without production.\nMedical blood air science. Career pay begin since director. From detail matter already true few attorney.', '2024-01-10', 24, 0, 5, NULL),
(5, 'Evento 5', 'Figure forget know determine. Gun experience camera board order likely film. Baby treatment mention level beat fire.\nPlan human owner impact. Executive nor age spend lose under. Chance send choice hour human manage ground.\nCoach impact with key moment. East machine often cut data subject control.\nEmployee recently imagine prepare scientist. Sell wish receive run sea improve less. Far read pick finally ahead whom sign physical. Truth tree skin.', '2024-01-05', 25, NULL, 8, NULL),
(6, 'Evento 6', 'White shoulder adult campaign expert chance.\nBase according pay fear who. Amount there concern worker pretty part base him. Subject evening movie help television particularly.\nProduce drive ever miss election song. Generation same tree phone city natural. Hospital professor research.\nOfficer strong two network. Happen technology their both short easy.\nAt everybody fast especially Congress stuff improve. Chair accept without hospital minute old.', '2023-12-22', 26, 0, 1, NULL),
(7, 'Evento 7', 'Represent kid surface simple three impact myself black. Discover small until treatment customer whose today of. Dream gun stage attorney anyone look travel.\nRead move it then class. Beat building fight reflect. Want so western.\nTrade heavy year me their second. Late hear adult thing light main. Same everyone force part reveal simply foot.\nGreen avoid yet stand. Day member describe condition.', '2024-01-14', 27, NULL, 3, NULL),
(8, 'Evento 8', 'Surface fine activity have. Total go student.\nFact season message. Wear own leader here. Detail large change music exist senior.\nIdentify realize result smile remember small. Them save over international final matter office evening.\nAllow police free building old age. Police share mouth whether soldier past.\nMean answer at arm enter threat.\nNorth be thank identify watch cup environment court. History enjoy skin building.', '2023-12-28', 28, 2, 7, NULL),
(9, 'Evento 9', 'Fast wide law high. Matter avoid social. Live without situation call may page.\nMay central other house majority model. Know both share.\nWhy notice pull explain. Everybody question unit set way three consumer. Method professional blood experience oil might. Way seat article time travel.\nFire federal half defense. Consumer floor brother take beyond line. Seven new upon vote face.', '2023-12-29', 29, NULL, 1, NULL),
(10, 'Evento 10', 'High season main music person drop. Close recognize improve within room kind.\nPrepare gas speak then despite life smile sense. Catch between present affect.\nBusiness wonder few land. Culture material mouth responsibility watch discuss buy. Media tend military provide challenge nearly bring.\nSmile Mrs both school run much. Recent society or worry hundred start when.\nGreen price police discussion another east recent choose. Street ball read tend.', '2024-01-08', 30, 2, 10, NULL);

-- --------------------------------------------------------

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
(10, 10, NULL);

-- --------------------------------------------------------

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
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL),
(9, NULL, NULL),
(10, NULL, NULL),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL),
(21, NULL, NULL),
(22, NULL, NULL),
(23, NULL, NULL),
(24, NULL, NULL),
(25, NULL, NULL),
(26, NULL, NULL),
(27, NULL, NULL),
(28, NULL, NULL),
(29, NULL, NULL),
(30, NULL, NULL),
(31, NULL, NULL),
(32, NULL, NULL),
(33, NULL, NULL),
(34, NULL, NULL),
(35, NULL, NULL),
(36, NULL, NULL),
(37, NULL, NULL),
(38, NULL, NULL),
(39, NULL, NULL),
(40, NULL, NULL),
(41, NULL, NULL),
(42, NULL, NULL),
(43, NULL, NULL),
(44, NULL, NULL),
(45, NULL, NULL),
(46, NULL, NULL),
(47, NULL, NULL),
(48, NULL, NULL),
(49, NULL, NULL),
(50, NULL, NULL);

-- --------------------------------------------------------

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
(10, 41, NULL),
(8, 42, NULL),
(3, 43, NULL),
(2, 44, NULL),
(3, 45, NULL),
(8, 46, NULL),
(8, 47, NULL),
(9, 48, NULL),
(8, 49, NULL),
(10, 50, NULL);

-- --------------------------------------------------------

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
(4, 31, NULL),
(2, 32, NULL),
(3, 33, NULL),
(4, 34, NULL),
(4, 35, NULL),
(2, 36, NULL),
(9, 37, NULL),
(4, 38, NULL),
(9, 39, NULL),
(6, 40, NULL);

-- --------------------------------------------------------

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
(1, 'LOG_TIPO 1', 'Detail while weight speech some for tough concern know room lose huge image.', '2015-08-27 14:59:04', NULL),
(2, 'LOG_TIPO 2', 'Significant his candidate usually father current one seat worker letter on rest plant above allow the.', '1982-03-11 10:45:27', NULL),
(3, 'LOG_TIPO 3', 'Shoulder change face upon tax we government yourself real wonder important interest book question toward baby dinner ahead theory.', '1987-06-22 23:04:26', NULL),
(4, 'LOG_TIPO 4', 'Mother sure project those painting toward create firm politics somebody lot ahead entire painting discuss TV lose carry nor.', '1982-11-11 23:21:36', NULL),
(5, 'LOG_TIPO 5', 'Center on need friend thousand difficult staff point world this list stuff us performance entire forward know term more.', '1985-03-25 13:09:22', NULL),
(6, 'LOG_TIPO 6', 'Role involve vote size even notice factor make stay opportunity.', '2004-07-09 06:03:03', NULL),
(7, 'LOG_TIPO 7', 'Shoulder catch agent thing on upon vote commercial mouth kind up pretty democratic remain moment religious right.', '2006-06-15 03:26:09', NULL),
(8, 'LOG_TIPO 8', 'After painting country very never west dream create south news difference issue price single treat wrong sense.', '2017-05-12 13:00:22', NULL),
(9, 'LOG_TIPO 9', 'After one fall race international between see back miss anyone already reveal compare bit vote.', '2011-10-08 15:36:51', NULL),
(10, 'LOG_TIPO 10', 'Hear above commercial safe peace plant thousand lose figure practice generation cold station enough beautiful like.', '1971-12-25 09:17:23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Cooperland', 'Georgia', 21, NULL),
(2, 'Turnerport', 'West Virginia', 22, NULL),
(3, 'East Lindsay', 'Oregon', 23, NULL),
(4, 'East Donna', 'Nevada', 24, NULL),
(5, 'Williamsfurt', 'New Mexico', 25, NULL),
(6, 'West Timothyfurt', 'Massachusetts', 26, NULL),
(7, 'Stantonport', 'Louisiana', 27, NULL),
(8, 'Hesterville', 'New Mexico', 28, NULL),
(9, 'Lake Michael', 'Iowa', 29, NULL),
(10, 'Carlosberg', 'New Jersey', 30, NULL);

-- --------------------------------------------------------

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
(1, 'Reseña 1', 'Four reality dark parent two there you. Throughout song join wide himself brother. Shoulder prevent shake three prove special structure.\nTest room adult agree beyond offer his.\nCertain necessary ok culture itself maintain. Fact born information toward season.\nReveal number true easy deep. Improve anyone interview value. Score not again identify respond center product.\nMouth every significant tough she. Father suffer establish him floor value behavior expert.\nHope only start. Set foot tough.', 3, NULL, NULL, '2023-12-26', 1, 1, NULL),
(2, 'Reseña 2', 'Reach individual candidate want. Cold number family TV later whom. Eat item assume. Pressure choose perform or including home foreign.\nEnd share read reason machine. Agency may through reveal along create what. Cell federal wife.\nEat treatment statement million wide.\nPm night source computer town at share. Avoid current finally its policy choice I.\nControl sing tonight player walk even day. Become east oil. Federal language tell trip day head.', 4, 14.68, 1, '2024-01-05', 2, 9, NULL),
(3, 'Reseña 3', 'Process network sometimes. Use opportunity show walk down right compare.\nNot similar decide huge you rate family. Improve significant left side country similar cold. If would leader every.\nData today room family official. Fire finish center start. Its recent theory anyone choose could.\nLearn high son responsibility industry light bring party. World like long go nature. Memory dinner already other song manager will data.', 1, NULL, NULL, '2024-01-03', 3, 1, NULL),
(4, 'Reseña 4', 'Pattern kind cup. None exactly church side seek. Next leader deep remember country eat cultural her. Marriage out us seven trade black church.\nProbably what statement project. Money cost painting what.\nCoach study military indeed police. Specific scene dinner dog. Decide Congress beat contain.\nGood around south likely American professional skin. Where push part moment Mr. Once forward present write reduce cost. Lead drop run by.', 3, 31.57, 1, '2024-01-11', 4, 6, NULL),
(5, 'Reseña 5', 'Agent evening property him my author board world. Bring player performance should. Day nor know seat really. Bring myself customer respond focus.\nYoung between anyone certain store turn it. So perhaps gun do north.\nResult court back certainly lead grow whose. Meet hotel wrong rather military.\nCell poor protect piece reflect. Full chance accept produce good. Performance heavy effort similar night support.\nAhead ahead better.', 3, NULL, NULL, '2023-12-24', 5, 10, NULL),
(6, 'Reseña 6', 'Site protect game prepare score remember. Land term bit forward side able rise.\nGeneration once whose yard activity really report I. Including lawyer call your store before.\nRecent minute someone though between join visit.\nEvidence identify pick court organization Republican manage. Little international believe.\nPositive stuff tonight learn picture phone herself. Woman apply else card. Threat section about feeling hospital action car. Weight role wide most trade design he south.', 5, 66.4, 0, '2024-01-17', 6, 8, NULL),
(7, 'Reseña 7', 'Them range hand understand moment. Speak benefit war election.\nLawyer piece stage manage these stage allow. Performance catch player certain whether. Likely material company card.\nAddress start cost identify. Onto green maybe decade production fill process notice.\nPower myself enough side. Hour give give church tough account meeting. On better military rather test. Need benefit test member seat vote.', 2, NULL, NULL, '2024-01-10', 7, 6, NULL),
(8, 'Reseña 8', 'From its claim who break and during. South class candidate. In should key apply realize there. Chair early business idea.\nFill assume song personal success goal. Market on society far door save.\nPicture life there record five brother join. Develop interest money assume billion end.\nLong turn measure while reason gas foot.\nThousand ball though ready writer establish huge. Human sign include defense beat be sea. Pick activity today enough admit.', 0, 81.8, 1, '2024-01-16', 8, 5, NULL),
(9, 'Reseña 9', 'Lose race actually including. Care old strong goal arm hospital it nor. Let sure sort college two.\nParticularly partner point could theory cut. Above democratic society those participant.\nModern law safe. Give student can which safe if.\nCell easy school small. Cup two weight identify education my say. Even single loss field professor simply music.\nApply bar particularly bank popular answer system. Plan imagine song citizen give rest professional less. Hot human protect field successful.', 1, NULL, NULL, '2024-01-18', 9, 2, NULL),
(10, 'Reseña 10', 'Interesting under likely you red. Evidence air thank structure tend loss east identify.\nMuch list few past. Anything candidate authority easy career task stock. Agreement hair girl project over professional generation.\nSociety choice pass one possible Mr world pass. News reveal international. Fish certain lead statement better.\nExplain add cut pretty woman involve save. Market improve senior.\nHistory event too society. Movie send PM plant.', 5, 76.08, 2, '2024-01-10', 10, 8, NULL);

-- --------------------------------------------------------

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
(1, 'Tarjeta 502030733906', 2, '2024-01-19', '21:00', 1, 2, NULL),
(2, 'Tarjeta 343030311814761', 6, '2024-02-15', '21:00', 2, 8, NULL),
(3, 'Tarjeta 4521750392861607', 4, '2024-01-20', '21:00', 3, 7, NULL),
(4, 'Tarjeta 38550649830650', 2, '2024-02-13', '21:00', 4, 2, NULL),
(5, 'Tarjeta 341877916231698', 1, '2024-01-28', '21:00', 5, 5, NULL),
(6, 'Tarjeta 2461887601090978', 9, '2024-02-15', '21:00', 6, 5, NULL),
(7, 'Tarjeta 36803166952205', 2, '2024-02-16', '21:00', 7, 8, NULL),
(8, 'Tarjeta 213190454290463', 9, '2024-02-11', '21:00', 8, 2, NULL),
(9, 'Tarjeta 676195221467', 5, '2024-02-15', '21:00', 9, 8, NULL),
(10, 'Tarjeta 341511082668611', 3, '2024-02-15', '21:00', 10, 1, NULL);

-- --------------------------------------------------------

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
(1, NULL, 'Morning hand entire responsibility opportunity white. Notice inside value identify operation nature record degree.\nPresent describe suggest none simple. Whole structure tree plant sort.', NULL, 10, NULL),
(2, NULL, 'Information coach my toward soon someone doctor. Court almost ten hour long. Manage team shoulder.\nSkin into people play study develop. Alone can understand.', 2, 3, NULL),
(3, NULL, 'Project develop standard interest apply. Factor final most alone rock nor letter power.\nEspecially ever notice want star. Pretty own crime piece financial product.', NULL, 9, NULL),
(4, NULL, 'Any least church body star. Give near western large career usually including.\nMedia building suffer present later message. Five I others may teach. Part around improve structure.', 2, 10, NULL),
(5, NULL, 'Traditional peace three. Student person simple home together. Little even my station. Those you and southern glass tonight.', NULL, 2, NULL),
(6, NULL, 'Minute accept body.\nToward without probably manage peace suddenly risk. Share however beyond moment. While lawyer concern country something pretty.', 1, 4, NULL),
(7, 2, 'Public lot future again face. Throw management rate car approach although.\nSign walk ever same box list. Tonight relate end forward bank whether.', NULL, 6, NULL),
(8, 2, 'Billion reason age see parent bed. Adult floor science collection have station.\nAnimal already candidate then. Memory though sport form.', 1, 8, NULL),
(9, 1, 'Spring sure lose trip treatment cell. Over discussion seek check.\nFight color sit its decide indicate rule.\nWall article total practice item. Single turn stuff.', NULL, 2, NULL),
(10, 3, 'Hospital whole soon option program through painting. Knowledge actually watch.\nDegree include parent risk wish respond. Turn magazine garden maybe nature force.', 0, 7, NULL);

-- --------------------------------------------------------

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
(1, 'About recently simply ground subject cut will possible.', 'Reveal everybody ok move no price source civil amount just American lay up he think oil true toward item investment.', NULL),
(2, 'Common always thus pretty south whose within memory threat anything into southern brother.', 'Thought center maybe laugh lawyer possible floor believe carry market perform short teach protect describe organization role adult surface task believe summer now him step college.', NULL),
(3, 'Such think current require capital concern race sea available look.', 'Seven democratic eye consumer study describe onto song give environmental allow ahead he tend politics political lot single degree include foreign.', NULL),
(4, 'Dog each himself campaign seven social.', 'Clear fill line want certainly hotel trade your anyone image result wear democratic new.', NULL),
(5, 'Fast great each today make knowledge organization radio news.', 'Large season red authority scene or pull growth somebody detail public art perhaps fund detail yes political rather group he.', NULL),
(6, 'Important economic down suddenly public difference include foreign minute themselves already.', 'Control tend do event company culture class stock character enjoy maybe cold various guy likely notice foot four top.', NULL),
(7, 'Rather school other herself pick learn expect.', 'With or themselves care movie artist moment majority to several final eye.', NULL),
(8, 'Sit entire watch pretty safe window plant cell official and notice weight establish.', 'Stage year one compare learn campaign various yes technology chair after must court particular under account.', NULL),
(9, 'Reduce agent conference travel there floor institution threat rate.', 'Particularly size teacher as door reveal against condition science new example list spend group may more budget control wonder crime something daughter remember.', NULL),
(10, 'Health nor me long out up late name view even for fall above.', 'Available though fish your base rise that political thing someone growth decision base language yes institution such bad chance result contain economic person vote.', NULL);

-- --------------------------------------------------------

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

INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `id_propietario`, `aforo_maximo` ,`notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Brian Roads', NULL, 'Clintonchester', 'Maine', 55.72, 14, 35, NULL),
(2, 'Restaurante2', 2, 12, 'Lee Port', NULL, 'East Tinafurt', 'Virginia', 81.73, 13, 35, NULL),
(3, 'Restaurante3', 3, 13, 'Kidd Radial', NULL, 'Christensenfurt', 'Tennessee', 55.72, 12, 35, NULL),
(4, 'Restaurante4', 4, 14, 'Desiree Circles', NULL, 'North Gabrielview', 'Kentucky', 16.66, 11, 35, NULL),
(5, 'Restaurante5', 5, 15, 'Brown Roads', NULL, 'Hayesshire', 'Wyoming', 55.72, 14, 35, NULL),
(6, 'Restaurante6', 6, 16, 'Chad Lodge', NULL, 'Brownmouth', 'Nebraska', 95.71, 11, 35, NULL),
(7, 'Restaurante7', 7, 17, 'Tyler Spur', NULL, 'Sethton', 'North Carolina', 55.72, 14, 35, NULL),
(8, 'Restaurante8', 8, 18, 'Robert Pine', NULL, 'Annehaven', 'Connecticut', 82.36, 13, 35, NULL),
(9, 'Restaurante9', 9, 19, 'Mendoza Corner', NULL, 'South Raymondfort', 'North Carolina', 55.72, 15, 35, NULL),
(10, 'Restaurante10', 10, 20, 'Dennis Flat', NULL, 'Camachoville', 'Montana', 74.53, 13, 35, NULL);

-- --------------------------------------------------------

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
(1, NULL, 'Tipo1', NULL),
(2, NULL, 'Tipo2', NULL),
(3, NULL, 'Tipo3', NULL),
(4, NULL, 'Tipo4', NULL),
(5, NULL, 'Tipo5', NULL),
(6, NULL, 'Tipo6', NULL),
(7, 1, 'Tipo7', NULL),
(8, 2, 'Tipo8', NULL),
(9, 1, 'Tipo9', NULL),
(10, 2, 'Tipo10', NULL);

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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
(1, 'cliente1', 'cliente1@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(2, 'cliente2', 'cliente2@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(3, 'cliente3', 'cliente3@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(4, 'cliente4', 'cliente4@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(5, 'cliente5', 'cliente5@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(6, 'cliente6', 'cliente6@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(7, 'cliente7', 'cliente7@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(8, 'cliente8', 'cliente8@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(9, 'cliente9', 'cliente9@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
(10, 'cliente10', 'cliente10@prueba.com', '$2y$13$qgJvfpEzmyNjbxaQy4c1Q.jOPhdqFN1ydD6At0X2FRPZ2w3W.Ln0e', 1, 'cliente', 0, NULL),
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
(110, 10, '9:00', '16:30', 'jueves', NULL);


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
