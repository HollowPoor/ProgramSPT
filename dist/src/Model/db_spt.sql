/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.16-MariaDB : Database - bd_spt-plut
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tbl_history-spd` */

DROP TABLE IF EXISTS `tbl_history-spd`;

CREATE TABLE `tbl_history-spd` (
  `kode_spd` char(7) NOT NULL,
  `no_surat` varchar(255) DEFAULT NULL,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `pangkat_golongan` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `tujuan_dinas` varchar(255) DEFAULT NULL,
  `kendaraan` varchar(255) DEFAULT NULL,
  `tempat_berangkat` varchar(255) DEFAULT NULL,
  `tempat_tujuan` varchar(255) DEFAULT NULL,
  `lama_perjalanan` varchar(255) DEFAULT NULL,
  `berangkat` date DEFAULT NULL,
  `kembali` date DEFAULT NULL,
  `instansi` varchar(255) DEFAULT NULL,
  `fungsi` varchar(255) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `akun` varchar(255) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `ditetapkan` varchar(255) DEFAULT NULL,
  `tgl_ditetapkan` date DEFAULT NULL,
  `nama_kepala` varchar(255) DEFAULT NULL,
  `nama_jabatan` varchar(255) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kode_spd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_history-spd` */

/*Table structure for table `tbl_kepala` */

DROP TABLE IF EXISTS `tbl_kepala`;

