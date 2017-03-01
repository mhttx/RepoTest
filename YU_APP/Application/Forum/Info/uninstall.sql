DROP TABLE IF EXISTS `thinkox_forum`;
DROP TABLE IF EXISTS `thinkox_forum_type`;
DROP TABLE IF EXISTS `thinkox_forum_bookmark`;
DROP TABLE IF EXISTS `thinkox_forum_lzl_reply`;
DROP TABLE IF EXISTS `thinkox_forum_post`;
DROP TABLE IF EXISTS `thinkox_forum_post_reply`;

/*删除menu相关数据*/
set @tmp_id=0;
select @tmp_id:= id from `thinkox_menu` where `title` = '论坛';
delete from `thinkox_menu` where  `id` = @tmp_id or (`pid` = @tmp_id  and `pid` !=0);
delete from `thinkox_menu` where  `title` = '论坛';

delete from `thinkox_menu` where  `url` like 'Forum/%';