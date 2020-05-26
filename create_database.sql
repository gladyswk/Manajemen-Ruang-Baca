-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 02:58 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_pbd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`admin`@`localhost` PROCEDURE `HITUNG_DENDA` (OUT `TOTAL_DENDA` INTEGER, IN `LAMA_TELAT` INTEGER)  BEGIN
	DECLARE DENDA INTEGER DEFAULT 2000;
	SET TOTAL_DENDA = DENDA * LAMA_TELAT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `informasi_koleksi` ()  BEGIN
SELECT
KODE_BUKU,
JENIS_BUKU, 
JUDUL_BUKU, 
NAMA_PENGARANG,
TAHUN_TERBIT,
JUMLAH_KOLEKSI,
STATUS_KOLEKSI(JUMLAH_KOLEKSI) AS KETERANGAN 
FROM buku;
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_KOLEKSI` (IN `KODE_BUKU` VARCHAR(6), IN `JENIS_BUKU` VARCHAR(50), IN `JUDUL_BUKU` VARCHAR(255), IN `NAMA_PENGARANG` VARCHAR(100), IN `TAHUN_TERBIT` INT(11), IN `JUMLAH_KOLEKSI` INT(11))  BEGIN
	INSERT INTO buku
    VALUES (KODE_BUKU, JENIS_BUKU, JUDUL_BUKU, NAMA_PENGARANG, TAHUN_TERBIT, JUMLAH_KOLEKSI);
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_MHS` (IN `NIM` VARCHAR(15), IN `NAMA` VARCHAR(100), IN `PRODI` VARCHAR(50), IN `ANGKATAN` VARCHAR(4), IN `JENIS_KELAMIN` VARCHAR(10), IN `NO_TELP` VARCHAR(13))  BEGIN
	INSERT INTO mahasiswa
    VALUES (NIM, NAMA, PRODI, ANGKATAN, JENIS_KELAMIN, NO_TELP);
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_TRANS_KEMBALI` (IN `KODE_PINJAM` VARCHAR(4), IN `TGL_PENGEMBALIAN` DATE, IN `LAMA_TELAT` INT(11))  BEGIN
	INSERT INTO transaksi_pengembalian
    VALUES (KODE_PINJAM, TGL_PENGEMBALIAN, LAMA_TELAT);
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_TRANS_PINJAM` (IN `KODE_PINJAM` VARCHAR(4), IN `NIM` VARCHAR(15), IN `TGL_PEMINJAMAN` DATE, IN `JUMLAH_PINJAM` INT(11), IN `TGL_KEMBALI` DATE)  BEGIN
	INSERT INTO transaksi_peminjaman
    VALUES (KODE_PINJAM, NIM, TGL_PEMINJAMAN, JUMLAH_PINJAM, TGL_KEMBALI);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `STATUS_KOLEKSI` (`JUMLAH_KOLEKSI` INT) RETURNS VARCHAR(20) CHARSET latin1 BEGIN
DECLARE status VARCHAR(20);
IF JUMLAH_KOLEKSI < 1 THEN
SET status = 'TIDAK TERSEDIA';
ELSEIF JUMLAH_KOLEKSI >=1 THEN
SET status = 'TERSEDIA';
END IF;
RETURN (status);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `KODE_BUKU` varchar(6) NOT NULL,
  `JENIS_BUKU` varchar(50) DEFAULT NULL,
  `JUDUL_BUKU` varchar(255) DEFAULT NULL,
  `NAMA_PENGARANG` varchar(100) DEFAULT NULL,
  `TAHUN_TERBIT` int(11) DEFAULT NULL,
  `JUMLAH_KOLEKSI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`KODE_BUKU`, `JENIS_BUKU`, `JUDUL_BUKU`, `NAMA_PENGARANG`, `TAHUN_TERBIT`, `JUMLAH_KOLEKSI`) VALUES
('E105', 'EBOOK', '\"FIND THE BEST PATH TO SOLVE PACKET TRANSMISSION\"', 'Aisyah Jihan', 2019, 0),
('J103', 'JURNAL', '\"LANGKAH MUDAH BELAJAR ROUTING MELALUI CISCO PACKET TRACER\"', 'Gladys Wahyu', 2019, 4),
('S102', 'SKRIPSI', '\"PENGARUH GELOMBANG ULTRASONIK TERHADAP KECEPATAN TRANSMISI DATA\"', 'Linda Nur Malasari', 2019, 2),
('S107', 'SKRIPSI', 'Analisa dan Desain Sistem Bimbingan Tugas Akhir Berbasis Web dengan Studi Kasus Fakultas Teknologi Informasi', 'Gladys Wahyu', 2019, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` varchar(15) NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `PRODI` varchar(50) DEFAULT NULL,
  `ANGKATAN` varchar(4) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(10) DEFAULT NULL,
  `NO_TELP` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `NAMA`, `PRODI`, `ANGKATAN`, `JENIS_KELAMIN`, `NO_TELP`) VALUES
