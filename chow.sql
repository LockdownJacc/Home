/*
SQLyog Ultimate v8.61 
MySQL - 5.5.5-10.1.19-MariaDB : Database - gem_elite_bd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gem_elite_bd` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gem_elite_bd`;

/*Table structure for table `acreedores` */

DROP TABLE IF EXISTS `acreedores`;

CREATE TABLE `acreedores` (
  `id_acreedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_acreedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `acreedores` */

/*Table structure for table `catalogo_cuentas` */

DROP TABLE IF EXISTS `catalogo_cuentas`;

CREATE TABLE `catalogo_cuentas` (
  `codigo_agrupador` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(50) DEFAULT NULL,
  `tipo` varchar(5) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo_agrupador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `catalogo_cuentas` */

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

/*Table structure for table `detalle_cuentasyempresas` */

DROP TABLE IF EXISTS `detalle_cuentasyempresas`;

CREATE TABLE `detalle_cuentasyempresas` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `codigo_agrupaor` int(11) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `Fk_detalle_empresa` (`id_empresa`),
  KEY `Fk_detalle_catalogo` (`codigo_agrupaor`),
  CONSTRAINT `Fk_detalle_catalogo` FOREIGN KEY (`codigo_agrupaor`) REFERENCES `catalogo_cuentas` (`codigo_agrupador`),
  CONSTRAINT `Fk_detalle_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalle_cuentasyempresas` */

/*Table structure for table `deudores` */

DROP TABLE IF EXISTS `deudores`;

CREATE TABLE `deudores` (
  `id_deudor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_deudor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deudores` */

/*Table structure for table `deudores_div` */

DROP TABLE IF EXISTS `deudores_div`;

CREATE TABLE `deudores_div` (
  `id_deudordiv` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_deudordiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deudores_div` */

/*Table structure for table `diario_compra` */

DROP TABLE IF EXISTS `diario_compra`;

CREATE TABLE `diario_compra` (
  `id_diarioC` int(11) NOT NULL AUTO_INCREMENT,
  `coigo_agrupador` int(11) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `iva_porAcr` varchar(20) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `debe` varchar(20) DEFAULT NULL,
  `haber` varchar(20) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_diarioC`),
  KEY `FK_Diario_cuentas` (`coigo_agrupador`),
  KEY `FK_Diario_empresas` (`id_empresa`),
  CONSTRAINT `FK_Diario_cuentas` FOREIGN KEY (`coigo_agrupador`) REFERENCES `catalogo_cuentas` (`codigo_agrupador`),
  CONSTRAINT `FK_Diario_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `diario_compra` */

/*Table structure for table `diario_ingreso` */

DROP TABLE IF EXISTS `diario_ingreso`;

CREATE TABLE `diario_ingreso` (
  `id_dirioI` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_agrupador` int(11) DEFAULT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `iva_portras` varchar(10) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `debe` varchar(20) DEFAULT NULL,
  `haber` varchar(20) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_dirioI`),
  KEY `FK_DiarioI_cuentas` (`codigo_agrupador`),
  KEY `FK_DiarioI_empresas` (`id_empresa`),
  CONSTRAINT `FK_DiarioI_cuentas` FOREIGN KEY (`codigo_agrupador`) REFERENCES `catalogo_cuentas` (`codigo_agrupador`),
  CONSTRAINT `FK_DiarioI_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `diario_ingreso` */

/*Table structure for table `empresas` */

DROP TABLE IF EXISTS `empresas`;

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `rfc` varchar(15) DEFAULT NULL,
  `domicilio` varchar(200) DEFAULT NULL,
  `id_giroE` int(11) DEFAULT NULL,
  `id_razonS` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT NULL,
  `Updtated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `FK_empresas_GE` (`id_giroE`),
  KEY `FK_empresas_RS` (`id_razonS`),
  KEY `FK_empresas_u` (`id_usuario`),
  CONSTRAINT `FK_empresas_GE` FOREIGN KEY (`id_giroE`) REFERENCES `giro_empresarial` (`id_giroE`),
  CONSTRAINT `FK_empresas_RS` FOREIGN KEY (`id_razonS`) REFERENCES `razon_social` (`id_razonS`),
  CONSTRAINT `FK_empresas_u` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empresas` */

/*Table structure for table `giro_empresarial` */

DROP TABLE IF EXISTS `giro_empresarial`;

CREATE TABLE `giro_empresarial` (
  `id_giroE` int(11) NOT NULL AUTO_INCREMENT,
  `giro` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_giroE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `giro_empresarial` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `poliza_egresos` */

DROP TABLE IF EXISTS `poliza_egresos`;

CREATE TABLE `poliza_egresos` (
  `id_polizaE` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_agrupador` int(11) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `debe` varchar(20) DEFAULT NULL,
  `haber` varchar(20) DEFAULT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_polizaE`),
  KEY `FK_PolizaE_cuentas` (`codigo_agrupador`),
  KEY `FK_PolizaE_empresas` (`id_empresa`),
  CONSTRAINT `FK_PolizaE_cuentas` FOREIGN KEY (`codigo_agrupador`) REFERENCES `catalogo_cuentas` (`codigo_agrupador`),
  CONSTRAINT `FK_PolizaE_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `poliza_egresos` */

/*Table structure for table `poliza_ingresos` */

DROP TABLE IF EXISTS `poliza_ingresos`;

CREATE TABLE `poliza_ingresos` (
  `id_polizaI` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_agrupador` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `concepto` varchar(100) DEFAULT NULL,
  `debe` varchar(20) DEFAULT NULL,
  `haber` varchar(20) DEFAULT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updtated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_polizaI`),
  KEY `FK_PolizaI_cuentas` (`codigo_agrupador`),
  KEY `FK_PolizaI_empresas` (`id_empresa`),
  CONSTRAINT `FK_PolizaI_cuentas` FOREIGN KEY (`codigo_agrupador`) REFERENCES `catalogo_cuentas` (`codigo_agrupador`),
  CONSTRAINT `FK_PolizaI_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `poliza_ingresos` */

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

/*Table structure for table `razon_social` */

DROP TABLE IF EXISTS `razon_social`;

CREATE TABLE `razon_social` (
  `id_razonS` int(11) NOT NULL AUTO_INCREMENT,
  `razon` varchar(50) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_razonS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `razon_social` */

/*Table structure for table `tipos_usu` */

DROP TABLE IF EXISTS `tipos_usu`;

CREATE TABLE `tipos_usu` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(40) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipos_usu` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `ap_paterno` varchar(40) DEFAULT NULL,
  `ap_materno` varchar(40) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `crear` char(2) DEFAULT NULL,
  `modificar` char(2) DEFAULT NULL,
  `eliminar` char(2) DEFAULT NULL,
  `ver` char(2) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `activo` char(2) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT NULL,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuarios_tipo` (`id_tipo`),
  CONSTRAINT `FK_usuarios_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_usu` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`nombre`,`ap_paterno`,`ap_materno`,`usuario`,`contrasena`,`crear`,`modificar`,`eliminar`,`ver`,`id_tipo`,`activo`,`Created_at`,`Updated_at`,`Deleted_at`) values (2,'Jose Alberto','Carmona','Colin','laidisman217','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Luis','Gomez','Laravel','donjuan217','$2y$10$sGXsP7lf3rL3WdGqLId.W.wKQj1GUxF3mCl6Aj8Dn1icxkv4hXRVG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Laravel','MVC','Jack','lolrr45','$2y$10$wiQkWHPPnKYfJ216ukKeTuqJ1RQVmcapLzgBQm38PBziI5izEtPzK',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-15 02:28:44','2017-11-15 02:28:44',NULL),(5,'Juan','Camanei','lol','gatitobellaca','$2y$10$jQ8ChtrgnGu.kg6th1/n0O9YudvWgVRYDFri9KN8x05jkoxmC9Ds6',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-15 19:35:56','2017-11-15 19:35:56',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
