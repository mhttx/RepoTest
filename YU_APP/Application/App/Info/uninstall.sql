DROP TABLE IF EXISTS `thinkox_app_feedback`;
DROP TABLE IF EXISTS `thinkox_app_app`;
/*删除menu相关数据*/
set @tmp_id=0;
select @tmp_id:= id from `thinkox_menu` where `title` = 'App' ;
delete from `thinkox_menu` where  `id` = @tmp_id or (`pid` = @tmp_id  and `pid` !=0);
delete from `thinkox_menu` where  `title` = 'App' ;
delete from `thinkox_menu` where  `url` like 'App/%';