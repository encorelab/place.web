CREATE TABLE IF NOT EXISTS `smartroom_hw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `problem_name` varchar(50) NOT NULL,
  `username` text NOT NULL,
  `principles` text NOT NULL,
  `equations` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

