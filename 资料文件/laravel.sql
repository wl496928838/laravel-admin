-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-03-22 23:28:00
-- 服务器版本： 5.7.4-m14-log
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_function`
--

CREATE TABLE `admin_function` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `function_name` varchar(50) NOT NULL COMMENT '函数名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='函数表';

-- --------------------------------------------------------

--
-- 表的结构 `admin_info`
--

CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送站点ID',
  `limit_id` int(11) NOT NULL COMMENT '权限id',
  `admin_name` varchar(50) NOT NULL,
  `password` char(60) NOT NULL DEFAULT '' COMMENT '密码',
  `token` varchar(255) DEFAULT '',
  `state` int(11) NOT NULL COMMENT '1:启用 2:关闭',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登陆时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台管理用户表';

--
-- 转存表中的数据 `admin_info`
--

INSERT INTO `admin_info` (`id`, `station_id`, `limit_id`, `admin_name`, `password`, `token`, `state`, `last_login`, `create_date`, `mobile`) VALUES
(1, 5, 1, 'yangyifan', '$2y$10$tyczgt4L8HynlxhElFAhSe8PWrRTuTFO6a21l6BHhlfqM/NyZ2rD2', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 1, '2015-12-05 11:19:20', '2012-09-15 06:22:04', '15897424254');

-- --------------------------------------------------------

--
-- 表的结构 `admin_limit`
--

CREATE TABLE `admin_limit` (
  `id` int(11) NOT NULL COMMENT '权限id',
  `limit_name` varchar(50) NOT NULL COMMENT '权限名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表';

--
-- 转存表中的数据 `admin_limit`
--

INSERT INTO `admin_limit` (`id`, `limit_name`) VALUES
(1, '超级管理员'),
(33, '测试角色1-1'),
(34, '测试角色2'),
(35, '这个是修改后的测试角色3');

-- --------------------------------------------------------

--
-- 表的结构 `admin_limit_function`
--

CREATE TABLE `admin_limit_function` (
  `id` int(11) NOT NULL,
  `limit_id` int(11) NOT NULL COMMENT '允许权限id',
  `function_id` varchar(50) NOT NULL COMMENT '函数id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限和函数关联表';

-- --------------------------------------------------------

--
-- 表的结构 `admin_limit_menu`
--

CREATE TABLE `admin_limit_menu` (
  `id` int(11) NOT NULL,
  `limit_id` int(11) NOT NULL COMMENT '权限ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限菜单列表';

--
-- 转存表中的数据 `admin_limit_menu`
--

INSERT INTO `admin_limit_menu` (`id`, `limit_id`, `menu_id`) VALUES
(18, 1, 54),
(17, 1, 53),
(16, 1, 52),
(15, 1, 6),
(14, 1, 156),
(13, 1, 155),
(12, 1, 154),
(11, 1, 153),
(10, 1, 152),
(19, 1, 55),
(20, 1, 56);

-- --------------------------------------------------------

--
-- 表的结构 `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单URL',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '255' COMMENT '排序 数字越小越靠前（最大值255）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单类型表';

--
-- 转存表中的数据 `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `menu_name`, `menu_url`, `sort`) VALUES
(6, 0, '权限管理', '', 6),
(52, 6, '权限 管理', '', 255),
(53, 52, '后台用户', 'Admin\\Admin\\AdminInfoController@getIndex', 255),
(54, 52, '后台菜单', 'Admin\\Admin\\AdminMenuController@getIndex', 255),
(55, 52, '后台角色', 'Admin\\Admin\\AdminLimitController@getIndex', 255),
(56, 52, '后台函数', 'Admin\\Admin\\AdminFunctionController@getIndex', 255);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_04_24_110151_create_oauth_scopes_table', 1),
('2014_04_24_110304_create_oauth_grants_table', 1),
('2014_04_24_110403_create_oauth_grant_scopes_table', 1),
('2014_04_24_110459_create_oauth_clients_table', 1),
('2014_04_24_110557_create_oauth_client_endpoints_table', 1),
('2014_04_24_110705_create_oauth_client_scopes_table', 1),
('2014_04_24_110817_create_oauth_client_grants_table', 1),
('2014_04_24_111002_create_oauth_sessions_table', 1),
('2014_04_24_111109_create_oauth_session_scopes_table', 1),
('2014_04_24_111254_create_oauth_auth_codes_table', 1),
('2014_04_24_111403_create_oauth_auth_code_scopes_table', 1),
('2014_04_24_111518_create_oauth_access_tokens_table', 1),
('2014_04_24_111657_create_oauth_access_token_scopes_table', 1),
('2014_04_24_111810_create_oauth_refresh_tokens_table', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_access_token_scopes`
--

