SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE TABLE IF NOT EXISTS `thinkox_app_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `fb_time` int(11) NOT NULL,
  `aid` int(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8  ;
CREATE TABLE IF NOT EXISTS `thinkox_app_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `version_code` varchar(11) NOT NULL,
  `update_info` text NOT NULL,
  `update_time` int(11) NOT NULL,
  `download_count` int(11) NOT NULL,
  `app_path` varchar(50) NOT NULL,
  `aid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8  ;
INSERT INTO `thinkox_menu` (`title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
( 'App', 0, 8, 'App/app', 0, '', '', 0);
set @tmp_id=0;
select @tmp_id:= id from thinkox_menu where title = 'App';
INSERT INTO `thinkox_menu` ( `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
( 'App管理', @tmp_id, 0, 'App/app', 0, '', 'App', 0),
( 'App详情', @tmp_id, 1, 'App/appdetail', 0, '', 'App', 0),
( 'App上传', @tmp_id, 2, 'App/appupload', 0, '', 'App', 0),
( '反馈消息', @tmp_id, 0, 'App/feedback', 0, '', '反馈', 0),
( '反馈回收站', @tmp_id, 1, 'App/feedbackTrash', 0, '', '反馈', 0),
( '反馈详情', @tmp_id, 2, 'App/Feedbackdetail', 0, '', '反馈', 0);

