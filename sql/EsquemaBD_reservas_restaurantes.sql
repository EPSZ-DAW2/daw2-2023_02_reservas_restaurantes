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
-- Estructura de la tabla "imagenes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id_imagen` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de imagen.',
  `descripcion` varchar(500) COMMENT 'Texto que describe la imagen y se muestra como pié de foto (opcional).',
  `notas` text COMMENT 'Notas internas para la imagen.',
  PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "usuarios".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuario.',
  `nombre_usuario` varchar(50) NOT NULL COMMENT 'Nombre del usuario.',
  `email` varchar(32) NOT NULL COMMENT 'Email de regitro del usuario.',
  `password` varchar(200) NOT NULL COMMENT 'Contraseña de registro del usuario.',
  `id_foto_usuario` int(12) COMMENT 'ID de la foto de perfil del usuario. NULL si no tiene.',  
  `notas` text COMMENT 'Notas internas para el usuario.', 
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT FOREIGN KEY (`id_foto_usuario`) REFERENCES imagenes (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Tabla: 'administradores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `administradores`;
CREATE TABLE IF NOT EXISTS `administradores` (
  `id_administrador` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada administrador.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Administrador',
  PRIMARY KEY (`id_administrador`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Tabla: 'gestores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `gestores`;
CREATE TABLE IF NOT EXISTS `gestores` (
  `id_gestor` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada gestor.',
  `es_propietario` tinyint(1) NOT NULL COMMENT 'Si el gestor es propietario o solo gestor, 0 solo gestor 1 propietario.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Gestor',
  PRIMARY KEY (`id_gestor`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Tabla: 'moderadores'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `moderadores`;
CREATE TABLE IF NOT EXISTS `moderadores` (
  `id_moderador` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada moderador.',
  `ciudad_moderador` varchar(100) COMMENT 'Ciudad de residencia del moderador.',
  `comunidad_autonoma_moderador` varchar(100) NOT NULL COMMENT 'Comunidad autónoma de residencia del moderador.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Moderador',
  PRIMARY KEY (`id_moderador`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Tabla: 'clientes'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada cliente.',
  `id_usuario` int(12) NOT NULL COMMENT 'Identificador asociado a cada usuario.',
  `notas` text COMMENT 'Notas internas para el Cliente',
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT FOREIGN KEY (`id_usuario`) REFERENCES usuarios (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "categorias".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada categoria de restaurante.',
  `id_categoria_padre` int(12) COMMENT 'Identificador de la categoría padre NULL si no tiene',
  `nombre_categoria` varchar(200) NOT NULL COMMENT 'Nombre de la categoria.',
  `notas` text COMMENT 'Notas internas para la categoria.', 
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "tipos_comida".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `tipos_comida`;
CREATE TABLE IF NOT EXISTS `tipos_comida` (
  `id_tipo_comida` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada tipo de comida de restaurante.',
  `id_tipo_padre` int(12) COMMENT 'Identificador del tipo de comida padre NULL si no tiene',
  `nombre_tipo` varchar(200) NOT NULL COMMENT 'Nombre del tipo de comida.',
  `notas` text COMMENT 'Notas internas para el tipo.', 
  PRIMARY KEY (`id_tipo_comida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE IF NOT EXISTS `restaurantes` (
  `id_restaurante` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada restaurante.',
  `nombre_restaurante` varchar(100) NOT NULL COMMENT 'Nombre del restaurante.',
  `id_foto_restaurante` int(12) NOT NULL COMMENT 'ID de la foto de perfil del restaurante.',
  `id_carta` int(12) NOT NULL COMMENT 'ID de la foto de la carta.',
  `calle_restaurante` varchar(100) NOT NULL COMMENT 'Calle del restaurante.', 
  `barrio_restaurante` varchar(100) COMMENT 'Barrio del restaurante.', 
  `ciudad_restaurante` varchar(100) NOT NULL COMMENT 'Ciudad del restaurante.', 
  `comunidad_autonoma_restaurante` varchar(100) NOT NULL COMMENT 'Comunidad autónoma del restaurante.', 
  `precio_medio_comensal` float(6) COMMENT 'Precio por persona medio.',
  `notas` text COMMENT 'Notas internas para el restaurante.', 
  PRIMARY KEY (`id_restaurante`),
  CONSTRAINT FOREIGN KEY (`id_foto_restaurante`) REFERENCES imagenes (`id_imagen`),
  CONSTRAINT FOREIGN KEY (`id_carta`) REFERENCES imagenes (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "categoria_restaurante".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `categoria_restaurante`;
CREATE TABLE IF NOT EXISTS `categoria_restaurante` (
  `id_categoria` int(12) NOT NULL COMMENT 'Identificador de la categoria.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para la relacion.', 
  CONSTRAINT FOREIGN KEY (`id_categoria`) REFERENCES categorias (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "tipo_restaurante".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `tipo_restaurante`;
CREATE TABLE IF NOT EXISTS `tipo_restaurante` (
  `id_tipo_comida` int(12) NOT NULL COMMENT 'Identificador del tipo de comida.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para la relacion.', 
  CONSTRAINT FOREIGN KEY (`id_tipo_comida`) REFERENCES tipos_comida (`id_tipo_comida`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "eventos".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada evento de restaurante.',
  `titulo_evento` varchar(100) NOT NULL COMMENT 'Título del evento organizado.',
  `descripcion_evento` varchar(500) NOT NULL COMMENT 'Descripción del evento organizado.',
  `fecha_evento` date NOT NULL COMMENT 'Fecha de celebración del evento.', 
  `id_imagen_promocional` int(12) NOT NULL COMMENT 'ID del la imagen aportada por el restaurante (Será la ruta+nombreArchivo de la imagen).', 
  `incidencia_evento` tinyint(1) COMMENT 'Marca de incidencia en una resena: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada restaurante asociada a la imagen.', 
  `notas` text COMMENT 'Notas internas para el evento.', 
  PRIMARY KEY (`id_evento`),
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_imagen_promocional`) REFERENCES imagenes (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "resenas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `resenas`;
CREATE TABLE IF NOT EXISTS `resenas` (
  `id_resena` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada resena.',
  `titulo_resena` varchar(100) COMMENT 'Título de la resena.',
  `cuerpo_resena` varchar(500) COMMENT 'Cuerpo de la resena.',
  `puntuacion` tinyint(1) NOT NULL COMMENT 'Puntuación de 0-5.',
  `precio_x_persona` float(6) COMMENT 'Precio por persona gastado.',
  `incidencia_resena` tinyint(1) COMMENT 'Marca de incidencia en una resena: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `fecha_resena` date NOT NULL COMMENT 'Fecha de la resena.',
  `id_cliente` int(12) NOT NULL COMMENT 'Referencia del cliente asociado a la resena.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la resena.',
  `notas` text COMMENT 'Notas internas para la resena.', 
  PRIMARY KEY (`id_resena`),
  CONSTRAINT FOREIGN KEY (`id_cliente`) REFERENCES clientes (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "respuestas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id_respuesta` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada respuesta de resena.',
  `id_respuesta_padre` int(12) COMMENT 'Identificador de la respuesta padre NULL si no tiene',
  `texto_respuesta` varchar(200) NOT NULL COMMENT 'Texto de la respuesta.', 
  `incidencia_respuesta` tinyint(1) COMMENT 'Marca de incidencia en una respuesta: 0-Correcta, 1-Pendiente de Revisión 2-Eliminada.',
  `id_resena` int(12) NOT NULL COMMENT 'Identificador de cada resena asociada a la respuesta.', 
  `notas` text COMMENT 'Notas internas para la respuesta de resena.', 
  PRIMARY KEY (`id_respuesta`),
  CONSTRAINT FOREIGN KEY (`id_resena`) REFERENCES resenas (`id_resena`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "favoritos".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `id_cliente` int(12) NOT NULL COMMENT 'Identificador del cliente.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante.',
  `notas` text COMMENT 'Notas internas para el favorito.', 
  CONSTRAINT FOREIGN KEY (`id_cliente`) REFERENCES clientes (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  `hora_reserva` varchar(5) NOT NULL COMMENT 'Hora seleccionada por el cliente para la reserva (Ej: 21:00).',
  `id_cliente` int(12) NOT NULL COMMENT 'Referencia del cliente asociado a la reserva.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado a la reserva.',
  `notas` text COMMENT 'Notas internas para la reserva.', 
  PRIMARY KEY (`id_reserva`),
  CONSTRAINT FOREIGN KEY (`id_cliente`) REFERENCES clientes (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "control_restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `control_restaurantes`;
CREATE TABLE IF NOT EXISTS `control_restaurantes` (
  `id_gestor` int(12) NOT NULL COMMENT 'Referencia del gestor asociado al restaurante.',
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador del restaurante asociado al gestor.',
  `notas` text COMMENT 'Notas internas para el control de restaurantes.', 
  CONSTRAINT FOREIGN KEY (`id_gestor`) REFERENCES gestores (`id_gestor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "imagenes_restaurantes".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `imagenes_restaurantes`;
CREATE TABLE IF NOT EXISTS `imagenes_restaurantes` (
  `id_restaurante` int(12) NOT NULL COMMENT 'Identificador de cada imagen aportada por el restaurante.',
  `id_imagen` int(12) NOT NULL COMMENT 'Identificador la imagen.', 
  `notas` text COMMENT 'Notas internas para la relación imagen del restaurante.', 
  CONSTRAINT FOREIGN KEY (`id_restaurante`) REFERENCES restaurantes (`id_restaurante`),
  CONSTRAINT FOREIGN KEY (`id_imagen`) REFERENCES imagenes (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ---------------------------------------------------------------------------
-- Estructura de la tabla "imagenes_resenas".
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS `imagenes_resenas`;
CREATE TABLE IF NOT EXISTS `imagenes_resenas` (
  `id_resena` int(12) NOT NULL COMMENT 'Identificador de cada imagen de resena.',
  `id_imagen` int(12) NOT NULL COMMENT 'Identificador de cada resena asociada a la imagen.', 
  `notas` text COMMENT 'Notas internas para la relación imagen de resena.', 
  CONSTRAINT FOREIGN KEY (`id_resena`) REFERENCES resenas (`id_resena`),
  CONSTRAINT FOREIGN KEY (`id_imagen`) REFERENCES imagenes (`id_imagen`)
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
  `respuesta` varchar(500) NOT NULL COMMENT 'Respuesta dada.',
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
  `nombre_variable` varchar(50) NOT NULL COMMENT 'Nombre de la variable.',
  `valor_variable` varchar(50) NOT NULL COMMENT 'Valor de la variable.',
  `notas` text COMMENT 'Notas internas para las variables.', 
  PRIMARY KEY (`nombre_variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;