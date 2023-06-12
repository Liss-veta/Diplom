-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 11 2023 г., 19:13
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `diplom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `about_galleries`
--

CREATE TABLE `about_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` bigint UNSIGNED NOT NULL,
  `id_master` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comm_master` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comm_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `id_master`, `id_user`, `text`, `number`, `status`, `comm_master`, `comm_user`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'dfhg hdfkg dfkghdfk ghdfh gkjdf hgfdhgkfhgkdgjkdfhgkjdfgdfg', '89064570340', 'Экстренно отклонено', 'Клиент не пришел в назначенное время', 'null', '2023-04-04 03:54:26', '2023-04-04 10:25:41'),
(2, 2, 32, 'dsfbdsmfbmsdbf dsbfm dbhfdhf ksdfg kdhfkjdshfjk dhkjf hds fhksdhfkjsdhfjkhdsjkf', '11111111111111', 'Экстренно отклонено', 'null', 'Мастер не пришел на встречу', '2023-05-05 09:17:08', '2023-05-05 11:26:57'),
(3, 1, 32, 'sdjhfjkds hfksdhfjkdhjkfsdfjsdhjkfhdskjf hsdkjfh s fsd gfhsd fjd jsdh fjk sdjkfhsdkfh sdkfhsdkf hksdhfksdhfk jsdfkjsdhfkj', '747236486237', 'Отправлен', 'null', 'null', '2023-05-05 11:29:17', '2023-05-05 11:29:17'),
(5, 4, 35, 'упрк рп тьа аилор олцурклурк олуолруалр улаываыаолывраовыраолывр аолыв алр ываолрыаолрол олммолиамиаиа ытьа иывтьаитьвистьимь иаьмт', '89064570340', 'Успешно завершено', 'null', 'null', NULL, NULL),
(6, 1, 33, 'мне необхоодимо сделать вечерний макияж для выпускного 27 мая. Макияж должен быть сдержанным и при этом необычным', '89064570340', 'Отправлен', 'null', 'null', '2023-05-15 14:13:46', '2023-05-15 14:13:46');

-- --------------------------------------------------------

--
-- Структура таблицы `comments_sovets`
--

