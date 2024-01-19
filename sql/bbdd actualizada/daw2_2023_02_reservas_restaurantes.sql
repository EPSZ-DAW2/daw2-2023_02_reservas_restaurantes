-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2024 a las 11:41:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `daw2_2023_02_reservas_restaurantes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_administrador` int(12) NOT NULL COMMENT 'Identificador de cada administrador.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el Administrador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_administrador`, `id_usuario`, `notas`) VALUES
(1, 1, NULL),
(2, 2, NULL);

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
('administrador', '1', 1705625756),
('gestor', '2', 1705625756),
('moderador', '3', 1705625756);

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
('administrador', 1, 'Rol de administrador con permisos completos', NULL, NULL, 1705621861, 1705621861),
('gestor', 1, 'Rol de gestor con permisos de gestión', NULL, NULL, 1705621861, 1705621861),
('moderador', 1, 'Rol de moderador con permisos de moderación', NULL, NULL, 1705621861, 1705621861);

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
(1, NULL, 'Ofertas', NULL),
(2, NULL, 'Selección La Cuchara', NULL),
(3, NULL, 'Categoria3', NULL),
(4, NULL, 'Categoria4', NULL),
(5, NULL, 'Categoria5', NULL),
(6, NULL, 'Categoria6', NULL),
(7, 1, 'Categoria7', NULL),
(8, 1, 'Categoria8', NULL),
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
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(2, 1, NULL),
(2, 2, NULL),
(2, 3, NULL),
(2, 4, NULL),
(2, 5, NULL),
(2, 6, NULL),
(2, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(12) NOT NULL COMMENT 'Identificador de cada cliente.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`, `notas`) VALUES
(1, 23, NULL),
(2, 24, NULL),
(3, 25, NULL),
(4, 26, NULL),
(5, 27, NULL),
(6, 28, NULL),
(7, 29, NULL),
(8, 30, NULL),
(9, 31, NULL),
(10, 32, NULL);

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
(1, 2, NULL),
(2, 1, NULL),
(3, 9, NULL),
(4, 4, NULL),
(5, 2, NULL),
(6, 7, NULL),
(7, 6, NULL),
(8, 7, NULL),
(9, 10, NULL),
(10, 3, NULL);

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
('authority', 'reason', NULL),
('enough', 'baby', NULL),
('expect', 'account', NULL),
('fine', 'ask', NULL),
('floor', 'modern', NULL),
('Mrs', 'big', NULL),
('research', 'woman', NULL),
('speech', 'thousand', NULL),
('trial', 'poor', NULL),
('under', 'water', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_restaurantes`
--

CREATE TABLE `control_restaurantes` (
  `id_gestor` int(12) NOT NULL COMMENT 'Referencia del gestor asociado al restaurante.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado al gestor.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el control de restaurantes.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `control_restaurantes`
--

INSERT INTO `control_restaurantes` (`id_gestor`, `id_restaurante`, `notas`) VALUES
(1, 10, NULL),
(2, 1, NULL),
(3, 6, NULL),
(4, 7, NULL),
(5, 10, NULL),
(6, 7, NULL),
(7, 2, NULL),
(8, 3, NULL),
(9, 4, NULL),
(10, 3, NULL);

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
(1, 'Evento 1', 'Responsibility hit police whole. Policy believe fact democratic. Contain newspaper style alone mind degree enter.\nSenior different production go book. Represent each reflect other wind.\nWriter us political hope available focus. Little get government much. Interest late response reason tell.\nCommunity economy now society. Meet pull themselves issue.\nAdult out wife true his drop travel. Learn usually line admit. Buy expert partner that risk opportunity wear push.', '2023-12-26', 21, NULL, 5, NULL),
(2, 'Evento 2', 'Election coach others for religious discover before. Benefit course over key join. Value which find political rate.\nHour so including teacher say.\nPerhaps fast evidence down could national clearly. Great no them statement. Kitchen friend product participant hope.\nThrough voice simply consumer author information. Style pressure day miss. Type feeling newspaper speak performance too network.\nYet idea car owner heart political. Conference feel view single.', '2024-01-05', 22, 0, 1, NULL),
(3, 'Evento 3', 'Just new front out. Next indicate represent visit civil free. Congress garden wear at report several think.\nPicture health day item animal necessary family.\nPeace practice necessary step. Will compare or worry city. Population among item people.\nLittle audience popular address. Want happy manage probably.\nLate huge know page western Mrs beautiful. I feeling consider against out.', '2023-12-21', 23, NULL, 2, NULL),
(4, 'Evento 4', 'Point happy memory better economic. Different ready similar possible if. Side race glass resource might whole agent. Agency power now eat record first might.\nRed include page stuff adult sometimes sure. Red wind force base seat mother. Outside threat heavy quickly.\nControl sort explain under meeting several. Would modern north thing age will tonight return. Page participant effort.\nPossible data dream. Six trial much purpose. Rock senior purpose tend.', '2024-01-15', 24, 2, 5, NULL),
(5, 'Evento 5', 'House her former region until. Board good current might. Involve mother guy enjoy property thousand point.\nSoon dream national central modern. Receive affect stage manage part notice beautiful form. Though pattern international. So kitchen them let.\nColor Mrs hotel machine prepare. Successful each put system building big. Always down detail eat newspaper top.\nLeast entire none message. Response stock big feel idea. Of wonder war step later teacher.\nHot lay across factor myself we.', '2024-01-03', 25, NULL, 6, NULL),
(6, 'Evento 6', 'Forget modern seem since. Order say arm war. Organization house agree next garden indicate he.\nSay measure week trouble candidate decade. Drug thing discussion enough serve despite.\nFederal sell less degree hard. Eye three yard for wear. Up eat kitchen member.\nEverybody allow mean race.\nMost yourself heart worry him magazine. Rather must use tell many. Listen free appear term politics behind start.\nScience drop president sure arrive or certain. Push need six successful window leg.', '2024-01-10', 26, 0, 10, NULL),
(7, 'Evento 7', 'Better talk beat always heart.\nStyle sometimes seek. Church care build.\nEach personal central strategy staff support question. Determine young today maintain road receive together.\nHalf camera oil. Realize now property quickly old now. Clearly cover ground thus move a paper skin.\nMember watch contain ago contain peace.\nTop sign cut. Author develop determine population. Turn fall night citizen.\nMajor number serious market onto quite. Baby part event station newspaper two country.', '2024-01-06', 27, NULL, 10, NULL),
(8, 'Evento 8', 'Center only sister. Serious how forward up provide school lose.\nExpect should available professor much idea operation interesting. Successful PM mention local. Write different part citizen. For fight bring doctor theory use.\nTechnology radio like artist. Voice machine he reach box compare.\nElection line kid business the one. Perform become protect lot guess education investment between. Sort form them least.', '2023-12-28', 28, 2, 10, NULL),
(9, 'Evento 9', 'Long skin also evidence. Kind gas democratic idea marriage your. Member worker we recently wear.\nMeeting former box painting soon fall feel. Suffer travel mission. Sister interview attorney agent.\nMeeting matter somebody rise. Represent condition crime peace charge.\nGoal red movement discuss. Assume painting could hotel world follow.\nFive use miss rise get author material.\nPlayer worker color increase public. Write road thing increase meet.', '2024-01-05', 29, NULL, 10, NULL),
(10, 'Evento 10', 'Employee maybe forget model. Natural paper modern according carry about. Stage adult stop late.\nEvening white nice condition mind economic us. Newspaper political majority any nor he available. Newspaper paper although class base class why dog.\nDoctor town our far until national dark. Continue cup generation world network for deep.\nBefore especially ability happen manager family. Blue firm commercial. Can research recognize compare collection reach.', '2023-12-18', 30, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_cliente` int(12) NOT NULL COMMENT 'Identificador del cliente.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el favorito.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 10, NULL),
(2, 7, NULL),
(3, 9, NULL),
(4, 2, NULL),
(5, 4, NULL),
(6, 10, NULL),
(7, 3, NULL),
(8, 2, NULL),
(9, 5, NULL),
(10, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestores`
--

CREATE TABLE `gestores` (
  `id_gestor` int(12) NOT NULL COMMENT 'Identificador de cada gestor.',
  `es_propietario` tinyint(1) NOT NULL COMMENT 'Si el gestor es propietario o solo gestor, 0 solo gestor 1 propietario.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el Gestor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gestores`
--

INSERT INTO `gestores` (`id_gestor`, `es_propietario`, `id_usuario`, `notas`) VALUES
(1, 1, 3, NULL),
(2, 0, 4, NULL),
(3, 0, 5, NULL),
(4, 0, 6, NULL),
(5, 0, 7, NULL),
(6, 0, 8, NULL),
(7, 1, 9, NULL),
(8, 0, 10, NULL),
(9, 1, 11, NULL),
(10, 0, 12, NULL);

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
(1, NULL, NULL),
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
(1, 41, NULL),
(10, 42, NULL),
(10, 43, NULL),
(10, 44, NULL),
(5, 45, NULL),
(1, 46, NULL),
(2, 47, NULL),
(8, 48, NULL),
(1, 49, NULL),
(3, 50, NULL);

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
(3, 31, NULL),
(10, 32, NULL),
(3, 33, NULL),
(1, 34, NULL),
(1, 35, NULL),
(1, 36, NULL),
(10, 37, NULL),
(10, 38, NULL),
(3, 39, NULL),
(1, 40, NULL);

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
(1, 'LOG_TIPO 1', 'Choice week democratic event hair involve six improve small result next store five however.', '1996-03-05 03:19:19', NULL),
(2, 'LOG_TIPO 2', 'Outside couple war left also total whether base fine live production million range probably.', '1975-08-23 20:55:51', NULL),
(3, 'LOG_TIPO 3', 'Time consider apply debate though include work light this test continue third chance look.', '1989-02-06 04:33:40', NULL),
(4, 'LOG_TIPO 4', 'Present say seat relate against win hundred hundred agency whether not even.', '2006-07-25 11:33:30', NULL),
(5, 'LOG_TIPO 5', 'Drive forget approach society minute analysis protect read head decide bag also.', '1999-09-16 15:26:36', NULL),
(6, 'LOG_TIPO 6', 'Move add play property central goal girl road deal fill truth century.', '1999-03-08 03:57:07', NULL),
(7, 'LOG_TIPO 7', 'Human bed general assume bit send care stage five address dog rock light large something skin box economy poor.', '2001-10-29 01:13:52', NULL),
(8, 'LOG_TIPO 8', 'Newspaper spend trade laugh quite class marriage great matter only charge guess bring.', '1998-10-09 22:12:56', NULL),
(9, 'LOG_TIPO 9', 'Conference gun machine PM cold add behind key mention society away according candidate talk.', '1976-08-20 03:01:45', NULL),
(10, 'LOG_TIPO 10', 'Figure class do heart see white accept people concern really growth food explain reveal now prove.', '2008-08-20 03:12:39', NULL);

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
('m000000_000000_base', 1705594035),
('m140506_102106_rbac_init', 1705594085),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1705594086),
('m180523_151638_rbac_updates_indexes_without_prefix', 1705594086),
('m200409_110543_rbac_update_mssql_trigger', 1705594086);

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
(1, 'Heatherborough', 'North Carolina', 13, NULL),
(2, 'Tamarachester', 'Massachusetts', 14, NULL),
(3, 'Clarkchester', 'Michigan', 15, NULL),
(4, 'South Keithstad', 'Connecticut', 16, NULL),
(5, 'South David', 'New Mexico', 17, NULL),
(6, 'North Steven', 'Wisconsin', 18, NULL),
(7, 'Foxland', 'Illinois', 19, NULL),
(8, 'Port Jacquelineton', 'Vermont', 20, NULL),
(9, 'Christopherside', 'Alabama', 21, NULL),
(10, 'Kevinton', 'Missouri', 22, NULL);

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
  `id_cliente` int(12) NOT NULL COMMENT 'Referencia del cliente asociado a la resena.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la resena.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la resena.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resenas`
--

INSERT INTO `resenas` (`id_resena`, `titulo_resena`, `cuerpo_resena`, `puntuacion`, `precio_x_persona`, `incidencia_resena`, `fecha_resena`, `id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 'Resena 1', 'Four off plant list race manager upon. Paper take remember call with. Body investment born little decade word part.\nCity speak this difficult. Loss their any.\nLose road member. Threat painting discover.\nHit seem hundred talk though. Policy son explain concern east more. Serious paper federal nice painting series field.\nBe school week call. Word main term.\nSkill body along. Kitchen key either item daughter.\nWriter field executive beat southern cell school. Three street during stop.', 2, NULL, NULL, '2024-01-04', 1, 7, NULL),
(2, 'Resena 2', 'Begin tell bag else month despite. Skin hundred may than skin wide against morning. Play would voice nothing hair.\nSay particularly another concern never. Green door believe site be.\nAround floor prove manage indicate herself class land. Cut benefit pressure including nice state.\nPrevent without doctor onto team. Bring her write manager could decide assume.\nAct speech successful debate wife consumer produce. Difference production sure treat into.', 1, 48.32, 2, '2024-01-11', 2, 1, NULL),
(3, 'Resena 3', 'Per walk television. Inside top sometimes manage good even. Enjoy network shoulder concern. Treatment forward well run unit series.\nReport without option face market. Probably loss great.\nProve upon check process show. Such ball success owner nothing. It national area seat.\nReal along party much money customer.\nInterview analysis they husband move. Risk before art dark.\nAway draw up class certain practice investment. Indicate hospital century authority.', 4, NULL, NULL, '2024-01-05', 3, 4, NULL),
(4, 'Resena 4', 'Quality final evening according time night watch.\nDetermine down school feeling ball.\nAmerican other try. Relate class degree knowledge idea dark who. Share spring anything room single event fly by.\nCustomer member strategy cold coach thing. Feeling could whose hundred plan sea fish. Brother find worker few certainly better resource.\nLead less project voice. Better financial such myself. Man large can.\nActivity simply cover door. Partner world set bank. Activity night discover the science.', 0, 96.02, 2, '2023-12-19', 4, 8, NULL),
(5, 'Resena 5', 'It find economy feel. Marriage less despite audience win pretty compare. Smile president cost when their realize agree move.\nPresent feeling hotel attention pull experience us official. Difference side read model activity.\nPm method gun. Ready dinner night understand lay help. Someone rather event in responsibility. Keep that seat.\nSpeak action since explain story. Test himself spring local player wall society. Leave night dream week number up.', 5, NULL, NULL, '2024-01-01', 5, 5, NULL),
(6, 'Resena 6', 'Unit laugh recognize bed result.\nThis whose machine impact.\nOffice safe card so leader card. Rich sit condition tonight understand.\nCrime director for to. Impact his picture difficult service dark environment. Play join important plan happen.\nTrip than opportunity beautiful lay.\nBank fund buy sort. Style prepare by network item herself.\nCup us certain would agent century. Sometimes most goal college nation list concern. More sea understand figure address radio Congress evidence.', 1, 47.13, 2, '2023-12-26', 6, 8, NULL),
(7, 'Resena 7', 'Return movie story. People main involve every outside. Thought company finish skin nature participant blood.\nHis down their hand little special.\nWife happy explain agent free. Change maintain until traditional provide hour give.\nWall these their economic tree. Coach ask cut listen. American federal heavy stay part by goal range.\nCommunity personal receive money situation which. Head century drop human nation.', 5, NULL, NULL, '2023-12-18', 7, 3, NULL),
(8, 'Resena 8', 'Phone laugh imagine thank few trade begin. Have next success organization. Young task reason take.\nStage point relationship base during. Once only trial from likely commercial attorney. Field rest staff town.\nLetter style their notice blue foreign. Fine four next environment indeed blue hope. Better visit growth. Energy above cover.\nPractice door lay happy offer choice. Tough smile address west opportunity job. Current prove now raise.', 5, 88.71, 1, '2023-12-26', 8, 7, NULL),
(9, 'Resena 9', 'Reflect moment apply carry. Task everyone loss nor everybody sense.\nFrom open let the couple offer. Sound fall beat mind seem executive service general. Sit official policy.\nSport once expert plan impact.\nGood seem message peace just performance consider. Executive impact agreement scene low. Situation skin region.\nStatement because any single state newspaper throw.\nMajority defense wait late increase week. You institution wish. Against value available modern technology structure organization.', 3, NULL, NULL, '2023-12-28', 9, 7, NULL),
(10, 'Resena 10', 'Including herself be choose stock. Operation heart program later rise democratic friend article. Game TV food president finish.\nReach day get second his eye wonder. Debate Mrs I security sport.\nImprove son senior science us. Make ok able authority teach bag shake. Instead carry while clear notice two.\nDespite nearly water institution. Begin long act compare artist trade.\nHerself simply add compare. Phone truth trial court. Maintain rock alone.', 1, 70.34, 0, '2024-01-03', 10, 7, NULL);

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
  `id_cliente` int(12) NOT NULL COMMENT 'Referencia del cliente asociado a la reserva.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la reserva.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para la reserva.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `datos_pago`, `num_comensales`, `fecha_reserva`, `hora_reserva`, `id_cliente`, `id_restaurante`, `notas`) VALUES
(1, 'Tarjeta 30447791677732', 2, '2024-01-18', '21:00', 1, 8, NULL),
(2, 'Tarjeta 2314965458065670', 2, '2024-01-29', '21:00', 2, 8, NULL),
(3, 'Tarjeta 213189375331778', 10, '2024-02-05', '21:00', 3, 8, NULL),
(4, 'Tarjeta 3584747648165367', 6, '2024-01-25', '21:00', 4, 9, NULL),
(5, 'Tarjeta 30248279253859', 6, '2024-02-09', '21:00', 5, 4, NULL),
(6, 'Tarjeta 213108040606265', 9, '2024-01-23', '21:00', 6, 8, NULL),
(7, 'Tarjeta 3551622829748258', 6, '2024-01-16', '21:00', 7, 9, NULL),
(8, 'Tarjeta 3539991333738858', 4, '2024-02-09', '21:00', 8, 5, NULL),
(9, 'Tarjeta 30266862362994', 4, '2024-01-23', '21:00', 9, 3, NULL),
(10, 'Tarjeta 4999275973149670', 5, '2024-01-18', '21:00', 10, 7, NULL);

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
(1, NULL, 'Game rule some quickly heavy. Condition leave company those apply return outside. Cold nature stand real.', NULL, 6, NULL),
(2, NULL, 'Them point side popular happy.', 0, 9, NULL),
(3, NULL, 'Citizen represent size wait. Final of your most particularly. Trial technology Democrat sell clear sure reach others. Probably view matter better box.', NULL, 4, NULL),
(4, NULL, 'Although may sort energy. Body coach keep sea grow many five.\nEntire near mind. Item protect probably would. Local character direction fill.', 1, 7, NULL),
(5, NULL, 'Structure available full everybody important crime affect. Realize service Democrat yet remain couple heavy.', NULL, 4, NULL),
(6, NULL, 'Tv go discussion rest realize candidate.\nCarry market leave fact book enough. Half concern meeting material. Material when capital onto.', 2, 5, NULL),
(7, 3, 'Size else news goal matter nor. Learn mother forget wide. Song behavior unit bank night improve hair.\nMonth radio take common. Arm property before pressure.', NULL, 6, NULL),
(8, 2, 'Own individual account within. Head sing than boy way. Peace bag wind lead store where finally.', 2, 10, NULL),
(9, 1, 'Above grow from strategy time.\nCandidate newspaper like at. Trade various physical appear. Recent drug be write event want help.', NULL, 6, NULL),
(10, 2, 'On science see. Door brother another American go everything.\nTravel miss life suddenly after stage the. Mention activity you street chance.', 0, 3, NULL);

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
(1, 'Good leader our fish entire hope start authority.', 'Suggest decision responsibility less under difficult morning myself receive indeed form service be hard economic painting fire ability customer my improve test my national.', NULL),
(2, 'Land level language per Republican before born stage song.', 'Trip simply former today technology choose strong west ball soldier idea artist.', NULL),
(3, 'Entire seem firm condition happy job our keep impact idea.', 'Practice a like party tough current themselves share stay state effort if sea player even would.', NULL),
(4, 'Road debate authority direction air six spring stage election game recently across there.', 'Memory fly investment task make must become build never make read until church certain here couple interview direction eight in newspaper.', NULL),
(5, 'Window condition trial place partner first gas agree.', 'Upon financial social trouble likely well either factor artist yet economic why least read leader ready lay capital thing which into.', NULL),
(6, 'Act network international ground accept find.', 'Degree who develop million positive local dog mention worry else everybody garden its truth campaign water.', NULL),
(7, 'West hard instead scientist education experience forget contain city behavior simple.', 'Consumer executive single gas white stage color can just bill television face nothing second dinner clearly six eye mind PM consider defense traditional assume.', NULL),
(8, 'Type past eye brother room or according best eye second.', 'Group south risk newspaper campaign occur plan loss have home reduce but.', NULL),
(9, 'Certain that keep identify operation large throw care may many that dream phone.', 'Carry under including forget animal history Republican raise morning teach realize this long wish.', NULL),
(10, 'Culture discover trade assume gas coach stage believe space affect court.', 'Early summer somebody make each third she theory media into officer surface thank such.', NULL);

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
  `precio_medio_comensal` float DEFAULT NULL COMMENT 'Precio por persona medio.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el restaurante.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurante`, `id_foto_restaurante`, `id_carta`, `calle_restaurante`, `barrio_restaurante`, `ciudad_restaurante`, `comunidad_autonoma_restaurante`, `precio_medio_comensal`, `notas`) VALUES
(1, 'Restaurante1', 1, 11, 'Lewis Keys', NULL, 'Stevenville', 'Oregon', NULL, NULL),
(2, 'Restaurante2', 2, 12, 'Ali Route', NULL, 'Sanchezview', 'Kansas', 14.78, NULL),
(3, 'Restaurante3', 3, 13, 'Benton Inlet', NULL, 'Lake Tracey', 'Maryland', NULL, NULL),
(4, 'Restaurante4', 4, 14, 'Jeffrey Ville', NULL, 'Jameschester', 'North Dakota', 97.59, NULL),
(5, 'Restaurante5', 5, 15, 'Dalton Extensions', NULL, 'Hannahview', 'Arkansas', NULL, NULL),
(6, 'Restaurante6', 6, 16, 'Joshua Cliffs', NULL, 'North Davidland', 'South Dakota', 62.65, NULL),
(7, 'Restaurante7', 7, 17, 'Harris Ramp', NULL, 'Roberttown', 'Idaho', NULL, NULL),
(8, 'Restaurante8', 8, 18, 'Lisa Stravenue', NULL, 'Michelleland', 'Kansas', 71.89, NULL),
(9, 'Restaurante9', 9, 19, 'Hill Drives', NULL, 'North Karenfurt', 'New Jersey', NULL, NULL),
(10, 'Restaurante10', 10, 20, 'Brian Street', NULL, 'Cruzburgh', 'Florida', 48.62, NULL);

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
(7, 3, 'Tipo7', NULL),
(8, 2, 'Tipo8', NULL),
(9, 2, 'Tipo9', NULL),
(10, 3, 'Tipo10', NULL);

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
(2, 1, NULL),
(8, 2, NULL),
(5, 5, NULL),
(5, 8, NULL),
(10, 8, NULL),
(4, 4, NULL),
(2, 3, NULL),
(5, 6, NULL),
(2, 2, NULL),
(3, 9, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador de cada usuario.',
  `nombre_usuario` varchar(50) NOT NULL COMMENT 'Nombre del usuario.',
  `email` varchar(32) NOT NULL COMMENT 'Email de regitro del usuario.',
  `password` varchar(32) NOT NULL COMMENT 'Contraseña de registro del usuario.',
  `rol` varchar(255) DEFAULT NULL,
  `id_foto_usuario` int(12) DEFAULT NULL COMMENT 'ID de la foto de perfil del usuario. NULL si no tiene.',
  `notas` text DEFAULT NULL COMMENT 'Notas internas para el usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `rol`, `id_foto_usuario`, `notas`) VALUES
(1, 'melissa32', 'shawangel@example.org', '_8+CHDbZ@n', 'administrador', NULL, NULL),
(2, 'howarddenise', 'philip11@example.com', 'r5xV@gck+a', 'gestor', NULL, NULL),
(3, 'smithcarlos', 'lydia50@example.net', '_!Y2HFE0_m', 'moderador', NULL, NULL),
(4, 'ricky78', 'dustinwhite@example.org', 'AV$4lQg3aV', NULL, NULL, NULL),
(5, 'jamesporter', 'jenniferarmstrong@example.org', 'Z*3EDo!z0R', NULL, NULL, NULL),
(6, 'zbird', 'davidsmith@example.org', '@4^CJoNoFh', NULL, NULL, NULL),
(7, 'grossjessica', 'adriennecooke@example.org', 'xZ(^5VchO+', NULL, NULL, NULL),
(8, 'regina60', 'whitneymoon@example.org', 'jW01RCYx^d', NULL, NULL, NULL),
(9, 'martinezmitchell', 'joy90@example.com', '64!9t0Bk_G', NULL, NULL, NULL),
(10, 'edwinclarke', 'christine10@example.com', '((xxZxmke3', NULL, NULL, NULL),
(11, 'jasongibson', 'howardbarnes@example.com', 'I)Ugh5JoLF', NULL, NULL, NULL),
(12, 'nryan', 'mark19@example.org', 'F5MHJuJu!p', NULL, NULL, NULL),
(13, 'sanfordlatoya', 'ybell@example.com', 'ygLYiqkd*6', NULL, NULL, NULL),
(14, 'jonathan44', 'marvinrobinson@example.org', '@JMQ)JhW+0', NULL, NULL, NULL),
(15, 'derrick65', 'ycameron@example.org', '^G5TAetPK)', NULL, NULL, NULL),
(16, 'gdavis', 'mcooper@example.net', 'RZp4_ENd^d', NULL, NULL, NULL),
(17, 'madisonburton', 'russellharrell@example.com', ')L23Dw8vA^', NULL, NULL, NULL),
(18, 'timothy06', 'qmills@example.com', '*sNYzupp8w', NULL, NULL, NULL),
(19, 'nicole61', 'cmatthews@example.org', '7*4E%YAr+8', NULL, NULL, NULL),
(20, 'oanderson', 'jennifer04@example.net', 'tCrGWFap*0', NULL, NULL, NULL),
(21, 'clarkjohn', 'phart@example.org', 'B4n!%9tu(l', NULL, NULL, NULL),
(22, 'racheljohnson', 'mcardenas@example.net', '!9_OkRqr53', NULL, NULL, NULL),
(23, 'gomezkimberly', 'singletoncynthia@example.org', '$k^g+OXj^4', NULL, NULL, NULL),
(24, 'thompsondebra', 'patricia10@example.org', '^H+tFQqb4c', NULL, NULL, NULL),
(25, 'jonesjoseph', 'jjones@example.org', '^12WQC9Bvm', NULL, NULL, NULL),
(26, 'michellecannon', 'uramsey@example.org', 'db7qImbm#1', NULL, NULL, NULL),
(27, 'janetrodriguez', 'markking@example.org', '+1tLh_IwSS', NULL, NULL, NULL),
(28, 'austin59', 'michaelgomez@example.net', 'Tr9mCvNl_A', NULL, NULL, NULL),
(29, 'esuarez', 'mcmahondiane@example.net', 'mU5!EgJRB%', NULL, NULL, NULL),
(30, 'watkinsmichael', 'andersonjoseph@example.com', ')y@9dYAaep', NULL, NULL, NULL),
(31, 'william13', 'williamsandrea@example.com', 'y4V!YH7l_h', NULL, NULL, NULL),
(32, 'jennifer62', 'vortega@example.org', ')hXDkQtXo8', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `id_usuario` (`id_usuario`);

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
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  ADD KEY `id_gestor` (`id_gestor`),
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
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `gestores`
--
ALTER TABLE `gestores`
  ADD PRIMARY KEY (`id_gestor`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
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
  ADD KEY `id_carta` (`id_carta`);

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
  ADD KEY `id_foto_usuario` (`id_foto_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_administrador` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada administrador.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada categoria de restaurante.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada cliente.', AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT de la tabla `gestores`
--
ALTER TABLE `gestores`
  MODIFY `id_gestor` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada gestor.', AUTO_INCREMENT=11;

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
  MODIFY `id_usuario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuario.', AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `control_restaurantes`
--
ALTER TABLE `control_restaurantes`
  ADD CONSTRAINT `control_restaurantes_ibfk_1` FOREIGN KEY (`id_gestor`) REFERENCES `gestores` (`id_gestor`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gestores`
--
ALTER TABLE `gestores`
  ADD CONSTRAINT `gestores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `restaurantes_ibfk_2` FOREIGN KEY (`id_carta`) REFERENCES `imagenes` (`id_imagen`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
