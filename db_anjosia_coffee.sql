-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Des 2022 pada 06.58
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_anjosia_coffee`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kode_barang` char(10) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok_barang` char(10) DEFAULT NULL,
  `kode_supplier` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kode_barang`, `nama_barang`, `harga`, `stok_barang`, `kode_supplier`) VALUES
('K001', 'Gold Coffee', 12000, '32', 'D001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pemasukan`
--

CREATE TABLE `tbl_pemasukan` (
  `kode_pemasukan` char(10) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `kode_barang` char(10) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `stok_awal` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pemasukan`
--

INSERT INTO `tbl_pemasukan` (`kode_pemasukan`, `tanggal_masuk`, `kode_barang`, `nama_barang`, `stok_awal`, `harga`) VALUES
('M001', '2022-12-06', 'K001', 'Gold Coffee', 12, 12000);

--
-- Trigger `tbl_pemasukan`
--
DELIMITER $$
CREATE TRIGGER `trigger _insert_product` AFTER INSERT ON `tbl_pemasukan` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok_barang = stok_barang + new.stok_awal
WHERE kode_barang = new.kode_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pemasukan_kas`
--

CREATE TABLE `tbl_pemasukan_kas` (
  `kode_pemasukan` char(10) NOT NULL,
  `nominal_pemasukan` int(11) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `kode_barang` char(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengeluaran`
--

CREATE TABLE `tbl_pengeluaran` (
  `kode_pengeluaran` char(10) NOT NULL,
  `tgl_pengeluaran` date DEFAULT NULL,
  `kode_barang` char(10) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `kode_pemasukan` char(10) DEFAULT NULL,
  `stok_akhir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pengeluaran`
--

INSERT INTO `tbl_pengeluaran` (`kode_pengeluaran`, `tgl_pengeluaran`, `kode_barang`, `nama_barang`, `harga`, `kode_pemasukan`, `stok_akhir`) VALUES
('P001', '2022-12-09', 'K001', 'Gold Coffee', 12000, 'M001', 10);

--
-- Trigger `tbl_pengeluaran`
--
DELIMITER $$
CREATE TRIGGER `trigger _pengeluaran_product` AFTER INSERT ON `tbl_pengeluaran` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok_barang = stok_barang - new.stok_akhir WHERE kode_barang = new.kode_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengeluaran_kas`
--

CREATE TABLE `tbl_pengeluaran_kas` (
  `kode_pengeluaran` char(10) NOT NULL,
  `nominal_pengeluaran` int(11) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `kode_barang` char(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `kode_supplier` char(10) NOT NULL,
  `nama_supplier` varchar(100) DEFAULT NULL,
  `daerah` varchar(100) DEFAULT NULL,
  `jenis_kopi` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah_kopi` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`kode_supplier`, `nama_supplier`, `daerah`, `jenis_kopi`, `harga`, `jumlah_kopi`) VALUES
('D001', '\r\n\r\nPT Globalindo Palugada Perkasa', 'Bandar Lampung', 'Biji Kopi', 40000, '5kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `nomerhp` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_supplier` (`kode_supplier`);

--
-- Indeks untuk tabel `tbl_pemasukan`
--
ALTER TABLE `tbl_pemasukan`
  ADD PRIMARY KEY (`kode_pemasukan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  ADD PRIMARY KEY (`kode_pengeluaran`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_pemasukan` (`kode_pemasukan`);

--
-- Indeks untuk tabel `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`kode_supplier`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`kode_supplier`) REFERENCES `tbl_supplier` (`kode_supplier`);

--
-- Ketidakleluasaan untuk tabel `tbl_pemasukan`
--
ALTER TABLE `tbl_pemasukan`
  ADD CONSTRAINT `tbl_pemasukan_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  ADD CONSTRAINT `tbl_pengeluaran_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`),
  ADD CONSTRAINT `tbl_pengeluaran_ibfk_2` FOREIGN KEY (`kode_pemasukan`) REFERENCES `tbl_pemasukan` (`kode_pemasukan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