CREATE TABLE `comments_sovets` (
  `id` bigint UNSIGNED NOT NULL,
  `id_sovet` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `comm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `title`, `description`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'Позвоните нам', 'Есть вопросы? мы поможем', '7(906)-457-03-40', '2023-04-02 04:22:28', '2023-04-02 04:22:28'),
(2, 'Напишите нам!', 'Мы открыты для любых вопросов', 'admin@mail.ru', '2023-04-02 04:22:54', '2023-04-02 04:23:52'),
(3, 'Хочешь стать частью команды?', 'Заполняй заявку и присоединяйся', 'Оставляйте заявку', '2023-04-02 04:24:52', '2023-04-02 04:24:52');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `likes_masters`
--

CREATE TABLE `likes_masters` (
  `id` bigint UNSIGNED NOT NULL,
  `id_master` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes_masters`
--

INSERT INTO `likes_masters` (`id`, `id_master`, `id_user`, `created_at`, `updated_at`) VALUES
(75, 1, 33, '2023-05-15 14:08:37', '2023-05-15 14:08:37'),
(76, 2, 33, '2023-05-15 14:09:03', '2023-05-15 14:09:03');

-- --------------------------------------------------------

--
-- Структура таблицы `likes_sovets`
--

CREATE TABLE `likes_sovets` (
  `id` bigint UNSIGNED NOT NULL,
  `id_sovet` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `masters`
--

CREATE TABLE `masters` (
  `id` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staj` int NOT NULL,
  `clients_count` int NOT NULL,
  `min_cena` int NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `masters`
--

INSERT INTO `masters` (`id`, `id_user`, `name`, `surname`, `age`, `city`, `staj`, `clients_count`, `min_cena`, `description`, `avatar`, `admin_status`, `privilege`, `created_at`, `updated_at`) VALUES
(1, 2, 'Евгения', 'Ким', 26, 'Астрахань', 3, 500, 1500, 'ловар аврп лра лпорвао лпр аплоаврплаврп аврп рвапл ролп равп ролав прлова рплоав рплоаврпл равплр вапр лавопр лав рплоавр пол аол арвпр ваопр ваол пралв плоавполавр пл аврполвар п рвапо ва р арп лраолпрваолв паов рплвар полварполар впола рвполаврполвар ппл', 'http://127.0.0.1:8000/storage/masters/avatars/G56QvvgS6YgjWQyuBK2Zf5sZEdZjnVc95QSjPUA0.jpg', 'active', '1', '2023-04-01 12:04:43', '2023-04-04 10:43:08'),
(2, 1, 'Ирина', 'Короткова', 27, 'Астрахань', 4, 700, 1000, 'ыуау рыв авпы ав авпававпапвыапвоапвапвыпаовыапво апвоап впа варвыпавпа варова пвыоапов ыапв ап выапва пвоыраппв аопвыоа пвоыап воыап ыоапвоы апыова вавроыа проыва п', 'http://127.0.0.1:8000/storage/masters/avatars/WF59cxecz0yhyAUbiUYwF1w9WD7VavKrddABwPaL.jpg', 'active', '2', NULL, '2023-05-14 17:20:16'),
(4, 31, 'Мастер', 'Иванников', 21, 'Москва', 5, 400, 2000, 'foh kfghk sdhfjksdh fjksdfh sdjkf hsdjk fhjksdhf jksd hfjsdfj hdsf sdnv sdhfskdjhfjk sdfjkdshfj sdhjkf hsdjk fhd jksd hvjk sdhbjk sdjkf sdjkf hdsjk fhkjsd hfjkdsh fjk shjkfh sdjkvhjksd hvkfsg vhj sfvsdvgsdkhvsd vjksfdh fjksdh', 'http://127.0.0.1:8000/storage/masters/avatars/Qs4NF7R2JfkP2QMGqZ9MWgCxFcxf6KCfJnoGSEHI.jpg', 'ban', '3', '2023-04-29 04:06:06', '2023-05-14 17:35:59'),
(9, 32, 'user1', 'qwdwqd', 22, 'qwdqwdwqwdwq', 2, 2, 222222, 'qwdqwdwqdqwdq wdwqdqwdq wdwqdqwdqwdwqdqwd qwdwqd wdqwdwqdqwd qwdwqdqwdqwd wqdqwdqwdw qdqwdqwdwqdq wdqwdwqd', 'http://127.0.0.1:8000/storage/masters/avatars/g7aBbiSmSb7rPsK3jaleUdvKyrDYTAwsLze6EMDm.png', 'not', '0', '2023-05-03 12:38:45', '2023-05-12 08:41:49');

-- --------------------------------------------------------

--
-- Структура таблицы `master_tags`
--

CREATE TABLE `master_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `id_master` bigint UNSIGNED NOT NULL,
  `id_tag` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `master_tags`
--

INSERT INTO `master_tags` (`id`, `id_master`, `id_tag`, `created_at`, `updated_at`) VALUES
(3, 9, 1, '2023-05-03 14:59:22', '2023-05-03 14:59:22'),
(4, 9, 2, '2023-05-03 14:59:22', '2023-05-03 14:59:22'),
(5, 9, 3, '2023-05-03 14:59:45', '2023-05-03 14:59:45'),
(6, 1, 3, NULL, NULL),
(7, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_02_28_102129_create_masters_table', 1),
(7, '2023_02_28_103130_create_posts_table', 1),
(8, '2023_03_28_102836_create_tags_table', 1),
(9, '2023_03_28_102954_create_master_tags_table', 1),
(10, '2023_03_28_103009_create_abouts_table', 1),
(11, '2023_03_28_103018_create_about_galleries_table', 1),
(12, '2023_03_28_103027_create_applications_table', 1),
(13, '2023_03_28_103048_create_contacts_table', 1),
(14, '2023_03_28_103100_create_likes_posts_table', 1),
(15, '2023_03_28_103139_create_post_images_table', 1),
(16, '2023_03_28_103150_create_slider_1s_table', 1),
(17, '2023_03_28_103155_create_sovets_table', 1),
(18, '2023_03_28_103202_create_sovet_images_table', 1),
(19, '2023_03_28_103306_create_likes_sovets_table', 1),
(20, '2023_03_28_103307_create_comments_sovets_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 3, 'token', '00c5ed5afda9d317fb373ee1933436208734abb3601640c6100ac76419ca2d2b', '[\"*\"]', NULL, NULL, '2023-04-01 11:02:10', '2023-04-01 11:02:10'),
(4, 'App\\Models\\User', 9, 'token', '99fb69a3e14d3357c2def3290d8776d46bd3ea06ad1de8f4890e07c6844065a7', '[\"*\"]', NULL, NULL, '2023-04-01 11:21:22', '2023-04-01 11:21:22'),
(5, 'App\\Models\\User', 10, 'token', 'a2777a95347948047a3da43b1ec158247c45709a41fe209064985f65b62c456d', '[\"*\"]', NULL, NULL, '2023-04-01 11:23:14', '2023-04-01 11:23:14'),
(6, 'App\\Models\\User', 11, 'token', 'd50a23dd32b497c2d0ac828487a19d42639fa4575ebd7154787aed431b2c8a0b', '[\"*\"]', NULL, NULL, '2023-04-01 11:27:00', '2023-04-01 11:27:00'),
(7, 'App\\Models\\User', 12, 'token', '0a99513bc99d364df0d542cc46a575dda32abef4dcddcd18b4b014edd4f86e8b', '[\"*\"]', NULL, NULL, '2023-04-01 11:27:56', '2023-04-01 11:27:56'),
(8, 'App\\Models\\User', 13, 'token', '140440f96e72c7137d2944b1d748c1b9f266fe903e5c54a2a87dc087b4da8d45', '[\"*\"]', NULL, NULL, '2023-04-01 11:31:04', '2023-04-01 11:31:04'),
(9, 'App\\Models\\User', 14, 'token', 'd90d879d3bb27bea1e972e6662fc1ac1b9b3d3998abbf56a5ee391d672c25762', '[\"*\"]', NULL, NULL, '2023-04-01 11:36:25', '2023-04-01 11:36:25'),
(10, 'App\\Models\\User', 15, 'token', '970c1e89c6b40f50e4c23bd9a5f700719e8b8f8cf97ce763828ce6cff25a8e06', '[\"*\"]', NULL, NULL, '2023-04-01 11:36:59', '2023-04-01 11:36:59'),
(11, 'App\\Models\\User', 16, 'token', 'bf37d695051f6c89d9cd93c333f2c276424b65ad1dd252d3f0a22e772b145f85', '[\"*\"]', NULL, NULL, '2023-04-01 11:38:16', '2023-04-01 11:38:16'),
(12, 'App\\Models\\User', 17, 'token', '8b331210b8a60d1e68a3760003b65dbc1f6bb4017269d00b3f0ab522168d7306', '[\"*\"]', NULL, NULL, '2023-04-01 11:39:21', '2023-04-01 11:39:21'),
(13, 'App\\Models\\User', 18, 'token', '3a556e652f1febdde46e40865f8b6fa433b93fe1f1ef978cb5c085453a09d9d0', '[\"*\"]', NULL, NULL, '2023-04-01 11:40:48', '2023-04-01 11:40:48'),
(14, 'App\\Models\\User', 20, 'token', '5cf4a0ec3c0cbfc2d244ae84dcaadd04f1ceff4064823ccf0aaf1d710bf9735c', '[\"*\"]', NULL, NULL, '2023-04-01 11:45:57', '2023-04-01 11:45:57'),
(15, 'App\\Models\\User', 21, 'token', '2588e6f5a038df358449ad5606d9793e7d26b02cfb0a05b6fb811f918b106aa5', '[\"*\"]', NULL, NULL, '2023-04-01 11:48:11', '2023-04-01 11:48:11'),
(16, 'App\\Models\\User', 22, 'token', 'a419d0a1f779c162c60142a071a3f9b3c21b754e472644211864c2a7e726a65a', '[\"*\"]', NULL, NULL, '2023-04-01 11:49:20', '2023-04-01 11:49:20'),
(17, 'App\\Models\\User', 23, 'token', '067c5c22c2ae064781c90976bc35709184262ec837c6adf7d61532c1101bc2f2', '[\"*\"]', NULL, NULL, '2023-04-01 11:49:47', '2023-04-01 11:49:47'),
(18, 'App\\Models\\User', 24, 'token', '4fc862734add6aeb994c16a36a0bae551bc31931a33343aa6c5c0fba07ba3057', '[\"*\"]', NULL, NULL, '2023-04-01 11:50:26', '2023-04-01 11:50:26'),
(19, 'App\\Models\\User', 25, 'token', 'ed04aafcf12f06cac38b5e5b6d642cd8b1c28b628f2823d513f991589daa213f', '[\"*\"]', NULL, NULL, '2023-04-01 11:51:12', '2023-04-01 11:51:12'),
(20, 'App\\Models\\User', 26, 'token', '32962b219b860510ef2fc1f11982e36ce5834090683ff8f560def4b6fffdb7cb', '[\"*\"]', NULL, NULL, '2023-04-01 11:52:12', '2023-04-01 11:52:12'),
(21, 'App\\Models\\User', 27, 'token', '7f7add64a195cef5ac64e0a9866b3fa5c29232f8ef33b0da67fd680b5b227458', '[\"*\"]', NULL, NULL, '2023-04-01 11:53:06', '2023-04-01 11:53:06'),
(22, 'App\\Models\\User', 28, 'token', '59590bfca1720c366ada5a28c44d5152c072735f2170a196b89c08492a9297ac', '[\"*\"]', NULL, NULL, '2023-04-01 11:53:58', '2023-04-01 11:53:58'),
(23, 'App\\Models\\User', 29, 'token', '0674915f47bb3622788eb28ecaa4edd9a563cea1749e7e162efe83a796a60ec0', '[\"*\"]', NULL, NULL, '2023-04-01 11:54:28', '2023-04-01 11:54:28'),
(102, 'App\\Models\\User', 30, 'token', '6dbd92b3069a9d8ee63560fb44e3e5f357763044ec643b64bf3a81e591c73166', '[\"*\"]', '2023-05-15 15:11:36', NULL, '2023-05-15 14:30:25', '2023-05-15 15:11:36');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_master` bigint UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `id_master`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 'fjsdgfhj sdgfhksdg vfjhgsd nmvsd fgdfvhjksdksd hfdshk fhxdfhdhfgjk sdhfjkg dfhjk dfhjkg df', '2023-04-03 11:54:34', '2023-04-03 11:54:34'),
(6, 2, 'какой то там текст', '2023-04-06 14:58:38', '2023-04-06 14:58:38'),
(7, 4, 'gergeerjtukyiythte gergeerjtukyiythte', '2023-04-29 04:09:06', '2023-04-29 04:09:06'),
(10, 1, 'dfgdgsfgdfgdf', '2023-05-03 09:21:19', '2023-05-03 09:21:19'),
(11, 1, 'asdsadsadad', '2023-05-03 09:21:43', '2023-05-03 09:21:43'),
(12, 1, 'qqqqqqq', '2023-05-03 09:28:09', '2023-05-03 09:28:09'),
(14, 2, 'asdsadsadasdsadsadasdsadsadasdsadsadasdsadsad', '2023-05-14 14:31:50', '2023-05-14 14:31:50'),
(15, 2, 'dsjgf msdckhjkdh vdsh cksbvnmsd bnmfgsdc shk gvsjdhfsdfsd', '2023-05-14 15:01:04', '2023-05-14 15:01:04'),
(16, 2, 'Прекрасная девушка. Прекрасно проведенное время. Прекрасный повседневный make-up', '2023-05-14 16:50:54', '2023-05-14 16:50:54'),
(17, 1, 'удивительный опыт для необычной съемки', '2023-05-14 16:55:10', '2023-05-14 16:55:10'),
(18, 4, 'kdgdfk sjfsd hfjhdfjkdsh fm dshfm,hsd,fjhsd', '2023-05-14 17:03:10', '2023-05-14 17:03:10'),
(20, 4, 'fgdfgd dg fhfgfgg dffd df df dfd fdf', '2023-05-14 17:11:14', '2023-05-14 17:11:14'),
(21, 2, 'sd fhjsd hfjksdh fjksdhf jksdh fksdh fjksdhfjksdh fjksdhfjksdhfkjsdhfkdsdkfh', '2023-05-14 17:14:10', '2023-05-14 17:14:10');

-- --------------------------------------------------------

--
-- Структура таблицы `post_images`
--

CREATE TABLE `post_images` (
  `id` bigint UNSIGNED NOT NULL,
  `id_post` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_images`
--

INSERT INTO `post_images` (`id`, `id_post`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'http://127.0.0.1:8000/storage/posts_img/usP2qWqQ9cT4vDCw4NNu6CJ8L8tQJREaOrk4RxNs.png', '2023-04-03 11:54:34', '2023-05-03 08:55:08'),
(2, 3, 'http://127.0.0.1:8000/storage/posts_img/k9YIajlnBXKJyIJ07DZSVmpvk3NsMuStOCwBz7fo.jpg', '2023-04-03 11:54:34', '2023-05-03 08:54:55'),
(8, 6, 'http://127.0.0.1:8000/storage/posts_img/ZOZBjCgmpPTA68YLF5WcebehrXfpKsBhZe1ZFHxO.jpg', '2023-04-06 14:58:39', '2023-05-14 15:22:19'),
(9, 7, 'http://127.0.0.1:8000/storage/posts_img/J0gB7AHni70xLrphfNLg7XBC1sehY4cZWQjTciQI.png', '2023-04-29 04:09:06', '2023-04-30 14:38:35'),
(14, 10, 'http://127.0.0.1:8000/storage/posts_img/fGMtAGqNHXrrEa4lddD9pYkUtlSge1vAff4I9Zxv.jpg', '2023-05-03 09:21:19', '2023-05-03 09:21:19'),
(15, 10, 'http://127.0.0.1:8000/storage/posts_img/FJOLnF9P3gRIJ1MjjqghK7dzIqQr7XO4ujErz7Cu.jpg', '2023-05-03 09:21:19', '2023-05-03 09:21:19'),
(16, 11, 'http://127.0.0.1:8000/storage/posts_img/5Hlhm4RKO48p801MZhEB8pITRzjGH20CYY3WWLeE.png', '2023-05-03 09:21:43', '2023-05-03 09:21:43'),
(17, 11, 'http://127.0.0.1:8000/storage/posts_img/DDx3MC2qcM888z6Jd9hTMKy7knGP6znnxxgC36QV.png', '2023-05-03 09:21:43', '2023-05-03 09:21:43'),
(18, 12, 'http://127.0.0.1:8000/storage/posts_img/7xhk5XMH0xATtXgezxAoRMtxnDWmYmnrIxPpLefJ.jpg', '2023-05-03 09:28:09', '2023-05-03 09:28:09'),
(19, 14, 'http://127.0.0.1:8000/storage/posts_img/47zxYAjhAt8BmRtYdiIT9mnCT4rPxGlYlubgvEpa.jpg', '2023-05-14 14:31:50', '2023-05-14 15:23:43'),
(20, 14, 'http://127.0.0.1:8000/storage/posts_img/65nrzTVhQfylsQX7EQj6SWreCWCUGxkWoCuYJHVz.jpg', '2023-05-14 14:31:50', '2023-05-14 15:23:17'),
(21, 15, 'http://127.0.0.1:8000/storage/posts_img/yiNLltXVbCMCZPQNj7h3MbsJr4tUx9dImmD2OkOx.jpg', '2023-05-14 15:01:04', '2023-05-14 15:21:33'),
(22, 15, 'http://127.0.0.1:8000/storage/posts_img/MbiRJH1CzD3j5NsXF2pQaY7qoxYTkvt5OWtb6WJj.png', '2023-05-14 15:01:04', '2023-05-14 15:21:35'),
(23, 16, 'http://127.0.0.1:8000/storage/posts_img/raQXSUHCJrYDlsQGKySuc1YII2H4fc9PUlg8hOIr.jpg', '2023-05-14 16:50:54', '2023-05-14 16:50:54'),
(24, 16, 'http://127.0.0.1:8000/storage/posts_img/e8H41aVB4UAt0scpbno1gDhECdkjnrFy58VN8pIs.jpg', '2023-05-14 16:50:54', '2023-05-14 16:50:54'),
(25, 17, 'http://127.0.0.1:8000/storage/posts_img/hWXH2m5bvc415HMjxHhrj2XJfKhenke7yMSs6RFb.jpg', '2023-05-14 16:55:10', '2023-05-14 16:55:10'),
(26, 18, 'http://127.0.0.1:8000/storage/posts_img/Rpg9TIo6S5iWA0VMOL4NCvZkHReSGAUaZsgwGJrr.jpg', '2023-05-14 17:03:10', '2023-05-14 17:03:10'),
(28, 20, 'http://127.0.0.1:8000/storage/posts_img/FMoUoXBP3caxlGg4q72sO93O3KXkym61bTCc1UFX.jpg', '2023-05-14 17:11:14', '2023-05-14 17:11:14'),
(29, 21, 'http://127.0.0.1:8000/storage/posts_img/F16f0TZVKQy6tAFYpr7FrzTdQrn2PVLAeSo9wUG5.jpg', '2023-05-14 17:14:10', '2023-05-14 17:14:10');

-- --------------------------------------------------------

--
-- Структура таблицы `slider_1s`
--

CREATE TABLE `slider_1s` (
  `id` bigint UNSIGNED NOT NULL,
  `number` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `slider_1s`
--

INSERT INTO `slider_1s` (`id`, `number`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://127.0.0.1:8000/storage/admin/slider/VDli0ths374N4jRfb5aHHpN2GUu8hdNdL5X8uhAq.jpg', '2023-04-02 02:44:27', '2023-05-14 16:00:22'),
(2, 2, 'http://127.0.0.1:8000/storage/admin/slider/mQxq0GO18234Xp1FgVonnFLjy3Rw9K4M4aXZoIUJ.jpg', '2023-04-02 02:44:27', '2023-05-14 16:10:08'),
(3, 3, 'http://127.0.0.1:8000/storage/admin/slider/etx39S5K5wYfU3QwVtT08dQmDJUztA52AG7byDx5.jpg', '2023-04-02 02:44:27', '2023-05-14 16:05:13');

-- --------------------------------------------------------

--
-- Структура таблицы `sovets`
--

CREATE TABLE `sovets` (
  `id` bigint UNSIGNED NOT NULL,
  `id_master` bigint UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sovets`
--

INSERT INTO `sovets` (`id`, `id_master`, `description`, `privilege`, `created_at`, `updated_at`) VALUES
(1, 2, 'gfgffg sdfkdshfdhfkdhfsdk f jdv hfgv hksd fjsdh fjkhvjkds hvjksdh fjksd hvjksdhfjkshdfhsdjkfhdfhjksdfjk sdhfkjsd hfgksdg fuiweh requjpwejovhsfuovg dbfdb g dfbnb g bdfvdcdsafs dngghn ghdbdfsd', '2', '2023-05-08 14:36:57', '2023-05-12 09:58:26'),
(2, 2, 'asdsdfsdfsdj hfgdshjfgsdjgfdgchjgsdhv ghjvg sdhj vgsdjh vgdhjhvgdhjsvsdjhv gsdjhv jsgvjdg vjdsvhjsd vj sdvgsdhj vgsdhjvg sdhvghsdvghjsdv ghjdv gsds', '0', '2023-05-08 14:38:00', '2023-05-12 10:02:35'),
(4, 2, 'qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd qdwdqd', '2', '2023-05-08 14:44:18', '2023-05-08 14:44:18'),
(5, 2, 'ascsacsacsacsac sf dfgfgfgsfg dfg fg sdfg g sdfg sg fsgf gsdfg dfgs dfg sdfg ascsacsacsacsac sf dfgfgfgsfg dfg fg sdfg g sdfg sg fsgf gsdfg dfgs dfg sdfg', '2', '2023-05-08 14:45:41', '2023-05-12 10:02:41'),
(6, 2, 'qwdwqdqqwdwqdqqwdwqdqqwdwqdqqwdwqdqqwdwqdqqwdwqdq', '0', '2023-05-14 14:33:52', '2023-05-14 14:33:52'),
(7, 2, 'qqqqqqqqqqqqqqqqqqqqq', '0', '2023-05-14 14:36:55', '2023-05-14 14:36:55'),
(8, 4, 'Набрав тени, слегка похлопайте кистью по тыльной стороне руки или просто стряхните, чтобы снять излишки теней. Не торопитесь, растушевывайте тени, понемногу увеличивая насыщенность, и получите максимально аккуратный макияж глаз и безупречную «дымку».', '1', '2023-05-14 17:40:23', '2023-05-14 17:40:23'),
(9, 2, 'Как правильно красить уголки губ?\r\nБежевым карандашом обведите губы, чуть выходя за естественные контуры. Внутреннюю часть губ закрасьте темным оттенком помады или блеска, а уголки нижней губы подчерните консилером. Это поможет визуально их приподнять.', '1', '2023-05-14 17:57:35', '2023-05-14 17:57:35'),
(10, 1, 'Чтобы цветной макияж глаз выглядел сочно и неоново-ярко, лучше использовать смешанные текстуры. С «красками» можно не стесняться: выбирай смелые, неоновые или даже кислотные оттенки.', '1', '2023-05-14 18:14:22', '2023-05-14 18:14:22');

-- --------------------------------------------------------

--
-- Структура таблицы `sovet_images`
--

CREATE TABLE `sovet_images` (
  `id` bigint UNSIGNED NOT NULL,
  `id_sovet` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sovet_images`
--

INSERT INTO `sovet_images` (`id`, `id_sovet`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 'http://127.0.0.1:8000/storage/sovets_img/kUoRB6c7BWwtWihJikKwYBpO4j79P9qTMhDQ8GPL.png', '2023-05-08 14:38:00', '2023-05-08 14:38:00'),
(2, 2, 'http://127.0.0.1:8000/storage/sovets_img/w5uDBLdkLMuCi2aBWFzcvqeMxGnyJYFl7SnBvFzh.png', '2023-05-08 14:38:00', '2023-05-08 14:38:00'),
(3, 2, 'http://127.0.0.1:8000/storage/sovets_img/Ca5og0ap8UcvvqqGRxGwr7WRubijmiA2bWboQQ4W.png', '2023-05-08 14:38:00', '2023-05-08 14:38:00'),
(7, 4, 'http://127.0.0.1:8000/storage/sovets_img/8qpToSjtpHvNO5SNAPBvJk88e4233g9Qo1oIW6SE.jpg', '2023-05-08 14:44:18', '2023-05-08 14:44:18'),
(8, 5, 'http://127.0.0.1:8000/storage/sovets_img/U5dSYPjuNYLDF2I7KFm2gG6VFJSlZyzNkjLKA5fu.png', '2023-05-08 14:45:41', '2023-05-08 14:45:41'),
(9, 7, 'http://127.0.0.1:8000/storage/sovets_img/s7nLweYJiDl4HR1BQHhimzRgk2XbzvnAJZ6Ddfp0.png', '2023-05-14 14:36:55', '2023-05-14 14:36:55'),
(10, 7, 'http://127.0.0.1:8000/storage/sovets_img/s35ryvFnV3DMVIdnfx0aKge8G1oyZALzwZCQ93XG.png', '2023-05-14 14:36:55', '2023-05-14 14:36:55'),
(11, 8, 'http://127.0.0.1:8000/storage/sovets_img/YlrYcjoxkfStvUd7JGaBTHtlQTlj88f3cz8o3IRC.jpg', '2023-05-14 17:40:23', '2023-05-14 17:40:23'),
(12, 8, 'http://127.0.0.1:8000/storage/sovets_img/GUjQmu3qCbb0bMatFhQVhM70yNVpHh0BrsTEpTDV.jpg', '2023-05-14 17:40:23', '2023-05-14 17:40:23'),
(13, 9, 'http://127.0.0.1:8000/storage/sovets_img/HCV5k5m5NfJSbStWoV2yGb6o59L8oEzVSSSbBPL5.jpg', '2023-05-14 17:57:35', '2023-05-14 17:57:35'),
(14, 9, 'http://127.0.0.1:8000/storage/sovets_img/knv0NJevjPlYcsHMCmWhnKkzvtX6NpvEloJeQS01.jpg', '2023-05-14 17:57:35', '2023-05-14 17:57:35'),
(15, 9, 'http://127.0.0.1:8000/storage/sovets_img/jdqR3aNWAToQm2E4U7iDZPcGpuM4PEBOPZNiBLZx.jpg', '2023-05-14 17:57:35', '2023-05-14 17:57:35'),
(16, 10, 'http://127.0.0.1:8000/storage/sovets_img/NJKQZVClZCtyCJyO99Abd7YPoBngbtO4CWfoZh3e.jpg', '2023-05-14 18:14:22', '2023-05-14 18:14:22'),
(17, 10, 'http://127.0.0.1:8000/storage/sovets_img/iuhdT8m2jwgQ53ZPUie4KPid3TI5GVUHcJaGbmEr.jpg', '2023-05-14 18:14:22', '2023-05-14 18:14:22'),
(18, 10, 'http://127.0.0.1:8000/storage/sovets_img/poG97aT0hNC1NZ3W1h4FpXfM4w9ylHaK3FYJE374.jpg', '2023-05-14 18:14:22', '2023-05-14 18:14:22');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `created_at`, `updated_at`) VALUES
(1, 'Свадебный', NULL, NULL),
(2, 'Вечерний', NULL, NULL),
(3, 'Дневной', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ирина', 'user@mail.ru', NULL, '$2y$10$L1cYN7wFC85Ul0j9buBPJ.4/jETSBMBM82x2eX.crkfnSu7yjcpNS', 'master', NULL, '2023-04-01 10:56:05', '2023-04-06 14:51:57'),
(2, 'Евгения', 'master@mail.ru', NULL, '$2y$10$AKF4pVLn.UZfJ8ykIgA6GeeBDzxdwfKQKb6H1JYKi69MHeHCTXIV.', 'master', NULL, '2023-04-01 11:00:41', '2023-04-01 11:00:41'),
(30, 'Artem', 'admin@mail.ru', NULL, '$2y$10$M2UQm6YwurA8u/QjXCgANe2qcXiy2ok4lZjEiRENrtGkNG.J7rMIC', 'admin', NULL, '2023-04-01 11:56:32', '2023-04-01 11:56:32'),
(31, 'Мастер', 'newmaster@mail.ru', NULL, '$2y$10$yW0RUhBFuC4fPETsD7sA5OhHNB6C6EMQZmkwi9mAqn.33p5G0Qtmi', 'master', NULL, '2023-04-29 04:00:45', '2023-04-29 04:00:45'),
(32, 'Мария', 'user1@mail.ru', NULL, '$2y$10$vKKnaXeOZmHJH9FZaKB7Ou8MV7.Vp/YMfi84pxs7uw/P1K8ydoHAG', 'user', NULL, '2023-05-03 09:30:18', '2023-05-12 08:32:19'),
(33, 'Мария', 'user2@mail.ru', NULL, '$2y$10$.wyPzas8ecObWmin9fyN8uSLVyVvRc4qlNAlkjT/Pm/VxeISQB8ZK', 'user', NULL, '2023-05-08 10:12:28', '2023-05-08 10:12:28'),
(34, 'тот еще лох', 'user3@mail.ru', NULL, '$2y$10$VeLIX2Ec5Qxaldw3sl1uB.HciY4UfB33wsV9MqN6JHPh3c9QWF48K', 'user', NULL, '2023-05-08 10:18:17', '2023-05-08 10:18:17'),
(35, 'Нормальный человек', 'user4@mail.ru', NULL, '$2y$10$44kVrVjD7ziROsz84Uvk5.irfyeHL7l/wrGdKUpI5HhR.5BWv3CjO', 'user', NULL, '2023-05-08 10:23:42', '2023-05-08 10:23:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `about_galleries`
--
ALTER TABLE `about_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_id_master_foreign` (`id_master`),
  ADD KEY `applications_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `comments_sovets`
--
ALTER TABLE `comments_sovets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_sovets_id_sovet_foreign` (`id_sovet`),
  ADD KEY `comments_sovets_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `likes_masters`
--
ALTER TABLE `likes_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_masters_id_master_foreign` (`id_master`),
  ADD KEY `likes_masters_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `likes_sovets`
--
ALTER TABLE `likes_sovets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_sovets_id_sovet_foreign` (`id_sovet`),
  ADD KEY `likes_sovets_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masters_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `master_tags`
--
ALTER TABLE `master_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_tags_id_master_foreign` (`id_master`),
  ADD KEY `master_tags_id_tag_foreign` (`id_tag`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_id_master_foreign` (`id_master`);

--
-- Индексы таблицы `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_images_id_post_foreign` (`id_post`);

--
-- Индексы таблицы `slider_1s`
--
ALTER TABLE `slider_1s`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sovets`
--
ALTER TABLE `sovets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sovets_id_master_foreign` (`id_master`);

--
-- Индексы таблицы `sovet_images`
--
ALTER TABLE `sovet_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sovet_images_id_sovet_foreign` (`id_sovet`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `about_galleries`
--
ALTER TABLE `about_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `comments_sovets`
--
ALTER TABLE `comments_sovets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `likes_masters`
--
ALTER TABLE `likes_masters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT для таблицы `likes_sovets`
--
ALTER TABLE `likes_sovets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `masters`
--
ALTER TABLE `masters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `master_tags`
--
ALTER TABLE `master_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `slider_1s`
--
ALTER TABLE `slider_1s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sovets`
--
ALTER TABLE `sovets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `sovet_images`
--
ALTER TABLE `sovet_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_id_master_foreign` FOREIGN KEY (`id_master`) REFERENCES `masters` (`id`),
  ADD CONSTRAINT `applications_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `comments_sovets`
--
ALTER TABLE `comments_sovets`
  ADD CONSTRAINT `comments_sovets_id_sovet_foreign` FOREIGN KEY (`id_sovet`) REFERENCES `sovets` (`id`),
  ADD CONSTRAINT `comments_sovets_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `likes_masters`
--
ALTER TABLE `likes_masters`
  ADD CONSTRAINT `likes_masters_id_master_foreign` FOREIGN KEY (`id_master`) REFERENCES `masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `likes_masters_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `likes_sovets`
--
ALTER TABLE `likes_sovets`
  ADD CONSTRAINT `likes_sovets_id_sovet_foreign` FOREIGN KEY (`id_sovet`) REFERENCES `sovets` (`id`),
  ADD CONSTRAINT `likes_sovets_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `masters`
--
ALTER TABLE `masters`
  ADD CONSTRAINT `masters_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `master_tags`
--
ALTER TABLE `master_tags`
  ADD CONSTRAINT `master_tags_id_master_foreign` FOREIGN KEY (`id_master`) REFERENCES `masters` (`id`),
  ADD CONSTRAINT `master_tags_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`);

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_id_master_foreign` FOREIGN KEY (`id_master`) REFERENCES `masters` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sovets`
--
ALTER TABLE `sovets`
  ADD CONSTRAINT `sovets_id_master_foreign` FOREIGN KEY (`id_master`) REFERENCES `masters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sovet_images`
--
ALTER TABLE `sovet_images`
  ADD CONSTRAINT `sovet_images_id_sovet_foreign` FOREIGN KEY (`id_sovet`) REFERENCES `sovets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
