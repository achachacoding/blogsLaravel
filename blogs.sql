-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 05:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'artikel', '<p><strong>edit Lorem Ipsum</strong><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', NULL, NULL),
(10, 'Kuliner', '<p><span style=\"font-size:16px\"><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif\"><strong>It</strong></span></span><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\"> is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'wah mantap', '2025-05-16 04:52:53', '2025-05-16 04:52:53'),
(2, 1, 1, 'boleh juga', '2025-05-16 04:53:52', '2025-05-16 04:53:52'),
(3, 1, 2, 'benar', '2025-05-16 05:17:48', '2025-05-16 05:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_10_005947_create_kategori_table', 1),
(6, '2025_05_10_012021_create_post_table', 1),
(7, '2025_05_10_014035_create_komentar_table', 1),
(8, '2025_05_10_014112_create_profile_table', 1),
(12, '2025_05_10_020000_add_address_to_profile_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `judul`, `content`, `thumbnail`, `kategori_id`, `created_at`, `updated_at`) VALUES
(1, 'Post 1', '<p><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', '1746973716.jpg', 1, '2025-05-11 07:28:36', '2025-05-16 00:54:00'),
(3, 'burger', '<p><strong>Hamburger,</strong><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;atau hanya&nbsp;</span><strong>burger</strong><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">, adalah&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Hidangan\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Hidangan\">hidangan</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;yang terdiri dari isian&mdash;biasanya&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Patty\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Patty\">patty</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;atau&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Daging_giling\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Daging giling\">daging giling</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">, biasanya&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Daging\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Daging\">daging</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;sapi&mdash;yang ditempatkan didalam irisan&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Roti\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Roti\">roti</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;atau&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Roti_gulung\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Roti gulung\">roti gulung</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">. Roti sering disajikan dengan&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Keju\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Keju\">keju</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Selada_(tumbuhan)\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Selada (tumbuhan)\">selada</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Tomat\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Tomat\">tomat</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Bawang_bombai\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Bawang bombai\">bawang bombay</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Acar\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Acar\">acar</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Bakon\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Bakon\">bacon</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;atau&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Cabai\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Cabai\">cabai</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;dengan bumbu seperti&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Saus_tomat\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Saus tomat\">saus tomat</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Moster\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Moster\">mustard</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Mayones\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Mayones\">mayones</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">,&nbsp;</span><a class=\"new\" href=\"https://id.wikipedia.org/w/index.php?title=Relish&amp;action=edit&amp;redlink=1\" style=\"text-decoration-line: none; color: rgb(191, 60, 44); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Relish (halaman belum tersedia)\">relish</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;atau &quot;</span><a class=\"new\" href=\"https://id.wikipedia.org/w/index.php?title=Saus_spesial&amp;action=edit&amp;redlink=1\" style=\"text-decoration-line: none; color: rgb(191, 60, 44); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Saus spesial (halaman belum tersedia)\">saus spesial</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&quot;, seringkali merupakan variasi&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Saus_pulau_seribu\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Saus pulau seribu\">saus Pulau Seribu</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">, dan sering diposting di roti&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Wijen\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Wijen\">biji wijen</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">.&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Patty\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Patty\">Patty</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;hamburger yang diberi&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Keju\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Keju\">keju</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">&nbsp;disebut&nbsp;</span><a href=\"https://id.wikipedia.org/wiki/Burger_keju\" style=\"text-decoration-line: none; color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 2px; overflow-wrap: break-word; font-family: sans-serif; font-size: 16px;\" title=\"Burger keju\">burger keju</a><span style=\"color:rgb(32, 33, 34); font-family:sans-serif; font-size:16px\">. Berdasarkan beberapa definisi, dan dalam beberapa budaya, burger dianggap sebagai sandwich.</span></p>', '1747378874.jpg', 1, '2025-05-16 00:01:14', '2025-05-16 00:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umur` int(11) NOT NULL,
  `bio` text NOT NULL,
  `address` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `umur`, `bio`, `address`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 27, 'Hello World!!!', 'Palangkaraya Timur', NULL, 1, '2025-05-12 00:34:22', '2025-05-15 21:46:20'),
(2, 29, 'aa', 'aa', NULL, 2, '2025-05-15 07:30:21', '2025-05-15 07:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'acha', 'acha@gmail.com', NULL, '$2y$10$WWrDszPXON2fbExPnf0JR.6BPILBQtw1V0VUskB2hKpEfiFTgbZou', NULL, '2025-05-12 00:34:22', '2025-05-12 00:34:22'),
(2, 'tiara', 'tiara@gmail.com', NULL, '$2y$10$G0oMZwXkWet9NC6bW8RZ0uca8h.6y/ugJKZvKhsR45Ud40.aNLBaG', NULL, '2025-05-15 07:30:21', '2025-05-15 07:30:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentar_post_id_foreign` (`post_id`),
  ADD KEY `komentar_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `komentar_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
