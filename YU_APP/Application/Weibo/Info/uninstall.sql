DROP TABLE IF EXISTS `thinkox_weibo`;
DROP TABLE IF EXISTS `thinkox_weibo_comment`;
DROP TABLE IF EXISTS `thinkox_weibo_top`;




/*删除menu相关数据*/
set @tmp_id=0;
select @tmp_id:= id from `thinkox_menu` where `title` = '微博' ;
delete from `thinkox_menu` where  `id` = @tmp_id or (`pid` = @tmp_id  and `pid` !=0);
delete from `thinkox_menu` where  `title` = '微博' ;

delete from `thinkox_menu` where  `url` like 'Weibo/%';

delete from `thinkox_auth_rule` where  `module` = 'Weibo';