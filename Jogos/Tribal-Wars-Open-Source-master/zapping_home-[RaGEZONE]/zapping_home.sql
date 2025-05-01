
--
-- Estrutura da tabela `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `link` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `graphic` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anuncio_global`
--

CREATE TABLE IF NOT EXISTS `anuncio_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('1','0') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `buy_logs`
--

CREATE TABLE IF NOT EXISTS `buy_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `world` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtn` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `change_mail`
--

CREATE TABLE IF NOT EXISTS `change_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `new_mail` varchar(600) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `second_mail` varchar(600) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cod` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `support_lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `confirmations`
--

CREATE TABLE IF NOT EXISTS `confirmations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `package` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resolved_on` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `start` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_visit` tinyint(1) NOT NULL DEFAULT '0',
  `extern_auth` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(33) NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `uv` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_gms`
--

CREATE TABLE IF NOT EXISTS `log_gms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horario` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paygol_logs`
--

CREATE TABLE IF NOT EXISTS `paygol_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `operator` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `custom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `points` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_logs`
--

CREATE TABLE IF NOT EXISTS `paypal_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `custom` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `amounts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions_ranks`
--

CREATE TABLE IF NOT EXISTS `permissions_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `adm_login` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_home` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_support` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `delticket` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `adm_settings` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_settings_news` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_settings_users` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_settings_villages` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_settings_worlds` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_settings_worlds_reset` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_ranks` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `adm_memo` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `addpremium` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `gerenciar` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `ban` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `cargos` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `spam` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `permissions_ranks`
--

INSERT INTO `permissions_ranks` (`id`, `rank`, `adm_login`, `adm_home`, `adm_support`, `delticket`, `adm_settings`, `adm_settings_news`, `adm_settings_users`, `adm_settings_villages`, `adm_settings_worlds`, `adm_settings_worlds_reset`, `adm_ranks`, `adm_memo`, `addpremium`, `gerenciar`, `ban`, `cargos`, `spam`) VALUES
(5, 5, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `premium_feature`
--

CREATE TABLE IF NOT EXISTS `premium_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `world` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `activated_on` varchar(400) COLLATE utf8_unicode_ci NOT NULL COMMENT 'active_on|active_for',
  `activated_until` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ranks`
--

CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `namecolor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `ranks`
--

INSERT INTO `ranks` (`id`, `name`, `namecolor`, `description`) VALUES
(1, 'Lanceiro', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `session` text COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `hkey` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `sid` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `support_feedback`
--

CREATE TABLE IF NOT EXISTS `support_feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) NOT NULL,
  `supporter` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `support_response`
--

CREATE TABLE IF NOT EXISTS `support_response` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Opcional!',
  `response` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `support_ticket`
--

CREATE TABLE IF NOT EXISTS `support_ticket` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `world` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_response` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `support_upload`
--

CREATE TABLE IF NOT EXISTS `support_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `upload_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hour` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banned` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ban_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `ban_from` int(11) NOT NULL,
  `ban_data` datetime NOT NULL,
  `ban_end` datetime NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sid` int(11) NOT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `time_reg` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ip_reg` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` text COLLATE utf8_unicode_ci NOT NULL,
  `activated` int(11) NOT NULL,
  `premium_points` int(11) NOT NULL DEFAULT '100',
  `administration` int(1) NOT NULL DEFAULT '1',
  `rank` int(1) NOT NULL DEFAULT '1',
  `wins` int(11) NOT NULL DEFAULT '0',
  `support_session` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `worlds`
--

CREATE TABLE IF NOT EXISTS `worlds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `db` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `type` enum('world','cluster') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'world',
  `cluster_end_time` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `prize` int(11) NOT NULL,
  `tribe_bonus` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `link` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dir` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `worlds`
--

INSERT INTO `worlds` (`id`, `name`, `db`, `active`, `order`, `start`, `type`, `cluster_end_time`, `duration`, `prize`, `tribe_bonus`, `limit`, `link`, `dir`) VALUES
(1, 'Mundo 1', 'zapping_worlds_m1', 1, 1, 0, 'world', 0, 0, 999, 666, 0, 'zapping_world_1', 'zapping_world_1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