('175150200111015', 'Aisyah Jihan Marcha F. F', 'Teknik Informatika', '2017', 'Perempuan', '081234567812'),
('175150400111001', 'Gladys Wahyu K', 'Sistem Informasi', '2017', 'Perempuan', '081245678923'),
('175150700111006', 'Linda Nur Malasari', 'Teknologi Informasi', '2017', 'Perempuan', '081231799258');

-- --------------------------------------------------------

--
-- Table structure for table `meminjam`
--

CREATE TABLE `meminjam` (
  `KODE_BUKU` varchar(6) NOT NULL,
  `KODE_PINJAM` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_peminjaman`
--
-- Error reading structure for table projek_pbd.transaksi_peminjaman: #1932 - Table 'projek_pbd.transaksi_peminjaman' doesn't exist in engine
-- Error reading data for table projek_pbd.transaksi_peminjaman: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `projek_pbd`.`transaksi_peminjaman`' at line 1

--
-- Triggers `transaksi_peminjaman`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DEL_PINJAM` AFTER DELETE ON `transaksi_peminjaman` FOR EACH ROW BEGIN
	UPDATE buku
    SET buku.JUMLAH_KOLEKSI = buku.JUMLAH_KOLEKSI + OLD.JUMLAH_PINJAM
    WHERE buku.KODE_BUKU = OLD.KODE_BUKU;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AFTER_INS_PINJAM` AFTER INSERT ON `transaksi_peminjaman` FOR EACH ROW BEGIN
	UPDATE buku
    SET buku.JUMLAH_KOLEKSI = buku.JUMLAH_KOLEKSI - NEW.JUMLAH_PINJAM
    WHERE buku.KODE_BUKU = NEW.KODE_BUKU;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pengembalian`
--

CREATE TABLE `transaksi_pengembalian` (
  `KODE_KEMBALI` varchar(4) NOT NULL,
  `KODE_PINJAM` varchar(4) NOT NULL,
  `TGL_PENGEMBALIAN` date NOT NULL,
  `TOTAL_BUKU` int(11) NOT NULL,
  `LAMA_TELAT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_pengembalian`
--

INSERT INTO `transaksi_pengembalian` (`KODE_KEMBALI`, `KODE_PINJAM`, `TGL_PENGEMBALIAN`, `TOTAL_BUKU`, `LAMA_TELAT`) VALUES
('KB01', 'PJ01', '2019-05-23', 1, 0),
('KB02', 'PJ01', '2019-05-23', 1, 0),
('KB03', 'PJ01', '2019-05-23', 5, 0);

--
-- Triggers `transaksi_pengembalian`
--
DELIMITER $$
CREATE TRIGGER `AFTER_INS_KEMBALI` AFTER INSERT ON `transaksi_pengembalian` FOR EACH ROW BEGIN
	DELETE FROM transaksi_peminjaman
    WHERE transaksi_peminjaman.KODE_PINJAM = NEW.KODE_PINJAM;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`KODE_BUKU`),
  ADD UNIQUE KEY `BUKU_PK` (`KODE_BUKU`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD UNIQUE KEY `MAHASISWA_PK` (`NIM`);

--
-- Indexes for table `meminjam`
--
ALTER TABLE `meminjam`
  ADD PRIMARY KEY (`KODE_BUKU`,`KODE_PINJAM`),
  ADD UNIQUE KEY `MEMINJAM_PK` (`KODE_BUKU`,`KODE_PINJAM`),
  ADD KEY `MEMINJAM_FK2` (`KODE_BUKU`),
  ADD KEY `MEMINJAM_FK` (`KODE_PINJAM`);

--
-- Indexes for table `transaksi_pengembalian`
--
ALTER TABLE `transaksi_pengembalian`
  ADD PRIMARY KEY (`KODE_KEMBALI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
