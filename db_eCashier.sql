-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Des 2022 pada 15.09
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecashier`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_table`
--

CREATE TABLE `cart_table` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart_table`
--

INSERT INTO `cart_table` (`id`, `transaction_id`, `product_id`, `purchase_amount`, `total`, `status`, `created_at`, `updated_at`) VALUES
(13, 'NIIHIARESD', 1, 3, 600000, 'Selesai', '2022-11-26 15:27:30', '2022-11-27 15:23:43'),
(14, 'NIIHIARESD', 3, 2, 700000, 'Selesai', '2022-11-27 08:21:43', '2022-11-27 15:23:43'),
(15, 'LJBYJGZFQA', 1, 1, 220000, 'Selesai', '2022-11-27 08:24:02', '2022-11-27 15:24:17'),
(16, 'LJBYJGZFQA', 3, 1, 350000, 'Selesai', '2022-11-27 08:24:08', '2022-11-27 15:24:17'),
(17, 'WSEYXWPVFV', 1, 1, 220000, 'Selesai', '2022-11-27 08:25:25', '2022-11-27 15:26:22'),
(18, 'JQNAMYLUJH', 1, 2, 440000, 'Selesai', '2022-11-28 08:30:17', '2022-11-28 15:30:28'),
(19, 'ZJVZAFHNQB', 3, 2, 700000, 'Selesai', '2022-11-28 09:00:18', '2022-11-28 16:00:26'),
(20, 'QNFGSTOXNE', 3, 1, 350000, 'Selesai', '2022-11-28 09:20:22', '2022-11-28 16:20:38'),
(21, 'QNFGSTOXNE', 1, 1, 220000, 'Selesai', '2022-11-28 09:20:27', '2022-11-28 16:20:38'),
(22, 'UAAUBBFXQU', 3, 1, 350000, 'Selesai', '2022-11-28 09:20:57', '2022-11-28 16:21:05'),
(23, 'RPUWMMXCDO', 1, 2, 440000, 'Selesai', '2022-11-28 10:26:26', '2022-11-29 18:52:37'),
(24, 'NKBFEDVKSF', 1, 2, 440000, 'Selesai', '2022-11-29 12:15:53', '2022-11-29 19:16:17'),
(25, 'NKBFEDVKSF', 3, 3, 1050000, 'Selesai', '2022-11-29 12:15:59', '2022-11-29 19:16:17'),
(26, 'NFHEXOKWRM', 1, 3, 660000, 'Selesai', '2022-11-29 12:20:08', '2022-11-29 19:22:09'),
(27, 'ODITGFFLZV', 3, 1, 350000, 'Selesai', '2022-11-29 12:26:20', '2022-11-29 19:26:41'),
(28, 'ODITGFFLZV', 1, 1, 220000, 'Selesai', '2022-11-29 12:26:30', '2022-11-29 19:26:41'),
(29, 'KTIESDDYHV', 3, 2, 700000, 'Selesai', '2022-11-29 13:11:39', '2022-11-29 20:11:56'),
(30, 'KTIESDDYHV', 1, 1, 220000, 'Selesai', '2022-11-29 13:11:43', '2022-11-29 20:11:56'),
(31, 'VVIUMRJYIB', 3, 1, 350000, 'Selesai', '2022-11-30 12:28:58', '2022-11-30 19:29:23'),
(32, 'VVIUMRJYIB', 1, 1, 220000, 'Selesai', '2022-11-30 12:29:06', '2022-11-30 19:29:23'),
(35, 'YYDWEZKRUZ', 1, 1, 220000, 'Selesai', '2022-12-01 14:07:01', '2022-12-01 21:07:21'),
(36, 'YYDWEZKRUZ', 3, 1, 350000, 'Selesai', '2022-12-01 14:07:07', '2022-12-01 21:07:21'),
(37, 'FOPREQCCAW', 3, 1, 350000, 'Selesai', '2022-12-01 14:07:50', '2022-12-01 21:08:10'),
(38, 'FOPREQCCAW', 5, 1, 45000, 'Selesai', '2022-12-01 14:07:54', '2022-12-01 21:08:10'),
(39, 'PFFZAHFUWS', 3, 1, 350000, 'Selesai', '2022-12-01 14:09:04', '2022-12-01 21:09:21'),
(40, 'QDTYRPLXLM', 3, 1, 350000, 'Selesai', '2022-12-02 13:48:14', '2022-12-02 20:48:42'),
(41, 'QDTYRPLXLM', 5, 2, 90000, 'Selesai', '2022-12-02 13:48:19', '2022-12-02 20:48:42'),
(43, 'JDBHWFXJUD', 3, 2, 700000, 'Selesai', '2022-12-11 19:22:10', '2022-12-12 16:04:51'),
(44, 'ODRIMPSYBV', 3, 2, 700000, 'Selesai', '2022-12-12 10:21:39', '2022-12-12 17:46:28'),
(45, 'UUSBEEBVTY', 3, 2, 700000, 'Selesai', '2022-12-12 11:09:55', '2022-12-12 18:10:13'),
(46, 'KRRWSODAZU', 5, 1, 45000, 'Selesai', '2022-12-12 11:13:43', '2022-12-12 18:19:24'),
(47, 'SHXHHHSYUD', 5, 2, 90000, 'Selesai', '2022-12-12 13:34:06', '2022-12-12 20:34:42'),
(48, 'EGKCYEDHHY', 5, 1, 45000, 'Selesai', '2022-12-12 13:35:17', '2022-12-12 20:37:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_table`
--

