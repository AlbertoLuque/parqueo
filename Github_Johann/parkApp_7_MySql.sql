-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2018 at 12:07 AM
-- Server version: 5.1.62
-- PHP Version: 5.4.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `parkApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario`           int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_estacionamiento`      int(8) unsigned NOT NULL,
  `com_puntuacion`          int(1) DEFAULT NULL,
  `com_comentario`          varchar(120) DEFAULT NULL,
  `com_filtroLenguajeApropiado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `comentario_estacionamiento_FK` (`id_estacionamiento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `distritoPostal`
--

CREATE TABLE IF NOT EXISTS `distritoPostal` (
  `id_distrito`             int(8) unsigned NOT NULL AUTO_INCREMENT,
  `dis_postal`              varchar(24) DEFAULT NULL,
  `dis_provincia`           varchar(40) DEFAULT NULL,
  `dis_nombre`              varchar(40) DEFAULT NULL,
  `dis_pais`                varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id_distrito`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estacionamiento`
--

CREATE TABLE IF NOT EXISTS `estacionamiento` (
  `id_estacionamiento`      int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_local`                int(8) unsigned NOT NULL,
  `id_tipoAmbiente`         int(8) unsigned NOT NULL,
  `id_tipoUbicacion`        int(8) unsigned NOT NULL,
  `id_tipoVehiculo`         int(8) unsigned NOT NULL,
  `id_propietario`          int(8) unsigned NOT NULL,
  `est_codigo`              varchar(8) DEFAULT NULL,
  `est_precioMinuto`        float(8,4) DEFAULT NULL,
  `est_precioHora`          float(8,2) DEFAULT NULL,
  `est_precioDia`           float(8,2) DEFAULT NULL,
  `est_precioMes`           float(8,2) DEFAULT NULL,
  `est_puntuacion`          int(1) unsigned DEFAULT NULL,
  `est_activo`              bit(1) NOT NULL,
  `est_preferencial`        bit(1) NOT NULL,
  PRIMARY KEY (`id_estacionamiento`),
  KEY `estacionamiento_local_FK` (`id_local`),
  KEY `estacionamiento_propietario_FK` (`id_propietario`),
  KEY `estacionamiento_tipoAmbiente_FK` (`id_tipoAmbiente`),
  KEY `estacionamiento_tipoUbicacion_FK` (`id_tipoUbicacion`),
  KEY `estacionamiento_tipoVehiculo_FK` (`id_tipoVehiculo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `local`
--

CREATE TABLE IF NOT EXISTS `local` (
  `id_local`                int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_distrito`             int(8) unsigned NOT NULL,
  `loc_nombreLocal`         varchar(40) DEFAULT NULL,
  `loc_direccion`           varchar(60) DEFAULT NULL,
  `loc_dirLatitudMaps`      float DEFAULT NULL,
  `loc_dirLongitudMaps`     float DEFAULT NULL,
  `loc_telefono`            varchar(24) DEFAULT NULL,
  `loc_horarioAbre`         time DEFAULT NULL,
  `loc_horarioCierra`       time DEFAULT NULL,
  `loc_foto`                varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_local`),
  KEY `local_distritoPostal_FK` (`id_distrito`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `propietario`
--

CREATE TABLE IF NOT EXISTS `propietario` (
  `id_propietario`          int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario`              int(8) unsigned NOT NULL,
  PRIMARY KEY (`id_propietario`),
  KEY `propietario_usuario_FK` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `publicidad`
--

CREATE TABLE IF NOT EXISTS `publicidad` (
  `id_publicidad`           int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipoUsuario`          int(8) unsigned NOT NULL,
  `pbl_titulo`              varchar(60) DEFAULT NULL,
  `pbl_contenido`           varchar(120) DEFAULT NULL,
  `pbl_fechaInicio`         datetime DEFAULT NULL,
  `pbl_fechaFinal`          datetime DEFAULT NULL,
  `pbl_tarifa`              float(8,2) DEFAULT NULL,
  `pbl_ubicacion`           int(2) DEFAULT NULL,
  PRIMARY KEY (`id_publicidad`),
  KEY `publicidad_tipoUsuario_FK` (`id_tipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva`              int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario`              int(8) unsigned NOT NULL,
  `id_estacionamiento`      int(8) unsigned NOT NULL,
  `rsv_pagado`              bit(1) DEFAULT NULL,
  `rsv_fechaHoraInicio`     datetime DEFAULT NULL,
  `rsv_periodoMinuto`       bit(1) DEFAULT NULL,
  `rsv_periodoHora`         bit(1) DEFAULT NULL,
  `rsv_periodoDia`          bit(1) DEFAULT NULL,
  `rsv_periodoMes`          bit(1) DEFAULT NULL,
  `rsv_cantidad`            int(11) DEFAULT NULL,
  `rsv_fechaHoraFinal`      datetime DEFAULT NULL,
  `rsv_precioTotal`         float(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `reserva_estacionamiento_FK` (`id_estacionamiento`),
  KEY `reserva_usuario_FK` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `id_servicio`             int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_reserva`              int(8) unsigned NOT NULL,
  `id_tipoServicio`         int(8) unsigned NOT NULL,
  `svc_precio`              float DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `servicio_reserva_FK` (`id_reserva`),
  KEY `servicio_tipoServicio_FK` (`id_tipoServicio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoAmbiente`
--

CREATE TABLE IF NOT EXISTS `tipoAmbiente` (
  `id_tipoAmbiente`         int(8) unsigned NOT NULL AUTO_INCREMENT,
  `tam_nombre`              varchar(24) DEFAULT NULL,
  `tam_descripcion`         varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_tipoAmbiente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoDocumento`
--

CREATE TABLE IF NOT EXISTS `tipoDocumento` (
  `id_tipoDocumento`        int(8) unsigned NOT NULL AUTO_INCREMENT,
  `tdo_nombre`              varchar(24) DEFAULT NULL,
  `tdo_detalle`             varchar(40) DEFAULT NULL,
  `tdo_cantCaracteres`      int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_tipoDocumento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoServicio`
--

CREATE TABLE IF NOT EXISTS `tipoServicio` (
  `id_tipoServicio`         int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_local`                int(8) unsigned NOT NULL,
  `tse_detalle`             varchar(40) DEFAULT NULL,
  `tse_precio`              float(8,2) DEFAULT NULL,
  `tse_activo`              bit(1) NOT NULL,
  PRIMARY KEY (`id_tipoServicio`),
  KEY `tipoServicio_local_FK` (`id_local`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoUbicacion`
--

CREATE TABLE IF NOT EXISTS `tipoUbicacion` (
  `id_tipoUbicacion`        int(8) unsigned NOT NULL AUTO_INCREMENT,
  `tub_nombre`              varchar(24) DEFAULT NULL,
  `tub_descripcion`         varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_tipoUbicacion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoUsuario`
--

CREATE TABLE IF NOT EXISTS `tipoUsuario` (
  `id_tipoUsuario`          int(8) unsigned NOT NULL AUTO_INCREMENT,
  `tus_nombre`              varchar(24) DEFAULT NULL,
  `tus_nivelPrivilegio`     int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_tipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoVehiculo`
--

CREATE TABLE IF NOT EXISTS `tipoVehiculo` (
  `id_tipoVehiculo`         int(8) unsigned NOT NULL AUTO_INCREMENT,
  `tve_nombre`              varchar(24) DEFAULT NULL,
  `tve_descripcion`         varchar(120) DEFAULT NULL,
  `tve_anchoMaximo`         float(4,2) DEFAULT NULL,
  `tve_largoMaximo`         float(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_tipoVehiculo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario`              int(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipoUsuario`          int(8) unsigned NOT NULL,
  `id_tipoDocumento`        int(8) unsigned NOT NULL,
  `id_distrito`             int(8) unsigned NOT NULL,
  `usu_nombres`             varchar(40) DEFAULT NULL,
  `usu_apPaterno`           varchar(40) DEFAULT NULL,
  `usu_apMaterno`           varchar(40) DEFAULT NULL,
  `usu_sexo`                varchar(1) DEFAULT NULL,
  `usu_numDocumento`        varchar(12) DEFAULT NULL,
  `usu_email`               varchar(60) DEFAULT NULL,
  `usu_usuario`             varchar(12) DEFAULT NULL,
  `usu_clave`               varchar(12) DEFAULT NULL,
  `usu_fechaNacimiento`     date DEFAULT NULL,
  `usu_celular`             varchar(24) DEFAULT NULL,
  `usu_direccion`           varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `usuario_distritoPostal_FK` (`id_distrito`),
  KEY `usuario_tipoDocumento_FK` (`id_tipoDocumento`),
  KEY `usuario_tipoUsuario_FK` (`id_tipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
