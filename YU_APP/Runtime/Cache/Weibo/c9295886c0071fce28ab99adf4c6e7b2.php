<?php if (!defined('THINK_PATH')) exit();?><a title="转发"  class="send_repost" href="<?php echo U('Weibo/Index/sendrepost',array('sourseId'=>$sourseId,'weiboId'=>$weiboId));?>" style="margin-left:8px ">转发 <?php echo ($repost_count); ?></a>