-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 09 Jun 2026 pada 23.54
-- Versi server: 8.4.3
-- Versi PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matchatea_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `badges`
--

CREATE TABLE `badges` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `emoji` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 0xF09F8F85,
  `condition_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_value` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `badges`
--

INSERT INTO `badges` (`id`, `name`, `description`, `emoji`, `condition_type`, `condition_value`, `created_at`) VALUES
(1, 'Matcha Newbie', 'Catat konsumsi matcha pertamamu', '🌱', 'intake_count', 1, '2026-06-09 10:59:03'),
(2, 'Matcha Regular', 'Catat 10x konsumsi matcha', '🍵', 'intake_count', 10, '2026-06-09 10:59:03'),
(3, 'Matcha Addict', 'Catat 50x konsumsi matcha', '🏆', 'intake_count', 50, '2026-06-09 10:59:03'),
(4, 'Mission Master', 'Selesaikan 10 misi', '⭐', 'mission_count', 10, '2026-06-09 10:59:03'),
(5, 'Mission Legend', 'Selesaikan 50 misi', '💫', 'mission_count', 50, '2026-06-09 10:59:03'),
(6, 'Community Star', 'Buat 5 postingan komunitas', '🌟', 'post_count', 5, '2026-06-09 10:59:03'),
(7, 'Health Guardian', 'Pantau kafein selama 30 hari', '💚', 'tracking_days', 30, '2026-06-09 10:59:03'),
(8, 'Recipe Creator', 'Tambahkan resep pertamamu', '👨‍🍳', 'recipe_count', 1, '2026-06-09 10:59:03'),
(9, 'Leaderboard Champion', 'Masuk Top 10 leaderboard', '👑', 'rank', 10, '2026-06-09 10:59:03'),
(10, 'Early Adopter', 'Bergabung di awal peluncuran MatchaTea', '🎖️', 'special', 1, '2026-06-09 10:59:03'),
(11, 'Matcha Newbie', 'Catat konsumsi matcha pertamamu', '🌱', 'intake_count', 1, '2026-06-09 11:01:26'),
(12, 'Matcha Regular', 'Catat 10x konsumsi matcha', '🍵', 'intake_count', 10, '2026-06-09 11:01:26'),
(13, 'Matcha Addict', 'Catat 50x konsumsi matcha', '🏆', 'intake_count', 50, '2026-06-09 11:01:26'),
(14, 'Mission Master', 'Selesaikan 10 misi', '⭐', 'mission_count', 10, '2026-06-09 11:01:26'),
(15, 'Community Star', 'Buat 5 postingan komunitas', '🌟', 'post_count', 5, '2026-06-09 11:01:26'),
(16, 'Health Guardian', 'Pantau kafein selama 30 hari', '💚', 'tracking_days', 30, '2026-06-09 11:01:26'),
(17, 'Recipe Creator', 'Tambahkan resep pertamamu', '👨‍🍳', 'recipe_count', 1, '2026-06-09 11:01:26'),
(18, 'Leaderboard Champion', 'Masuk Top 10 leaderboard', '👑', 'rank', 10, '2026-06-09 11:01:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `community_posts`
--

CREATE TABLE `community_posts` (
  `id` int NOT NULL,
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_photo` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `tags` json DEFAULT NULL,
  `likes` int DEFAULT '0',
  `comments` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `community_posts`
--

INSERT INTO `community_posts` (`id`, `user_id`, `user_name`, `user_photo`, `content`, `image_url`, `tags`, `likes`, `comments`, `created_at`, `updated_at`) VALUES
(2, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 'baek jicheon', 'https://lh3.googleusercontent.com/a/ACg8ocLGqEmXBykXvfDtAz0jfR6YTn_1aD0CQdtdoJI0jSWwazTfAoM=s96-c', 'butuh espresso matcha biar ga ngantuk', '', '[\"espressomatchaholic\"]', 8, 0, '2026-06-09 14:50:46', '2026-06-09 23:08:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fun_facts`
--

CREATE TABLE `fun_facts` (
  `id` int NOT NULL,
  `fact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fun_facts`
--

INSERT INTO `fun_facts` (`id`, `fact`, `category`, `created_at`) VALUES
(1, 'Matcha mengandung L-theanine yang menghasilkan efek relaksasi tanpa mengantuk, sehingga disebut \"calm alertness\".', 'Kesehatan', '2026-06-09 10:59:03'),
(2, 'Satu cangkir matcha setara dengan 10 cangkir teh hijau biasa dalam hal kandungan antioksidan.', 'Nutrisi', '2026-06-09 10:59:03'),
(3, 'Upacara teh Jepang (Chado) telah ada sejak abad ke-12 dan masih dipraktikkan hingga kini.', 'Sejarah', '2026-06-09 10:59:03'),
(4, 'Matcha ceremonial grade dipetik hanya sekali setahun di musim semi (ichibancha).', 'Produksi', '2026-06-09 10:59:03'),
(5, 'Warna hijau terang matcha berasal dari klorofil yang melimpah karena ditanam dalam naungan 3-4 minggu sebelum panen.', 'Produksi', '2026-06-09 10:59:03'),
(6, 'L-theanine dalam matcha bekerja sinergis dengan kafein untuk meningkatkan fokus dan konsentrasi.', 'Kesehatan', '2026-06-09 10:59:03'),
(7, 'Matcha Uji dari Prefektur Kyoto dianggap sebagai matcha terbaik di dunia karena kondisi tanah dan iklimnya.', 'Produksi', '2026-06-09 10:59:03'),
(8, 'Satu sendok teh (2g) matcha mengandung sekitar 70mg kafein, hampir setara dengan satu shot espresso.', 'Nutrisi', '2026-06-09 10:59:03'),
(9, 'Matcha pertama kali dibawa ke Jepang oleh biksu Zen bernama Eisai pada tahun 1191.', 'Sejarah', '2026-06-09 10:59:03'),
(10, 'Proses penggilingan matcha tradisional menggunakan batu granit dan hanya menghasilkan 30-40g per jam.', 'Produksi', '2026-06-09 10:59:03'),
(11, 'Matcha mengandung L-theanine yang menghasilkan efek relaksasi tanpa mengantuk, sehingga disebut \"calm alertness\".', 'Kesehatan', '2026-06-09 11:01:26'),
(12, 'Satu cangkir matcha setara dengan 10 cangkir teh hijau biasa dalam hal kandungan antioksidan.', 'Nutrisi', '2026-06-09 11:01:26'),
(13, 'Upacara teh Jepang (Chado) telah ada sejak abad ke-12 dan masih dipraktikkan hingga kini.', 'Sejarah', '2026-06-09 11:01:26'),
(14, 'Matcha ceremonial grade dipetik hanya sekali setahun di musim semi (ichibancha).', 'Produksi', '2026-06-09 11:01:26'),
(15, 'Warna hijau terang matcha berasal dari klorofil yang melimpah karena ditanam dalam naungan 3-4 minggu sebelum panen.', 'Produksi', '2026-06-09 11:01:26'),
(16, 'L-theanine dalam matcha bekerja sinergis dengan kafein untuk meningkatkan fokus dan konsentrasi.', 'Kesehatan', '2026-06-09 11:01:26'),
(17, 'Matcha Uji dari Prefektur Kyoto dianggap sebagai matcha terbaik di dunia karena kondisi tanah dan iklimnya.', 'Produksi', '2026-06-09 11:01:26'),
(18, 'Satu sendok teh (2g) matcha mengandung sekitar 70mg kafein, hampir setara dengan satu shot espresso.', 'Nutrisi', '2026-06-09 11:01:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `intake_records`
--

CREATE TABLE `intake_records` (
  `id` int NOT NULL,
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matcha_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grams_consumed` decimal(8,2) NOT NULL,
  `caffeine_amount` decimal(8,2) NOT NULL COMMENT 'mg',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `consumed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `intake_records`
--

INSERT INTO `intake_records` (`id`, `user_id`, `matcha_type`, `grams_consumed`, `caffeine_amount`, `notes`, `consumed_at`, `created_at`, `updated_at`) VALUES
(1, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 'Iced Matcha', 3.00, 105.00, 'biar seger', '2026-06-09 14:47:41', '2026-06-09 14:47:36', '2026-06-09 14:47:36'),
(2, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 'Iced Matcha', 10.00, 350.00, 'beli di matchaverse, recomended! ', '2026-06-09 16:26:21', '2026-06-09 16:26:15', '2026-06-09 16:26:15'),
(7, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 'Matcha Latte', 15.00, 525.00, '', '2026-06-09 23:04:10', '2026-06-09 23:04:05', '2026-06-09 23:04:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matcha_news`
--

CREATE TABLE `matcha_news` (
  `id` int NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `matcha_news`
--

INSERT INTO `matcha_news` (`id`, `title`, `summary`, `content`, `image_url`, `source`, `published_at`, `created_at`) VALUES
(1, 'Tren Matcha Global 2026: Pasar Diprediksi Tumbuh 15%', 'Industri matcha dunia terus berkembang pesat didorong meningkatnya kesadaran kesehatan.', 'Laporan terbaru menunjukkan pasar matcha global diperkirakan tumbuh 15% pada 2026, didorong meningkatnya permintaan dari konsumen yang sadar kesehatan di Asia, Eropa, dan Amerika.', NULL, 'MatchaVerse News', '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(2, 'Penelitian Baru: Matcha Bantu Kurangi Stres', 'Studi dari Universitas Nagoya membuktikan konsumsi matcha rutin dapat mengurangi kadar kortisol.', 'Sebuah penelitian yang diterbitkan di Journal of Nutritional Science mengungkapkan bahwa konsumsi matcha secara rutin dapat membantu mengurangi kadar kortisol, hormon stres utama dalam tubuh.', NULL, 'MatchaVerse News', '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(3, 'Kafe Matcha Specialty Bermunculan di Jakarta', 'Jakarta menjadi salah satu kota dengan pertumbuhan kafe matcha specialty tercepat di Asia Tenggara.', 'Dalam setahun terakhir, lebih dari 50 kafe matcha specialty baru telah membuka gerai di Jakarta, menjadikan kota ini sebagai salah satu pusat budaya matcha terbesar di Asia Tenggara.', NULL, 'MatchaVerse News', '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(4, '5 Manfaat Matcha yang Jarang Diketahui', 'Selain antioksidan, matcha ternyata punya segudang manfaat tersembunyi untuk kesehatan tubuh.', 'Matcha tidak hanya kaya antioksidan. Penelitian terbaru mengungkap matcha dapat meningkatkan metabolisme, menjaga kesehatan jantung, meningkatkan fungsi otak, dan bahkan membantu detoksifikasi alami tubuh.', NULL, 'MatchaVerse News', '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(5, 'Panduan Memilih Matcha Berkualitas untuk Pemula', 'Bingung pilih matcha yang bagus? Ini panduan lengkap dari grade, warna, hingga aroma.', 'Untuk pemula, memilih matcha yang tepat bisa membingungkan. Perhatikan warna (hijau terang = kualitas baik), aroma (segar seperti rumput), tekstur (halus seperti bedak), dan grade (ceremonial untuk minum, culinary untuk memasak).', NULL, 'MatchaVerse News', '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(6, 'Tren Matcha Global 2026: Pasar Diprediksi Tumbuh 15%', 'Industri matcha dunia terus berkembang pesat didorong meningkatnya kesadaran kesehatan.', 'Laporan terbaru dari Grand View Research menunjukkan pasar matcha global diperkirakan akan tumbuh 15% pada tahun 2026, didorong oleh meningkatnya permintaan dari konsumen yang sadar kesehatan...', NULL, 'MatchaVerse News', '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(7, 'Penelitian Baru: Matcha Bantu Kurangi Stres', 'Studi dari Universitas Nagoya membuktikan konsumsi matcha rutin dapat mengurangi kadar kortisol.', 'Sebuah penelitian terbaru yang diterbitkan di Journal of Nutritional Science mengungkapkan bahwa konsumsi matcha secara rutin dapat membantu mengurangi kadar kortisol, hormon stres utama dalam tubuh...', NULL, 'MatchaVerse News', '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(8, 'Kafe Matcha Specialty Bermunculan di Jakarta', 'Jakarta menjadi salah satu kota dengan pertumbuhan kafe matcha specialty tercepat di Asia Tenggara.', 'Dalam setahun terakhir, lebih dari 50 kafe matcha specialty baru telah membuka gerai di Jakarta, menjadikan kota ini sebagai salah satu pusat budaya matcha terbesar di Asia Tenggara...', NULL, 'MatchaVerse News', '2026-06-09 11:01:25', '2026-06-09 11:01:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matcha_products`
--

CREATE TABLE `matcha_products` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` enum('Minuman','Dessert','Makanan','Snack','Ceremonial','Culinary Grade') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) DEFAULT '0.00',
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `rating` decimal(3,2) DEFAULT '0.00',
  `origin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `matcha_products`
--

INSERT INTO `matcha_products` (`id`, `name`, `description`, `category`, `price`, `image_url`, `rating`, `origin`, `grade`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Matcha Latte Premium', 'Minuman matcha hangat dengan susu oat organik, creamy dan lembut', 'Minuman', 45000.00, NULL, 4.80, 'Uji, Japan', 'Ceremonial', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(2, 'Matcha Croissant', 'Croissant renyah dengan filling matcha cream premium dari Kyoto', 'Makanan', 35000.00, NULL, 4.70, 'Kyoto, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(3, 'Matcha Mochi', 'Mochi lembut berisi matcha paste tradisional Jepang', 'Dessert', 25000.00, NULL, 4.60, 'Nishio, Japan', 'Ceremonial', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(4, 'Matcha Tiramisu', 'Tiramisu dengan twist matcha layer, kombinasi sempurna', 'Dessert', 55000.00, NULL, 4.90, 'Kyoto, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(5, 'Matcha Cookies', 'Cookies renyah dengan matcha powder berkualitas tinggi', 'Snack', 28000.00, NULL, 4.50, 'Uji, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(6, 'Ceremonial Grade Matcha', 'Matcha bubuk premium untuk upacara teh tradisional Jepang', 'Ceremonial', 285000.00, NULL, 5.00, 'Uji, Japan', 'Ceremonial', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(7, 'Matcha Smoothie Bowl', 'Smoothie bowl sehat dengan topping granola dan buah segar', 'Minuman', 52000.00, NULL, 4.70, 'Shizuoka, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(8, 'Matcha Cake Roll', 'Roll cake lembut dengan filling matcha cream cheese', 'Dessert', 75000.00, NULL, 4.80, 'Uji, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 10:59:03', '2026-06-09 10:59:03'),
(9, 'Matcha Latte Premium', 'Minuman matcha hangat dengan susu oat organik, creamy dan lembut', 'Minuman', 45000.00, NULL, 4.80, 'Uji, Japan', 'Ceremonial', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(10, 'Matcha Croissant', 'Croissant renyah dengan filling matcha cream premium dari Kyoto', 'Makanan', 35000.00, NULL, 4.70, 'Kyoto, Japan', 'Culinary Grade', 0, NULL, '2026-06-09 11:01:25', '2026-06-09 17:35:37'),
(11, 'Matcha Mochi', 'Mochi lembut berisi matcha paste tradisional Jepang', 'Dessert', 25000.00, NULL, 4.60, 'Nishio, Japan', 'Ceremonial', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(12, 'Matcha Tiramisu', 'Tiramisu dengan twist matcha layer, kombinasi sempurna', 'Dessert', 55000.00, NULL, 4.90, 'Kyoto, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(13, 'Matcha Cookies', 'Cookies renyah dengan matcha powder berkualitas tinggi', 'Snack', 28000.00, NULL, 4.50, 'Uji, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(14, 'Ceremonial Grade Matcha', 'Matcha bubuk premium untuk upacara teh tradisional Jepang', 'Ceremonial', 285000.00, NULL, 5.00, 'Uji, Japan', 'Ceremonial', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(15, 'Matcha Smoothie Bowl', 'Smoothie bowl sehat dengan topping granola dan buah segar', 'Minuman', 52000.00, NULL, 4.70, 'Shizuoka, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25'),
(16, 'Matcha Cake Roll', 'Roll cake lembut dengan filling matcha cream cheese', 'Dessert', 75000.00, NULL, 4.80, 'Uji, Japan', 'Culinary Grade', 1, NULL, '2026-06-09 11:01:25', '2026-06-09 11:01:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `missions`
--

CREATE TABLE `missions` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `mission_type` enum('daily','weekly') COLLATE utf8mb4_unicode_ci DEFAULT 'daily',
  `points_reward` int DEFAULT '10',
  `emoji` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 0xF09F8EAF,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `missions`
--

INSERT INTO `missions` (`id`, `title`, `description`, `mission_type`, `points_reward`, `emoji`, `is_active`, `created_at`) VALUES
(1, 'Minum Matcha Pertama', 'Catat konsumsi matcha pertamamu hari ini', 'daily', 10, '🍵', 1, '2026-06-09 10:59:03'),
(2, 'Explorer Hari Ini', 'Buka halaman Eksplorasi dan baca 1 berita matcha', 'daily', 15, '📰', 1, '2026-06-09 10:59:03'),
(3, 'Cek Resep Baru', 'Lihat minimal 1 resep di halaman Resep', 'daily', 10, '📖', 1, '2026-06-09 10:59:03'),
(4, 'Bagikan Perjalanan', 'Buat 1 postingan di komunitas MatchaTea', 'daily', 20, '✍️', 1, '2026-06-09 10:59:03'),
(5, 'Cek Leaderboard', 'Buka halaman leaderboard dan lihat rankingmu', 'daily', 5, '🏆', 1, '2026-06-09 10:59:03'),
(6, '5 Hari Berturut-turut', 'Catat konsumsi matcha 5 hari berturut-turut minggu ini', 'weekly', 50, '🔥', 1, '2026-06-09 10:59:03'),
(7, 'Matcha Explorer', 'Eksplorasi 5 produk matcha berbeda minggu ini', 'weekly', 40, '🗺️', 1, '2026-06-09 10:59:03'),
(8, 'Community Contributor', 'Buat 3 postingan komunitas minggu ini', 'weekly', 60, '👥', 1, '2026-06-09 10:59:03'),
(9, 'Health Tracker Pro', 'Catat konsumsi matcha setiap hari selama 7 hari berturut-turut', 'weekly', 75, '💪', 1, '2026-06-09 10:59:03'),
(10, 'Recipe Master', 'Tambahkan 1 resep matcha baru minggu ini', 'weekly', 45, '👨‍🍳', 1, '2026-06-09 10:59:03'),
(11, 'Minum Matcha Pertama', 'Catat konsumsi matcha pertamamu hari ini', 'daily', 10, '🍵', 1, '2026-06-09 11:01:26'),
(12, 'Explorer Hari Ini', 'Buka halaman Eksplorasi dan baca 1 berita matcha', 'daily', 15, '📰', 1, '2026-06-09 11:01:26'),
(13, 'Cek Resep Baru', 'Lihat minimal 1 resep di halaman Resep', 'daily', 10, '📖', 1, '2026-06-09 11:01:26'),
(14, 'Bagikan Perjalanan', 'Buat 1 postingan di komunitas MatchaTea', 'daily', 20, '✍️', 1, '2026-06-09 11:01:26'),
(15, '5 Hari Berturut-turut', 'Catat konsumsi matcha 5 hari berturut-turut minggu ini', 'weekly', 50, '🔥', 1, '2026-06-09 11:01:26'),
(16, 'Matcha Explorer', 'Eksplorasi 10 produk matcha berbeda minggu ini', 'weekly', 40, '🗺️', 1, '2026-06-09 11:01:26'),
(17, 'Community Contributor', 'Buat 3 postingan komunitas minggu ini', 'weekly', 60, '👥', 1, '2026-06-09 11:01:26'),
(18, 'Health Tracker Pro', 'Catat konsumsi matcha setiap hari selama 7 hari berturut-turut', 'weekly', 75, '💪', 1, '2026-06-09 11:01:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `created_at`) VALUES
(6, 2, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', '2026-06-09 14:50:55'),
(7, 2, '4ies892t44O4CrIKwIb8A1Ru5Mp1', '2026-06-09 16:22:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipes`
--

CREATE TABLE `recipes` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ingredients` json DEFAULT NULL COMMENT 'Array of ingredient strings',
  `steps` json DEFAULT NULL COMMENT 'Array of step strings',
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `servings` int DEFAULT '1',
  `prep_time` int DEFAULT '0' COMMENT 'Menit',
  `difficulty` enum('Mudah','Sedang','Sulit') COLLATE utf8mb4_unicode_ci DEFAULT 'Mudah',
  `author_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `ingredients`, `steps`, `image_url`, `servings`, `prep_time`, `difficulty`, `author_id`, `author_name`, `created_at`, `updated_at`) VALUES
(1, 'Matcha Latte Iced', 'Matcha latte dingin yang menyegarkan, mudah dibuat di rumah', '[\"2g matcha powder\", \"30ml air panas 80°C\", \"200ml oat milk\", \"Es batu secukupnya\", \"Simple syrup sesuai selera\"]', '[\"Sift matcha powder ke dalam gelas.\", \"Tuang air panas, aduk hingga pasta matcha terbentuk.\", \"Tambahkan simple syrup, aduk rata.\", \"Masukkan es batu.\", \"Tuang oat milk perlahan dari sisi gelas.\", \"Sajikan segera.\"]', NULL, 1, 5, 'Mudah', NULL, 'MatchaVerse Admin', '2026-06-09 10:59:03', '2026-06-09 16:33:01'),
(2, 'Matcha Mochi Homemade', 'Mochi lembut berisi matcha paste yang bisa dibuat sendiri di rumah', '[\"150g tepung ketan\", \"200ml air\", \"50g gula\", \"2 sdm matcha powder untuk filling\", \"100g white bean paste\", \"Tepung maizena untuk taburan\"]', '[\"Campur tepung ketan, air, dan gula. Aduk rata.\", \"Kukus adonan 20 menit hingga matang.\", \"Buat filling: campur white bean paste dengan matcha powder.\", \"Ambil adonan mochi, pipihkan di atas tepung maizena.\", \"Isi dengan matcha paste, bentuk bola.\", \"Sajikan segera atau simpan dalam kulkas.\"]', NULL, 8, 45, 'Sedang', NULL, 'MatchaVerse Admin', '2026-06-09 10:59:03', '2026-06-09 16:33:31'),
(3, 'Matcha Tiramisu', 'Tiramisu klasik dengan sentuhan matcha yang elegan', '[\"3 sdm matcha powder\", \"250g mascarpone cheese\", \"200ml whipping cream\", \"3 kuning telur\", \"80g gula pasir\", \"200ml air panas\", \"Ladyfinger biscuit secukupnya\"]', '[\"Seduh matcha dengan air panas, dinginkan.\", \"Kocok kuning telur dan gula hingga pucat.\", \"Masukkan mascarpone, aduk rata.\", \"Kocok whipping cream hingga soft peak, lipat ke adonan.\", \"Celup ladyfinger ke matcha, tata di wadah.\", \"Tuang cream mixture di atas ladyfinger.\", \"Ulangi layer, taburi matcha powder di atas.\", \"Dinginkan minimal 4 jam sebelum disajikan.\"]', NULL, 6, 30, 'Sedang', NULL, 'MatchaVerse Admin', '2026-06-09 10:59:03', '2026-06-09 16:34:53'),
(4, 'Matcha Latte Iced', 'Matcha latte dingin yang menyegarkan, mudah dibuat di rumah', '[\"2g matcha powder\", \"30ml air panas 80°C\", \"200ml oat milk\", \"Es batu secukupnya\", \"Simple syrup sesuai selera\"]', '[\"Sift matcha powder ke dalam gelas.\", \"Tuang air panas, aduk hingga pasta matcha terbentuk.\", \"Tambahkan simple syrup, aduk rata.\", \"Masukkan es batu.\", \"Tuang oat milk perlahan dari sisi gelas.\", \"Sajikan segera.\"]', NULL, 1, 5, 'Mudah', NULL, 'MatchaVerse Admin', '2026-06-09 11:01:25', '2026-06-09 16:34:25'),
(5, 'Matcha Mochi Homemade', 'Mochi lembut berisi matcha paste yang bisa dibuat sendiri di rumah', '[\"150g tepung ketan\", \"200ml air\", \"50g gula\", \"2 sdm matcha powder untuk filling\", \"100g white bean paste\", \"Tepung maizena untuk taburan\"]', '[\"Campur tepung ketan, air, dan gula. Aduk rata.\", \"Kukus adonan 20 menit hingga matang.\", \"Buat filling: campur white bean paste dengan matcha powder.\", \"Ambil adonan mochi, pipihkan di atas tepung maizena.\", \"Isi dengan matcha paste, bentuk bola.\", \"Sajikan segera atau simpan dalam kulkas.\"]', NULL, 8, 45, 'Sedang', NULL, 'MatchaVerse Admin', '2026-06-09 11:01:25', '2026-06-09 16:33:56'),
(6, 'bikin es matcha', 'simple ajasih', '[\"1 bubuk matcha sachet\", \"air putih 1 gelas\", \"es batu\"]', '[\"tuangkan bubuk matcha ke dalam gelas\", \"tuangkan air putih\", \"tuangkan es batu\", \"kemudian aduk hingga tercampur rata\"]', '', 1, 15, 'Mudah', 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 'baek jicheon', '2026-06-09 14:49:52', '2026-06-09 14:49:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Firebase UID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` text COLLATE utf8mb4_unicode_ci,
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `points` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo_url`, `fcm_token`, `points`, `created_at`, `updated_at`) VALUES
('4ies892t44O4CrIKwIb8A1Ru5Mp1', 'alfath shafira', 'alfathshafira4@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocIClHbbA5xhK3UC9xvxpN8csln5cK93xzRJswu9_LDaUeE4LA=s96-c', NULL, 60, '2026-06-09 16:22:01', '2026-06-09 23:03:57'),
('Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 'baek jicheon', 'jiheonniebbaek@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocLGqEmXBykXvfDtAz0jfR6YTn_1aD0CQdtdoJI0jSWwazTfAoM=s96-c', NULL, 30, '2026-06-09 14:02:32', '2026-06-09 21:57:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_badges`
--

CREATE TABLE `user_badges` (
  `id` int NOT NULL,
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge_id` int NOT NULL,
  `earned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_missions`
--

CREATE TABLE `user_missions` (
  `id` int NOT NULL,
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int NOT NULL,
  `mission_type` enum('daily','weekly') COLLATE utf8mb4_unicode_ci DEFAULT 'daily',
  `is_completed` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_missions`
--

INSERT INTO `user_missions` (`id`, `user_id`, `mission_id`, `mission_type`, `is_completed`, `completed_at`, `created_at`) VALUES
(1, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 1, 'daily', 0, '2026-06-09 14:22:51', '2026-06-09 14:02:36'),
(2, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 2, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(3, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 3, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(4, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 4, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(5, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 5, 'daily', 1, '2026-06-09 21:57:41', '2026-06-09 14:02:36'),
(6, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 6, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(7, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 7, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(8, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 8, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(9, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 9, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(10, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 10, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(11, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 11, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(12, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 12, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(13, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 13, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(14, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 14, 'daily', 0, NULL, '2026-06-09 14:02:36'),
(15, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 15, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(16, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 16, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(17, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 17, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(18, 'Pr8VEP0PcyRlOtNEkAOY7EFoodN2', 18, 'weekly', 0, NULL, '2026-06-09 14:02:36'),
(45, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 1, 'daily', 1, '2026-06-09 22:02:05', '2026-06-09 16:22:04'),
(46, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 2, 'daily', 1, '2026-06-09 21:59:55', '2026-06-09 16:22:04'),
(47, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 3, 'daily', 1, '2026-06-09 21:59:57', '2026-06-09 16:22:04'),
(48, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 4, 'daily', 0, NULL, '2026-06-09 16:22:04'),
(49, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 5, 'daily', 1, '2026-06-09 22:00:04', '2026-06-09 16:22:04'),
(50, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 6, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(51, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 7, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(52, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 8, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(53, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 9, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(54, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 10, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(55, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 11, 'daily', 1, '2026-06-09 21:59:42', '2026-06-09 16:22:04'),
(56, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 12, 'daily', 0, NULL, '2026-06-09 16:22:04'),
(57, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 13, 'daily', 0, NULL, '2026-06-09 16:22:04'),
(58, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 14, 'daily', 0, NULL, '2026-06-09 16:22:04'),
(59, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 15, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(60, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 16, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(61, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 17, 'weekly', 0, NULL, '2026-06-09 16:22:04'),
(62, '4ies892t44O4CrIKwIb8A1Ru5Mp1', 18, 'weekly', 0, NULL, '2026-06-09 16:22:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `fun_facts`
--
ALTER TABLE `fun_facts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `intake_records`
--
ALTER TABLE `intake_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_date` (`user_id`,`consumed_at`);

--
-- Indeks untuk tabel `matcha_news`
--
ALTER TABLE `matcha_news`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `matcha_products`
--
ALTER TABLE `matcha_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_post_like` (`post_id`,`user_id`);

--
-- Indeks untuk tabel `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `user_badges`
--
ALTER TABLE `user_badges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_badge` (`user_id`,`badge_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Indeks untuk tabel `user_missions`
--
ALTER TABLE `user_missions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_mission` (`user_id`,`mission_id`),
  ADD KEY `mission_id` (`mission_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `fun_facts`
--
ALTER TABLE `fun_facts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `intake_records`
--
ALTER TABLE `intake_records`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `matcha_news`
--
ALTER TABLE `matcha_news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `matcha_products`
--
ALTER TABLE `matcha_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_badges`
--
ALTER TABLE `user_badges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_missions`
--
ALTER TABLE `user_missions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `intake_records`
--
ALTER TABLE `intake_records`
  ADD CONSTRAINT `intake_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `matcha_products`
--
ALTER TABLE `matcha_products`
  ADD CONSTRAINT `matcha_products_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `user_badges`
--
ALTER TABLE `user_badges`
  ADD CONSTRAINT `user_badges_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_badges_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_missions`
--
ALTER TABLE `user_missions`
  ADD CONSTRAINT `user_missions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_missions_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
