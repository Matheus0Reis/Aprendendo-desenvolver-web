CREATE TABLE `forum_message` (
  `message_id` int(11) NOT NULL auto_increment,
  `thread_id` int(11) NOT NULL,
  `ally_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(10000) collate latin1_general_ci NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

CREATE TABLE `forum_structure` (
  `ally_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) collate latin1_general_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  KEY `area_id` (`area_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

CREATE TABLE `forum_thread` (
  `subject` varchar(50) collate latin1_general_ci NOT NULL,
  `thread_id` int(11) NOT NULL auto_increment,
  `area_id` int(11) NOT NULL,
  `ally_id` int(11) NOT NULL,
  `flagman_id` int(11) NOT NULL,
  `flagman_ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `last_post_id` int(11) NOT NULL,
  `last_post_ts` timestamp NULL default NULL,
  `answer` int(11) default '0',
  `status` int(1) default '0',
  KEY `thread_id` (`thread_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

CREATE TABLE `friends` (
  `id` int(20) NOT NULL auto_increment,
  `type` enum('activ','pending') collate latin1_general_ci NOT NULL default 'pending',
  `id_from` int(20) NOT NULL default '-1',
  `id_to` int(20) NOT NULL default '-1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

CREATE TABLE `support` (
  `ID` int(11) NOT NULL auto_increment,
  `Grund` varchar(36) collate latin1_general_ci NOT NULL,
  `Nick` varchar(36) collate latin1_general_ci NOT NULL,
  `Message` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;