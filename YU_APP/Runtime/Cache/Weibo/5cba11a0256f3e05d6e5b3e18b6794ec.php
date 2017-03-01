<?php if (!defined('THINK_PATH')) exit();?>    <p class="word-wrap"><?php echo (parse_weibo_content($weibo["content"])); ?></p>
    <div class="popup-gallery"  >
        <?php if(is_array($weibo['weibo_data']['image'])): $i = 0; $__LIST__ = $weibo['weibo_data']['image'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="<?php echo ($vo["big"]); ?>" title="点击查看大图"><img class="lazy" data-original="<?php echo ($vo["small"]); ?>" width="100" height="100" style="margin-right: 7px;margin-bottom: 7px;"></a><?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
<script>
    $("#weibo_<?php echo ($weibo['id']); ?> img.lazy").lazyload({effect: "fadeIn",threshold:200,failure_limit : 100});
    bind_weibo_popup();
</script>