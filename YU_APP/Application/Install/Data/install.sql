-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-04-13 16:32:02
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `smile_bbs`
-
-- --------------------------------------------------------

--
-- 表的结构 `sml_action`
--

CREATE TABLE IF NOT EXISTS `sml_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `sml_action`
--

INSERT INTO `sml_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一个微博。\r\n表[model]，记录编号[record]。', 1, 0, 1394866289),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765),
(13, 'add_weibo', '发微博', '积分+2，金币+1，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+2|cycle:24|max:5|tox_money_rule:tox_money+1|tox_money_field:tox_money', '', 1, 1, 1408935799),
(14, 'add_weibo_comment', '微博评论', '积分+1，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:24|max:5', '', 1, 1, 1396342907),
(15, 'add_post', '发帖子', '积分+3，金币+1，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+3|cycle:24|max:5|tox_money_rule:tox_money+1|tox_money_field:tox_money', '', 1, 1, 1408935783),
(16, 'add_post_reply', '发帖子回复', '积分+1，每天上限5次，', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:24|max:5', '', 1, 1, 1408935759),
(17, 'recharge', '充值', '系统帮用户充值', '', 'user 充值了 data', 1, -1, 1419925472);

-- --------------------------------------------------------

--
-- 表的结构 `sml_action_log`
--

CREATE TABLE IF NOT EXISTS `sml_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=7671 ;

--
-- 转存表中的数据 `sml_action_log`
--

INSERT INTO `sml_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(7179, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:29登录了后台', 1, 1419920965),
(7180, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:32登录了后台', 1, 1419921121),
(7181, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:32登录了后台', 1, 1419921123),
(7182, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:32登录了后台', 1, 1419921124),
(7183, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:32登录了后台', 1, 1419921124),
(7184, 13, 1, 2130706433, 'Weibo', 403, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1419921139),
(7185, 14, 1, 2130706433, 'WeiboComment', 8, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1419921150),
(7186, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921215),
(7187, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921215),
(7188, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921216),
(7189, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921219),
(7190, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921220),
(7191, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921220),
(7192, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921223),
(7193, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921224),
(7194, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921224),
(7195, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921225),
(7196, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921225),
(7197, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921225),
(7198, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921227),
(7199, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921227),
(7200, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921227),
(7201, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921231),
(7202, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921232),
(7203, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921232),
(7204, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921233),
(7205, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921233),
(7206, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921233),
(7207, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921238),
(7208, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921239),
(7209, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:33登录了后台', 1, 1419921239),
(7210, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:34登录了后台', 1, 1419921243),
(7211, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:34登录了后台', 1, 1419921243),
(7212, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:34登录了后台', 1, 1419921244),
(7213, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:38登录了后台', 1, 1419921489),
(7214, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:38登录了后台', 1, 1419921490),
(7215, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:38登录了后台', 1, 1419921504),
(7216, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:44登录了后台', 1, 1419921870),
(7217, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:44登录了后台', 1, 1419921878),
(7218, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:44登录了后台', 1, 1419921890),
(7219, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:44登录了后台', 1, 1419921890),
(7220, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:45登录了后台', 1, 1419921903),
(7221, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:56登录了后台', 1, 1419922562),
(7222, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:56登录了后台', 1, 1419922564),
(7223, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 14:56登录了后台', 1, 1419922574),
(7224, 1, 58, 2130706433, 'member', 58, '蔚蓝在2014-12-30 15:15登录了后台', 1, 1419923757),
(7225, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 15:18登录了后台', 1, 1419923898),
(7226, 15, 58, 2130706433, 'ForumPost', 22, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1419924149),
(7227, 13, 58, 2130706433, 'Weibo', 404, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1419924149),
(7228, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 15:28登录了后台', 1, 1419924520),
(7229, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 15:32登录了后台', 1, 1419924767),
(7230, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 15:53登录了后台', 1, 1419926022),
(7231, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-30 15:53登录了后台', 1, 1419926032),
(7232, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-31 16:49登录了后台', 1, 1420015771),
(7233, 1, 1, 2130706433, 'member', 1, 'admin在2014-12-31 16:52登录了后台', 1, 1420015963),
(7234, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-01 13:26登录了后台', 1, 1420089977),
(7235, 13, 1, 2130706433, 'Weibo', 405, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420089985),
(7236, 13, 1, 2130706433, 'Weibo', 406, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420089995),
(7237, 13, 1, 2130706433, 'Weibo', 407, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420090006),
(7238, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-02 21:20登录了后台', 1, 1420204807),
(7239, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-02 21:20登录了后台', 1, 1420204820),
(7240, 14, 1, 2130706433, 'WeiboComment', 9, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420206455),
(7241, 14, 1, 2130706433, 'WeiboComment', 10, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420206466),
(7242, 13, 1, 2130706433, 'Weibo', 408, '操作url：/index.php?s=/weibo/index/dosendrepost.html', 1, 1420206481),
(7243, 14, 1, 2130706433, 'WeiboComment', 11, '操作url：/index.php?s=/weibo/index/dosendrepost.html', 1, 1420206481),
(7244, 13, 1, 2130706433, 'Weibo', 409, '操作url：/index.php?s=/weibo/index/dosendrepost.html', 1, 1420206518),
(7245, 14, 1, 2130706433, 'WeiboComment', 12, '操作url：/index.php?s=/weibo/index/dosendrepost.html', 1, 1420206518),
(7246, 13, 1, 2130706433, 'Weibo', 410, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206548),
(7247, 14, 1, 2130706433, 'WeiboComment', 13, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420206560),
(7248, 13, 1, 2130706433, 'Weibo', 411, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206571),
(7249, 13, 1, 2130706433, 'Weibo', 412, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206589),
(7250, 13, 1, 2130706433, 'Weibo', 413, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206600),
(7251, 13, 1, 2130706433, 'Weibo', 414, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206617),
(7252, 13, 1, 2130706433, 'Weibo', 415, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206629),
(7253, 13, 1, 2130706433, 'Weibo', 416, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206651),
(7254, 13, 1, 2130706433, 'Weibo', 417, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420206662),
(7255, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:22登录了后台', 1, 1420215734),
(7256, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:22登录了后台', 1, 1420215736),
(7257, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:22登录了后台', 1, 1420215755),
(7258, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:23登录了后台', 1, 1420215828),
(7259, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:23登录了后台', 1, 1420215828),
(7260, 13, 1, -1442928124, 'Weibo', 418, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420215844),
(7261, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:24登录了后台', 1, 1420215854),
(7262, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:24登录了后台', 1, 1420215860),
(7263, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-03 00:24登录了后台', 1, 1420215867),
(7264, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-05 11:54登录了后台', 1, 1420430095),
(7265, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-05 11:55登录了后台', 1, 1420430102),
(7266, 15, 1, 2130706433, 'ForumPost', 23, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431171),
(7267, 13, 1, 2130706433, 'Weibo', 419, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431171),
(7268, 15, 1, 2130706433, 'ForumPost', 24, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431188),
(7269, 13, 1, 2130706433, 'Weibo', 420, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431188),
(7270, 15, 1, 2130706433, 'ForumPost', 25, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431233),
(7271, 13, 1, 2130706433, 'Weibo', 421, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431233),
(7272, 15, 1, 2130706433, 'ForumPost', 26, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431243),
(7273, 13, 1, 2130706433, 'Weibo', 422, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431243),
(7274, 15, 1, 2130706433, 'ForumPost', 27, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431257),
(7275, 13, 1, 2130706433, 'Weibo', 423, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431257),
(7276, 15, 1, 2130706433, 'ForumPost', 28, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431270),
(7277, 13, 1, 2130706433, 'Weibo', 424, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431270),
(7278, 15, 1, 2130706433, 'ForumPost', 29, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431285),
(7279, 13, 1, 2130706433, 'Weibo', 425, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431285),
(7280, 15, 1, 2130706433, 'ForumPost', 30, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431298),
(7281, 13, 1, 2130706433, 'Weibo', 426, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431298),
(7282, 15, 1, 2130706433, 'ForumPost', 31, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431314),
(7283, 13, 1, 2130706433, 'Weibo', 427, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431314),
(7284, 15, 1, 2130706433, 'ForumPost', 32, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431356),
(7285, 13, 1, 2130706433, 'Weibo', 428, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431356),
(7286, 15, 1, 2130706433, 'ForumPost', 33, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431372),
(7287, 13, 1, 2130706433, 'Weibo', 429, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431372),
(7288, 15, 1, 2130706433, 'ForumPost', 34, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431398),
(7289, 13, 1, 2130706433, 'Weibo', 430, '操作url：/index.php?s=/forum/index/doedit.html', 1, 1420431398),
(7290, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-05 17:03登录了后台', 1, 1420448602),
(7291, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-05 17:03登录了后台', 1, 1420448604),
(7292, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-05 17:03登录了后台', 1, 1420448607),
(7293, 16, 1, 2130706433, 'ForumPostReply', 1, '操作url：/index.php?s=/forum/index/doreply/post_id/29.html', 1, 1420467916),
(7294, 16, 1, 2130706433, 'ForumPostReply', 2, '操作url：/index.php?s=/forum/index/doreply/post_id/29.html', 1, 1420467931),
(7295, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-05 23:21登录了后台', 1, 1420471318),
(7296, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-05 23:23登录了后台', 1, 1420471423),
(7297, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-05 23:23登录了后台', 1, 1420471431),
(7298, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-05 23:25登录了后台', 1, 1420471526),
(7299, 13, 58, 2130706433, 'Weibo', 431, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420471538),
(7300, 16, 58, 2130706433, 'ForumPostReply', 3, '操作url：/index.php?s=/forum/index/doreply/post_id/32.html', 1, 1420473005),
(7301, 16, 58, 2130706433, 'ForumPostReply', 4, '操作url：/index.php?s=/forum/index/doreply/post_id/32.html', 1, 1420473347),
(7302, 16, 58, 2130706433, 'ForumPostReply', 5, '操作url：/index.php?s=/forum/index/doreply/post_id/32.html', 1, 1420473359),
(7303, 16, 58, 2130706433, 'ForumPostReply', 6, '操作url：/index.php?s=/forum/index/doreply/post_id/32.html', 1, 1420476168),
(7304, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:36登录了后台', 1, 1420540598),
(7305, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:36登录了后台', 1, 1420540599),
(7306, 13, 58, 2130706433, 'Weibo', 432, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541492),
(7307, 13, 58, 2130706433, 'Weibo', 433, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541502),
(7308, 13, 58, 2130706433, 'Weibo', 434, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541515),
(7309, 13, 58, 2130706433, 'Weibo', 435, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541532),
(7310, 13, 58, 2130706433, 'Weibo', 436, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541544),
(7311, 13, 58, 2130706433, 'Weibo', 437, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541559),
(7312, 13, 58, 2130706433, 'Weibo', 438, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541573),
(7313, 13, 58, 2130706433, 'Weibo', 439, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541592),
(7314, 13, 58, 2130706433, 'Weibo', 440, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420541602),
(7315, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:54登录了后台', 1, 1420541654),
(7316, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:54登录了后台', 1, 1420541666),
(7317, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:55登录了后台', 1, 1420541737),
(7318, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:56登录了后台', 1, 1420541790),
(7319, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 18:56登录了后台', 1, 1420541812),
(7320, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:10登录了后台', 1, 1420546248),
(7321, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:10登录了后台', 1, 1420546255),
(7322, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:11登录了后台', 1, 1420546272),
(7323, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:15登录了后台', 1, 1420546526),
(7324, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:15登录了后台', 1, 1420546533),
(7325, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:15登录了后台', 1, 1420546538),
(7326, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:15登录了后台', 1, 1420546546),
(7327, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:16登录了后台', 1, 1420546572),
(7328, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:16登录了后台', 1, 1420546578),
(7329, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:16登录了后台', 1, 1420546587),
(7330, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:17登录了后台', 1, 1420546629),
(7331, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:30登录了后台', 1, 1420547433),
(7332, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:38登录了后台', 1, 1420547891),
(7333, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:38登录了后台', 1, 1420547894),
(7334, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:38登录了后台', 1, 1420547903),
(7335, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:38登录了后台', 1, 1420547937),
(7336, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-06 20:38登录了后台', 1, 1420547937),
(7337, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-06 20:39登录了后台', 1, 1420547948),
(7338, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-06 20:39登录了后台', 1, 1420547958),
(7339, 13, 1, 2130706433, 'Weibo', 441, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552596),
(7340, 13, 1, 2130706433, 'Weibo', 442, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552606),
(7341, 13, 1, 2130706433, 'Weibo', 443, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552616),
(7342, 13, 1, 2130706433, 'Weibo', 444, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552627),
(7343, 13, 1, 2130706433, 'Weibo', 445, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552637),
(7344, 13, 1, 2130706433, 'Weibo', 446, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552647),
(7345, 13, 1, 2130706433, 'Weibo', 447, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552659),
(7346, 13, 1, 2130706433, 'Weibo', 448, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552673),
(7347, 13, 1, 2130706433, 'Weibo', 449, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420552827),
(7348, 13, 1, 2130706433, 'Weibo', 450, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420558685),
(7349, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-07 11:49登录了后台', 1, 1420602553),
(7350, 13, 1, 2130706433, 'Weibo', 451, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420602575),
(7351, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-07 12:32登录了后台', 1, 1420605154),
(7352, 11, 1, 2130706433, 'category', 42, '操作url：/index.php?s=/admin/category/remove/id/42.html', 1, 1420605176),
(7353, 11, 1, 2130706433, 'category', 2, '操作url：/index.php?s=/admin/category/remove/id/2.html', 1, 1420605183),
(7354, 11, 1, 2130706433, 'category', 41, '操作url：/index.php?s=/admin/category/remove/id/41.html', 1, 1420605190),
(7355, 11, 1, 2130706433, 'category', 40, '操作url：/index.php?s=/admin/category/remove/id/40.html', 1, 1420605192),
(7356, 11, 1, 2130706433, 'category', 1, '操作url：/index.php?s=/admin/category/edit.html', 1, 1420605200),
(7357, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/admin/category/add.html', 1, 1420605221),
(7358, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/admin/category/add.html', 1, 1420605235),
(7359, 11, 1, 2130706433, 'category', 1, '操作url：/index.php?s=/admin/category/edit.html', 1, 1420605313),
(7360, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/admin/category/add.html', 1, 1420605328),
(7361, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/admin/category/edit.html', 1, 1420605346),
(7362, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/admin/category/edit.html', 1, 1420605355),
(7363, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/admin/category/edit.html', 1, 1420605375),
(7364, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/admin/category/add.html', 1, 1420613966),
(7365, 8, 1, 2130706433, 'attribute', 34, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1420641669),
(7366, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-08 22:59登录了后台', 1, 1420729199),
(7367, 14, 1, 2130706433, 'WeiboComment', 14, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420729224),
(7368, 14, 1, 2130706433, 'WeiboComment', 15, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420729334),
(7369, 14, 1, 2130706433, 'WeiboComment', 16, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1420729468),
(7370, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-09 15:25登录了后台', 1, 1420788303),
(7371, 1, 59, -1062717439, 'member', 59, 'love在2015-01-09 16:39登录了后台', 1, 1420792759),
(7372, 13, 59, -1062717439, 'Weibo', 452, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1420792891),
(7373, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-09 16:59登录了后台', 1, 1420793970),
(7374, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-09 17:04登录了后台', 1, 1420794274),
(7375, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 18:48登录了后台', 1, 1420800500),
(7376, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 18:52登录了后台', 1, 1420800727),
(7377, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 18:54登录了后台', 1, 1420800880),
(7378, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 19:24登录了后台', 1, 1420802692),
(7379, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 19:32登录了后台', 1, 1420803169),
(7380, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 19:34登录了后台', 1, 1420803288),
(7381, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 19:36登录了后台', 1, 1420803388),
(7382, 1, 1, -1442928124, 'member', 1, 'admin在2015-01-09 19:40登录了后台', 1, 1420803652),
(7383, 1, 60, 2130706433, 'member', 60, 'qwer在2015-01-09 20:28登录了后台', 1, 1420806509),
(7384, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-01-09 22:23登录了后台', 1, 1420813407),
(7385, 1, 61, 2130706433, 'member', 61, 'eeqwer在2015-01-09 22:46登录了后台', 1, 1420814775),
(7386, 1, 62, -1062731676, 'member', 62, 'ghj在2015-01-09 22:48登录了后台', 1, 1420814908),
(7387, 1, 63, -1062731676, 'member', 63, 'haha在2015-01-09 22:52登录了后台', 1, 1420815120),
(7388, 1, 58, -1062731673, 'member', 58, '蔚蓝在2015-01-09 22:55登录了后台', 1, 1420815301),
(7389, 1, 58, -1062731673, 'member', 58, '蔚蓝在2015-01-09 22:55登录了后台', 1, 1420815303),
(7390, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-09 22:55登录了后台', 1, 1420815347),
(7391, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-10 14:11登录了后台', 1, 1420870291),
(7392, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-10 14:11登录了后台', 1, 1420870298),
(7393, 7, 1, 2130706433, 'model', 4, '操作url：/index.php?s=/admin/model/update.html', 1, 1420870548),
(7394, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1420870940),
(7395, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1420871164),
(7396, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1420871175),
(7397, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1420871212),
(7398, 8, 1, 2130706433, 'attribute', 38, '操作url：/index.php?s=/admin/attribute/remove/id/38.html', 1, 1420872072),
(7399, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-11 22:08登录了后台', 1, 1420985334),
(7400, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-11 22:09登录了后台', 1, 1420985341),
(7401, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-15 21:56登录了后台', 1, 1421330187),
(7402, 13, 1, 2130706433, 'Weibo', 453, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1421330349),
(7403, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-16 13:11登录了后台', 1, 1421385115),
(7404, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-16 13:14登录了后台', 1, 1421385288),
(7405, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-30 14:14登录了后台', 1, 1422598450),
(7406, 1, 1, 2130706433, 'member', 1, 'admin在2015-01-30 14:14登录了后台', 1, 1422598462),
(7407, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/admin/category/edit.html', 1, 1422598506),
(7408, 11, 1, 2130706433, 'category', 45, '操作url：/index.php?s=/admin/category/edit.html', 1, 1422598513),
(7409, 11, 1, 2130706433, 'category', 46, '操作url：/index.php?s=/admin/category/edit.html', 1, 1422598522),
(7410, 11, 1, 2130706433, 'category', 47, '操作url：/index.php?s=/admin/category/edit.html', 1, 1422598533),
(7411, 11, 1, 2130706433, 'category', 49, '操作url：/index.php?s=/admin/category/add.html', 1, 1422598548),
(7412, 11, 1, 2130706433, 'category', 50, '操作url：/index.php?s=/admin/category/add.html', 1, 1422598566),
(7413, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422605578),
(7414, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422605677),
(7415, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422605743),
(7416, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422605802),
(7417, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422605858),
(7418, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1422606027),
(7419, 8, 1, 2130706433, 'attribute', 39, '操作url：/index.php?s=/admin/attribute/remove/id/39.html', 1, 1422606327),
(7420, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:09登录了后台', 1, 1422860949),
(7421, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:09登录了后台', 1, 1422860952),
(7422, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:10登录了后台', 1, 1422861013),
(7423, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:10登录了后台', 1, 1422861013),
(7424, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:19登录了后台', 1, 1422861592),
(7425, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:21登录了后台', 1, 1422861665),
(7426, 13, 1, 2130706433, 'Weibo', 454, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1422861686),
(7427, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:28登录了后台', 1, 1422862131),
(7428, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 15:40登录了后台', 1, 1422862840),
(7429, 1, 64, -1062731500, 'member', 64, '吴锐在2015-02-02 16:12登录了后台', 1, 1422864724),
(7430, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:40登录了后台', 1, 1422866415),
(7431, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:40登录了后台', 1, 1422866455),
(7432, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:43登录了后台', 1, 1422866625),
(7433, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:45登录了后台', 1, 1422866714),
(7434, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:45登录了后台', 1, 1422866754),
(7435, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:47登录了后台', 1, 1422866834),
(7436, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:48登录了后台', 1, 1422866884),
(7437, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-02 16:57登录了后台', 1, 1422867432),
(7438, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-02 17:00登录了后台', 1, 1422867642),
(7439, 13, 1, 2130706433, 'Weibo', 455, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1422869714),
(7440, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-07 17:31登录了后台', 1, 1423301518),
(7441, 13, 1, 2130706433, 'Weibo', 456, '操作url：/index.php?s=/weibo/index/appDoSend/content/12312/1231', 1, 1423304647),
(7442, 13, 1, 2130706433, 'Weibo', 457, '操作url：/index.php?s=/weibo/index/appDoSend/content/12312/1231', 1, 1423304668),
(7443, 13, 1, 2130706433, 'Weibo', 458, '操作url：/index.php?s=/weibo/index/appDoSend/content/12312/1231', 1, 1423304718),
(7444, 1, 58, -1062731512, 'member', 58, '蔚蓝在2015-02-10 14:29登录了后台', 1, 1423549758),
(7445, 1, 58, -1062731512, 'member', 58, '蔚蓝在2015-02-10 14:58登录了后台', 1, 1423551536),
(7446, 1, 58, -1062731512, 'member', 58, '蔚蓝在2015-02-10 15:11登录了后台', 1, 1423552285),
(7447, 1, 58, -1062731512, 'member', 58, '蔚蓝在2015-02-10 16:39登录了后台', 1, 1423557551),
(7448, 1, 58, -1062731512, 'member', 58, '蔚蓝在2015-02-10 16:54登录了后台', 1, 1423558460),
(7449, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-10 21:06登录了后台', 1, 1423573565),
(7450, 13, 58, 2130706433, 'Weibo', 459, '操作url：/index.php?s=/weibo/index/appDoSend/content/iloveyou', 1, 1423573571),
(7451, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-10 21:13登录了后台', 1, 1423574016),
(7452, 1, 58, -1062731509, 'member', 58, '蔚蓝在2015-02-10 21:51登录了后台', 1, 1423576312),
(7453, 1, 58, -1062731509, 'member', 58, '蔚蓝在2015-02-10 22:15登录了后台', 1, 1423577731),
(7454, 13, 58, -1062731509, 'Weibo', 460, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423577740),
(7455, 13, 58, -1062731509, 'Weibo', 461, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423578315),
(7456, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-12 21:33登录了后台', 1, 1423748008),
(7457, 13, 58, -1407507711, 'Weibo', 462, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423748011),
(7458, 13, 58, -1407507711, 'Weibo', 463, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423748029),
(7459, 13, 58, -1407507711, 'Weibo', 464, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423748076),
(7460, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-12 21:54登录了后台', 1, 1423749295),
(7461, 13, 58, 2130706433, 'Weibo', 465, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1423749318),
(7462, 1, 64, 2130706433, 'member', 64, '吴锐在2015-02-12 22:07登录了后台', 1, 1423750032),
(7463, 13, 64, 2130706433, 'Weibo', 466, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1423750040),
(7464, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-12 23:15登录了后台', 1, 1423754118),
(7465, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-12 23:17登录了后台', 1, 1423754256),
(7466, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 00:22登录了后台', 1, 1423758159),
(7467, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 00:49登录了后台', 1, 1423759755),
(7468, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 00:52登录了后台', 1, 1423759920),
(7469, 13, 58, -1407507711, 'Weibo', 467, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423760108),
(7470, 13, 58, -1407507711, 'Weibo', 468, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423760169),
(7471, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 11:41登录了后台', 1, 1423798906),
(7472, 13, 1, -1407507711, 'Weibo', 469, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423799338),
(7473, 13, 1, -1407507711, 'Weibo', 470, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423799417),
(7474, 13, 1, -1407507711, 'Weibo', 471, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423799653),
(7475, 13, 1, -1407507711, 'Weibo', 472, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423799677),
(7476, 13, 1, -1407507711, 'Weibo', 473, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423799699),
(7477, 1, 1, -1407507711, 'member', 1, 'admin在2015-02-13 12:08登录了后台', 1, 1423800481),
(7478, 13, 1, -1407507711, 'Weibo', 474, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423800494),
(7479, 13, 1, -1407507711, 'Weibo', 475, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423801161),
(7480, 13, 1, -1407507711, 'Weibo', 476, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423801172),
(7481, 13, 1, -1407507711, 'Weibo', 477, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423801182),
(7482, 13, 1, -1407507711, 'Weibo', 478, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423801423),
(7483, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 13:21登录了后台', 1, 1423804914),
(7484, 13, 1, -1407507711, 'Weibo', 479, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423804997),
(7485, 1, 1, -1407507711, 'member', 1, 'admin在2015-02-13 13:23登录了后台', 1, 1423805035),
(7486, 13, 1, -1407507711, 'Weibo', 480, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423805042),
(7487, 1, 58, -1407507711, 'member', 58, '蔚蓝在2015-02-13 16:48登录了后台', 1, 1423817299),
(7488, 13, 1, -1407507711, 'Weibo', 481, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423817395),
(7489, 13, 1, -1407507711, 'Weibo', 482, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423818618),
(7490, 13, 1, -1407507711, 'Weibo', 483, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423835840),
(7491, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-14 16:07登录了后台', 1, 1423901265),
(7492, 13, 1, -1062717339, 'Weibo', 484, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423901268),
(7493, 1, 59, -1062717339, 'member', 59, 'love在2015-02-14 17:12登录了后台', 1, 1423905152),
(7494, 13, 1, -1062717339, 'Weibo', 485, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423905167),
(7495, 13, 1, -1062717339, 'Weibo', 486, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423916723),
(7496, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-14 20:38登录了后台', 1, 1423917495),
(7497, 1, 59, -1062717339, 'member', 59, 'love在2015-02-14 21:11登录了后台', 1, 1423919477),
(7498, 13, 1, -1062717339, 'Weibo', 487, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423920644),
(7499, 13, 1, -1062717339, 'Weibo', 488, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423934201),
(7500, 1, 59, -1062717339, 'member', 59, 'love在2015-02-15 11:51登录了后台', 1, 1423972313),
(7501, 13, 1, -1062717339, 'Weibo', 489, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423972672),
(7502, 13, 1, -1062717339, 'Weibo', 490, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1423974423),
(7503, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-15 14:18登录了后台', 1, 1423981103),
(7504, 13, 58, 2130706433, 'Weibo', 491, '操作url：/index.php?s=/weibo/index/dosend.html', 1, 1423981148),
(7505, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-15 16:21登录了后台', 1, 1423988502),
(7506, 1, 1, -1062717339, 'member', 1, 'admin在2015-02-15 16:39登录了后台', 1, 1423989578),
(7507, 1, 1, -1062717339, 'member', 1, 'admin在2015-02-15 16:40登录了后台', 1, 1423989631),
(7508, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-16 23:42登录了后台', 1, 1424101375),
(7509, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-17 15:28登录了后台', 1, 1424158081),
(7510, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-17 19:42登录了后台', 1, 1424173370),
(7511, 13, 1, -1062717339, 'Weibo', 492, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424173377),
(7512, 1, 65, -1062717339, 'member', 65, 'qw1在2015-02-17 21:35登录了后台', 1, 1424180131),
(7513, 1, 59, -1062717339, 'member', 59, 'love在2015-02-23 02:01登录了后台', 1, 1424628119),
(7514, 13, 1, -1062717339, 'Weibo', 493, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424699031),
(7515, 13, 1, -1062717339, 'Weibo', 494, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424699524),
(7516, 13, 1, -1062717339, 'Weibo', 495, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424699739),
(7517, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 00:29登录了后台', 1, 1424708964),
(7518, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 00:31登录了后台', 1, 1424709086),
(7519, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 00:38登录了后台', 1, 1424709487),
(7520, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 00:38登录了后台', 1, 1424709531),
(7521, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 00:41登录了后台', 1, 1424709682),
(7522, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-24 00:43登录了后台', 1, 1424709838),
(7523, 1, 58, 2130706433, 'member', 58, '蔚蓝在2015-02-24 00:51登录了后台', 1, 1424710281),
(7524, 14, 58, 2130706433, 'WeiboComment', 17, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1424710297),
(7525, 14, 58, 2130706433, 'WeiboComment', 18, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1424710316),
(7526, 14, 58, 2130706433, 'WeiboComment', 19, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1424710368),
(7527, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 00:53登录了后台', 1, 1424710393),
(7528, 14, 1, 2130706433, 'WeiboComment', 20, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1424710407),
(7529, 14, 1, 2130706433, 'WeiboComment', 21, '操作url：/index.php?s=/weibo/index/docomment.html', 1, 1424710422),
(7530, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 10:56登录了后台', 1, 1424746591),
(7531, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 10:56登录了后台', 1, 1424746593),
(7532, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 10:56登录了后台', 1, 1424746599),
(7533, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 11:32登录了后台', 1, 1424748745),
(7534, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 11:32登录了后台', 1, 1424748764),
(7535, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 11:51登录了后台', 1, 1424749882),
(7536, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-24 11:51登录了后台', 1, 1424749882),
(7537, 1, 1, -1062717339, 'member', 1, 'admin在2015-02-24 14:03登录了后台', 1, 1424757808),
(7538, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-24 14:04登录了后台', 1, 1424757845),
(7539, 1, 59, -1062717339, 'member', 59, 'love在2015-02-24 14:05登录了后台', 1, 1424757920),
(7540, 13, 1, -1062717339, 'Weibo', 496, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424758028),
(7541, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-24 14:20登录了后台', 1, 1424758853),
(7542, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-24 14:31登录了后台', 1, 1424759494),
(7543, 1, 1, -1062717339, 'member', 1, 'admin在2015-02-24 14:33登录了后台', 1, 1424759616),
(7544, 14, 1, 2130706433, 'WeiboComment', 22, '操作url：/index.php?s=/weibo/index/appDoComment/token/Zfiorz0wAQpdWB7SFqHbvK6TsM1YN89GnPxlt3IE/weibo_id/403/content/hehehehehhehehehe', 1, 1424764698),
(7545, 13, 1, -1062717339, 'Weibo', 497, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424765772),
(7546, 13, 1, -1062717339, 'Weibo', 498, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424765906),
(7547, 14, 0, -1062717339, 'WeiboComment', 23, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424766304),
(7548, 14, 0, -1062717339, 'WeiboComment', 24, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424766400),
(7549, 14, 0, -1062717339, 'WeiboComment', 25, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424768252),
(7550, 14, 0, -1062717339, 'WeiboComment', 26, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424768740),
(7551, 14, 0, -1062717339, 'WeiboComment', 27, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424769012),
(7552, 14, 0, -1062717339, 'WeiboComment', 28, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424769249),
(7553, 14, 0, -1062717339, 'WeiboComment', 29, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424772154),
(7554, 14, 0, -1062717339, 'WeiboComment', 30, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424772287),
(7555, 14, 0, -1062717339, 'WeiboComment', 31, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424773645),
(7556, 14, 0, -1062717339, 'WeiboComment', 32, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424773663),
(7557, 14, 0, -1062717339, 'WeiboComment', 33, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424773692),
(7558, 14, 0, -1062717339, 'WeiboComment', 34, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424776927),
(7559, 14, 0, -1062717339, 'WeiboComment', 35, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424776996),
(7560, 13, 1, -1062717339, 'Weibo', 499, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424777006),
(7561, 1, 58, -1062717339, 'member', 58, '蔚蓝在2015-02-24 19:59登录了后台', 1, 1424779158),
(7562, 14, 0, -1062717339, 'WeiboComment', 36, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424779300),
(7563, 13, 1, -1062717339, 'Weibo', 500, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424845570),
(7564, 13, 1, -1062717339, 'Weibo', 501, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424845655),
(7565, 1, 58, -1062731507, 'member', 58, '蔚蓝在2015-02-25 14:55登录了后台', 1, 1424847318),
(7566, 1, 58, -1062731500, 'member', 58, '蔚蓝在2015-02-25 15:24登录了后台', 1, 1424849050),
(7567, 13, 1, -1062731500, 'Weibo', 502, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424849057),
(7568, 13, 1, -1062731500, 'Weibo', 503, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424849119),
(7569, 13, 1, -1062731500, 'Weibo', 504, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424849393),
(7570, 13, 1, -1062731500, 'Weibo', 505, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424849523),
(7571, 1, 59, -1062731507, 'member', 59, 'love在2015-02-25 15:34登录了后台', 1, 1424849659),
(7572, 13, 1, -1062731507, 'Weibo', 506, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424849708),
(7573, 14, 0, -1062731507, 'WeiboComment', 37, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424849748),
(7574, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-25 15:37登录了后台', 1, 1424849857),
(7575, 13, 1, -1062731500, 'Weibo', 507, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424850890),
(7576, 13, 1, -1062731500, 'Weibo', 508, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424852789),
(7577, 14, 0, -1062731507, 'WeiboComment', 38, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424855436),
(7578, 1, 66, -1062731507, 'member', 66, 'blue在2015-02-25 17:31登录了后台', 1, 1424856677),
(7579, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-25 18:13登录了后台', 1, 1424859213),
(7580, 1, 67, -1062731500, 'member', 67, 'superuser在2015-02-25 18:32登录了后台', 1, 1424860373),
(7581, 1, 68, -1062731500, 'member', 68, 'skype在2015-02-25 18:36登录了后台', 1, 1424860608),
(7582, 1, 68, -1062731500, 'member', 68, 'skype在2015-02-25 18:37登录了后台', 1, 1424860626),
(7583, 13, 1, -1062731500, 'Weibo', 509, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424860635),
(7584, 1, 69, -1062731507, 'member', 69, '会飞的猪在2015-02-25 20:05登录了后台', 1, 1424865909),
(7585, 1, 58, -1062729112, 'member', 58, '蔚蓝在2015-02-25 20:38登录了后台', 1, 1424867902),
(7586, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/admin/category/edit.html', 1, 1424868640),
(7587, 1, 58, -1062729112, 'member', 58, '蔚蓝在2015-02-25 22:47登录了后台', 1, 1424875629),
(7588, 11, 1, 2130706433, 'category', 48, '操作url：/index.php?s=/admin/category/edit.html', 1, 1424882100),
(7589, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-26 15:12登录了后台', 1, 1424934760),
(7590, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-26 15:13登录了后台', 1, 1424934821),
(7591, 1, 58, -1062729113, 'member', 58, '蔚蓝在2015-02-26 16:06登录了后台', 1, 1424937995),
(7592, 14, 0, -1062729113, 'WeiboComment', 1, '操作url：/index.php?s=/weibo/index/appDoComment', 1, 1424940967),
(7593, 1, 58, -1062729112, 'member', 58, '蔚蓝在2015-02-26 21:00登录了后台', 1, 1424955606),
(7594, 13, 1, -1062729112, 'Weibo', 510, '操作url：/index.php?s=/weibo/index/appDoSend', 1, 1424955618),
(7595, 1, 70, 0, 'member', 70, 'kkkk在2015-03-26 15:41登录了后台', 1, 1427355707),
(7596, 1, 1, 0, 'member', 1, 'admin在2015-03-26 15:42登录了后台', 1, 1427355758),
(7597, 1, 1, 0, 'member', 1, 'admin在2015-03-26 15:42登录了后台', 1, 1427355774),
(7598, 10, 1, 0, 'Menu', 2256, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427355886),
(7599, 10, 1, 0, 'Menu', 93, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356311),
(7600, 10, 1, 0, 'Menu', 0, '操作url：/v/index.php?s=/admin/menu/del/id/93.html', 1, 1427356346),
(7601, 10, 1, 0, 'Menu', 2247, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356405),
(7602, 10, 1, 0, 'Menu', 2253, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356586),
(7603, 10, 1, 0, 'Menu', 2248, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356621),
(7604, 10, 1, 0, 'Menu', 2249, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356642),
(7605, 10, 1, 0, 'Menu', 2255, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356678),
(7606, 10, 1, 0, 'Menu', 2254, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356696),
(7607, 10, 1, 0, 'Menu', 2252, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356715),
(7608, 10, 1, 0, 'Menu', 2259, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356730),
(7609, 10, 1, 0, 'Menu', 2250, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356743),
(7610, 10, 1, 0, 'Menu', 2246, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356768),
(7611, 10, 1, 0, 'Menu', 2251, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356784),
(7612, 10, 1, 0, 'Menu', 2257, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356804),
(7613, 10, 1, 0, 'Menu', 2258, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356823),
(7614, 10, 1, 0, 'Menu', 2248, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356911),
(7615, 10, 1, 0, 'Menu', 2249, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356923),
(7616, 10, 1, 0, 'Menu', 2251, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356938),
(7617, 10, 1, 0, 'Menu', 2257, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356945),
(7618, 10, 1, 0, 'Menu', 2258, '操作url：/v/index.php?s=/admin/menu/edit.html', 1, 1427356955),
(7619, 11, 1, 0, 'category', 1, '操作url：/v/index.php?s=/admin/category/edit.html', 1, 1427386811),
(7620, 11, 1, 0, 'category', 1, '操作url：/v/index.php?s=/admin/category/edit.html', 1, 1427386881),
(7621, 1, 70, 0, 'member', 70, 'kkkk在2015-03-27 01:48登录了后台', 1, 1427392121),
(7622, 15, 70, 0, 'ForumPost', 35, '操作url：/v/index.php?s=/forum/index/doedit.html', 1, 1427392190),
(7623, 13, 70, 0, 'Weibo', 511, '操作url：/v/index.php?s=/forum/index/doedit.html', 1, 1427392190),
(7624, 1, 70, -1062731671, 'member', 70, 'kkkk在2015-03-27 02:12登录了后台', 1, 1427393522),
(7625, 13, 1, -1062731671, 'Weibo', 512, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427393545),
(7626, 14, 0, -1062731671, 'WeiboComment', 2, '操作url：/v/index.php?s=/weibo/index/appDoComment', 1, 1427433484),
(7627, 1, 70, 0, 'member', 70, 'kkkk在2015-03-27 13:37登录了后台', 1, 1427434636),
(7628, 1, 70, 0, 'member', 70, 'kkkk在2015-03-27 13:45登录了后台', 1, 1427435118),
(7629, 1, 70, -1062731417, 'member', 70, 'kkkk在2015-03-27 20:21登录了后台', 1, 1427458890),
(7630, 13, 1, -1062731417, 'Weibo', 513, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427458928),
(7631, 14, 0, -1062731417, 'WeiboComment', 3, '操作url：/v/index.php?s=/weibo/index/appDoComment', 1, 1427458961),
(7632, 14, 0, -1062731417, 'WeiboComment', 4, '操作url：/v/index.php?s=/weibo/index/appDoComment', 1, 1427458968),
(7633, 13, 1, -1062731417, 'Weibo', 514, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427462505),
(7634, 13, 70, 0, 'Weibo', 515, '操作url：/v/index.php?s=/weibo/index/dosend.html', 1, 1427462983),
(7635, 1, 70, 0, 'member', 70, 'kkkk在2015-03-28 18:25登录了后台', 1, 1427538348),
(7636, 13, 70, 0, 'Weibo', 516, '操作url：/v/index.php?s=/weibo/index/dosend.html', 1, 1427544596),
(7637, 13, 1, -1062731417, 'Weibo', 517, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427545341),
(7638, 13, 1, -1062731417, 'Weibo', 518, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427545378),
(7639, 1, 70, 0, 'member', 70, 'kkkk在2015-03-28 21:57登录了后台', 1, 1427551076),
(7640, 13, 70, 0, 'Weibo', 519, '操作url：/v/index.php?s=/weibo/index/dosend.html', 1, 1427551180),
(7641, 13, 1, -1062731417, 'Weibo', 520, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427552738),
(7642, 13, 1, -1062731417, 'Weibo', 521, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427552885),
(7643, 13, 1, -1062731417, 'Weibo', 522, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427552977),
(7644, 13, 1, -1062731417, 'Weibo', 523, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427553068),
(7645, 13, 1, -1062731417, 'Weibo', 524, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427553151),
(7646, 13, 1, -1062731417, 'Weibo', 525, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427553245),
(7647, 13, 1, -1062731417, 'Weibo', 526, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427553354),
(7648, 13, 1, -1062731417, 'Weibo', 527, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427553410),
(7649, 13, 1, -1062731417, 'Weibo', 528, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427554567),
(7650, 13, 1, -1062731417, 'Weibo', 529, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427554628),
(7651, 13, 1, -1062731417, 'Weibo', 530, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427554684),
(7652, 13, 1, -1062731417, 'Weibo', 531, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427554763),
(7653, 13, 1, -1062731417, 'Weibo', 532, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427600385),
(7654, 14, 0, -1062731417, 'WeiboComment', 5, '操作url：/v/index.php?s=/weibo/index/appDoComment', 1, 1427601206),
(7655, 1, 70, 0, 'member', 70, 'kkkk在2015-03-29 14:51登录了后台', 1, 1427611900),
(7656, 1, 1, 0, 'member', 1, 'admin在2015-03-29 14:52登录了后台', 1, 1427611922),
(7657, 13, 1, -1062731417, 'Weibo', 533, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427614194),
(7658, 13, 1, -1062731417, 'Weibo', 534, '操作url：/v/index.php?s=/weibo/index/appDoSend', 1, 1427614614),
(7659, 1, 1, 0, 'member', 1, 'admin在2015-04-07 22:00登录了后台', 1, 1428415248),
(7660, 1, 1, 0, 'member', 1, 'admin在2015-04-07 22:23登录了后台', 1, 1428416618),
(7661, 11, 1, 0, 'category', 51, '操作url：/v/index.php?s=/admin/category/add.html', 1, 1428416686),
(7662, 1, 71, -1062731405, 'member', 71, '小宏在2015-04-08 11:08登录了后台', 1, 1428462535),
(7663, 1, 71, -1062731405, 'member', 71, '小宏在2015-04-08 11:09登录了后台', 1, 1428462552);
INSERT INTO `sml_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(7664, 1, 1, 0, 'member', 1, 'admin在2015-04-09 21:51登录了后台', 1, 1428587483),
(7665, 1, 1, 0, 'member', 1, 'admin在2015-04-09 21:51登录了后台', 1, 1428587493),
(7666, 7, 1, 0, 'model', 5, '操作url：/v/index.php?s=/admin/model/update.html', 1, 1428590580),
(7667, 7, 1, 0, 'model', 6, '操作url：/v/index.php?s=/admin/model/update.html', 1, 1428590679),
(7668, 1, 70, -1062731405, 'member', 70, 'kkkk在2015-04-10 20:04登录了后台', 1, 1428667490),
(7669, 1, 70, -1062731405, 'member', 70, 'kkkk在2015-04-10 20:37登录了后台', 1, 1428669420),
(7670, 1, 1, 0, 'member', 1, 'admin在2015-04-12 20:36登录了后台', 1, 1428842193);

-- --------------------------------------------------------

--
-- 表的结构 `sml_addons`
--

CREATE TABLE IF NOT EXISTS `sml_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `sml_addons`
--

INSERT INTO `sml_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(89, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"ThinkOX\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1409038881, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(16, 'Avatar', '头像插件', '用于头像的上传', 1, '{"random":"1"}', 'caipeichao', '0.1', 1394449710, 1),
(49, 'Checkin', '签到', '签到积分', 1, '{"random":"1"}', '想天软件工作室', '0.1', 1403764341, 1),
(58, 'SyncLogin', '同步登陆', '同步登陆', 1, '{"type":null,"meta":"","bind":"0","QqKEY":"","QqSecret":"","SinaKEY":"","SinaSecret":""}', 'xjw129xjt', '0.1', 1406598876, 0),
(41, 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', 1, '{"can_guest_comment":"1"}', 'caipeichao', '0.1', 1399440324, 0),
(44, 'InsertImage', '插入图片', '微博上传图片', 1, 'null', '想天软件工作室', '0.1', 1402390777, 0),
(48, 'Repost', '转发', '转发', 1, 'null', '想天软件工作室', '0.1', 1403763025, 0),
(63, 'Advertising', '广告位置', '广告位插件', 1, 'null', 'onep2p', '0.1', 1406689090, 1),
(64, 'Advs', '广告管理', '广告插件', 1, 'null', 'onep2p', '0.1', 1406689131, 1),
(68, 'ImageSlider', '图片轮播', '图片轮播，需要先通过 http://www.onethink.cn/topic/2153.html 的方法，让配置支持多图片上传', 1, '{"second":"3000","direction":"horizontal","imgWidth":"760","imgHeight":"350","url":"","images":"110,111,112"}', 'birdy', '0.1', 1407144129, 0),
(70, 'SuperLinks', '合作单位', '合作单位', 1, '{"random":"1"}', '苏南 newsn.net', '0.1', 1407156572, 1),
(91, 'Rank_checkin', '签到排名', '设置每天某一时刻开始 按时间先后 签到排名，取前十', 1, '{"random":"1","ranktime":null}', '嘉兴想天信息科技有限公司', '0.1', 1409109841, 1),
(84, 'Support', '赞', '赞的功能', 1, 'null', '嘉兴想天信息科技有限公司', '0.1', 1408499141, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_advertising`
--

CREATE TABLE IF NOT EXISTS `sml_advertising` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置展示方式  0为默认展示一张',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `pos` varchar(50) NOT NULL,
  `s` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sml_advertising`
--

INSERT INTO `sml_advertising` (`id`, `title`, `type`, `width`, `height`, `status`, `pos`, `s`) VALUES
(1, '微博发布框下方', 2, '620', '87', 1, 'weibo_below_sendbox', 0),
(2, '微博首页签到排行下方', 4, '', '', 1, 'weibo_below_checkrank', 0),
(3, '首页1号广告位', 1, '756', '100', 1, 'home_ad1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_advs`
--

CREATE TABLE IF NOT EXISTS `sml_advs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `position` int(11) NOT NULL COMMENT '广告位置',
  `advspic` int(11) NOT NULL COMMENT '图片地址',
  `advstext` text NOT NULL COMMENT '文字广告内容',
  `advshtml` text NOT NULL COMMENT '代码广告内容',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表' AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_attachment`
--

CREATE TABLE IF NOT EXISTS `sml_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_attribute`
--

CREATE TABLE IF NOT EXISTS `sml_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `sml_attribute`
--

INSERT INTO `sml_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(33, 'zx', '附件', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 2, 0, 1, 1395988634, 1395988634, '', 3, '', 'regex', '', 3, 'function'),
(34, 'source', '来源', 'varchar(255) NOT NULL', 'string', '原创', '文章来源，例如：腾讯网', 1, 'string', 1, 0, 1, 1420641669, 1420641669, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `sml_auth_extend`
--

CREATE TABLE IF NOT EXISTS `sml_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `sml_auth_extend`
--

INSERT INTO `sml_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1),
(5, 1, 1),
(5, 45, 1),
(5, 46, 1),
(5, 47, 1),
(5, 48, 1),
(5, 49, 1),
(5, 50, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_auth_group`
--

CREATE TABLE IF NOT EXISTS `sml_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `sml_auth_group`
--

INSERT INTO `sml_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '普通用户', '', 1, ',292,293'),
(5, 'admin', 1, '超级管理员', '拥有所有权限', 1, ',1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,195,205,206,207,208,209,210,211,212,213,214,215,216,224,225,226,228,229,230,231,232,233,234,235,236,237,238,239,241,242,243,245,246,249,250,253,254,255,256,257,258,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,297,298,299,292,293,294,295,296'),
(6, 'admin', 1, '社团用户组', '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sml_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `sml_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sml_auth_group_access`
--

INSERT INTO `sml_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(1, 3),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(66, 5),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sml_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=351 ;

--
-- 转存表中的数据 `sml_auth_rule`
--

INSERT INTO `sml_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '资讯', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/Forum/forum', '板块管理', 1, ''),
(218, 'admin', 1, 'Admin/Forum/post', '帖子管理', 1, ''),
(219, 'admin', 1, 'Admin/Forum/editForum', '编辑／创建板块', 1, ''),
(220, 'admin', 1, 'Admin/Forum/editPost', '编辑帖子', 1, ''),
(221, 'admin', 2, 'Admin//Admin/Forum/index', '讨论区', -1, ''),
(222, 'admin', 2, 'Admin//Admin/Weibo/index', '微博', -1, ''),
(223, 'admin', 1, 'Admin/Forum/sortForum', '排序', 1, ''),
(224, 'admin', 1, 'Admin/SEO/editRule', '新增、编辑', 1, ''),
(225, 'admin', 1, 'Admin/SEO/sortRule', '排序', 1, ''),
(226, 'admin', 1, 'Admin/SEO/index', '规则管理', 1, ''),
(227, 'admin', 1, 'Admin/Forum/editReply', '新增/编辑回复', 1, ''),
(228, 'admin', 1, 'Admin/Weibo/editComment', '编辑回复', 1, ''),
(229, 'admin', 1, 'Admin/Weibo/editWeibo', '编辑微博', 1, ''),
(230, 'admin', 1, 'Admin/SEO/ruleTrash', '规则回收站', 1, ''),
(231, 'admin', 1, 'Admin/Rank/userList', '查看用户', 1, ''),
(232, 'admin', 1, 'Admin/Rank/userRankList', '用户头衔列表', 1, ''),
(233, 'admin', 1, 'Admin/Rank/userAddRank', '关联新头衔', 1, ''),
(234, 'admin', 1, 'Admin/Rank/userChangeRank', '编辑头衔关联', 1, ''),
(235, 'admin', 1, 'Admin/Issue/add', '编辑专辑', 1, ''),
(236, 'admin', 1, 'Admin/Issue/issue', '专辑管理', 1, ''),
(237, 'admin', 1, 'Admin/Issue/operate', '专辑操作', 1, ''),
(238, 'admin', 1, 'Admin/Weibo/weibo', '微博管理', 1, ''),
(239, 'admin', 1, 'Admin/Rank/index', '头衔列表', 1, ''),
(240, 'admin', 1, 'Admin/Forum/forumTrash', '板块回收站', 1, ''),
(241, 'admin', 1, 'Admin/Weibo/weiboTrash', '微博回收站', 1, ''),
(242, 'admin', 1, 'Admin/Rank/editRank', '添加头衔', 1, ''),
(243, 'admin', 1, 'Admin/Weibo/comment', '回复管理', 1, ''),
(244, 'admin', 1, 'Admin/Forum/postTrash', '帖子回收站', 1, ''),
(245, 'admin', 1, 'Admin/Weibo/commentTrash', '回复回收站', 1, ''),
(246, 'admin', 1, 'Admin/Issue/issueTrash', '专辑回收站', 1, ''),
(247, 'admin', 1, 'Admin//Admin/Forum/reply', '回复管理', 1, ''),
(248, 'admin', 1, 'Admin/Forum/replyTrash', '回复回收站', 1, ''),
(249, 'admin', 2, 'Admin/Forum/index', '论坛', 1, ''),
(250, 'admin', 2, 'Admin/Weibo/weibo', '微博', 1, ''),
(251, 'admin', 2, 'Admin/SEO/index', 'SEO', -1, ''),
(252, 'admin', 2, 'Admin/Rank/index', '头衔', -1, ''),
(253, 'admin', 2, 'Admin/Issue/issue', '专辑', 1, ''),
(254, 'admin', 1, 'Admin/Issue/contents', '内容管理', 1, ''),
(255, 'admin', 1, 'Admin/User/profile', '扩展资料', 1, ''),
(256, 'admin', 1, 'Admin/User/editProfile', '添加、编辑分组', 1, ''),
(257, 'admin', 1, 'Admin/User/sortProfile', '分组排序', 1, ''),
(258, 'admin', 1, 'Admin/User/field', '字段列表', 1, ''),
(259, 'admin', 1, 'Admin/User/editFieldSetting', '添加、编辑字段', 1, ''),
(260, 'admin', 1, 'Admin/User/sortField', '字段排序', 1, ''),
(261, 'admin', 1, 'Admin/Update/quick', '全部补丁', 1, ''),
(262, 'admin', 1, 'Admin/Update/addpack', '新增补丁', 1, ''),
(263, 'admin', 1, 'Admin/User/expandinfo_select', '用户扩展资料列表', 1, ''),
(264, 'admin', 1, 'Admin/User/expandinfo_details', '扩展资料详情', 1, ''),
(265, 'admin', 1, 'Admin/Shop/shopLog', '商城信息记录', 1, ''),
(266, 'admin', 1, 'Admin/Shop/setStatus', '商品分类状态设置', 1, ''),
(267, 'admin', 1, 'Admin/Shop/setGoodsStatus', '商品状态设置', 1, ''),
(268, 'admin', 1, 'Admin/Shop/operate', '商品分类操作', 1, ''),
(269, 'admin', 1, 'Admin/Shop/add', '商品分类添加', 1, ''),
(270, 'admin', 1, 'Admin/Shop/goodsEdit', '添加、编辑商品', 1, ''),
(271, 'admin', 1, 'Admin/Shop/hotSellConfig', '热销商品阀值配置', 1, ''),
(272, 'admin', 1, 'Admin/Shop/setNew', '设置新品', 1, ''),
(273, 'admin', 1, 'Admin/EventType/index', '活动分类管理', 1, ''),
(274, 'admin', 1, 'Admin/Event/event', '内容管理', 1, ''),
(275, 'admin', 1, 'Admin/EventType/eventTypeTrash', '活动分类回收站', 1, ''),
(276, 'admin', 1, 'Admin/Event/verify', '内容审核', 1, ''),
(277, 'admin', 1, 'Admin/Event/contentTrash', '内容回收站', 1, ''),
(278, 'admin', 1, 'Admin/Rank/rankVerify', '待审核用户头衔', 1, ''),
(279, 'admin', 1, 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', 1, ''),
(280, 'admin', 1, 'Admin/Weibo/config', '微博设置', 1, ''),
(281, 'admin', 1, 'Admin/Issue/verify', '内容审核', 1, ''),
(282, 'admin', 1, 'Admin/Shop/goodsList', '商品列表', 1, ''),
(283, 'admin', 1, 'Admin/Shop/shopCategory', '商品分类配置', 1, ''),
(284, 'admin', 1, 'Admin/Shop/categoryTrash', '商品分类回收站', 1, ''),
(285, 'admin', 1, 'Admin/Shop/verify', '待发货交易', 1, ''),
(286, 'admin', 1, 'Admin/Issue/contentTrash', '内容回收站', 1, ''),
(287, 'admin', 1, 'Admin/Shop/goodsBuySuccess', '交易成功记录', 1, ''),
(288, 'admin', 1, 'Admin/Shop/goodsTrash', '商品回收站', 1, ''),
(289, 'admin', 1, 'Admin/Shop/toxMoneyConfig', '货币配置', 1, ''),
(290, 'admin', 2, 'Admin/Shop/shopCategory', '商城', 1, ''),
(291, 'admin', 2, 'Admin/EventType/index', '活动', 1, ''),
(292, 'Weibo', 1, 'sendWeibo', '发微博', 1, ''),
(293, 'Weibo', 1, 'deleteWeibo', '删除微博', 1, ''),
(294, 'Weibo', 1, 'setWeiboTop', '微博置顶', 1, ''),
(295, 'Weibo', 1, 'beTopicAdmin', '抢先成为话题主持人', 1, ''),
(296, 'Weibo', 1, 'manageTopic', '管理话题', 1, ''),
(297, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, ''),
(298, 'Issue', 1, 'addIssueContent', '专辑投稿权限', 1, ''),
(299, 'Issue', 1, 'editIssueContent', '编辑专辑内容（管理）', 1, ''),
(300, 'admin', 2, 'Admin/Forum/editReply', '新增/编辑回复', -1, ''),
(301, 'admin', 2, 'Admin/Forum/sortForum', '排序', -1, ''),
(302, 'admin', 2, 'Admin/Forum/editPost', '编辑帖子', -1, ''),
(303, 'admin', 2, 'Admin/Forum/editForum', '编辑／创建板块', -1, ''),
(304, 'admin', 1, 'Admin/Issue/config', '专辑设置', 1, ''),
(305, 'admin', 1, 'Admin/Event/config', '活动设置', 1, ''),
(306, 'admin', 1, 'Admin/User/config', '基础设置', 1, ''),
(307, 'admin', 1, 'admin/group/group', '群组管理', 1, ''),
(308, 'admin', 1, 'Admin/group/groupType', '分类管理', 1, ''),
(309, 'admin', 1, 'Admin/group/postType', '文章分类', 1, ''),
(310, 'admin', 1, 'Admin/group/editPostCate', '修改分类', 1, ''),
(311, 'admin', 1, 'Admin/group/sortPostCate', '类型排序', 1, ''),
(312, 'admin', 1, 'Admin/group/editGroupType', '修改群组分类', 1, ''),
(313, 'admin', 1, 'Admin/group/sortGroupType', '群组类型排序', 1, ''),
(314, 'admin', 1, 'Admin/group/editLzlReply', '编辑楼中楼回复', 1, ''),
(315, 'admin', 1, 'Admin/group/lzlreply', '楼中楼回复', 1, ''),
(316, 'admin', 1, 'Admin/group/lzlreplyTrash', '楼中楼回复回收站', 1, ''),
(317, 'admin', 1, 'Admin/group/editReply', '编辑回复', 1, ''),
(318, 'admin', 1, 'Admin/group/groupTrash', '群组回收站', 1, ''),
(319, 'admin', 1, 'Admin/group/post', '文章管理', 1, ''),
(320, 'admin', 1, 'Admin/group/postTrash', '文章回收站', 1, ''),
(321, 'admin', 1, 'Admin/group/reply', '回复管理', 1, ''),
(322, 'admin', 1, 'Admin/group/replyTrash', '回复回收站', 1, ''),
(323, 'admin', 1, 'Admin/group/config', '群组设置', 1, ''),
(324, 'admin', 1, 'Admin/group/unverify', '未审核群组', 1, ''),
(325, 'admin', 1, 'Admin/module/lists', '模块管理', 1, ''),
(326, 'admin', 1, 'Admin/module/uninstall', '卸载模块', 1, ''),
(327, 'admin', 1, 'Admin/module/install', '模块安装', 1, ''),
(328, 'admin', 1, 'Admin/AuthManager/addNode', '新增权限节点', 1, ''),
(329, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, ''),
(330, 'admin', 1, 'Admin/User/changeGroup', '转移用户组', 1, ''),
(331, 'admin', 1, 'Admin/AuthManager/deleteNode', '删除权限节点', 1, ''),
(332, 'admin', 1, 'admin/expression/expressionList', '表情列表', 1, ''),
(333, 'admin', 1, 'Admin/adimn/expression/add', '新增表情包', 1, ''),
(334, 'admin', 2, 'Admin/Forum/addType', '新增/编辑分类', -1, ''),
(335, 'admin', 2, 'Admin/Forum/setTypeStatus', '设置分类状态', -1, ''),
(336, 'admin', 2, 'Admin/Forum/type', '分类管理', -1, ''),
(337, 'admin', 2, 'Admin/Forum/forum', '板块管理', -1, ''),
(338, 'admin', 2, 'Admin/Forum/forumTrash', '板块回收站', -1, ''),
(339, 'admin', 2, 'Admin/Forum/post', '帖子管理', -1, ''),
(340, 'admin', 2, 'Admin/Forum/postTrash', '帖子回收站', -1, ''),
(341, 'admin', 2, 'Admin/Forum/replyTrash', '回复回收站', -1, ''),
(342, 'admin', 2, 'Admin/Forum/reply', '回复管理', -1, ''),
(343, 'admin', 2, 'Admin/Forum/config', '论坛设置', -1, ''),
(344, 'admin', 2, 'admin/group/index', '群组', 1, ''),
(345, 'admin', 1, 'admin/expression/index', '表情管理', 1, ''),
(346, 'admin', 1, 'Admin/Forum/addType', '新增/编辑分类', 1, ''),
(347, 'admin', 1, 'Admin/Forum/setTypeStatus', '设置分类状态', 1, ''),
(348, 'admin', 1, 'Admin/Forum/type', '分类管理', 1, ''),
(349, 'admin', 1, 'Admin/Forum/reply', '回复管理', 1, ''),
(350, 'admin', 1, 'Admin/Forum/config', '论坛设置', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sml_avatar`
--

CREATE TABLE IF NOT EXISTS `sml_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sml_avatar`
--

INSERT INTO `sml_avatar` (`id`, `uid`, `path`, `create_time`, `status`, `is_temp`) VALUES
(2, 58, '2014-12-30/54a2516195588-0dc71c62.png', 1419923818, 1, 0),
(3, 59, '2015-01-09/54af93ecefab2.png', 1420792812, 1, 1),
(5, 60, '2015-01-09/54afc9899773e-ba0df45f.jpg', 1420806541, 1, 0),
(7, 1, '2015-01-16/54b89e1661238-73502702.jpg', 1421385244, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_category`
--

CREATE TABLE IF NOT EXISTS `sml_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `sml_category`
--

INSERT INTO `sml_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'blog', '默认', 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1427386881, 0, 0),
(48, 'notification', '学在长大', 0, 0, 10, '', '', '', '', '', '', '', '2', '', 0, 1, 1, 1, 0, '', '', 1420613966, 1424882100, 1, 0),
(45, 'news', '精彩社团', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1420605221, 1422598513, 1, 0),
(46, 'read', '高校就业', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1420605235, 1422598522, 1, 0),
(47, 'activity', '轻松一刻', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1420605328, 1422598533, 1, 0),
(49, 'love', '恋爱掌门', 0, 0, 10, '', '', '', '', '', '', '', '', '', 0, 1, 1, 1, 0, '', '', 1422598548, 1422598548, 1, 0),
(50, 'city', '社会百态', 0, 0, 10, '', '', '', '', '', '', '', '', '', 0, 1, 1, 1, 0, '', '', 1422598566, 1422598566, 1, 0),
(51, 'notice', '系统公告', 0, 0, 10, '', '', '', '', '', '', '', '2', '3', 0, 1, 1, 1, 0, '', '', 1428416686, 1428416686, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_channel`
--

CREATE TABLE IF NOT EXISTS `sml_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `sml_channel`
--

INSERT INTO `sml_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `color`, `band_color`, `band_text`) VALUES
(1, 0, '首页', 'Weibo/Index/index', 1, 1379475111, 1401628204, 1, 0, '', '', ''),
(2, 0, '论坛', 'Forum/Index/index', 2, 1379475131, 1409662841, 1, 0, '', '', ''),
(4, 0, '专辑', 'Issue/Index/index', 123, 1399022492, 1406255246, 1, 0, '', '', ''),
(5, 0, '会员', 'People/Index/index', 5, 1399784340, 1406256451, 1, 0, '', '', ''),
(11, 0, '商城', 'Shop/Index/index', 5, 1403056971, 1403085891, 1, 0, '', '', ''),
(14, 0, '资讯', 'blog/index/index', 4, 1406084715, 1406084910, 1, 0, '', '', ''),
(13, 0, '活动', '/Event/index', 3, 1403797042, 1403797164, 1, 0, '', '', ''),
(15, 0, '群组', 'group/index/index', 5, 1410771228, 1410771228, 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `sml_check_info`
--

CREATE TABLE IF NOT EXISTS `sml_check_info` (
  `uid` int(11) DEFAULT NULL,
  `con_num` int(11) DEFAULT '1',
  `total_num` int(11) DEFAULT '1',
  `ctime` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sml_check_info`
--

INSERT INTO `sml_check_info` (`uid`, `con_num`, `total_num`, `ctime`) VALUES
(1, 1, 1, 1419925902),
(1, 2, 2, 1420015778),
(1, 1, 3, 1420215907),
(58, 1, 1, 1420471362),
(1, 1, 4, 1420685514),
(59, 1, 1, 1420792908),
(58, 1, 2, 1423917502);

-- --------------------------------------------------------

--
-- 表的结构 `sml_config`
--

CREATE TABLE IF NOT EXISTS `sml_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- 转存表中的数据 `sml_config`
--

INSERT INTO `sml_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 8),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '湖北省荆州市长江大学', 12),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 11),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 14),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:Amazu', '后台颜色风格', 1379122533, 1409279514, 1, 'amaze', 2),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', 15),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 10),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 9),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 24),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 12),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 16),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 22),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 25),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 26),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 4),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 27),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 7),
(38, 'WEB_SITE', 1, '网站名称', 1, '', '用于邮件,短信,站内信显示', 1388332311, 1388501500, 1, '安安网', 3),
(39, 'MAIL_TYPE', 4, '邮件类型', 5, '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', 1388332882, 1388931416, 1, '1', 0),
(40, 'MAIL_SMTP_HOST', 1, 'SMTP 服务器', 5, '', 'SMTP服务器', 1388332932, 1388332932, 1, '', 0),
(41, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '默认25', 1388332975, 1388332975, 1, '25', 0),
(42, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '填写完整用户名', 1388333010, 1388333010, 1, '', 0),
(43, 'MAIL_SMTP_PASS', 6, 'SMTP服务器密码', 5, '', '填写您的密码', 1388333057, 1389187088, 1, '', 0),
(50, 'MAIL_USER_PASS', 5, '密码找回模板', 0, '', '支持HTML代码', 1388583989, 1388672614, 1, '密码找回111223333555111', 0),
(51, 'PIC_FILE_PATH', 1, '图片文件保存根目录', 4, '', '图片文件保存根目录./目录/', 1388673255, 1388673255, 1, './Uploads/', 0),
(46, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '填写测试邮件地址', 1388334529, 1388584028, 1, '', 11),
(47, 'MAIL_USER_REG', 5, '注册邮件模板', 3, '', '支持HTML代码', 1388337307, 1389532335, 1, '<a href="http://3spp.cn" target="_blank">点击进入</a><span style="color:#E53333;">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', 55),
(52, 'USER_NAME_BAOLIU', 1, '保留用户名', 3, '', '禁止注册用户名,用" , "号隔开', 1388845937, 1388845937, 1, '管理员,测试,admin,垃圾', 0),
(53, 'USER_REG_TIME', 0, '注册时间限制', 3, '', '同一IP注册时间限制，防恶意注册，格式分钟', 1388847715, 1388847715, 1, '2', 0),
(48, 'VERIFY_OPEN', 4, '验证码配置', 4, '0:全部关闭\r\n1:全部显示\r\n2:注册显示\r\n3:登陆显示', '验证码配置', 1388500332, 1405561711, 1, '2', 0),
(49, 'VERIFY_TYPE', 4, '验证码类型', 4, '1:中文\r\n2:英文\r\n3:数字\r\n4:算数', '验证码类型', 1388500873, 1405561731, 1, '1', 0),
(54, 'NO_BODY_TLE', 2, '空白说明', 2, '', '空白说明', 1392216444, 1392981305, 1, '呵呵，暂时没有内容哦！！', 0),
(55, 'USER_RESPASS', 5, '密码找回模板', 3, '', '密码找回文本', 1396191234, 1396191234, 1, '<span style="color:#009900;">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', 0),
(56, 'COUNT_CODE', 2, '统计代码', 1, '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', 1403058890, 1403058890, 1, '', 4),
(57, 'SHARE_WEIBO_ID', 0, '分享来源微博ID', 1, '', '来源的微博ID，不配置则隐藏顶部微博分享按钮。', 1403091490, 1403091490, 1, '', 5),
(60, 'AFTER_LOGIN_JUMP_URL', 2, '登陆后跳转的Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法', 1407145718, 1407154887, 1, 'weibo/index/index', 7),
(58, 'USER_REG_WEIBO_CONTENT', 1, '用户注册微博提示内容', 3, '', '留空则表示不发新微博，支持face', 1404965285, 1404965445, 1, '', 0),
(59, 'WEIBO_WORDS_COUNT', 0, '微博字数限制', 1, '', '最大允许的微博字数长度', 1405330568, 1405330622, 1, '200', 6),
(61, 'FOOTER_RIGHT', 2, '底部右侧链接部分', 1, '', '链接部分', 1408008354, 1408008354, 1, '  <p><h4><strong>联系</strong></h4></p>\r\n                    <p><a href="http://www.anan.com/index.php?s=/home/index/about.html" target="_blank">关于我们</a>\r\n                    <p>\r\n                    ', 10),
(62, 'FOOTER_SUMMARY', 2, '底部简介部分代码', 1, '', '', 1408008496, 1408008496, 1, '', 9),
(63, 'FOOTER_TITLE', 2, '底部介绍标题', 1, '', '公司标题', 1408008573, 1408008573, 1, '<a target="_blank" href="http://www.anan.com/">长大在线</a>', 8),
(64, 'FOOTER_QCODE', 2, '底部二维码部分代码', 1, '', '', 1408008644, 1408008738, 1, ' <img src="/Public/Core/images/erweima.png"/>', 11),
(78, '_WEIBO_SHOW_TITLE', 0, '', 0, '', '', 1409670239, 1409670239, 1, '1', 0),
(75, '_WEIBO_SHOWTITLE', 0, '', 0, '', '', 1409670094, 1409670094, 1, '0', 0),
(80, '_FORUM_LIMIT_IMAGE', 0, '', 0, '', '', 1409711730, 1409711730, 1, '1', 0),
(82, '_ISSUE_NEED_VERIFY', 0, '', 0, '', '', 1409712596, 1409712596, 1, '0', 0),
(84, '_USER_LEVEL', 0, '', 0, '', '', 1409880649, 1409880649, 1, '0:Lv1 实习\r\n50:Lv2 试用\r\n100:Lv3 转正\r\n200:Lv4 助理\r\n400:Lv 5 经理\r\n800:Lv6 董事\r\n1600:Lv7 董事长', 0),
(85, '_EXPRESSION_EXPRESSION', 0, '', 0, '', '', 1417150390, 1417150390, 1, 'miniblog', 0),
(86, 'DEFUALT_HOME_URL', 1, '默认首页Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', 1417509438, 1417509501, 1, 'Weibo/index/index', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_document`
--

CREATE TABLE IF NOT EXISTS `sml_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `source` varchar(255) NOT NULL DEFAULT '原创' COMMENT '来源',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=181 ;

--
-- 转存表中的数据 `sml_document`
--

INSERT INTO `sml_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`, `source`) VALUES
(180, 1, '', '啊实打实大苏打', 45, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1428590696, 1428590696, 1, '原创'),
(179, 1, '', '欢迎使用长大校园通', 51, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 1428416717, 1428416717, 1, '原创'),
(178, 1, '', '【早安】距离2015年英语专业四级考试只剩19天...', 48, '', 0, 0, 2, 2, 7, 0, 188, 1, 0, 0, 12, 0, 0, 0, 1427612520, 1427612578, 1, '原创'),
(177, 1, '', '【最美的风景不在远方，而在身旁】', 48, '', 0, 0, 2, 2, 0, 0, 187, 1, 0, 0, 19, 0, 0, 0, 1427612079, 1427612079, 1, '在线QQ空间'),
(169, 1, '', '长大微校新版发布啦，小伙伴们快来围观', 48, '', 0, 0, 2, 2, 0, 0, 135, 1, 0, 0, 0, 0, 0, 0, 1424880626, 1424880626, 3, '原创'),
(176, 1, '', '【晚安心语】当你成功的时候，你说的所有话都是真理。', 48, '', 0, 0, 2, 2, 0, 0, 141, 1, 0, 0, 29, 0, 0, 0, 1427387418, 1427387418, 1, '原创'),
(175, 1, '', '【晚安心语】当你成功的时候，你说的所有话都是真理。', 48, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1427387360, 1427387360, 3, '原创'),
(174, 1, '', '我永远相信只要永不放弃，我们还是有机会的', 48, '', 0, 0, 2, 2, 0, 0, 140, 1, 0, 0, 20, 0, 0, 0, 1427387040, 1427387196, 1, 'QQ空间'),
(173, 1, '', '太科幻 用脑电波也能控制无人机', 47, '', 0, 0, 2, 2, 0, 0, 138, 1, 0, 0, 0, 0, 0, 0, 1424937202, 1424937202, 3, '腾讯网');

-- --------------------------------------------------------

--
-- 表的结构 `sml_document_article`
--

CREATE TABLE IF NOT EXISTS `sml_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `zx` int(10) unsigned NOT NULL COMMENT '附近',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `sml_document_article`
--

INSERT INTO `sml_document_article` (`id`, `parse`, `content`, `template`, `bookmark`, `zx`) VALUES
(21, 0, '<p>\r\n  全新的界面，带给你全新的感受\r\n</p>\r\n<p>\r\n <img src="/Uploads/Editor/2015-01-07/54acd33ba5f65.png" alt="" />\r\n</p>', '', 0, 0),
(179, 0, '欢迎使用长大校园通', '', 0, 0),
(180, 0, '阿斯顿阿斯顿阿斯顿阿斯顿阿三da', '', 0, 0),
(178, 0, '<p>\r\n <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">【早安】距离2015年英语专业四级考试只剩19天，距离2015年6月大学英语四六级考试只剩75天，距2015高考还有70天，距2016高考还有436天。距离2015年司法考试只剩173天，距离2016年研究生考试只剩271天。别让这8个遗憾伴随你一生~</span> \r\n</p>\r\n<p>\r\n <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a34427913.jpg" alt="" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a353c0d32.jpg" alt="" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a35facced.jpg" alt="" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a36eac3f7.jpg" alt="" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a37c115af.jpg" alt="" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a38cbb614.jpg" alt="" /><br />\r\n</span> \r\n</p>', '', 0, 0),
(169, 0, '', '', 0, 0),
(174, 0, '<div class="f-info" style="margin:-5px 0px 0px;padding:0px 10px 8px;font-size:14px;color:#293233;font-family:punctuation, 微软雅黑;background-color:#FFFFFF;">\r\n  我永远相信只要永不放弃，我们还是有机会的。最后，我们还是坚信一点，这世界上只要有梦想，只要不断努力，只要不断学习，不管你长得如何，不管是这样，还是那样，男人的长相往往和他的的才华成反比。今天很残酷，明天更残酷，后天很美好，但绝对大部分是死在明天晚上，所以每个人不要放弃今天。\r\n</div>\r\n<div class="qz_summary wupfeed" id="hex_319265902_311_0_1427384308_0_1" style="margin:0px;padding:0px;color:#293233;font-family:punctuation, 微软雅黑;background-color:#FFFFFF;">\r\n  <div class="f-ct " style="margin:0px 10px;padding:0px;">\r\n    <div class="f-ct-txtimg " style="margin:0px;padding:0px;">\r\n      <div class="txt-box " style="margin:-5px 0px 6px;padding:0px;font-size:14px;">\r\n      </div>\r\n      <div class="img-box" style="margin:0px 0px 10px;padding:0px;">\r\n        <img src="/v/Uploads/Editor/2015-03-27/5514333a5e08f.jpg" alt="" /><br />\r\n     </div>\r\n    </div>\r\n  </div>\r\n</div>', '', 0, 0),
(175, 0, '', '', 0, 0),
(176, 0, '<p>\r\n <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">【晚安心语】当你成功的时候，你说的所有话都是真理。</span>\r\n</p>\r\n<p>\r\n <img src="/v/Uploads/Editor/2015-03-27/55143408377bf.jpg" alt="" />\r\n</p>', '', 0, 0),
(177, 0, '<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">住在一间安静优美的小屋，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">在鸟鸣中起床，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">推窗有花香铺面而来。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">早餐过后，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">在阳光温暖的抚摸里，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">我们骑车踏青或光脚奔跑。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">累了，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">我们就躺在绿草的清凉中，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">看天空湛蓝如洗。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">入夜，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">我们一起数繁星点点，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">聊我们的心事和青春。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">遥望星空，此时，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">风景不在远方，而在身旁。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">只闻花香，不谈悲喜；</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">记得随时带上自己的阳光。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">想起彩虹，美丽极致，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">分享传播幸福。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">真正的平静，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">不是避开车马喧嚣，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">而是在心中呵护一朵花开。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">闲看花开，静待花落。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">冷暖自知，干净如始。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">幸福就是有花有草，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">心中充满爱意！</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">等老了，和心爱的人一起，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">找一个小镇，安静的住下，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">早上在巷口看日出，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">晚上相依相偎看夕阳。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">每天早上睁开眼睛，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">看到暖暖的阳光和温柔的笑容，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">这就是我想要的未来。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">愿有一屋，不求华丽；</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">不被打扰，幸福终老。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">推开窗，就能闻到风中树叶和蔷薇的清香。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">愿你的窗台，繁花盛开。</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">都市的繁华，小山村的宁静，各有各的美好！</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">曾经真的梦想过有这样的一座大大的城堡，</span><br />\r\n<span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">和亲友聚在一起聊兴趣，谈人生。</span><br />\r\n<p>\r\n  <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;">愿你也可以找到身旁属于你的风景</span>\r\n</p>\r\n<p>\r\n <span style="color:#333333;font-family:punctuation, ''Hiragino Sans GB'', ''Helvetica Neue'', 微软雅黑, Tohoma;font-size:14px;line-height:22px;background-color:#FFFFFF;"><img src="/v/Uploads/Editor/2015-03-29/5517a19c123cc.jpg" alt="" /><br />\r\n</span>\r\n</p>', '', 0, 0),
(173, 0, '<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n  <img src="/Uploads/Editor/2015-02-26/54eed0da928e9.png" alt="" />\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n 腾讯科技讯 2月26日，葡萄牙无人机厂商Tekever主导的一个项目Project Brainflight实现了用人脑来控制无人机的飞行。这一项目本周进行了演示，而这一系统未来可以用于控制更大的飞机，例如货运飞机。\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n Project Brainflight使用高性能的脑电波系统去测量大脑的某些部分，随后通过特定的感知算法将大脑信号转换为无人机指令。\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n  Tekever表示，无人机操作者需要佩戴专门的设备以测量大脑活动，而他们只需简单的思考即可完成操控。\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n  操作者需要接受几个月时间的培训，才能熟悉这一系统，从而使用思想去控制计算机屏幕上的一个圆环上下运动，并进而控制无人机的方向。Tekever在一份公告中表示：“从本质上来看，操作者大脑的电流成为了无人机控制系统的输入。”\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n 这是该技术首次公开展示。该公司认为，从短期来看，这将帮助残障人士去控制飞行器。不过，该公司还有着更长远的目标，例如取代货运飞机和客机的飞行员。该公司表示：“未来，如果我们的系统作为一种飞行器控制方式被接受，那么这一项目将有利于整个飞行员社区。”\r\n</p>\r\n<p style="font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;">\r\n  独立航空业咨询师约翰·斯特里克兰（John Strickland）对于这一系统的大规模部署感到怀疑。他表示：“目前对我而言，这一系统还很遥远。一些想法积极的人可能会这样宣传，但如果真的有人这样做，那么我会很惊讶。”（李玮）\r\n</p>', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_document_download`
--

CREATE TABLE IF NOT EXISTS `sml_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `sml_event`
--

CREATE TABLE IF NOT EXISTS `sml_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '发起人',
  `title` varchar(255) NOT NULL COMMENT '活动名称',
  `explain` text NOT NULL COMMENT '详细内容',
  `sTime` int(11) NOT NULL COMMENT '活动开始时间',
  `eTime` int(11) NOT NULL COMMENT '活动结束时间',
  `address` varchar(255) NOT NULL COMMENT '活动地点',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `limitCount` int(11) NOT NULL COMMENT '限制人数',
  `cover_id` int(11) NOT NULL COMMENT '封面ID',
  `deadline` int(11) NOT NULL,
  `attentionCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `signCount` int(11) NOT NULL,
  `is_recommend` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_event_attend`
--

CREATE TABLE IF NOT EXISTS `sml_event_attend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `creat_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0为报名，1为参加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_event_type`
--

CREATE TABLE IF NOT EXISTS `sml_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sml_event_type`
--

INSERT INTO `sml_event_type` (`id`, `title`, `create_time`, `update_time`, `status`, `allow_post`, `pid`, `sort`) VALUES
(1, '慈善活动', 1403859500, 1403859485, 1, 0, 0, 0),
(2, '公益活动', 1403859511, 1403859502, 1, 0, 0, 0),
(3, '', 1428588132, 1428588120, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_field`
--

CREATE TABLE IF NOT EXISTS `sml_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_field_group`
--

CREATE TABLE IF NOT EXISTS `sml_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `sml_field_group`
--

INSERT INTO `sml_field_group` (`id`, `profile_name`, `status`, `createTime`, `sort`, `visiable`) VALUES
(13, '个人资料', 1, 1403847366, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_field_setting`
--

CREATE TABLE IF NOT EXISTS `sml_field_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `sml_field_setting`
--

INSERT INTO `sml_field_setting` (`id`, `field_name`, `profile_group_id`, `visiable`, `required`, `sort`, `form_type`, `form_default_value`, `validation`, `status`, `createTime`, `child_form_type`, `input_tips`) VALUES
(36, 'qq', 13, 1, 1, 0, 'input', '', '', 1, 1409045825, 'string', '');

-- --------------------------------------------------------

--
-- 表的结构 `sml_file`
--

CREATE TABLE IF NOT EXISTS `sml_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_follow`
--

CREATE TABLE IF NOT EXISTS `sml_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='关注表' AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `sml_follow`
--

INSERT INTO `sml_follow` (`id`, `follow_who`, `who_follow`, `create_time`) VALUES
(72, 1, 58, 1419924250),
(73, 59, 1, 1420793039),
(74, 70, 1, 1427358335),
(75, 58, 1, 1427358341),
(76, 69, 1, 1427358344),
(77, 68, 1, 1427358346),
(78, 67, 1, 1427358347),
(79, 66, 1, 1427358348);

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum`
--

CREATE TABLE IF NOT EXISTS `sml_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `allow_user_group` text NOT NULL,
  `sort` int(11) NOT NULL,
  `logo` int(11) NOT NULL,
  `background` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `admin` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `sml_forum`
--

INSERT INTO `sml_forum` (`id`, `title`, `create_time`, `post_count`, `status`, `allow_user_group`, `sort`, `logo`, `background`, `description`, `admin`, `type_id`, `last_reply_time`) VALUES
(1, '默认版块', 1407114174, 13, 1, '1', 0, 0, 0, '', '', 0, 0),
(2, '社团百事', 1419923903, 3, 1, '1', 0, 0, 0, '各种好玩儿，各种新鲜，萌妹子，技术宅。。。', '', 1, 0),
(3, '专业交流', 1420430142, 4, 1, '', 0, 113, 0, '专业交流平台，方便学生们交流专业', '', 1, 1420467931),
(4, '英语沙龙', 1420430214, 1, 1, '', 0, 114, 0, '英语就是四六级，托福雅思GRE', '', 1, 0),
(5, '考研考证', 1420430328, 2, 1, '', 0, 115, 0, '考研考证交流', '', 2, 1420476168),
(6, '长大在线', 1420430368, 1, 1, '1', 0, 116, 0, '官方内容讨论板块', '', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum_bookmark`
--

CREATE TABLE IF NOT EXISTS `sml_forum_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum_lzl_reply`
--

CREATE TABLE IF NOT EXISTS `sml_forum_lzl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum_post`
--

CREATE TABLE IF NOT EXISTS `sml_forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL COMMENT '是否置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `sml_forum_post`
--

INSERT INTO `sml_forum_post` (`id`, `uid`, `forum_id`, `title`, `parse`, `content`, `create_time`, `update_time`, `status`, `last_reply_time`, `view_count`, `reply_count`, `is_top`) VALUES
(22, 58, 1, '新人报道', 0, '<p><br/>这个程序还不错，我喜欢</p>', 1419924149, 1419924149, 1, 1419924149, 3, 0, 0),
(23, 1, 1, '测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431171, 1420431171, 1, 1420431171, 1, 0, 0),
(24, 1, 1, '测试测试测试测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431188, 1420431188, 1, 1420431188, 1, 0, 0),
(25, 1, 2, '测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431233, 1420431233, 1, 1420431233, 3, 0, 0),
(26, 1, 2, '测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431243, 1420431243, 1, 1420431243, 3, 0, 0),
(27, 1, 3, '测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431257, 1420431257, 1, 1420431257, 2, 0, 0),
(28, 1, 4, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431270, 1420431270, 1, 1420431270, 1, 0, 0),
(29, 1, 3, '测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431285, 1420431285, 1, 1420467931, 16, 2, 0),
(30, 1, 3, '测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431298, 1420431298, 1, 1420431298, 1, 0, 0),
(31, 1, 3, '12323123123测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431314, 1420431314, 1, 1420431314, 9, 0, 0),
(32, 1, 5, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span><span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431356, 1420431356, 1, 1420476168, 40, 4, 0),
(33, 1, 6, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', 1420431372, 1420431372, 1, 1420431372, 4, 0, 0),
(34, 1, 5, '测试测试测试测试测试测试测试测试测试测试测试测试测试', 0, '<p><span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试<span style="white-space: normal;">测试</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span><span style="white-space: normal;">测试</span><span style="line-height: 1.428571429;">测试</span></span></p>', 1420431398, 1420431398, 1, 1420431398, 6, 0, 0),
(35, 70, 2, '阿斯顿发射点发射点', 0, '<p><br/><span style="text-decoration:underline;">啊手动阀发生阿斯顿发士大夫阿德发</span></p>', 1427392190, 1427392190, 1, 1427392190, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum_post_reply`
--

CREATE TABLE IF NOT EXISTS `sml_forum_post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `sml_forum_post_reply`
--

INSERT INTO `sml_forum_post_reply` (`id`, `uid`, `post_id`, `parse`, `content`, `create_time`, `update_time`, `status`) VALUES
(1, 1, 29, 0, '<p>1额 安抚爱上发生的阿桑地方十大撒旦法时代发生的阿斯顿阿道夫撒旦法啊沙发上啊爱的色放阿桑地方阿桑地方阿斯顿撒旦法撒旦法撒旦丰富而非违法请问乳房呃呃 如果不是的不是本人他不儿歌额而且邱琦雯</p>', 1420467916, 1420467916, 1),
(2, 1, 29, 0, '<p>2312121234123413241234的方式的说法刚发给你嘎哈那地方怪怪的发大是大非撒手大哥和你度过的撒收到更好的改善啊D沙发电视</p>', 1420467931, 1420467931, 1),
(3, 58, 32, 0, '<p>414134234123412341234124</p>', 1420473005, 1420473005, 1),
(4, 58, 32, 0, '<p>实施规划大发光火个地方</p>', 1420473347, 1420473347, 1),
(5, 58, 32, 0, '<p>11231231231231</p>', 1420473359, 1420473359, 1),
(6, 58, 32, 0, '<p>这个帖子不错！！<img src="http://img.baidu.com/hi/jx2/j_0001.gif" _src="http://img.baidu.com/hi/jx2/j_0001.gif"/>[图片]</p>', 1420476168, 1420476168, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_forum_type`
--

CREATE TABLE IF NOT EXISTS `sml_forum_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='论坛分类表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sml_forum_type`
--

INSERT INTO `sml_forum_type` (`id`, `title`, `status`, `sort`, `pid`) VALUES
(1, '默认分类', 1, 0, 0),
(2, '官方板块', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_group`
--

CREATE TABLE IF NOT EXISTS `sml_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `allow_user_group` text NOT NULL,
  `sort` int(11) NOT NULL,
  `logo` int(11) NOT NULL,
  `background` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '群组类型，0为公共的，1为私有的',
  `activity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_bookmark`
--

CREATE TABLE IF NOT EXISTS `sml_group_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_dynamic`
--

CREATE TABLE IF NOT EXISTS `sml_group_dynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `row_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_lzl_reply`
--

CREATE TABLE IF NOT EXISTS `sml_group_lzl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_member`
--

CREATE TABLE IF NOT EXISTS `sml_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `last_view` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_notice`
--

CREATE TABLE IF NOT EXISTS `sml_group_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_post`
--

CREATE TABLE IF NOT EXISTS `sml_group_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL COMMENT '是否置顶',
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_post_category`
--

CREATE TABLE IF NOT EXISTS `sml_group_post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '所属群组',
  `title` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_post_reply`
--

CREATE TABLE IF NOT EXISTS `sml_group_post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_group_type`
--

CREATE TABLE IF NOT EXISTS `sml_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='群组的分类表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sml_group_type`
--

INSERT INTO `sml_group_type` (`id`, `title`, `status`, `sort`, `create_time`, `pid`) VALUES
(1, '群组默认分类', 1, 0, 1409811696, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_hooks`
--

CREATE TABLE IF NOT EXISTS `sml_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `sml_hooks`
--

INSERT INTO `sml_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, 'ImageSlider'),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'SuperLinks'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment,Avatar'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,SyncLogin,Advertising,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, 'Iswaf'),
(17, 'checkin', '签到', 1, 1395371353, 'Checkin'),
(18, 'Rank', '签到排名钩子', 1, 1395387442, 'Rank_checkin'),
(20, 'support', '赞', 1, 1398264759, 'Support'),
(21, 'localComment', '本地评论插件', 1, 1399440321, 'LocalComment'),
(22, 'weiboType', '微博类型', 1, 1409121894, 'InsertImage'),
(23, 'repost', '转发钩子', 1, 1403668286, 'Repost'),
(24, 'syncLogin', '第三方登陆位置', 1, 1403700579, 'SyncLogin'),
(25, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin'),
(26, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1403841931, 'ChinaCity'),
(27, 'Advs', '广告位插件', 1, 1406687667, 'Advs'),
(28, 'imageSlider', '图片轮播钩子', 1, 1407144022, 'ImageSlider'),
(29, 'friendLink', '友情链接插件', 1, 1407156413, 'SuperLinks'),
(30, 'beforeSendWeibo', '在发微博之前预处理微博', 2, 1408084504, 'InsertFile'),
(31, 'beforeSendRepost', '转发微博前的预处理钩子', 2, 1408085689, ''),
(32, 'parseWeiboContent', '解析微博内容钩子', 2, 1409121261, ''),
(33, 'userConfig', '用户配置页面钩子', 1, 1417137557, 'SyncLogin'),
(34, 'weiboSide', '微博侧边钩子', 1, 1417063425, 'Retopic'),
(35, 'personalMenus', '顶部导航栏个人下拉菜单', 1, 1417146501, ''),
(36, 'dealPicture', '上传图片处理', 2, 1417139975, ''),
(37, 'ucenterSideMenu', '用户中心左侧菜单', 1, 1417161205, '');

-- --------------------------------------------------------

--
-- 表的结构 `sml_issue`
--

CREATE TABLE IF NOT EXISTS `sml_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sml_issue`
--

INSERT INTO `sml_issue` (`id`, `title`, `create_time`, `update_time`, `status`, `allow_post`, `pid`, `sort`) VALUES
(13, '默认一级', 1409712474, 1409712467, 1, 0, 0, 0),
(14, '默认二级', 1409712480, 1409712475, 1, 0, 13, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_issue_content`
--

CREATE TABLE IF NOT EXISTS `sml_issue_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `view_count` int(11) NOT NULL COMMENT '阅读数量',
  `cover_id` int(11) NOT NULL COMMENT '封面图片id',
  `issue_id` int(11) NOT NULL COMMENT '所在专辑',
  `uid` int(11) NOT NULL COMMENT '发布者id',
  `reply_count` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='专辑内容表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sml_issue_content`
--

INSERT INTO `sml_issue_content` (`id`, `title`, `content`, `view_count`, `cover_id`, `issue_id`, `uid`, `reply_count`, `create_time`, `update_time`, `status`, `url`) VALUES
(29, '测试', '<p>啊是发生发射点似的发撒大地方嘎</p>', 2, 139, 14, 1, 0, 1427358515, 1427358580, 1, 'http://bbs.phonegap100.com');

-- --------------------------------------------------------

--
-- 表的结构 `sml_local_comment`
--

CREATE TABLE IF NOT EXISTS `sml_local_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app` text NOT NULL,
  `mod` text NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sml_local_comment`
--

INSERT INTO `sml_local_comment` (`id`, `uid`, `app`, `mod`, `row_id`, `parse`, `content`, `create_time`, `pid`, `status`) VALUES
(1, 58, 'Blog', 'Article', 172, 0, '太棒了[呲牙][呲牙]', 1424938014, 0, 1),
(2, 70, 'Blog', 'Article', 176, 0, '[?][?][??][??][??][??][??][??][??][??][??][??][??]', 1427433393, 0, 1),
(3, 71, 'Blog', 'Article', 174, 0, '哈喽[呲牙]', 1428462635, 0, 1),
(4, 71, 'Blog', 'Article', 177, 0, '不错哈', 1428493847, 0, 1),
(5, 71, 'Blog', 'Article', 176, 0, '[流汗]', 1428494561, 0, 1),
(6, 71, 'Blog', 'Article', 174, 0, '[偷笑][偷笑][大哭][大哭]', 1428494734, 0, 1),
(7, 71, 'Blog', 'Article', 174, 0, '[呲牙][调皮][流汗][流汗][调皮][调皮][流汗][流汗]', 1428494738, 0, 1),
(8, 71, 'Blog', 'Article', 174, 0, '测试测试测试', 1428494747, 0, 1),
(9, 71, 'Blog', 'Article', 174, 0, '测试', 1428494753, 0, 1),
(10, 71, 'Blog', 'Article', 174, 0, '测试', 1428494755, 0, 1),
(11, 70, 'Blog', 'Article', 177, 0, '[偷笑][偷笑]', 1428667499, 0, 1),
(12, 70, 'Blog', 'Article', 178, 0, 'rrtyy', 1428669442, 0, 1),
(13, 70, 'Blog', 'Article', 178, 0, '[嘘][嘘][再见][再见]', 1428669459, 0, 1),
(14, 70, 'Blog', 'Article', 178, 0, '[再见][敲打][敲打][大哭][大哭]', 1428669464, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_member`
--

CREATE TABLE IF NOT EXISTS `sml_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `signature` text NOT NULL,
  `tox_money` int(11) NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `studyid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `name` (`nickname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=72 ;

--
-- 转存表中的数据 `sml_member`
--

INSERT INTO `sml_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `signature`, `tox_money`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `department`, `studyid`) VALUES
(58, '蔚蓝', 0, '0000-00-00', '', 120, 76, 2130706433, 1419923757, 3232238184, 1424955606, 1, '', 16, 0, 0, 0, 0, '', 0),
(59, 'love', 1, '0000-00-00', '', 42, 12, 3232249857, 1420792759, 3232235789, 1424849659, 1, '我就是我是颜色不一样的烟火0', 1, 0, 0, 0, 0, '', 0),
(60, 'qwer', 0, '0000-00-00', '', 10, 1, 2130706433, 1420806509, 2130706433, 1420806509, -1, '', 0, 0, 0, 0, 0, '', 0),
(61, 'eeqwer', 0, '0000-00-00', '', 10, 1, 2130706433, 1420814775, 2130706433, 1420814775, -1, '', 0, 0, 0, 0, 0, '', 0),
(62, 'ghj', 0, '0000-00-00', '', 10, 1, 3232235620, 1420814908, 3232235620, 1420814908, -1, '', 0, 0, 0, 0, 0, '', 0),
(63, 'haha', 0, '0000-00-00', '', 10, 1, 3232235620, 1420815120, 3232235620, 1420815120, -1, '', 0, 0, 0, 0, 0, '', 0),
(64, '吴锐', 0, '0000-00-00', '', 22, 2, 3232235796, 1422864724, 2130706433, 1423750032, -1, '', 1, 0, 0, 0, 0, '', 0),
(65, 'qw1', 0, '0000-00-00', '', 10, 1, 3232249957, 1424180131, 3232249957, 1424180131, -1, '', 0, 0, 0, 0, 0, '', 0),
(66, 'blue', 0, '0000-00-00', '', 10, 1, 3232235789, 1424856677, 3232235789, 1424856677, 1, '', 0, 0, 0, 0, 0, '', 0),
(67, 'superuser', 0, '0000-00-00', '', 10, 1, 3232235796, 1424860373, 3232235796, 1424860373, 1, '', 0, 0, 0, 0, 0, '', 0),
(68, 'skype', 0, '0000-00-00', '', 10, 2, 3232235796, 1424860608, 3232235796, 1424860626, 1, '', 0, 0, 0, 0, 0, '', 0),
(69, '会飞的猪', 0, '0000-00-00', '', 10, 1, 3232235789, 1424865909, 3232235789, 1424865909, 1, '', 0, 0, 0, 0, 0, '', 0),
(70, 'kkkk', 0, '0000-00-00', '', 31, 11, 0, 1427355707, 3232235891, 1428669420, 1, '', 5, 0, 0, 0, 0, '', 0),
(71, '小宏', 0, '0000-00-00', '', 10, 2, 3232235891, 1428462535, 3232235891, 1428462552, 1, '', 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_menu`
--

CREATE TABLE IF NOT EXISTS `sml_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2260 ;

--
-- 转存表中的数据 `sml_menu`
--

INSERT INTO `sml_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '资讯', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 998, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 2, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 9999, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0),
(80, '分类管理', 2, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 20, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0),
(2253, '帖子回收站', 2245, 4, 'Forum/postTrash', 0, '', '帖子', 0),
(123, '微博', 0, 8, 'Weibo/weibo', 0, '', '', 0),
(2252, '板块回收站', 2245, 2, 'Forum/forumTrash', 0, '', '板块', 0),
(2251, '新增/编辑回复', 2245, 0, 'Forum/editReply', 0, '', '论坛', 0),
(2250, '排序', 2245, 0, 'Forum/sortForum', 0, '', '板块', 0),
(130, '新增、编辑', 132, 0, 'SEO/editRule', 0, '', '', 0),
(131, '排序', 132, 0, 'SEO/sortRule', 0, '', '', 0),
(132, '规则管理', 68, 0, 'SEO/index', 0, '', 'SEO规则', 0),
(133, '回复管理', 122, 5, '/Admin/Forum/reply', 0, '', '回复', 0),
(2249, '编辑帖子', 2245, 0, 'Forum/editPost', 0, '', '论坛', 0),
(140, '编辑回复', 138, 0, 'Weibo/editComment', 0, '', '', 0),
(139, '编辑微博', 137, 0, 'Weibo/editWeibo', 0, '', '', 0),
(137, '微博管理', 123, 1, 'Weibo/weibo', 0, '', '微博', 0),
(138, '回复管理', 123, 3, 'Weibo/comment', 0, '', '回复', 0),
(2248, '编辑／创建板块', 2245, 0, 'Forum/editForum', 0, '', '论坛', 0),
(2247, '帖子管理', 2245, 3, 'Forum/post', 0, '', '帖子', 0),
(2246, '板块管理', 2245, 1, 'Forum/forum', 0, '', '板块', 0),
(144, '微博回收站', 123, 2, 'Weibo/weiboTrash', 0, '', '微博', 0),
(145, '回复回收站', 123, 4, 'Weibo/commentTrash', 0, '', '回复', 0),
(146, '规则回收站', 68, 0, 'SEO/ruleTrash', 0, '', 'SEO规则', 0),
(147, '头衔列表', 16, 10, 'Rank/index', 0, '', '头衔管理', 0),
(149, '添加头衔', 16, 2, 'Rank/editRank', 0, '', '头衔管理', 0),
(150, '查看用户', 16, 0, 'Rank/userList', 0, '', '头衔管理', 0),
(151, '用户头衔列表', 150, 0, 'Rank/userRankList', 1, '', '', 0),
(152, '关联新头衔', 150, 0, 'Rank/userAddRank', 1, '', '', 0),
(153, '编辑头衔关联', 150, 0, 'Rank/userChangeRank', 1, '', '', 0),
(154, '专辑', 0, 20, 'Issue/issue', 0, '', '', 0),
(155, '编辑专辑', 154, 0, 'Issue/add', 1, '', '专辑', 0),
(156, '专辑管理', 154, 0, 'Issue/issue', 0, '', '专辑', 0),
(157, '专辑回收站', 154, 4, 'Issue/issueTrash', 0, '', '专辑', 0),
(158, '专辑操作', 154, 0, 'Issue/operate', 1, '', '专辑', 0),
(159, '内容审核', 154, 1, 'Issue/verify', 0, '', '内容管理', 0),
(160, '内容回收站', 154, 5, 'Issue/contentTrash', 0, '', '内容管理', 0),
(161, '内容管理', 154, 0, 'Issue/contents', 0, '', '内容管理', 0),
(162, '扩展资料', 16, 0, 'Admin/User/profile', 0, '', '用户管理', 0),
(163, '添加、编辑分组', 162, 0, 'Admin/User/editProfile', 0, '', '', 0),
(164, '分组排序', 162, 0, 'Admin/User/sortProfile', 0, '', '', 0),
(165, '字段列表', 162, 0, 'Admin/User/field', 0, '', '', 0),
(166, '添加、编辑字段', 165, 0, 'Admin/User/editFieldSetting', 0, '', '', 0),
(167, '字段排序', 165, 0, 'Admin/User/sortField', 0, '', '', 0),
(168, '全部补丁', 68, 0, 'Admin/Update/quick', 0, '', '升级补丁', 0),
(169, '新增补丁', 68, 0, 'Admin/Update/addpack', 0, '', '升级补丁', 0),
(170, '用户扩展资料列表', 16, 0, 'Admin/User/expandinfo_select', 0, '', '用户管理', 0),
(171, '扩展资料详情', 170, 0, 'User/expandinfo_details', 0, '', '', 0),
(185, '商城信息记录', 172, 0, 'Shop/shopLog', 0, '', '商城记录', 0),
(184, '待发货交易', 172, 4, 'Shop/verify', 0, '', '交易管理', 0),
(183, '交易成功记录', 172, 5, 'Shop/goodsBuySuccess', 0, '', '交易管理', 0),
(182, '商品分类状态设置', 176, 0, 'Shop/setStatus', 0, '', '', 0),
(181, '商品状态设置', 174, 0, 'Shop/setGoodsStatus', 0, '', '', 0),
(180, '商品回收站', 172, 7, 'Shop/goodsTrash', 0, '', '商品管理', 0),
(179, '商品分类回收站', 172, 3, 'Shop/categoryTrash', 0, '', '商城配置', 0),
(178, '商品分类操作', 176, 0, 'Shop/operate', 0, '', '', 0),
(176, '商品分类配置', 172, 2, 'Shop/shopCategory', 0, '', '商城配置', 0),
(177, '商品分类添加', 176, 0, 'Shop/add', 0, '', '', 0),
(175, '添加、编辑商品', 174, 0, 'Shop/goodsEdit', 0, '', '', 0),
(174, '商品列表', 172, 1, 'Shop/goodsList', 0, '', '商品管理', 0),
(173, '货币配置', 172, 8, 'Shop/toxMoneyConfig', 0, '', '商城配置', 0),
(172, '商城', 0, 8, 'Shop/shopCategory', 0, '', '', 0),
(186, '热销商品阀值配置', 172, 0, 'Shop/hotSellConfig', 0, '', '商城配置', 0),
(187, '设置新品', 174, 0, 'Shop/setNew', 0, '', '', 0),
(188, '活动', 0, 21, 'EventType/index', 0, '', '', 0),
(189, '活动分类管理', 188, 0, 'EventType/index', 0, '', '活动分类管理', 0),
(190, '内容管理', 188, 0, 'Event/event', 0, '', '内容管理', 0),
(191, '活动分类回收站', 188, 0, 'EventType/eventTypeTrash', 0, '', '活动分类管理', 0),
(192, '内容审核', 188, 0, 'Event/verify', 0, '', '内容管理', 0),
(193, '内容回收站', 188, 0, 'Event/contentTrash', 0, '', '内容管理', 0),
(216, '待审核用户头衔', 16, 0, 'Rank/rankVerify', 0, '', '头衔管理', 0),
(217, '被驳回的头衔申请', 16, 0, 'Rank/rankVerifyFailure', 0, '', '头衔管理', 0),
(218, '微博设置', 123, 0, 'Weibo/config', 0, '微博的基本配置', '设置', 0),
(2245, '论坛', 0, 22, 'Forum/index', 0, '', '', 0),
(220, '专辑设置', 154, 0, 'Issue/config', 0, '', '设置', 0),
(221, '活动设置', 188, 0, 'Event/config', 0, '', '设置', 0),
(222, '基础设置', 16, 0, 'User/config', 0, '', '用户管理', 0),
(2216, '群组', 0, 22, 'admin/group/index', 0, '', '', 0),
(2217, '群组管理', 2216, 0, 'admin/group/group', 0, '', '群组', 0),
(2218, '分类管理', 2216, 0, 'group/groupType', 0, '', '群组', 0),
(2219, '文章分类', 2216, 0, 'group/postType', 0, '', '文章', 0),
(2220, '修改分类', 2216, 0, 'group/editPostCate', 1, '', '文章', 0),
(2221, '类型排序', 2216, 0, 'group/sortPostCate', 1, '', '文章', 0),
(2222, '修改群组分类', 2216, 0, 'group/editGroupType', 1, '', '群组', 0),
(2223, '群组类型排序', 2216, 0, 'group/sortGroupType', 1, '', '群组', 0),
(2224, '编辑楼中楼回复', 2216, 0, 'group/editLzlReply', 1, '', '回复', 0),
(2225, '楼中楼回复', 2216, 0, 'group/lzlreply', 1, '', '回复', 0),
(2226, '楼中楼回复回收站', 2216, 0, 'group/lzlreplyTrash', 1, '', '回复', 0),
(2227, '编辑回复', 2216, 0, 'group/editReply', 1, '', '回复', 0),
(2228, '群组回收站', 2216, 0, 'group/groupTrash', 0, '', '群组', 0),
(2229, '文章管理', 2216, 0, 'group/post', 0, '', '文章', 0),
(2230, '文章回收站', 2216, 0, 'group/postTrash', 0, '', '文章', 0),
(2231, '回复管理', 2216, 0, 'group/reply', 0, '', '回复', 0),
(2232, '回复回收站', 2216, 0, 'group/replyTrash', 0, '', '回复', 0),
(2233, '群组设置', 2216, 0, 'group/config', 0, '', '设置', 0),
(2234, '未审核群组', 2216, 0, 'group/unverify', 0, '', '群组', 0),
(2235, '模块管理', 43, 0, 'module/lists', 0, '', '云平台', 0),
(2236, '卸载模块', 43, 0, 'module/uninstall', 1, '', '云平台', 0),
(2237, '模块安装', 43, 0, 'module/install', 1, '', '云平台', 0),
(2238, '新增权限节点', 27, 0, 'AuthManager/addNode', 1, '', '', 1),
(2239, '前台权限管理', 27, 0, 'AuthManager/accessUser', 1, '', '权限管理', 0),
(2240, '转移用户组', 16, 0, 'User/changeGroup', 1, '批量转移用户组', '', 0),
(2241, '删除权限节点', 27, 0, 'AuthManager/deleteNode', 1, '', '', 0),
(2242, '表情管理', 68, 30, 'admin/expression/index', 0, '', '表情配置', 0),
(2243, '表情列表', 68, 0, 'admin/expression/expressionList', 1, '', '表情配置', 0),
(2244, '新增表情包', 68, 0, 'adimn/expression/add', 1, '', '表情配置', 0),
(2254, '回复回收站', 2245, 6, 'Forum/replyTrash', 0, '', '回复', 0),
(2255, '回复管理', 2245, 6, 'Forum/reply', 0, '', '回复', 0),
(2256, '论坛设置', 2245, 10, 'Forum/config', 0, '', '设置', 0),
(2257, '新增/编辑分类', 2245, 0, 'Forum/addType', 0, '', '论坛', 0),
(2258, '设置分类状态', 2245, 0, 'Forum/setTypeStatus', 0, '', '论坛', 0),
(2259, '分类管理', 2245, 0, 'Forum/type', 0, '分类管理', '分类管理', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_message`
--

CREATE TABLE IF NOT EXISTS `sml_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0系统消息,1用户消息,2应用消息',
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `url` varchar(400) NOT NULL,
  `talk_id` int(11) NOT NULL,
  `appname` varchar(30) NOT NULL,
  `apptype` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `find_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='thinkox新增消息表' AUTO_INCREMENT=377 ;

--
-- 转存表中的数据 `sml_message`
--

INSERT INTO `sml_message` (`id`, `from_uid`, `to_uid`, `title`, `content`, `create_time`, `type`, `is_read`, `last_toast`, `url`, `talk_id`, `appname`, `apptype`, `source_id`, `find_id`, `status`) VALUES
(322, 58, 1, '粉丝数增加', 'blue 关注了你。', 1419924250, 0, 1, 1419924770, '/index.php?s=/usercenter/index/index/uid/58.html', 0, 'usercenter', '', 0, 0, 0),
(323, 1, 58, '评论消息', '评论内容：afasdfasdfasdf', 1420206456, 1, 1, 1420471321, '/index.php?s=/weibo/index/weibodetail/id/404.html', 0, 'weibo', '', 0, 0, 0),
(324, 1, 58, '评论消息', '评论内容：asdfasdfas', 1420206467, 1, 1, 1420471321, '/index.php?s=/weibo/index/weibodetail/id/404.html', 0, 'weibo', '', 0, 0, 0),
(325, 1, 58, 'admin赞了您。', 'admin给您点了个赞。', 1420206475, 0, 1, 1420471321, '/index.php?s=/weibo/index/weibodetail/id/404.html', 0, 'home', '', 0, 0, 0),
(326, 1, 58, '转发提醒', 'admin转发了您的微博！', 1420206482, 1, 1, 1420471321, '/index.php?s=/weibo/index/weibodetail/id/408.html', 0, 'weibo', '', 0, 0, 0),
(327, 1, 58, '评论消息', '评论内容：1231231', 1420206482, 1, 1, 1420471321, '/index.php?s=/weibo/index/weibodetail/id/404.html', 0, 'weibo', '', 0, 0, 0),
(328, 58, 1, '蔚蓝回复了您的帖子。', '回复内容：41413423412341234123', 1420473005, 2, 1, 1420547951, '/index.php?s=/forum/index/detail/id/32/page/1.html#3', 0, 'forum', 'reply', 32, 3, 0),
(329, 58, 1, '蔚蓝回复了您的帖子。', '回复内容：实施规划大发', 1420473348, 2, 1, 1420547951, '/index.php?s=/forum/index/detail/id/32/page/1.html#4', 0, 'forum', 'reply', 32, 4, 0),
(330, 58, 1, '蔚蓝回复了您的帖子。', '回复内容：11231231231231', 1420473359, 2, 1, 1420547951, '/index.php?s=/forum/index/detail/id/32/page/1.html#5', 0, 'forum', 'reply', 32, 5, 0),
(331, 58, 1, '蔚蓝回复了您的帖子。', '回复内容：这个帖子不错', 1420476168, 2, 1, 1420547951, '/index.php?s=/forum/index/detail/id/32/page/1.html#6', 0, 'forum', 'reply', 32, 6, 0),
(332, 1, 59, '粉丝数增加', 'admin 关注了你。', 1420793039, 0, 0, 1420793047, '/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(333, 58, 1, '蔚蓝评论了您', '评论内容：13123212423412341', 1423918203, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(334, 58, 1, '蔚蓝评论了您', '评论内容：agdxcffgfasdhggasdfhasddhdrdssrarawerargdfgdsg', 1423918214, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(335, 58, 1, '蔚蓝评论了您', '评论内容：aweradbggzgfsesrsgsrrtevrtbyvaccahfhgcxzxchhtrytr', 1423918226, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(336, 58, 1, '蔚蓝评论了您', '评论内容：sfdfghgsfdf', 1423918233, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(337, 58, 1, '蔚蓝评论了您', '评论内容：qweqweqererwerwerwer', 1423918255, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(338, 58, 1, '蔚蓝评论了您', '评论内容：qweqewqweqweqweqweqweqwe', 1423918274, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(339, 58, 1, '蔚蓝评论了您', '评论内容：[aoman][baiyan][bizui][cahan]', 1423918300, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/161.html', 0, 'Blog', '', 0, 0, 0),
(340, 0, 1, '游客评论了您', '评论内容：haha', 1423979753, 0, 0, 1424710396, 'http://localhost/index.php?s=/blog/article/detail/id/166.html', 0, 'Blog', '', 0, 0, 0),
(341, 58, 59, '评论消息', '评论内容：buku', 1424710298, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(342, 58, 59, '评论消息', '评论内容：回复 @蔚蓝 ：6666', 1424710316, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(343, 58, 59, '评论消息', '评论内容：iloveyou', 1424710368, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(344, 1, 59, '评论消息', '评论内容：jiayou', 1424710407, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(345, 1, 59, '评论消息', '评论内容：回复 @蔚蓝 ：gabadie', 1424710422, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(346, 1, 58, '评论消息', '回复内容：回复 @蔚蓝 ：gabadie', 1424710422, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(347, 1, 59, 'admin赞了您。', 'admin给您点了个赞。', 1424710663, 0, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'home', '', 0, 0, 0),
(348, 0, 1, '评论消息', '评论内容：[呲牙]', 1424766305, 1, 0, 1424766309, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(349, 0, 1, '评论消息', '评论内容：[呲牙]', 1424766401, 1, 0, 1424766409, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(350, 0, 1, '评论消息', '评论内容：qweqweqeq', 1424768252, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/497.html', 0, 'weibo', '', 0, 0, 0),
(351, 0, 1, '评论消息', '评论内容：dsdfsafsfdfsfsd', 1424768740, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(352, 0, 59, '评论消息', '评论内容：[呲牙]', 1424769013, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/495.html', 0, 'weibo', '', 0, 0, 0),
(353, 0, 1, '评论消息', '评论内容：[流汗]', 1424769250, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(354, 0, 1, '评论消息', '评论内容：[流泪][流泪][流泪][流泪][流泪][流泪][流泪][流泪][流泪][流泪][流泪][流泪]', 1424772154, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(355, 0, 59, '评论消息', '评论内容：[玫瑰]', 1424772287, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/488.html', 0, 'weibo', '', 0, 0, 0),
(356, 0, 1, '评论消息', '评论内容：[呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙][呲牙]', 1424773646, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(357, 0, 1, '评论消息', '评论内容：[玫瑰][玫瑰][玫瑰][流泪][流泪][大哭][大哭][嘘][酷][酷][酷][酷][酷][酷][酷][色][色][色][色][色][色][抓狂][抓狂][抓狂]', 1424773664, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(358, 0, 1, '评论消息', '评论内容：[偷笑][偷笑][偷笑][偷笑][偷笑][偷笑][再见][嘘][嘘][大哭][流泪][流泪][炸弹][炸弹][炸弹][炸弹][炸弹][菜刀][嘘][酷][酷][酷][酷][酷][酷][酷][酷][酷][酷][酷][酷][色][色][色][色]', 1424773692, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(359, 0, 58, '评论消息', '评论内容：[玫瑰][玫瑰]', 1424776928, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/491.html', 0, 'weibo', '', 0, 0, 0),
(360, 0, 1, '评论消息', '评论内容：www.baidu.com', 1424776996, 1, 0, 1424777253, '/index.php?s=/weibo/index/weibodetail/id/498.html', 0, 'weibo', '', 0, 0, 0),
(361, 0, 59, '评论消息', '评论内容：[呲牙]', 1424779300, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/496.html', 0, 'weibo', '', 0, 0, 0),
(362, 0, 59, '评论消息', '评论内容：我来吐槽', 1424849749, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/506.html', 0, 'weibo', '', 0, 0, 0),
(363, 0, 58, '评论消息', '评论内容：哈哈哈还[调皮][调皮][调皮]', 1424855437, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/508.html', 0, 'weibo', '', 0, 0, 0),
(364, 0, 68, '评论消息', '评论内容：hello', 1424940967, 1, 0, 0, '/index.php?s=/weibo/index/weibodetail/id/509.html', 0, 'weibo', '', 0, 0, 0),
(365, 0, 1, '购买成功通知', '测试商品购买成功，请等待发货。', 1427357366, 0, 0, 1427357369, '/v/index.php?s=/shop/index/mygoods/status/0.html', 0, 'shop', '', 0, 0, 0),
(366, 1, 1, '发货通知', '你购买的商品已发货。现在可以在已完成交易列表中查看该交易。', 1427357409, 1, 1, 1427357410, '/v/index.php?s=/shop/index/mygoods/status/1.html', 0, 'admin', '', 0, 0, 0),
(367, 1, 70, '粉丝数增加', 'admin 关注了你。', 1427358335, 0, 0, 1427392126, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(368, 1, 58, '粉丝数增加', 'admin 关注了你。', 1427358342, 0, 0, 0, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(369, 1, 69, '粉丝数增加', 'admin 关注了你。', 1427358344, 0, 0, 0, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(370, 1, 68, '粉丝数增加', 'admin 关注了你。', 1427358346, 0, 0, 0, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(371, 1, 67, '粉丝数增加', 'admin 关注了你。', 1427358347, 0, 0, 0, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(372, 1, 66, '粉丝数增加', 'admin 关注了你。', 1427358349, 0, 0, 0, '/v/index.php?s=/usercenter/index/index/uid/1.html', 0, 'usercenter', '', 0, 0, 0),
(373, 0, 70, '评论消息', '评论内容：@：[玫瑰]', 1427433486, 1, 0, 1427434640, '/v/index.php?s=/weibo/index/weibodetail/id/512.html', 0, 'weibo', '', 0, 0, 0),
(374, 0, 70, '评论消息', '评论内容：@：不错', 1427458961, 1, 0, 1427458971, '/v/index.php?s=/weibo/index/weibodetail/id/511.html', 0, 'weibo', '', 0, 0, 0),
(375, 0, 70, '评论消息', '评论内容：1883833', 1427458969, 1, 0, 1427458971, '/v/index.php?s=/weibo/index/weibodetail/id/511.html', 0, 'weibo', '', 0, 0, 0),
(376, 0, 70, '评论消息', '评论内容：@：发来贺电', 1427601207, 1, 0, 1427601210, '/v/index.php?s=/weibo/index/weibodetail/id/532.html', 0, 'weibo', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_model`
--

CREATE TABLE IF NOT EXISTS `sml_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `sml_model`
--

INSERT INTO `sml_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(5, 'feedback', '反馈', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1428590580, 1428590580, 1, 'MyISAM'),
(6, 'assn', '社团', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1428590679, 1428590679, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `sml_module`
--

CREATE TABLE IF NOT EXISTS `sml_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '模块名',
  `alias` varchar(30) NOT NULL COMMENT '中文名',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) NOT NULL COMMENT '简介',
  `developer` varchar(50) NOT NULL COMMENT '开发者',
  `website` varchar(200) NOT NULL COMMENT '网址',
  `entry` varchar(50) NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模块管理表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sml_module`
--

INSERT INTO `sml_module` (`id`, `name`, `alias`, `version`, `is_com`, `show_nav`, `summary`, `developer`, `website`, `entry`, `is_setup`, `sort`) VALUES
(21, 'Blog', '资讯', '1.0.0', 0, 1, '原OneThink的内容模块，ThinkOX实现了前台界面，传统的CMS模块', '上海顶想信息科技有限公司', 'http://www.topthink.net/', 'Blog/index/index', 1, 0),
(22, 'Event', '活动', '1.0.0', 0, 1, '活动模块，用户可以发起活动', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Event/index/index', 1, 0),
(23, 'Forum', '论坛', '1.0.0', 0, 1, '论坛模块，比较简单的论坛模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Forum/index/index', 1, 0),
(24, 'Group', '群组', '1.0.0', 0, 1, '群组模块，允许用户建立自己的圈子', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Group/index/index', 1, 0),
(25, 'Home', '网站主页模块', '1.0.0', 0, 1, '首页模块，主要用于展示网站内容', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Home/index/index', 1, 0),
(26, 'Issue', '专辑', '1.0.0', 0, 1, '专辑模块，适用于精品内容展示', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Issue/index/index', 1, 0),
(27, 'People', '会员展示', '1.0.0', 0, 1, '会员展示模块，可以用于会员的查找', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'People/index/index', 1, 0),
(28, 'Shop', '积分商城', '1.0.0', 0, 1, '积分商城模块，用户可以使用积分兑换商品', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Shop/index/index', 1, 0),
(29, 'Weibo', '微博', '1.0.0', 0, 1, '微博模块，用户可以发布微博', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Weibo/index/index', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_picture`
--

CREATE TABLE IF NOT EXISTS `sml_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=192 ;

--
-- 转存表中的数据 `sml_picture`
--

INSERT INTO `sml_picture` (`id`, `type`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(135, 'local', '/Uploads/Picture/2015-02-25/54ede216abd25.png', '', '4b0cabdc3b7a833c976859f714bc431f', 'e7aec6b7b8707169d778230fd654b2055aa0e495', 1, 1424876054),
(136, 'local', '/Uploads/Picture/2015-02-26/54ee7f8d0a25e.png', '', 'e8f5e4503c639f5f752fa8a1f702015b', 'a4bd26d65cce300e6504c29f68a6a0067d5da55a', 1, 1424916364),
(137, 'local', '/Uploads/Picture/2015-02-26/54eecce55d970.jpg', '', 'd892863e50ec59c022f34e49b9ac9165', 'bb454dc881af8bbf2a48a11e7d8191ce29647dda', 1, 1424936165),
(138, 'local', '/Uploads/Picture/2015-02-26/54eed0ed7fc73.png', '', 'b025416c15a0c6ef987ca1c732e60195', 'a80a443b9db2f7c831af74cb674600e2bb796c0d', 1, 1424937197),
(134, 'local', '/Uploads/Picture/2015-02-25/54ed87b829c53.png', '', '9fe6a1c4aff1c0a5f6c94590f3ae93d1', 'c23a40dd28c2fdebe7bcf57f97f9f359a0a4ee9e', 1, 1424852919),
(139, 'local', '/Uploads/Picture/2015-03-26/5513be21c0516.jpg', '', '874ad7bc598f8dd96d8ad7c7a8a1af18', '7a40aa97128ccde91835bae61bc4dbc80e1b329b', 1, 1427357217),
(140, 'local', '/Uploads/Picture/2015-03-27/5514329ef3faf.jpg', '', '1ca3d7c67a62f7cdb7246c31dbb2a8e4', '81f9966d01985bbf4cfed37419a52e49b8a705d0', 1, 1427387038),
(141, 'local', '/Uploads/Picture/2015-03-27/551434148961b.jpg', '', 'bccdff787dadc1a23cfe85a26e01182f', '0f6cc3d8fc56b6061dfc071bf421a90275083abc', 1, 1427387412),
(142, 'local', '/Uploads/Picture/2015-03-27/5514eead4e298.png', '', '23415e097c85ad4d8ce62541de4eb7f1', '4eb6adb22855937ce2e857365f171bea14d3c695', 1, 1427435180),
(143, 'local', '/Uploads/Picture/2015-03-27/55154d8588766.png', '', '31a329e691ca3dbabd96479167d230ce', '9520d7c670be846228d9a658fdbbd99c0138e0c2', 1, 1427459461),
(144, 'local', '/Uploads/Picture/2015-03-27/55154f36bc035.jpg', '', 'c85810b188e88a2c8ab7492f07725ae5', '3fb6567ed5b5251e778d67925895dcc9bba33b08', 1, 1427459894),
(145, 'local', '/Uploads/Picture/2015-03-27/5515691f2ae60.png', '', '1a97e0771eb134ac59ebb55106a1c20e', '291174c3ae2b81bc0a09a5423af3c67c42bca621', 1, 1427466526),
(146, 'local', '/Uploads/Picture/2015-03-27/55156e07e32f3.png', '', '3040d39bef097feb39cb0076f422e509', '3ee7f2dd5e18266864e096cdfbd4550118b23128', 1, 1427467783),
(147, 'local', '/Uploads/Picture/2015-03-27/55156e5cc7079.png', '', '571484a47e048cbfdf3c69f9bdbc653a', '510f7af38f033d6d42b95ba6a2f08e0c5b175c7c', 1, 1427467868),
(148, 'local', '/Uploads/Picture/2015-03-27/55156e5cc8985.png', '', '7d27560ad706068465f454d600adee84', '8626bd3638d6d50f1463c225d0739ac3a1b88977', 1, 1427467868),
(149, 'local', '/Uploads/Picture/2015-03-27/55156e5cca12d.png', '', '2c071d6f4e20a3642a0ef77e22677a4a', 'c297976504cc8a91d6e23daca9ebe5779078ce82', 1, 1427467868),
(150, 'local', '/Uploads/Picture/2015-03-28/551699d5dd2ba.png', '', 'a3fccc41b836bdca2cd4f442ada5cd03', '76d27b964bbd7368daf782e05ecf84ade8d772aa', 1, 1427544533),
(151, 'local', '/Uploads/Picture/2015-03-28/551699f68b646.png', '', '2cfacd587cf55018b046d6a34c24753d', '6f7ea591e96415dcbab04ea3b17f28925fe3b7e2', 1, 1427544566),
(152, 'local', '/Uploads/Picture/2015-03-28/55169bcb9223f.png', '', '398d5c25e2636dcf23c2d4e8482d0078', 'c8a9c6ff33a8da49f5d34dedad5dd3ab3ef398ce', 1, 1427545035),
(153, 'local', '/Uploads/Picture/2015-03-28/55169c141640f.jpg', '', '219d9787a175621e68fa417b57612eda', 'b3d1e352946777142b28a2f89e175f0878fdcc12', 1, 1427545107),
(154, 'local', '/Uploads/Picture/2015-03-28/5516b0b8b8afe.pw', '', 'dff23e017334f3b797ea0fae70b06ad6', '873c02194e0928c18e76484f957928887bb53659', 1, 1427550392),
(155, 'local', '/Uploads/Picture/2015-03-28/5516b180a19f5.pw', '', 'a1c9d6ca54004f081becb4f7743a355c', 'e3feca812a27cb0750beeb40f6f947ae6a833b23', 1, 1427550592),
(156, 'local', '/Uploads/Picture/2015-03-28/5516b1bcb235d.pw', '', '2aea95b311e5785cee821d27d65bf398', 'b2d42e41d339dfb9187652921018e6d15742c839', 1, 1427550652),
(157, 'local', '/Uploads/Picture/2015-03-28/5516b1bcb3378.pw', '', 'c36739bae2c36ef0d34e04efbe570f2c', 'f27b4a74d2032c2ee1d55e30fd8b9ada948ecbb3', 1, 1427550652),
(158, 'local', '/Uploads/Picture/2015-03-28/5516b26facf20.jpg', '', '2ba39d662c80bdccd1cc9890d110621e', '55f8b1cc90e19c0f0dab4e69b106401805addfed', 1, 1427550831),
(159, 'local', '/Uploads/Picture/2015-03-28/5516b37094119.png', '', '342e4549d154bcbf867cf5ff1690f6ae', 'd891985798da03c86df25eab04f6a7320f6956ff', 1, 1427551088),
(160, 'local', '/Uploads/Picture/2015-03-28/5516b3733ab1d.png', '', '5c9fc5bcf60886f0e89919fef2c2d8e1', '768a900705d07906b98ba1bf9a1bc56e7c0752a7', 1, 1427551091),
(161, 'local', '/Uploads/Picture/2015-03-28/5516b376ef78f.png', '', '5e6754e4e6ca27bcd8e3f74b6a507507', '3d6ef764b5f964e59cf991b245a805a5712582b9', 1, 1427551094),
(162, 'local', '/Uploads/Picture/2015-03-28/5516b556a953f.jpg', '', 'c4c52e3919c88a64225151dd28190a30', '95777cf00ee2a102efc8112c7fa756814b52610a', 1, 1427551574),
(163, 'local', '/Uploads/Picture/2015-03-28/5516b585b16cf.jpg', '', '12905bd9f5d2872c26bef93a87e835bf', '13aa483288b2eb500735e380df4527f717de118f', 1, 1427551620),
(164, 'local', '/Uploads/Picture/2015-03-28/5516b7d9c0297.jpg', '', 'c1731edfdba6b491a8ba9c53da3d0f7c', 'a2550e47d246fd703ed3f1492c990d24440b1f10', 1, 1427552217),
(165, 'local', '/Uploads/Picture/2015-03-28/5516b9e357b5c.jpg', '', '830b4e3d854b1325d083f2300af79e27', 'e88e00ae10e9f0ae278138afba4dd65fcd662193', 1, 1427552738),
(166, 'local', '/Uploads/Picture/2015-03-28/5516ba776377a.jpg', '', '08398b546add737353732a4581b2563c', '739f99dea45d04323d161d5e17cd53056581d905', 1, 1427552885),
(167, 'local', '/Uploads/Picture/2015-03-28/5516bad22cf89.jpg', '', 'a407f6deef1cbab7399429c9902f37b2', 'a93d05c3a28120e98e9ae402be7ff8ac70a944c4', 1, 1427552977),
(168, 'local', '/Uploads/Picture/2015-03-28/5516bb2e89903.jpg', '', 'd72d6421d608dafe2269820cfbaff403', '8a8d1330c0ce1b5bc09613c3d531341ee7b788f7', 1, 1427553068),
(169, 'local', '/Uploads/Picture/2015-03-28/5516bb802d5fd.jpg', '', '41268b59465460fa48bd3a22860c3ddf', 'c03838e3ac5eb9b04ee22e3bdbcccc02144a5f0d', 1, 1427553151),
(170, 'local', '/Uploads/Picture/2015-03-28/5516bbddeaa66.jpg', '', '1e1d0e95af7b5222dd578272be07c8f7', '0509037d3a7cc8eb7e480dfd282295d64cb9d5e8', 1, 1427553245),
(171, 'local', '/Uploads/Picture/2015-03-28/5516bc4ab4a3b.jpg', '', 'bde5ec42e2cbc4cd5b3a75d99df866e1', '4c751640c8bd5a967ec228159686e9f428911ee9', 1, 1427553354),
(172, 'local', '/Uploads/Picture/2015-03-28/5516bc82d0708.jpg', '', '5362a2b4151beaf61d5aee14bbc26918', '36285c745ddb79bb53de1737a4cfe6f6158c0108', 1, 1427553410),
(173, 'local', '/Uploads/Picture/2015-03-28/5516bc82d2317.jpg', '', '7e8b363f582803d6daad3f8f313fd8d7', 'b63dd14139e91d8f32428edc46bec2ee406ef612', 1, 1427553410),
(174, 'local', '/Uploads/Picture/2015-03-28/5516bddb003e1.jpg', '', 'f32d8542a21be303674ce2006d36c6ec', '4cdbed57347ca5e9169c1f13560e37569c7256c0', 1, 1427553754),
(175, 'local', '/Uploads/Picture/2015-03-28/5516bddb016d2.jpg', '', '3f2b3e83a9bd92e748dfd936ac21b10c', '720d79204bd1ee8fe3532441e86bb96d5260e2f0', 1, 1427553754),
(176, 'local', '/Uploads/Picture/2015-03-28/5516be5593a26.jpg', '', '3593e15d0dff869c252364aa26a66b3d', '671b7a9217e304fb297d6b14dbcb36a174b91290', 1, 1427553877),
(177, 'local', '/Uploads/Picture/2015-03-28/5516beae64ed3.jpg', '', '52c5f8879d1fc28e980266cfa37ff40c', '3903491274c422034e9a698a3bd53c768215eb49', 1, 1427553965),
(178, 'local', '/Uploads/Picture/2015-03-28/5516bfd201ab5.jpg', '', 'e3401e61b0120816c47474f938aa7a9a', '7342a16822afda21800d40aa186bc72ef7c2ba3b', 1, 1427554257),
(179, 'local', '/Uploads/Picture/2015-03-28/5516c0b6bcb6f.jpg', '', 'ace3d8b258bd22c9125c2963d13a0eb8', 'eae467f9cb6e551a190c9689d0a417d10dc9ecbb', 1, 1427554486),
(180, 'local', '/Uploads/Picture/2015-03-28/5516c106f1cb4.jpg', '', '0c2dd2bfa2b7f3f93327ef2254b0ef9c', '0381a3757bf8724f27e529844d9565af9b5ea9c7', 1, 1427554566),
(181, 'local', '/Uploads/Picture/2015-03-28/5516c143b988c.jpg', '', '1ac330d816a894636cb984eeb1a321f1', 'd464addc49fcef49a0dabe4251d562fe135f72d7', 1, 1427554627),
(182, 'local', '/Uploads/Picture/2015-03-28/5516c143ba890.jpg', '', 'a7106e6bcb0b43b1f0dd641d32fef251', '69b8c6b0c8c16615adaaf588a741605192cb80ef', 1, 1427554627),
(183, 'local', '/Uploads/Picture/2015-03-28/5516c17c74227.jpg', '', '7266850dc34bcae27d49a9eae065105f', '72763041ec35cd6a3659c67dc4d447b9914a932a', 1, 1427554684),
(184, 'local', '/Uploads/Picture/2015-03-28/5516c1cb709b6.jpg', '', '610fbb3f1d8056cce4057939e5f9b0c4', '2ebf8b2b710cfbe81a3bc6042fb7beb9c7a12cf4', 1, 1427554763),
(185, 'local', '/Uploads/Picture/2015-03-28/5516c1cb71aec.jpg', '', '00d66e9886081f24a58e5c9cc8e829ab', 'f45a50bd42a4b3e2eb46cedf7f505375d9dae7f9', 1, 1427554763),
(186, 'local', '/Uploads/Picture/2015-03-29/55177400c8983.jpg', '', 'f79055e65ba7550a9d7c8c396c2a97ba', 'f98b6b6aa0e0d92b69d889c05fe403b7445eb029', 1, 1427600384),
(187, 'local', '/Uploads/Picture/2015-03-29/5517a1ab8bbed.jpg', '', 'e0724a80d299c57655ce9cd045c3c81c', 'a9765e44ab6f75323e2bb1326ad56b90b9899e12', 1, 1427612075),
(188, 'local', '/Uploads/Picture/2015-03-29/5517a31b1717f.jpg', '', '1f63618de0f8830bd17a6a45a476d18a', '992270d4edab8ce3b3840ddbf9367732faab9c79', 1, 1427612442),
(189, 'local', '/Uploads/Picture/2015-03-29/5517a9f276553.jpg', '', '7c94d01384881560d3052e7e96a3f775', '00b91c01310fe03860d0dfe547b9c6665dd41998', 1, 1427614193),
(190, 'local', '/Uploads/Picture/2015-03-29/5517ab779b4a6.jpg', '', 'c0f81facd874483cb63d8661d39065b3', '1f99711f214bfe40e6012a79a720e27fedccc608', 1, 1427614583),
(191, 'local', '/Uploads/Picture/2015-03-29/5517ab96a82c0.jpg', '', '9e23f05449bd4a42febd57451eead5f5', '36fb2e82de49457c3b7bc97d3db8426fbcb8711a', 1, 1427614614);

-- --------------------------------------------------------

--
-- 表的结构 `sml_rank`
--

CREATE TABLE IF NOT EXISTS `sml_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_rank_user`
--

CREATE TABLE IF NOT EXISTS `sml_rank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_seo_rule`
--

CREATE TABLE IF NOT EXISTS `sml_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `sml_seo_rule`
--

INSERT INTO `sml_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_keywords`, `seo_description`, `seo_title`, `sort`) VALUES
(4, '整站标题', '', '', '', 1, '', '', 'ThinkOX', 7),
(6, '论坛版块页', 'forum', 'index', 'forum', 1, '{$forum.title} ', '{$forum.title} ', '{$forum.title} —— ThinkOX论坛', 2),
(7, '微博首页', 'Weibo', 'Index', 'index', 1, '微博', '微博首页', 'ThinkOX轻量化社交框架', 5),
(8, '微博详情页', 'Weibo', 'Index', 'weiboDetail', 1, '{$weibo.title|op_t},Thinkox,ox,微博', '{$weibo.content|op_t}\r\n', '{$weibo.content|op_t}——ThinkOX微博', 6),
(9, '用户中心', 'usercenter', 'index', 'index', 1, '{$user_info.nickname|op_t},Thinkox', '{$user_info.username|op_t}的个人主页', '{$user_info.nickname|op_t}的个人主页', 3),
(10, '会员页面', 'people', 'index', 'index', 1, '会员', '会员', '会员', 4),
(11, '论坛帖子详情页', 'forum', 'index', 'detail', 1, '{$post.title|op_t},论坛,thinkox', '{$post.title|op_t}', '{$post.title|op_t} —— ThinkOX论坛', 1),
(12, '商城首页', 'shop', 'index', 'index', 1, '商城,积分', '积分商城', '商城首页——ThinkOX', 0),
(13, '商城商品详情页', 'shop', 'index', 'goodsdetail', 1, '{$content.goods_name|op_t},商城', '{$content.goods_name|op_t}', '{$content.goods_name|op_t}——ThinkOX商城', 0),
(14, '资讯首页', 'blog', 'index', 'index', 1, '资讯首页', '资讯首页\r\n', '资讯——ThinkOX', 0),
(15, '资讯列表页', 'blog', 'article', 'lists', 1, '{$category.title|op_t}', '{$category.title|op_t}', '{$category.title|op_t}', 0),
(16, '资讯文章页', 'blog', 'article', 'detail', 1, '{$info.title|op_t}', '{$info.title|op_t}', '{$info.title|op_t}——ThinkOX', 0),
(17, '活动首页', 'event', 'index', 'index', 1, '活动', '活动首页', '活动首页——ThinkOX', 0),
(18, '活动详情页', 'event', 'index', 'detail', 1, '{$content.title|op_t}', '{$content.title|op_t}', '{$content.title|op_t}——ThinkOX', 0),
(19, '专辑首页', 'issue', 'index', 'index', 1, '专辑', '专辑首页', '专辑首页——ThinkOX', 0),
(20, '专辑详情页', 'issue', 'index', 'issuecontentdetail', 1, '{$content.title|op_t}', '{$content.title|op_t}', '{$content.title|op_t}——ThinkOX', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop`
--

CREATE TABLE IF NOT EXISTS `sml_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(25) NOT NULL COMMENT '商品名称',
  `goods_ico` int(11) NOT NULL COMMENT '商品图标',
  `goods_introduct` varchar(100) NOT NULL COMMENT '商品简介',
  `goods_detail` text NOT NULL COMMENT '商品详情',
  `tox_money_need` int(11) NOT NULL COMMENT '需要金币数',
  `goods_num` int(11) NOT NULL COMMENT '商品余量',
  `changetime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，-1：删除；0：禁用；1：启用',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `category_id` int(11) NOT NULL,
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为新品',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '已出售量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品信息' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `sml_shop`
--

INSERT INTO `sml_shop` (`id`, `goods_name`, `goods_ico`, `goods_introduct`, `goods_detail`, `tox_money_need`, `goods_num`, `changetime`, `status`, `createtime`, `category_id`, `is_new`, `sell_num`) VALUES
(14, '1212', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(15, '联通宽带出售', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(16, '测试商品3', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(17, '测试商品4', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 110),
(18, '1212', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(19, '联通宽带出售', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(20, '测试商品3', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(21, '测试商品4', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 11),
(22, '1212', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(23, '联通宽带出售', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(24, '测试商品3', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(25, '测试商品4', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 110),
(26, '1212', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(27, '联通宽带出售', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(28, '测试商品3', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(29, '测试商品4', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(30, '1212', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(31, '联通宽带出售', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(32, '测试商品3', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 110),
(33, '测试商品4', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(34, '1212', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(35, '联通宽带出售', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(36, '测试商品3', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 11),
(37, '测试商品4', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(38, '测试商品4', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(39, '1212', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(40, '联通宽带出售', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 110),
(41, '测试商品3', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(42, '测试商品4', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(43, '1212', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(44, '联通宽带出售', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(45, '测试商品4', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(46, '1212', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(47, '联通宽带出售', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 110),
(48, '测试商品3', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(49, '测试商品4', 122, '联通宽带，就是快', '', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(50, '1212', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(51, '联通宽带出售', 124, '啊盛大盛大', '阿斯顿阿斯顿啊大叔', 1, 11, 1420608183, -1, 1420608183, 1, 1, 11),
(52, '测试商品3', 110, '好用的才是实用的', '哈哈哈哈，5s不多说', 1999, 1, 1420605858, -1, 1419924718, 1, 1, 0),
(53, '测试商品4', 122, '联通宽带，就是快', '1221231', 100, 1, 1420605923, -1, 1420605923, 11, 1, 0),
(54, '1212', 123, '1212312', '1231231231', 1, 1, 1420608155, -1, 1420608155, 1, 1, 1),
(55, '测试商品', 139, '大屏更好用', '大屏更好用', 1, 0, 1427357309, 1, 1427357248, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_address`
--

CREATE TABLE IF NOT EXISTS `sml_shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `change_time` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sml_shop_address`
--

INSERT INTO `sml_shop_address` (`id`, `uid`, `address`, `zipcode`, `create_time`, `change_time`, `name`, `phone`) VALUES
(3, 1, '长江大学东校区汉科4栋', 435200, 1427357366, 0, '吴锐', '15572090961');

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_buy`
--

CREATE TABLE IF NOT EXISTS `sml_shop_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_num` int(11) NOT NULL COMMENT '购买数量',
  `status` tinyint(4) NOT NULL COMMENT '状态，-1：未领取；0：申请领取；1：已领取',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `createtime` int(11) NOT NULL COMMENT '购买时间',
  `gettime` int(11) NOT NULL COMMENT '交易结束时间',
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购买商品信息表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `sml_shop_buy`
--

INSERT INTO `sml_shop_buy` (`id`, `goods_id`, `goods_num`, `status`, `uid`, `createtime`, `gettime`, `address_id`) VALUES
(55, 55, 1, 1, 1, 1427357366, 1427357409, 3);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_category`
--

CREATE TABLE IF NOT EXISTS `sml_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sml_shop_category`
--

INSERT INTO `sml_shop_category` (`id`, `title`, `create_time`, `update_time`, `status`, `pid`, `sort`) VALUES
(1, '电子产品', 1403507725, 1420605603, 1, 0, 0),
(5, '生活用品', 1420605614, 1420605604, 1, 0, 0),
(6, '体育用品', 1420605625, 1420605617, -1, 0, 0),
(7, '学习用品', 1420605638, 1420605629, 1, 0, 0),
(8, '文体乐器', 1420605652, 1420605643, 1, 0, 0),
(9, '服饰箱包', 1420605678, 1420605657, -1, 0, 0),
(10, '代步工具', 1420605703, 1420605682, 1, 0, 0),
(11, '虚拟产品', 1420605724, 1420605708, 1, 0, 0),
(12, '房屋租赁', 1420605752, 1420605728, 1, 0, 0),
(13, '兼职信息', 1420605769, 1420605756, -1, 0, 0),
(14, '其他物品', 1420605778, 1420605772, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_config`
--

CREATE TABLE IF NOT EXISTS `sml_shop_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(25) NOT NULL COMMENT '标识',
  `cname` varchar(25) NOT NULL COMMENT '中文名称',
  `changetime` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商店配置' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sml_shop_config`
--

INSERT INTO `sml_shop_config` (`id`, `ename`, `cname`, `changetime`) VALUES
(1, 'tox_money', '金币', 1403507688),
(2, 'min_sell_num', '10', 1403489181);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_log`
--

CREATE TABLE IF NOT EXISTS `sml_shop_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sml_shop_log`
--

INSERT INTO `sml_shop_log` (`id`, `uid`, `message`, `create_time`) VALUES
(1, 1, '用户[1]admin在2015-03-26 16:09购买了商品<a href="index.php?s=/Shop/Index/goodsDetail/id/55.html" target="_black">测试商品</a>', 1427357366),
(2, 1, '在2015-03-26 16:10[1]admin发送了用户[1]admin购买的商品：<a href="index.php?s=/Shop/Index/goodsDetail/id/55.html" target="_black">测试商品</a>', 1427357409);

-- --------------------------------------------------------

--
-- 表的结构 `sml_shop_see`
--

CREATE TABLE IF NOT EXISTS `sml_shop_see` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `sml_shop_see`
--

INSERT INTO `sml_shop_see` (`id`, `goods_id`, `uid`, `create_time`, `update_time`) VALUES
(5, 15, 1, 1420607065, 1420607065),
(6, 36, 1, 1420732150, 1420732150),
(7, 40, 1, 1420732165, 1420732956),
(8, 55, 1, 1427357292, 1427357368);

-- --------------------------------------------------------

--
-- 表的结构 `sml_super_links`
--

CREATE TABLE IF NOT EXISTS `sml_super_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sml_super_links`
--

INSERT INTO `sml_super_links` (`id`, `type`, `title`, `cover_id`, `link`, `level`, `status`, `create_time`) VALUES
(5, 2, '想天科技', 0, 'http://www.ourstu.com', 0, 1, 1407156786),
(6, 2, 'Onethink', 0, 'http://www.onethink.cn', 0, 1, 1407156813),
(7, 1, 'ThinkOX', 92, 'http://tox.ourstu.com', 0, 1, 1407156830);

-- --------------------------------------------------------

--
-- 表的结构 `sml_support`
--

CREATE TABLE IF NOT EXISTS `sml_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='支持的表' AUTO_INCREMENT=59 ;

--
-- 转存表中的数据 `sml_support`
--

INSERT INTO `sml_support` (`id`, `appname`, `row`, `uid`, `create_time`, `table`) VALUES
(52, 'Weibo', 404, 1, 1420206475, 'weibo'),
(53, 'Weibo', 408, 1, 1420206515, 'weibo'),
(54, 'Weibo', 410, 1, 1420206552, 'weibo'),
(55, 'Weibo', 451, 1, 1420685508, 'weibo'),
(56, 'Weibo', 495, 1, 1424710662, 'weibo'),
(57, 'Issue', 29, 1, 1427358535, 'issue_content'),
(58, 'Weibo', 514, 70, 1427462554, 'weibo');

-- --------------------------------------------------------

--
-- 表的结构 `sml_sync_login`
--

CREATE TABLE IF NOT EXISTS `sml_sync_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_talk`
--

CREATE TABLE IF NOT EXISTS `sml_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) NOT NULL,
  `appname` varchar(30) NOT NULL,
  `apptype` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `source_title` varchar(100) NOT NULL,
  `source_content` text NOT NULL,
  `source_url` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `message_id` int(11) NOT NULL,
  `other_uid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会话表' AUTO_INCREMENT=168 ;

--
-- 转存表中的数据 `sml_talk`
--

INSERT INTO `sml_talk` (`id`, `create_time`, `uids`, `appname`, `apptype`, `source_id`, `update_time`, `source_title`, `source_content`, `source_url`, `status`, `message_id`, `other_uid`, `title`) VALUES
(164, 1420813417, '[1],[58]', '', '', 0, 1420813467, '', '', '', 1, 0, 0, 'admin 和 蔚蓝的聊天'),
(165, 1420815315, '[1],[58]', '', '', 0, 1420815380, '', '', '', 1, 0, 0, 'admin 和 蔚蓝的聊天'),
(166, 1420815398, '[58],[1]', '', '', 0, 1420815410, '', '', '', 1, 0, 0, '蔚蓝 和 admin的聊天'),
(167, 1420815665, '[1],[59]', '', '', 0, 1420815708, '', '', '', 1, 0, 0, 'admin 和 love的聊天');

-- --------------------------------------------------------

--
-- 表的结构 `sml_talk_message`
--

CREATE TABLE IF NOT EXISTS `sml_talk_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='聊天消息表' AUTO_INCREMENT=285 ;

--
-- 转存表中的数据 `sml_talk_message`
--

INSERT INTO `sml_talk_message` (`id`, `content`, `uid`, `create_time`, `talk_id`) VALUES
(278, '你好', 58, 1420813467, 164),
(279, '1233', 58, 1420815352, 165),
(280, '1122', 58, 1420815363, 165),
(281, 'wreee4', 58, 1420815380, 165),
(282, 'kjbjk', 1, 1420815410, 166),
(283, 'wrrr', 59, 1420815680, 167),
(284, 'zdww', 59, 1420815708, 167);

-- --------------------------------------------------------

--
-- 表的结构 `sml_talk_message_push`
--

CREATE TABLE IF NOT EXISTS `sml_talk_message_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='状态，0为未提示，1为未点击，-1为已点击' AUTO_INCREMENT=118 ;

--
-- 转存表中的数据 `sml_talk_message_push`
--

INSERT INTO `sml_talk_message_push` (`id`, `uid`, `source_id`, `create_time`, `status`, `talk_id`) VALUES
(111, 1, 278, 1420813467, -1, 164),
(112, 1, 279, 1420815352, -1, 165),
(113, 1, 280, 1420815363, -1, 165),
(114, 1, 281, 1420815380, -1, 165),
(115, 58, 282, 1420815410, 1, 166),
(116, 1, 283, 1420815680, -1, 167),
(117, 1, 284, 1420815708, -1, 167);

-- --------------------------------------------------------

--
-- 表的结构 `sml_talk_push`
--

CREATE TABLE IF NOT EXISTS `sml_talk_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='对话推送表' AUTO_INCREMENT=102 ;

--
-- 转存表中的数据 `sml_talk_push`
--

INSERT INTO `sml_talk_push` (`id`, `uid`, `source_id`, `create_time`, `status`) VALUES
(98, 1, 164, 1420813417, -1),
(99, 1, 165, 1420815315, -1),
(100, 58, 166, 1420815398, 1),
(101, 1, 167, 1420815666, -1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `sml_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `sml_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=72 ;

--
-- 转存表中的数据 `sml_ucenter_member`
--

INSERT INTO `sml_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(58, 'blue', '3d4077490a26798f1d0417851f8a7bdc', 'wurui_2010@qq.com', '', 1419923757, 2130706433, 1424955606, 3232238184, 1419923757, 1),
(59, 'love', '3d4077490a26798f1d0417851f8a7bdc', 'love@qq.com', '', 1420792759, 3232249857, 1424849659, 3232235789, 1420792759, 1),
(60, 'qwer', '3d4077490a26798f1d0417851f8a7bdc', '1231322@qq.com', '', 1420806509, 2130706433, 1420806509, 2130706433, 1420806509, 1),
(61, 'eeqwer', 'e18ec83b229792687c220c1b7e3bf031', '13344@qq.com', '', 1420814775, 2130706433, 1420814775, 2130706433, 1420814775, 1),
(62, 'eeeeee', 'e18ec83b229792687c220c1b7e3bf031', '12323344@qq.com', '', 1420814908, 3232235620, 1420814908, 3232235620, 1420814908, 1),
(63, 'rayray', '5adfa86d1a93063116bececd790d1273', '23244534@qq.com', '', 1420815120, 3232235620, 1420815120, 3232235620, 1420815120, 1),
(64, 'noblue', '3d4077490a26798f1d0417851f8a7bdc', '306135437@qq.com', '', 1422864724, 3232235796, 1423750032, 2130706433, 1422864724, 1),
(65, 'rrry', 'e18ec83b229792687c220c1b7e3bf031', '1231331@qq.com', '', 1424180131, 3232249957, 1424180131, 3232249957, 1424180131, 1),
(66, 'okblue', '3d4077490a26798f1d0417851f8a7bdc', '30645075@qq.com', '', 1424856677, 3232235789, 1424856677, 3232235789, 1424856677, 1),
(67, 'superuser', '3d4077490a26798f1d0417851f8a7bdc', '12345678@qq.com', '', 1424860373, 3232235796, 1424860373, 3232235796, 1424860373, 1),
(68, 'skype', '3d4077490a26798f1d0417851f8a7bdc', '131321321@qq.com', '', 1424860608, 3232235796, 1424860626, 3232235796, 1424860608, 1),
(69, 'wurui', '3d4077490a26798f1d0417851f8a7bdc', 'pig@qq.com', '', 1424865909, 3232235789, 1424865909, 3232235789, 1424865909, 1),
(70, 'kkkk', 'f7ec46ad54a2cfc17588466eb4bae105', '12312313@qq.com', '', 1427355707, 0, 1428669420, 3232235891, 1427355707, 1),
(71, 'hiro', 'f7ec46ad54a2cfc17588466eb4bae105', 'hiro@163.com', '', 1428462535, 3232235891, 1428462552, 3232235891, 1428462535, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sml_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `sml_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_ucenter_user_link`
--

CREATE TABLE IF NOT EXISTS `sml_ucenter_user_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) NOT NULL,
  `uc_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_url`
--

CREATE TABLE IF NOT EXISTS `sml_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sml_user_token`
--

CREATE TABLE IF NOT EXISTS `sml_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `sml_user_token`
--

INSERT INTO `sml_user_token` (`id`, `uid`, `token`, `time`) VALUES
(14, 1, 'Zfiorz0wAQpdWB7SFqHbvK6TsM1YN89GnPxlt3IE', 1424759616),
(15, 58, 'q3DSUutLpnsw2eNIfHgEZaQyl5dAFmBx7O9RJ1vY', 1424955606),
(16, 59, 'xiTaAkEl4VBc6dmU7IKCzXY3ybGstDoZ2phwNPR8', 1424849660),
(17, 68, '02DQN7ApfMJC1glUqTW98jRzurGhLVsboYaKxtwB', 1424860626),
(18, 70, 'z4L8UGsS7yp09bCTxtDMFefkOqjcouWdaiBhnN2v', 1428669420),
(19, 71, '02KnCHBLZTfkEYRvdwOrSsziMe53F71V9pPcGgy4', 1428462552);

-- --------------------------------------------------------

--
-- 表的结构 `sml_weibo`
--

CREATE TABLE IF NOT EXISTS `sml_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `repost_count` int(11) NOT NULL,
  `from` varchar(40) NOT NULL,
  `like_num` int(11) NOT NULL,
  `like_user` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=535 ;

--
-- 转存表中的数据 `sml_weibo`
--

INSERT INTO `sml_weibo` (`id`, `uid`, `content`, `create_time`, `comment_count`, `status`, `is_top`, `type`, `data`, `repost_count`, `from`, `like_num`, `like_user`) VALUES
(509, 68, 'hello', 1424860635, 1, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 2, ',68,58'),
(510, 58, '[调皮][调皮]', 1424955618, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 2, ',58,70'),
(511, 70, '我发表了一个新的帖子【阿斯顿发射点发射点】：http://localhost/v/index.php?s=/forum/index/detail/id/35.html', 1427392190, 2, 1, 0, 'feed', 'a:0:{}', 0, '', 1, ',70'),
(512, 70, '都两点了[晕]', 1427393545, 1, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 1, ',70'),
(513, 70, '[流汗][再见][流汗][流泪][流泪][嘘][嘘][流泪]', 1427458928, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(514, 70, '133', 1427462505, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(515, 70, 'watsrtshrhtsehtet', 1427462983, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:3:"144";}', 0, '', 0, NULL),
(516, 70, '啊法撒旦发送', 1427544596, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 1, ',70'),
(517, 70, '序列化', 1427545341, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(518, 70, '序列化图片', 1427545378, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(519, 70, '测试', 1427551180, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:15:"150,159,160,161";}', 0, '', 0, NULL),
(520, 70, '唯美', 1427552738, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(521, 70, '美美', 1427552885, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(522, 70, '123', 1427552977, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(523, 70, '漂亮', 1427553068, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(524, 70, '12484883373', 1427553151, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(525, 70, '36364637', 1427553245, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(526, 70, '27383884', 1427553354, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(527, 70, '2737377377', 1427553410, 0, 0, 0, 'image', 'a:1:{s:10:"attach_ids";s:0:"";}', 0, '', 0, NULL),
(528, 70, 'hello', 1427554567, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:3:"180";}', 0, '', 0, NULL),
(529, 70, 'wer', 1427554628, 0, 1, 0, 'feed', 'a:1:{s:10:"attach_ids";s:7:"181,182";}', 0, '', 0, NULL),
(530, 70, 'wertyu', 1427554684, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:3:"183";}', 0, '', 0, NULL),
(531, 70, '太高兴了[呲牙]', 1427554763, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:7:"184,185";}', 0, '', 1, ',70'),
(532, 70, '终于可以发图片了[调皮]', 1427600385, 1, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:3:"186";}', 0, '', 1, ',70'),
(533, 70, '框架', 1427614194, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:3:"189";}', 0, '', 0, NULL),
(534, 70, '微博内容不能为空！', 1427614614, 0, 1, 0, 'image', 'a:1:{s:10:"attach_ids";s:3:"191";}', 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sml_weibo_comment`
--

CREATE TABLE IF NOT EXISTS `sml_weibo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `to_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sml_weibo_comment`
--

INSERT INTO `sml_weibo_comment` (`id`, `uid`, `weibo_id`, `content`, `create_time`, `status`, `to_comment_id`) VALUES
(1, 58, 509, 'hello', 1424940967, 1, 0),
(2, 70, 512, '@：[玫瑰]', 1427433484, 1, 0),
(3, 70, 511, '@：不错', 1427458961, 1, 0),
(4, 70, 511, '1883833', 1427458968, 1, 0),
(5, 70, 532, '@：发来贺电', 1427601206, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sml_weibo_top`
--

CREATE TABLE IF NOT EXISTS `sml_weibo_top` (
  `weibo_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='置顶微博表';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
