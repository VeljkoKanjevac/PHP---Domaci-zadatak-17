-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 10:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id_korisnika` int(11) NOT NULL,
  `ime` varchar(64) NOT NULL,
  `prezime` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `sifra` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id_korisnika`, `ime`, `prezime`, `email`, `sifra`) VALUES
(2, 'Baba', 'Penzioner', 'baba@udruzenjepenzionera.com', 'sifraTajna'),
(4, 'Veki', 'Kanjevac', 'veki@gmail.com', '$2y$10$TiUYGq7akOnn5KMTtBQ9r.Rguc0e7alj9652fkXqUAjG7IEEp3pLu'),
(5, 'Veljko', 'Kanjevac', 'veljko@gmail.com', '$2y$10$qVq/ultYEj6Ed7uu7..FG.dm3ubVhcXoM86dzjPQlU8d8JI6YuEgu'),
(6, 'Danijel', 'Kanjevac', 'danijel@gmail.com', '$2y$10$3kJyafrruv3K/LhsFu.bWu72sMn1ZRhhX8RBeP/L.MtqStI5CXubK'),
(7, 'Luka', 'Kanjevac', 'luka@gmail.com', '$2y$10$DGkrB0sCnkArj/bEo7GqFespY6vOELnt5wbUx319XWAH1rxtGv.JC'),
(8, 'miljko', 'kanjevac', 'miljko@gmail.com', '$2y$10$JyD2KLAqP15c9muadiR5tuqZuvDod0fEQj8YTFdQDeMFXud.lnjfe'),
(9, 'Suncica', 'Kanjevac', 'suncica@gmail.com', '$2y$10$zdWwzAa/XFEpE0gu/bYleeYn7M.ThQe/u/ev0pbx8jS6F9NWnnUwK'),
(10, 'aleksandar', 'petrovic', 'aleksandar@gmail.com', '$2y$10$hLVQm1RlRQdovAxU0pZ8N.AnLkyCJltUKkTcp63YGwlCtBe1nLgD6');

-- --------------------------------------------------------

--
-- Table structure for table `narudzbine`
--

CREATE TABLE `narudzbine` (
  `id` int(11) NOT NULL,
  `id_proizvoda` int(11) NOT NULL,
  `id_korisnika` int(11) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `narudzbine`
--

INSERT INTO `narudzbine` (`id`, `id_proizvoda`, `id_korisnika`, `cena`, `kolicina`) VALUES
(1, 4, 2, 19999.99, 10);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

CREATE TABLE `proizvodi` (
  `id_proizvoda` int(11) NOT NULL,
  `ime` varchar(64) NOT NULL,
  `opis` text DEFAULT NULL,
  `cena` decimal(10,2) NOT NULL,
  `slika` varchar(64) NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id_proizvoda`, `ime`, `opis`, `cena`, `slika`, `kolicina`) VALUES
(1, 'iPhone 13 Pro', 'Dobar iphone', 1199.99, 'iPhone13.jpg', 0),
(2, 'iPhone 11 Pro', 'iPhone 11 kao nov, baba koristila za fb', 989.99, 'iPhone11.jpg', 22),
(3, 'iPhone 15', '100% pravi iPhone, samo niko ne zna da postoji', 2499.99, 'nepostojeci.jpg', 1),
(4, 'iPhone14 ProMax', 'Ukraden nov iz Austrije', 1999.99, 'iPhone14.jpg', 66),
(6, 'iPhone 16 ProMax', 'Najnoviji iPhone na trzistu', 1500.00, 'iPhone16.png', 5),
(7, 'iPhone X', 'Ocuvan telefon koriscen 2 godine', 300.00, 'iPhoneX.png', 2),
(9, 'Samsung S24 Ultra', 'Nov telefon. Dobro ocuvan i u potpunosti ispravan.', 999.00, 'samsungs24.jpg', 11),
(10, 'Huawei P40 Lite', 'Telefon sa najboljom kamerom', 620.00, 'Huawei.jpg', 3),
(13, 'Nokia 3310', 'Muzejski primerak telefona', 99.00, 'nokia.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id_korisnika`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `narudzbine`
--
ALTER TABLE `narudzbine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD PRIMARY KEY (`id_proizvoda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id_korisnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `narudzbine`
--
ALTER TABLE `narudzbine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proizvodi`
--
ALTER TABLE `proizvodi`
  MODIFY `id_proizvoda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