CREATE TABLE `product_table` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_table`
--

INSERT INTO `product_table` (`id`, `name`, `description`, `stock`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sepatu Adidas', 'Sepatu buat kaki kalo baju buat badan kalo kamu buat aku hehehehe :)', 2, 220000, '', '2022-11-26 15:28:10', '2022-12-01 21:07:01'),
(3, 'Sepatu Nike', 'Sepatu Nike Bukan Sepatu Turun', 76, 350000, '', '2022-11-26 15:28:10', '2022-12-12 18:09:55'),
(5, 'Sepatu Piero', 'Sepatu Running', 3, 45000, '', '2022-11-30 12:33:54', '2022-12-12 20:35:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_table`
--

CREATE TABLE `promo_table` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `voucher_code` varchar(50) DEFAULT NULL,
  `promo_value` int(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `promo_table`
--

INSERT INTO `promo_table` (`id`, `name`, `voucher_code`, `promo_value`, `created_at`, `updated_at`) VALUES
(1, 'Diskon Gila 50 %', 'KAS5362FCDGA', 50, '2022-11-26 15:28:49', '2022-11-26 22:28:49'),
(2, 'Diskon 11.11 11%', 'FCGHG54GC56', 11, '2022-11-26 15:28:49', '2022-11-26 22:28:49'),
(3, 'Diskon banget 20%', 'KJBVHDB354JV', 20, '2022-11-26 15:28:49', '2022-11-26 22:28:49'),
(9, 'PROMO 12 12', '1212MANTULSALE', 12, '2022-11-26 15:28:49', '2022-11-26 22:28:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_table`
--

CREATE TABLE `transaction_table` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `voucher_code` varchar(191) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction_table`
--

INSERT INTO `transaction_table` (`id`, `transaction_id`, `total_amount`, `voucher_code`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(5, 'WSEYXWPVFV', 220000, '0', 'Cash', 'Paid', '2022-11-27 08:26:22', '2022-11-27 15:26:22'),
(11, 'JQNAMYLUJH', 440000, '0', 'Cash', 'Paid', '2022-11-28 08:30:58', '2022-11-28 15:30:58'),
(12, 'ZJVZAFHNQB', 700000, '0', 'Cash', 'Paid', '2022-11-28 09:00:26', '2022-11-28 16:00:26'),
(13, 'QNFGSTOXNE', 570000, '0', 'Cash', 'Paid', '2022-11-28 09:20:38', '2022-11-28 16:20:38'),
(14, 'UAAUBBFXQU', 350000, '0', 'Cash', 'Paid', '2022-11-28 09:21:05', '2022-11-28 16:21:05'),
(15, 'RPUWMMXCDO', 440000, '0', 'Cash', 'Paid', '2022-11-29 11:52:37', '2022-11-29 18:52:37'),
(16, 'NKBFEDVKSF', 1490000, '0', 'Cash', 'Paid', '2022-11-29 12:16:17', '2022-11-29 19:16:17'),
(23, 'ODITGFFLZV', 570000, '0', 'Cash', 'Paid', '2022-11-29 12:30:54', '2022-11-29 19:30:54'),
(24, 'KTIESDDYHV', 920000, '0', 'Cash', 'Paid', '2022-11-29 13:11:56', '2022-11-29 20:11:56'),
(25, 'VVIUMRJYIB', 570000, '0', 'Cash', 'Paid', '2022-11-30 12:29:23', '2022-11-30 19:29:23'),
(26, 'YYDWEZKRUZ', 570000, '0', 'Cash', 'Paid', '2022-12-01 14:07:21', '2022-12-01 21:07:21'),
(27, 'FOPREQCCAW', 395000, '0', 'Cash', 'Paid', '2022-12-01 14:08:10', '2022-12-01 21:08:10'),
(28, 'PFFZAHFUWS', 350000, '0', 'Cash', 'Paid', '2022-12-01 14:09:21', '2022-12-01 21:09:21'),
(41, 'ODRIMPSYBV', 616000, '1212MANTULSALE', 'Cash', 'Paid', '2022-12-12 10:46:28', '2022-12-12 17:46:28'),
(43, 'UUSBEEBVTY', 616000, '1212MANTULSALE', 'Cash', 'Paid', '2022-12-12 11:10:13', '2022-12-12 18:10:13'),
(44, 'KRRWSODAZU', 45000, '0', 'Cash', 'Paid', '2022-12-12 11:19:24', '2022-12-12 18:19:24'),
(48, 'SHXHHHSYUD', 79200, '1212MANTULSALE', 'Cash', 'Paid', '2022-12-12 13:34:42', '2022-12-12 20:34:42'),
(49, 'EGKCYEDHHY', 22500, 'KAS5362FCDGA', 'Cash', 'Paid', '2022-12-12 13:37:52', '2022-12-12 20:37:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `promo_table`
--
ALTER TABLE `promo_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_table`
--
ALTER TABLE `transaction_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `product_table`
--
ALTER TABLE `product_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `promo_table`
--
ALTER TABLE `promo_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transaction_table`
--
ALTER TABLE `transaction_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