CREATE TABLE `oauth_access_token_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_auth_code_scopes`
--

CREATE TABLE `oauth_auth_code_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `auth_code_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `secret`, `name`, `created_at`, `updated_at`) VALUES
('f3d259ddd3ed8ff3843839b', '4c7f6f8fa93d59c45502c0ae8c4a95b', 'Main website', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_client_endpoints`
--

CREATE TABLE `oauth_client_endpoints` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_client_grants`
--

CREATE TABLE `oauth_client_grants` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_client_scopes`
--

CREATE TABLE `oauth_client_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_grants`
--

CREATE TABLE `oauth_grants` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_grant_scopes`
--

CREATE TABLE `oauth_grant_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_sessions`
--

CREATE TABLE `oauth_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` enum('client','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_redirect_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_session_scopes`
--

CREATE TABLE `oauth_session_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_function`
--
ALTER TABLE `admin_function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_limit`
--
ALTER TABLE `admin_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_limit_function`
--
ALTER TABLE `admin_limit_function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_limit_menu`
--
ALTER TABLE `admin_limit_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_access_tokens_id_session_id_unique` (`id`,`session_id`),
  ADD KEY `oauth_access_tokens_session_id_index` (`session_id`);

--
-- Indexes for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_token_scopes_access_token_id_index` (`access_token_id`),
  ADD KEY `oauth_access_token_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_session_id_index` (`session_id`);

--
-- Indexes for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_code_scopes_auth_code_id_index` (`auth_code_id`),
  ADD KEY `oauth_auth_code_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_clients_id_secret_unique` (`id`,`secret`);

--
-- Indexes for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_client_endpoints_client_id_redirect_uri_unique` (`client_id`,`redirect_uri`);

--
-- Indexes for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_grants_client_id_index` (`client_id`),
  ADD KEY `oauth_client_grants_grant_id_index` (`grant_id`);

--
-- Indexes for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_scopes_client_id_index` (`client_id`),
  ADD KEY `oauth_client_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_grants`
--
ALTER TABLE `oauth_grants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_grant_scopes_grant_id_index` (`grant_id`),
  ADD KEY `oauth_grant_scopes_scope_id_index` (`scope_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`access_token_id`),
  ADD UNIQUE KEY `oauth_refresh_tokens_id_unique` (`id`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_sessions_client_id_owner_type_owner_id_index` (`client_id`,`owner_type`,`owner_id`);

--
-- Indexes for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_session_scopes_session_id_index` (`session_id`),
  ADD KEY `oauth_session_scopes_scope_id_index` (`scope_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_function`
--
ALTER TABLE `admin_function`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;
--
-- AUTO_INCREMENT for table `admin_limit`
--
ALTER TABLE `admin_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id', AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `admin_limit_function`
--
ALTER TABLE `admin_limit_function`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2318;
--
-- AUTO_INCREMENT for table `admin_limit_menu`
--
ALTER TABLE `admin_limit_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `oauth_access_tokens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  ADD CONSTRAINT `oauth_access_token_scopes_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD CONSTRAINT `oauth_auth_codes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  ADD CONSTRAINT `oauth_auth_code_scopes_auth_code_id_foreign` FOREIGN KEY (`auth_code_id`) REFERENCES `oauth_auth_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_auth_code_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  ADD CONSTRAINT `oauth_client_endpoints_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  ADD CONSTRAINT `oauth_client_grants_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `oauth_client_grants_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- 限制表 `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  ADD CONSTRAINT `oauth_client_scopes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_client_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  ADD CONSTRAINT `oauth_grant_scopes_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_grant_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD CONSTRAINT `oauth_refresh_tokens_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- 限制表 `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  ADD CONSTRAINT `oauth_sessions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  ADD CONSTRAINT `oauth_session_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_session_scopes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