CREATE TABLE `tbl_kepala` (
  `id_kepala` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kepala` char(4) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_kepala` */

insert  into `tbl_kepala`(`id_kepala`,`kode_kepala`,`nama`,`jabatan`,`nip`) values 
(1,'KP-1','Drs. SAMSURIJAL, M.M','Pembina Utama Muda','19670418 199203 1 003');

/*Table structure for table `tbl_konsultan` */

DROP TABLE IF EXISTS `tbl_konsultan`;

CREATE TABLE `tbl_konsultan` (
  `id_konsultan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_konsultan` char(4) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `golongan` varchar(255) DEFAULT NULL,
  `tingkatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_konsultan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_konsultan` */

insert  into `tbl_konsultan`(`id_konsultan`,`kode_konsultan`,`nama`,`jabatan`,`golongan`,`tingkatan`) values 
(1,'k-01','Priyatmono, S.Sos','Kelembagaan',NULL,NULL),
(2,'k-02','Somi Awan, S.H','Pemibiayaan',NULL,NULL),
(3,'k-03','Meirisa Puspita, S.P','Pemasaran',NULL,NULL),
(4,'k-04','Maryani, S.H., M.M','Sumber Daya Manusia',NULL,NULL),
(5,'k-05','Aan Hendridunan Maheda, S.T','Jaringan Kerjasama',NULL,NULL),
(6,'k-06','Adhie Thyo Priandika, S.kom, M.kom','Pengembangan TI',NULL,NULL),
(7,'k-07','Saparudin, S.E., M.M','Produksi',NULL,NULL),
(8,'k-00',NULL,NULL,NULL,NULL);

/*Table structure for table `tbl_surat_spd` */

DROP TABLE IF EXISTS `tbl_surat_spd`;

CREATE TABLE `tbl_surat_spd` (
  `id_surat` char(7) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `perintah` varchar(255) DEFAULT NULL,
  `id_konsultan` int(11) DEFAULT NULL,
  `tujuan_dinas` varchar(255) NOT NULL,
  `kendaraan` varchar(255) NOT NULL,
  `tempat_berangkat` varchar(255) NOT NULL,
  `tempat_tujuan` varchar(255) NOT NULL,
  `lama_perjalanan` varchar(255) NOT NULL,
  `berangkat` date NOT NULL,
  `kembali` date NOT NULL,
  `instansi` varchar(255) DEFAULT NULL,
  `kode_fungsi` varchar(255) DEFAULT NULL,
  `kode_kegiatan` varchar(255) DEFAULT NULL,
  `kode_akun` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ditetapkan` varchar(255) DEFAULT NULL,
  `tgl_dibuat` date DEFAULT NULL,
  `id_kepala` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat`),
  KEY `id_konsultan` (`id_konsultan`),
  KEY `id_kepala` (`id_kepala`),
  CONSTRAINT `tbl_surat_spd_ibfk_1` FOREIGN KEY (`id_konsultan`) REFERENCES `tbl_konsultan` (`id_konsultan`),
  CONSTRAINT `tbl_surat_spd_ibfk_2` FOREIGN KEY (`id_kepala`) REFERENCES `tbl_kepala` (`id_kepala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_surat_spd` */

/*Table structure for table `tbl_surat_spt` */

DROP TABLE IF EXISTS `tbl_surat_spt`;

CREATE TABLE `tbl_surat_spt` (
  `id_surat` int(11) NOT NULL AUTO_INCREMENT,
  `no_surat` varchar(255) NOT NULL,
  `isi_dasar1` varchar(255) DEFAULT NULL,
  `isi_dasar2` varchar(255) DEFAULT NULL,
  `tujuan` varchar(255) NOT NULL,
  `tanggal_tujuan` date NOT NULL,
  `ditetapkan` varchar(255) NOT NULL,
  `tgl_ditetapkan` date NOT NULL,
  `id_konsultan1` int(11) DEFAULT NULL,
  `id_konsultan2` int(11) DEFAULT NULL,
  `id_konsultan3` int(11) DEFAULT NULL,
  `id_konsultan4` int(11) DEFAULT NULL,
  `id_kepala` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat`),
  KEY `id_konsultan1` (`id_konsultan1`),
  KEY `id_konsultan2` (`id_konsultan2`),
  KEY `id_konsultan3` (`id_konsultan3`),
  KEY `id_konsultan4` (`id_konsultan4`),
  KEY `id_kepala` (`id_kepala`),
  CONSTRAINT `tbl_surat_spt_ibfk_1` FOREIGN KEY (`id_konsultan1`) REFERENCES `tbl_konsultan` (`id_konsultan`),
  CONSTRAINT `tbl_surat_spt_ibfk_2` FOREIGN KEY (`id_konsultan2`) REFERENCES `tbl_konsultan` (`id_konsultan`),
  CONSTRAINT `tbl_surat_spt_ibfk_3` FOREIGN KEY (`id_konsultan3`) REFERENCES `tbl_konsultan` (`id_konsultan`),
  CONSTRAINT `tbl_surat_spt_ibfk_4` FOREIGN KEY (`id_konsultan4`) REFERENCES `tbl_konsultan` (`id_konsultan`),
  CONSTRAINT `tbl_surat_spt_ibfk_5` FOREIGN KEY (`id_kepala`) REFERENCES `tbl_kepala` (`id_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_surat_spt` */

insert  into `tbl_surat_spt`(`id_surat`,`no_surat`,`isi_dasar1`,`isi_dasar2`,`tujuan`,`tanggal_tujuan`,`ditetapkan`,`tgl_ditetapkan`,`id_konsultan1`,`id_konsultan2`,`id_konsultan3`,`id_konsultan4`,`id_kepala`) values 
(1,'25','EW','YH','Pagar Alam','2021-08-19','Bandar Lampung','2021-08-17',4,3,5,8,1);

/*Table structure for table `vkonsultan1` */

DROP TABLE IF EXISTS `vkonsultan1`;

/*!50001 DROP VIEW IF EXISTS `vkonsultan1` */;
/*!50001 DROP TABLE IF EXISTS `vkonsultan1` */;

/*!50001 CREATE TABLE  `vkonsultan1`(
 `id_konsultan` int(11) ,
 `kode_konsultan` char(4) ,
 `nama` varchar(255) ,
 `jabatan` varchar(255) 
)*/;

/*Table structure for table `vkonsultan2` */

DROP TABLE IF EXISTS `vkonsultan2`;

/*!50001 DROP VIEW IF EXISTS `vkonsultan2` */;
/*!50001 DROP TABLE IF EXISTS `vkonsultan2` */;

/*!50001 CREATE TABLE  `vkonsultan2`(
 `id_konsultan` int(11) ,
 `kode_konsultan` char(4) ,
 `nama` varchar(255) ,
 `jabatan` varchar(255) 
)*/;

/*Table structure for table `vkonsultan3` */

DROP TABLE IF EXISTS `vkonsultan3`;

/*!50001 DROP VIEW IF EXISTS `vkonsultan3` */;
/*!50001 DROP TABLE IF EXISTS `vkonsultan3` */;

/*!50001 CREATE TABLE  `vkonsultan3`(
 `id_konsultan` int(11) ,
 `kode_konsultan` char(4) ,
 `nama` varchar(255) ,
 `jabatan` varchar(255) 
)*/;

/*Table structure for table `vkonsultan4` */

DROP TABLE IF EXISTS `vkonsultan4`;

/*!50001 DROP VIEW IF EXISTS `vkonsultan4` */;
/*!50001 DROP TABLE IF EXISTS `vkonsultan4` */;

/*!50001 CREATE TABLE  `vkonsultan4`(
 `id_konsultan` int(11) ,
 `kode_konsultan` char(4) ,
 `nama` varchar(255) ,
 `jabatan` varchar(255) 
)*/;

/*Table structure for table `vsuratspd` */

DROP TABLE IF EXISTS `vsuratspd`;

/*!50001 DROP VIEW IF EXISTS `vsuratspd` */;
/*!50001 DROP TABLE IF EXISTS `vsuratspd` */;

/*!50001 CREATE TABLE  `vsuratspd`(
 `no_surat` varchar(255) ,
 `perintah` varchar(255) ,
 `nama_konsultan` varchar(255) ,
 `golongan` varchar(255) ,
 `jabatan` varchar(255) ,
 `tingkatan` varchar(255) ,
 `tujuan_dinas` varchar(255) ,
 `kendaraan` varchar(255) ,
 `tempat_berangkat` varchar(255) ,
 `tempat_tujuan` varchar(255) ,
 `lama_perjalanan` varchar(255) ,
 `berangkat` date ,
 `kembali` date ,
 `instansi` varchar(255) ,
 `kode_fungsi` varchar(255) ,
 `kode_kegiatan` varchar(255) ,
 `kode_akun` varchar(255) ,
 `keterangan` varchar(255) ,
 `ditetapkan` varchar(255) ,
 `tgl_dibuat` date ,
 `nama` varchar(255) ,
 `nip` varchar(255) 
)*/;

/*Table structure for table `vsuratspt` */

DROP TABLE IF EXISTS `vsuratspt`;

/*!50001 DROP VIEW IF EXISTS `vsuratspt` */;
/*!50001 DROP TABLE IF EXISTS `vsuratspt` */;

/*!50001 CREATE TABLE  `vsuratspt`(
 `no_surat` varchar(255) ,
 `isi_dasar1` varchar(255) ,
 `isi_dasar2` varchar(255) ,
 `nama1` varchar(255) ,
 `jabatan1` varchar(255) ,
 `nama2` varchar(255) ,
 `jabatan2` varchar(255) ,
 `nama3` varchar(255) ,
 `jabatan3` varchar(255) ,
 `nama4` varchar(255) ,
 `jabatan4` varchar(255) ,
 `tujuan` varchar(255) ,
 `tanggal_tujuan` date ,
 `ditetapkan` varchar(255) ,
 `nama` varchar(255) ,
 `jabatan` varchar(255) ,
 `nip` varchar(255) 
)*/;

/*View structure for view vkonsultan1 */

/*!50001 DROP TABLE IF EXISTS `vkonsultan1` */;
/*!50001 DROP VIEW IF EXISTS `vkonsultan1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vkonsultan1` AS (select `tbl_konsultan`.`id_konsultan` AS `id_konsultan`,`tbl_konsultan`.`kode_konsultan` AS `kode_konsultan`,`tbl_konsultan`.`nama` AS `nama`,`tbl_konsultan`.`jabatan` AS `jabatan` from `tbl_konsultan`) */;

/*View structure for view vkonsultan2 */

/*!50001 DROP TABLE IF EXISTS `vkonsultan2` */;
/*!50001 DROP VIEW IF EXISTS `vkonsultan2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vkonsultan2` AS (select `tbl_konsultan`.`id_konsultan` AS `id_konsultan`,`tbl_konsultan`.`kode_konsultan` AS `kode_konsultan`,`tbl_konsultan`.`nama` AS `nama`,`tbl_konsultan`.`jabatan` AS `jabatan` from `tbl_konsultan`) */;

/*View structure for view vkonsultan3 */

/*!50001 DROP TABLE IF EXISTS `vkonsultan3` */;
/*!50001 DROP VIEW IF EXISTS `vkonsultan3` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vkonsultan3` AS (select `tbl_konsultan`.`id_konsultan` AS `id_konsultan`,`tbl_konsultan`.`kode_konsultan` AS `kode_konsultan`,`tbl_konsultan`.`nama` AS `nama`,`tbl_konsultan`.`jabatan` AS `jabatan` from `tbl_konsultan`) */;

/*View structure for view vkonsultan4 */

/*!50001 DROP TABLE IF EXISTS `vkonsultan4` */;
/*!50001 DROP VIEW IF EXISTS `vkonsultan4` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vkonsultan4` AS (select `tbl_konsultan`.`id_konsultan` AS `id_konsultan`,`tbl_konsultan`.`kode_konsultan` AS `kode_konsultan`,`tbl_konsultan`.`nama` AS `nama`,`tbl_konsultan`.`jabatan` AS `jabatan` from `tbl_konsultan`) */;

/*View structure for view vsuratspd */

/*!50001 DROP TABLE IF EXISTS `vsuratspd` */;
/*!50001 DROP VIEW IF EXISTS `vsuratspd` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsuratspd` AS (select `tbl_surat_spd`.`no_surat` AS `no_surat`,`tbl_surat_spd`.`perintah` AS `perintah`,`tbl_konsultan`.`nama` AS `nama_konsultan`,`tbl_konsultan`.`golongan` AS `golongan`,`tbl_konsultan`.`jabatan` AS `jabatan`,`tbl_konsultan`.`tingkatan` AS `tingkatan`,`tbl_surat_spd`.`tujuan_dinas` AS `tujuan_dinas`,`tbl_surat_spd`.`kendaraan` AS `kendaraan`,`tbl_surat_spd`.`tempat_berangkat` AS `tempat_berangkat`,`tbl_surat_spd`.`tempat_tujuan` AS `tempat_tujuan`,`tbl_surat_spd`.`lama_perjalanan` AS `lama_perjalanan`,`tbl_surat_spd`.`berangkat` AS `berangkat`,`tbl_surat_spd`.`kembali` AS `kembali`,`tbl_surat_spd`.`instansi` AS `instansi`,`tbl_surat_spd`.`kode_fungsi` AS `kode_fungsi`,`tbl_surat_spd`.`kode_kegiatan` AS `kode_kegiatan`,`tbl_surat_spd`.`kode_akun` AS `kode_akun`,`tbl_surat_spd`.`keterangan` AS `keterangan`,`tbl_surat_spd`.`ditetapkan` AS `ditetapkan`,`tbl_surat_spd`.`tgl_dibuat` AS `tgl_dibuat`,`tbl_kepala`.`nama` AS `nama`,`tbl_kepala`.`nip` AS `nip` from ((`tbl_surat_spd` join `tbl_konsultan` on(`tbl_surat_spd`.`id_konsultan` = `tbl_konsultan`.`id_konsultan`)) join `tbl_kepala` on(`tbl_surat_spd`.`id_kepala` = `tbl_kepala`.`id_kepala`))) */;

/*View structure for view vsuratspt */

/*!50001 DROP TABLE IF EXISTS `vsuratspt` */;
/*!50001 DROP VIEW IF EXISTS `vsuratspt` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsuratspt` AS (select `tbl_surat_spt`.`no_surat` AS `no_surat`,`tbl_surat_spt`.`isi_dasar1` AS `isi_dasar1`,`tbl_surat_spt`.`isi_dasar2` AS `isi_dasar2`,`vkonsultan1`.`nama` AS `nama1`,`vkonsultan1`.`jabatan` AS `jabatan1`,`vkonsultan2`.`nama` AS `nama2`,`vkonsultan2`.`jabatan` AS `jabatan2`,`vkonsultan3`.`nama` AS `nama3`,`vkonsultan3`.`jabatan` AS `jabatan3`,`vkonsultan4`.`nama` AS `nama4`,`vkonsultan4`.`jabatan` AS `jabatan4`,`tbl_surat_spt`.`tujuan` AS `tujuan`,`tbl_surat_spt`.`tanggal_tujuan` AS `tanggal_tujuan`,`tbl_surat_spt`.`ditetapkan` AS `ditetapkan`,`tbl_kepala`.`nama` AS `nama`,`tbl_kepala`.`jabatan` AS `jabatan`,`tbl_kepala`.`nip` AS `nip` from (((((`tbl_surat_spt` join `tbl_kepala` on(`tbl_surat_spt`.`id_kepala` = `tbl_kepala`.`id_kepala`)) join `vkonsultan1` on(`vkonsultan1`.`id_konsultan` = `tbl_surat_spt`.`id_konsultan1`)) join `vkonsultan2` on(`vkonsultan2`.`id_konsultan` = `tbl_surat_spt`.`id_konsultan2`)) join `vkonsultan3` on(`vkonsultan3`.`id_konsultan` = `tbl_surat_spt`.`id_konsultan3`)) join `vkonsultan4` on(`vkonsultan4`.`id_konsultan` = `tbl_surat_spt`.`id_konsultan4`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
