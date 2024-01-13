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
-- Base de datos: `laCuchara`
-- --------------------------------------------------------
DROP DATABASE IF EXISTS `daw2_2023_02_reservas_restaurantes`;
CREATE DATABASE IF NOT EXISTS `daw2_2023_02_reservas_restaurantes`
  CHARACTER SET 'utf8'
  COLLATE 'utf8_general_ci';

USE `daw2_2023_02_reservas_restaurantes`;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "usuarios".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuario.',
  `nombre_usuario` varchar(50) NOT NULL COMMENT 'Nombre del usuario.',
  `email` varchar(32) NOT NULL COMMENT 'Email de regitro del usuario.',
  `password` varchar(32) NOT NULL COMMENT 'Contraseña de registro del usuario.',
  `foto_perfil_usuario` varchar(500) COMMENT 'Foto de perfil del usuario (Será la ruta+nombreArchivo de la foto).',  
  `notas` text COMMENT 'Notas internas para el usuario.', 
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Tabla: 'administradores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `administradores`;
CREATE TABLE IF NOT EXISTS `administradores` (
  `ref_administrador` varchar(10) NOT NULL COMMENT 'Identificador de cada administrador compuesta por ADM+id (Ejemplo: ADM0000001).',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Administrador',
  PRIMARY KEY (`ref_administrador`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------
-- Tabla: 'gestores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `gestores`;
CREATE TABLE IF NOT EXISTS `gestores` (
  `ref_gestor` varchar(10) NOT NULL COMMENT 'Identificador de cada gestor compuesta por GES+id (Ejemplo: GES0000001).',
  `es_propietario` tinyint(1) NOT NULL COMMENT 'Si el gestor es propietario o solo gestor, 0 solo gestor 1 propietario.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Gestor',
  PRIMARY KEY (`ref_gestor`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------
-- Tabla: 'moderadores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `moderadores`;
CREATE TABLE IF NOT EXISTS `moderadores` (
  `ref_moderador` varchar(10) NOT NULL COMMENT 'Identificador de cada moderador compuesta por MOD+id (Ejemplo: MOD0000001).',
  `ciudad_moderador` varchar(100) COMMENT 'Ciudad de residencia del moderador.',
  `comunidad_autonoma_moderador` varchar(100) NOT NULL COMMENT 'Comunidad autónoma de residencia del moderador.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Moderador',
  PRIMARY KEY (`ref_moderador`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------
-- Tabla: 'clientes'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `ref_cliente` varchar(10) NOT NULL COMMENT 'Identificador de cada moderador compuesta por CLI+id (Ejemplo: CLI0000001).',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Cliente',
  PRIMARY KEY (`ref_cliente`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "categorias".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada categoria de restaurante.',
  `nombre_categoria` varchar(200) NOT NULL COMMENT 'Nombre de la categoria.',
  `notas` text COMMENT 'Notas internas para la categoria.', 
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "subcategorias".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE IF NOT EXISTS `subcategorias` (
  `id_subcategoria` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada subcategoria.',
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de la categoria padre.',
  `notas` text COMMENT 'Notas internas para la subcategoria.', 
  PRIMARY KEY (`id_subcategoria`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "tipos_comida".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `tipos_comida`;
CREATE TABLE IF NOT EXISTS `tipos_comida` (
  `id_tipo_comida` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada tipo de comida de restaurante.',
  `nombre_tipo` varchar(200) NOT NULL COMMENT 'Nombre del tipo de comida.',
  `notas` text COMMENT 'Notas internas para el tipo.', 
  PRIMARY KEY (`id_tipo_comida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "subtipos_comida".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `subtipos_comida`;
CREATE TABLE IF NOT EXISTS `subtipos_comida` (
  `id_subtipo_comida` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada subtipo.',
  `id_tipo_comida` int(12) NOT NULL COMMENT 'Identificador del tipo padre.',
  `notas` text COMMENT 'Notas internas para el subtipo.', 
  PRIMARY KEY (`id_subtipo_comida`),
  KEY `id_tipo_comida` (`id_tipo_comida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE IF NOT EXISTS `restaurantes` (
  `id_restaurante` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada restaurante.',
  `nombre_restaurante` varchar(100) NOT NULL COMMENT 'Nombre del restaurante.',
  `foto_perfil_restaurante` varchar(500) NOT NULL COMMENT 'Foto de perfil del restaurante (Será la ruta+nombreArchivo de la foto).',
  `carta` varchar(500) NOT NULL COMMENT 'Foto de la carta del restaurante (Será la ruta+nombreArchivo de la foto).',
  `calle_restaurante` varchar(100) NOT NULL COMMENT 'Calle del restaurante.', 
  `barrio_restaurante` varchar(100) COMMENT 'Barrio del restaurante.', 
  `ciudad_restaurante` varchar(100) NOT NULL COMMENT 'Ciudad del restaurante.', 
  `comunidad_autonoma_restaurante` varchar(100) NOT NULL COMMENT 'Comunidad autónoma del restaurante.', 
  `precio_medio_comensal` float(6) COMMENT 'Precio por persona medio.',
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de la categoria a la que pertenece el restaurante.',
  `notas` text COMMENT 'Notas internas para el restaurante.', 
  PRIMARY KEY (`id_restaurante`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "categoria-restaurante".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `categoria-restaurante`;
CREATE TABLE IF NOT EXISTS `categoria-restaurante` (
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de la categoria.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para la relacion.', 
  CONSTRAINT FOREIGN KEY (`id_categoria`) REFERENCES categorias (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "tipo-restaurante".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `tipo-restaurante`;
CREATE TABLE IF NOT EXISTS `tipo-restaurante` (
  `id_tipo_comida` int(12) NOT NULL COMMENT 'Identificador del tipo de comida.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para la relacion.', 
  CONSTRAINT FOREIGN KEY (`id_tipo_comida`) REFERENCES tipos_comida (`id_tipo_comida`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "imagenes_restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `imagenes_restaurantes`;
CREATE TABLE IF NOT EXISTS `imagenes_restaurantes` (
  `id_imagen_restaurante` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada imagen de restaurante.',
  `ruta_imagen_restaurante` varchar(500) NOT NULL COMMENT 'Imagen aportada por el restaurante (Será la ruta+nombreArchivo de la imagen).', 
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada restaurante asociada a la imagen.', 
  `notas` text COMMENT 'Notas internas para la imagen del restaurante.', 
  PRIMARY KEY (`id_imagen_restaurante`),
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "eventos".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada evento de restaurante.',
  `titulo_evento` varchar(100) NOT NULL COMMENT 'Título del evento organizado.',
  `descripcion_evento` varchar(500) NOT NULL COMMENT 'Descripción del evento organizado.',
  `fecha_evento` date NOT NULL COMMENT 'Fecha de celebración del evento.', 
  `imagen_promocional` varchar(500) NOT NULL COMMENT 'Imagen aportada por el restaurante (Será la ruta+nombreArchivo de la imagen).', 
  `incidencia_evento` tinyint(1) COMMENT 'Marca de incidencia en una reseña: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada restaurante asociada a la imagen.', 
  `notas` text COMMENT 'Notas internas para el evento.', 
  PRIMARY KEY (`id_evento`),
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "reseñas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `reseñas`;
CREATE TABLE IF NOT EXISTS `reseñas` (
  `id_reseña` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada reseña.',
  `titulo_reseña` varchar(100) COMMENT 'Título de la reseña.',
  `cuerpo_reseña` varchar(500) COMMENT 'Cuerpo de la reseña.',
  `puntuacion` tinyint(1) NOT NULL COMMENT 'Puntuación de 0-5.',
  `precio_x_persona` float(6) COMMENT 'Precio por persona gastado.',
  `incidencia_reseña` tinyint(1) COMMENT 'Marca de incidencia en una reseña: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `fecha_reseña` date NOT NULL COMMENT 'Fecha de la reseña.',
  `ref_cliente` varchar(10) NOT NULL COMMENT 'Referencia del cliente asociado a la reseña.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la reseña.',
  `notas` text COMMENT 'Notas internas para la reseña.', 
  PRIMARY KEY (`id_reseña`),
  CONSTRAINT FOREIGN KEY (`ref_cliente`) REFERENCES clientes (`ref_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "imagenes_reseñas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `imagenes_reseñas`;
CREATE TABLE IF NOT EXISTS `imagenes_reseñas` (
  `id_imagen_reseña` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada imagen de reseña.',
  `ruta_imagen_reseña` varchar(500) NOT NULL COMMENT 'Imagen aportada en la reseña por el usuario (Será la ruta+nombreArchivo de la imagen).', 
  `id_reseña` int(12) NOT NULL COMMENT 'Identificador de cada reseña asociada a la imagen.', 
  `notas` text COMMENT 'Notas internas para la imagen de reseña.', 
  PRIMARY KEY (`id_imagen_reseña`),
  CONSTRAINT FOREIGN KEY (`id_reseña`) REFERENCES reseñas (`id_reseña`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "respuestas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id_respuesta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada respuesta de reseña.',
  `texto_respuesta` varchar(200) NOT NULL COMMENT 'Texto de la respuesta.', 
  `incidencia_respuesta` tinyint(1) COMMENT 'Marca de incidencia en una respuesta: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `id_reseña` int(12) NOT NULL COMMENT 'Identificador de cada reseña asociada a la respuesta.', 
  `notas` text COMMENT 'Notas internas para la respuesta de reseña.', 
  PRIMARY KEY (`id_respuesta`),
  CONSTRAINT FOREIGN KEY (`id_reseña`) REFERENCES reseñas (`id_reseña`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "subrespuestas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `subrespuestas`;
CREATE TABLE IF NOT EXISTS `subrespuestas` (
  `id_subrespuesta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada respuesta dada a otra respuesta.',
  `id_respuesta` int(12) NOT NULL COMMENT 'Identificador de la respuesta padre.',
  `notas` text COMMENT 'Notas internas para la subrespuesta de reseña.', 
  PRIMARY KEY (`id_subrespuesta`),
  CONSTRAINT FOREIGN KEY (`id_respuesta`) REFERENCES respuestas (`id_respuesta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "favoritos".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `ref_cliente` varchar(10) NOT NULL COMMENT 'Identificador del cliente.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para el favorito.', 
  CONSTRAINT FOREIGN KEY (`ref_cliente`) REFERENCES clientes (`ref_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "reservas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id_reserva` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada reserva.',
  `datos_pago` varchar(100) NOT NULL COMMENT 'Datos de pago dados por el cliente.',
  `num_comensales` int(3) NOT NULL COMMENT 'Número de comensales para la reserva.',
  `fecha_reserva` date NOT NULL COMMENT 'Fecha de la reserva.',
  `ref_cliente` varchar(10) NOT NULL COMMENT 'Referencia del cliente asociado a la reserva.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la reserva.',
  `notas` text COMMENT 'Notas internas para la reserva.', 
  PRIMARY KEY (`id_reserva`),
  CONSTRAINT FOREIGN KEY (`ref_cliente`) REFERENCES clientes (`ref_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "control_restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `control_restaurantes`;
CREATE TABLE IF NOT EXISTS `control_restaurantes` (
  `ref_gestor` varchar(10) NOT NULL COMMENT 'Referencia del gestor asociado al restaurante.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado al gestor.',
  `notas` text COMMENT 'Notas internas para el control de restaurantes.', 
  CONSTRAINT FOREIGN KEY (`ref_gestor`) REFERENCES gestores (`ref_gestor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "comentarios".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comentario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del comentario.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador del usuario que hace el comentario.',
  `notas` text COMMENT 'Notas internas para los comentarios.', 
  PRIMARY KEY (`id_comentario`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "respuestas_faq".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `respuestas_faq`;
CREATE TABLE IF NOT EXISTS `respuestas_faq` (
  `id_pregunta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la pregunta FAQ.',
  `pregunta` varchar(500) NOT NULL COMMENT 'Pregunta a responder.',
  `respuesta` varchar (500) NOT NULL COMMENT 'Respuesta dada.',
  `notas` text COMMENT 'Notas internas para las preguntas FAQ.', 
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "logs".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del log.',
  `tipo_log` varchar(100) NOT NULL COMMENT 'Tipo del log.',
  `texto_log` varchar(500) NOT NULL COMMENT 'Texto informatico dado.',
  `fecha_hora` varchar(50) NOT NULL COMMENT 'Fecha y hora del log.',
  `notas` text COMMENT 'Notas internas para los log.', 
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "configuraciones".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE IF NOT EXISTS `configuraciones` (
  `id_variable` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la variable.',
  `nombre_variable` varchar(50) NOT NULL COMMENT 'Nombre de la variable.',
  `valor_variable` varchar(50) NOT NULL COMMENT 'Valor de la variable.',
  `notas` text COMMENT 'Notas internas para las variables.', 
  PRIMARY KEY (`id_variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;