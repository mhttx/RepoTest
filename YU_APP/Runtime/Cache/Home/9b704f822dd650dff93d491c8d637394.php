<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">

<?php echo hook('syncMeta');?>

<?php $oneplus_seo_meta = get_seo_meta($vars,$seo); ?>
<?php if($oneplus_seo_meta['title']): ?><title><?php echo ($oneplus_seo_meta['title']); ?></title>
    <?php else: ?>
    <title><?php echo C('WEB_SITE_TITLE');?></title><?php endif; ?>
<?php if($oneplus_seo_meta['keywords']): ?><meta name="keywords" content="<?php echo ($oneplus_seo_meta['keywords']); ?>"/><?php endif; ?>
<?php if($oneplus_seo_meta['description']): ?><meta name="description" content="<?php echo ($oneplus_seo_meta['description']); ?>"/><?php endif; ?>

<!-- 为了让html5shiv生效，请将所有的CSS都添加到此处 -->
<link href="/app/Public/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="/app/Public/static/qtip/jquery.qtip.css"/>
<link type="text/css" rel="stylesheet" href="/app/Public/Core/js/ext/toastr/toastr.min.css"/>
<link href="/app/Public/Core/css/oneplus.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="/app/Public/Core/js/ext/magnific/magnific-popup.css"/>


<!-- 增强IE兼容性 -->
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/app/Public/static/bootstrap/js/html5shiv.js"></script>
<script src="/app/Public/static/bootstrap/js/respond.js"></script>
<![endif]-->

<!-- jQuery库 -->
<!--[if lt IE 9]>
<script type="text/javascript" src="/app/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/app/Public/static/jquery-2.0.3.min.js"></script>
<!--<![endif]-->

<!--合并前的js-->
<!-- Bootstrap库 -->
<script type="text/javascript" src="/app/Public/static/bootstrap/js/bootstrap.min.js"></script>

<!-- 其他库-->
<script src="/app/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/toastr/toastr.min.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/app/Public/static/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="/app/Public/Core/js/ext/lazyload/lazyload.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/magnific/jquery.magnific-popup.min.js"></script>
<!--CNZZ广告管家，可自行更改-->
<!--<script type='text/javascript' src='http://js.adm.cnzz.net/js/abase.js'></script>-->
<!--CNZZ广告管家，可自行更改end
 自定义js-->
<script type="text/javascript" src="/app/Public/Core/js/core.js"></script>
<!--合并前的js-->
<?php $config = api('Config/lists'); C($config); $icp=C('WEB_SITE_ICP'); $count_code=C('COUNT_CODE'); ?>
<script type="text/javascript">
    var ThinkPHP = window.Think = {
        "ROOT": "/app", //当前网站地址
        "APP": "/app/index.php?s=", //当前项目地址
        "PUBLIC": "/app/Public", //项目公共目录地址
        "DEEP": "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
        "MODEL": ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
        "VAR": ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"],
        'URL_MODEL': "<?php echo C('URL_MODEL');?>",
        'WEIBO_ID': "<?php echo C('SHARE_WEIBO_ID');?>"
    }
</script>

<!-- Bootstrap库 -->
<!--
<?php $js[]=urlencode('/static/bootstrap/js/bootstrap.min.js'); ?>

&lt;!&ndash; 其他库 &ndash;&gt;
<script src="/app/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/toastr/toastr.min.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/app/Public/static/jquery.iframe-transport.js"></script>
-->
<!--CNZZ广告管家，可自行更改-->
<!--<script type='text/javascript' src='http://js.adm.cnzz.net/js/abase.js'></script>-->
<!--CNZZ广告管家，可自行更改end-->
<!-- 自定义js -->
<!--<script src="/app/Public/js.php?get=<?php echo implode(',',$js);?>"></script>-->


<script>
    //全局内容的定义
    var _ROOT_ = "/app";
    var MID = "<?php echo is_login();?>";
    var MODULE_NAME="<?php echo MODULE_NAME; ?>";
    var ACTION_NAME="<?php echo ACTION_NAME; ?>";
    var initNum = "<?php echo C('WEIBO_WORDS_COUNT');?>";
</script>

<audio id="music" src="" autoplay="autoplay"></audio>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>
</head>
<body>
	<!-- 头部 -->
	<?php if((is_login()) ): ?><div id="right_panel" class="friend_panel visible-md visible-lg" style="display: none;">
        <a class="btn-pull" onclick="show_panel()"> <img style="width: 30px" src="/app/Public/Core/images/friend.png"/> </i>
            <script>
                function show_panel() {
                    var $right_panel = $('#right_panel_main');
                    if ($right_panel.text()) {
                        $right_panel.load(U('Usercenter/Session/panel'));
                        $right_panel.toggle();
                    } else {
                        $right_panel.toggle();
                    }

                }
            </script>

            <i id="friend_has_new"
            <?php $map_mid=is_login(); $modelTP=D('talk_push'); $has_talk_push=$modelTP->where("(uid = ".$map_mid." and status = 1) or (uid = ".$map_mid." and status = 0)")->count(); $has_message_push=D('talk_message_push')->where("uid= ".$map_mid." and (status=1 or status=0)")->count(); if($has_talk_push || $has_message_push){ ?>
            style="display: inline-block"
            <?php } ?>
            ></i>

        </a>
        <?php if(count($currentSession) == 0): ?><div id="right_panel_main" style="display: none;">
                <div style="color: white;line-height: 500px;font-size: 16px;padding:10px;">
                    <img src="/app/Public/Core/images/loading.gif"/>
                </div>
            </div>
            <?php else: ?>
            <div id="right_panel_main" style="display: none;" >
                <div style="color: white;line-height: 500px;font-size: 16px;padding:10px;">
                    <img src="/app/Public/Core/images/loading.gif"/>
                </div>
            </div><?php endif; ?>


    </div>
    <!--开始聊天板-->
    <div id="chat_box" style="display: none" class="chat_panel weibo_post_box">
        <div class="panel_title"><img id="chat_ico" class="chat_avatar avatar-img" src="<?php echo ($friend["avatar64"]); ?>">

            <div id="chat_title" class="title pull-left text-more"></div>
            <div class="control_btns pull-right"><a><i onclick="$('#chat_box').hide();"
                                                       class="glyphicon glyphicon-minus"></i></a><!-- <a
                ><i class="glyphicon glyphicon-off"></i></a>--></div>
        </div>
        <div class="row talk-body ">
            <div id="scrollArea_chat" class="row ">
                <div id="scrollContainer_chat">
                </div>
            </div>

        </div>

        <div class="send_box">
            <input id="chat_id" type="hidden" value="0">
            <?php $talk_self=query_user(array('avatar128')); ?>
            <script>
                var myhead = "<?php echo ($talk_self["avatar128"]); ?>";
            </script>
            <textarea id="chat_content" class="form-control"></textarea>

        </div>


        <div class="row">
            <div class="col-md-6">
                <button class=" btn btn-danger" onclick="talker.exit()"
                        style="margin: 10px 10px" title="退出聊天"><i class="glyphicon glyphicon-off"></i>
                </button>
                <!--  <button class=" btn btn-success" onclick="chat_exit()"
                          style="margin: 10px 10px" title="邀请好友"><i class="glyphicon glyphicon-plus"></i>
                  </button>-->
                <a href="javascript:" onclick="insertFace($(this))"><img class="weibo_type_icon" src="/app/Public/static/image/bq.png"/></a>
            </div>
            <div class="col-md-6">

                <button class="pull-right btn btn-primary" onclick="talker.post_message()"
                        style="margin: 10px 10px"> 发送 Ctrl+Enter
                </button>
            </div>
            <div id="emot_content" class="emot_content" style="margin-top: -165px;margin-left: -415px;"></div>


        </div>
    </div>
    <?php else: ?>
    <div id="right_panel" class="friend_panel visible-md visible-lg" style="display: none;">
        <a class="btn-pull" onclick="toast.error('请登陆后使用好友面板。','温馨提示')"> <img style="width: 30px" src="/app/Public/Core/images/friend.png"/> </i>
        </a>
    </div><?php endif; ?>

<?php D('Home/Member')->need_login(); ?>
<!--[if lt IE 8]>
<div class="alert alert-danger" style="margin-bottom: 0">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a target="_blank" href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<div id="top_bar" class="top_bar">
    <div class="container">
        <div class="row  ">
            <?php if(is_login()): else: ?>
                <div class="col-xs-6 text-center visible-xs">
                    <a href="<?php echo U('Home/User/login');?>" style="padding-top: 10px;display: block;font-size: 16px;color: #ccc !important;">登录</a>
                </div>
                <div class="col-xs-6 text-center visible-xs">
                    <a href="<?php echo U('Home/User/register');?>" style="padding-top: 10px;display: block;font-size: 16px;color: #ccc!important;">注册</a>
                </div><?php endif; ?>
            <div class="col-md-6 col-sm-6 hidden-xs">
               <?php if(C('SHARE_WEIBO_ID') != ''): ?>分享<a class="share_weibo" id="weibo_shareBtn" target="_blank"></a>
                   <script>
                       $(function () {
                           weiboShare();//处理微博分享
                       })
                   </script><?php endif; ?>
            </div>
            <div class="col-md-6 col-xs-12  text-right top_right">
                <?php $unreadMessage=D('Common/Message')->getHaventReadMeassageAndToasted(is_login()); ?>

                <ul class="nav navbar-nav navbar-right">
                    <!-- <li>
                         &lt;!&ndash;换肤功能预留&ndash;&gt;
                        <a>换肤</a>
                        &lt;!&ndash;换肤功能预留end&ndash;&gt;
                    </li>-->
                    <!--登陆面板-->
                    <?php if(is_login()): ?><li class="dropdown op_nav_ico hidden-xs hidden-sm">
                            <div></div>
                            <a id="nav_info" class="dropdown-toggle text-left" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-bell"></span>
                                <span id="nav_bandage_count"
                                <?php if(count($unreadMessage) == 0): ?>style="display: none"<?php endif; ?>
                                class="badge pull-right"><?php echo count($unreadMessage);?></span>
                                &nbsp;
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <li style="padding-left: 15px;padding-right: 15px;">
                                    <div class="row nav_info_center">
                                        <div class="col-xs-9 nav_align_left"><span
                                                id="nav_hint_count"><?php echo count($unreadMessage);?></span> 条未读
                                        </div>
                                        <div class="col-xs-3"><i onclick="setAllReaded()"
                                                                 class="set_read glyphicon glyphicon-ok"
                                                                 title="全部标为已读"></i></div>
                                    </div>
                                </li>
                                <li>
                                    <div style="position: relative;width: auto;overflow: hidden;max-height: 250px ">
                                        <ul id="nav_message" class="dropdown-menu-list scroller "
                                            style=" width: auto;">
                                            <?php if(count($unreadMessage) == 0): ?><div style="font-size: 18px;color: #ccc;font-weight: normal;text-align: center;line-height: 150px">
                                                    暂无任何消息!
                                                </div>
                                                <?php else: ?>
                                                <?php if(is_array($unreadMessage)): $i = 0; $__LIST__ = $unreadMessage;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$message): $mod = ($i % 2 );++$i;?><li>
                                                        <a data-url="<?php echo ($message["url"]); ?>"
                                                           onclick="readMessage(this,<?php echo ($message["id"]); ?>)">
                                                            <i class="glyphicon glyphicon-bell"></i>
                                                            <?php echo ($message["title"]); ?>
                                            <span class="time">
                                            <?php echo ($message["ctime"]); ?>
                                            </span>
                                                        </a>
                                                    </li><?php endforeach; endif; else: echo "" ;endif; endif; ?>

                                        </ul>
                                    </div>
                                </li>
                                <li class="external">
                                    <a href="<?php echo U('Usercenter/Message/message');?>">
                                        消息中心 <i class="glyphicon glyphicon-circle-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a style="margin-right: 15px;" title="修改资料" href="<?php echo U('Usercenter/Config/index');?>"><i
                                    class="glyphicon glyphicon-cog"></i></a>
                        </li>
                        <li class="top_spliter hidden-xs"></li>
                        <li class="dropdown">
                            <?php $common_header_user = query_user(array('nickname')); ?>
                            <a role="button" class="dropdown-toggle dropdown-toggle-avatar" data-toggle="dropdown">
                                <?php echo ($common_header_user["nickname"]); ?>&nbsp;<i style="font-size: 12px"
                                                                       class="glyphicon glyphicon-chevron-down"></i>
                            </a>
                            <ul class="dropdown-menu text-left" role="menu">
                                <li><a href="<?php echo U('UserCenter/Index/index');?>"><span
                                        class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人主页</a>
                                </li>
                                <li><a href="<?php echo U('Usercenter/message/message');?>"><span
                                        class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;消息中心</a>
                                </li>
                                <li><a href="<?php echo U('Usercenter/Collection/index');?>"><span
                                        class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;我的收藏</a>
                                </li>

                                <li><a href="<?php echo U('Usercenter/Index/rank');?>"><span
                                        class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;我的头衔</a>
                                </li>
                                <?php echo hook('personalMenus');?>
                                <?php if(is_administrator()): ?><li><a href="<?php echo U('Admin/Index/index');?>" target="_blank"><span
                                            class="glyphicon glyphicon-dashboard"></span>&nbsp;&nbsp;管理后台</a></li><?php endif; ?>
                                <li><a event-node="logout"><span
                                        class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;注销</a>
                                </li>
                            </ul>
                        </li>
                        <li class="top_spliter hidden-xs"></li>
                        <?php else: ?>
                        <li class="top_spliter hidden-xs"></li>
                        <li class="hidden-xs">
                            <a href="<?php echo U('Home/User/login');?>">登录</a>
                        </li>
                        <li class="hidden-xs">
                            <a href="<?php echo U('Home/User/register');?>">注册</a>
                        </li>
                        <li class="spliter hidden-xs"></li><?php endif; ?>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="logo_bar" class="logo_bar" style="background: #03AE87">
    <div class="container">
        <div class="row logo">
            <div class="col-md-9">
                <a href="<?php echo U('Home/Index/index');?>"><img src="/app/Public/Core/images/logo.png"/></a>
            </div>
            <div class="col-md-3 hidden-xs">
                    <div class="pull-right text-right" style="padding-top:4px;">
                        <form class="navbar-form navbar-right search_bar" role="search" id="forum_search" method="post">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="keywords" placeholder="查找">

                                    <div class="input-group-btn text-left">
                                        <button type="button" class="btn btn-default dropdown-toggle"
                                                style="border-left: none;border-top-left-radius: 0;border-bottom-left-radius: 0"
                                                data-toggle="dropdown"><span class="glyphicon glyphicon-search"></span>
                                        </button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a class="submit_search weibo_search" url="<?php echo U('Weibo/Index/search');?>">微博</a></li>
                                            <li><a class="submit_search" url="<?php echo U('Forum/Index/search');?>">论坛</a></li>
                                            <!-- <li><a class="submit_search">活动</a></li>-->
                                            <li><a class="submit_search" url="<?php echo U('People/Index/find');?>">会员</a></li>
                                        </ul>
                                    </div>
                                    <script>
                                        $(function () {
                                            $('#forum_search').attr('action', $('.weibo_search').attr('url'));
                                            $('.submit_search').click(function () {
                                                $('#forum_search').attr('action', $(this).attr('url'));
                                                $('#forum_search').submit();
                                            });
                                        })
                                    </script>
                                </div>
                            </div>
                        </form>
                    </div>
            </div>

        </div>
    </div>
</div>
<div id="nav_bar" class="nav_bar " style="margin-bottom: 25px;">
    <nav class="container" id="nav_bar_container" role="navigation">
        <div class="collapse navbar-collapse " id="nav_bar_main">

            <ul class="nav navbar-nav  " style="font-size: 16px">
                <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): $children=D('Channel')->where(array('pid'=>$nav['id']))->order('sort asc')->select(); if($children){ ?>
                        <li class="dropdown">
                            <a class="dropdown-toggle nav_item" data-toggle="dropdown" href="#" style="color:<?php echo ($nav["color"]); ?>">

                                <?php echo ($nav["title"]); ?> <span class="caret"></span><?php if(($nav["band_text"]) != ""): ?><span class="badge" style="background: <?php echo ($nav["band_color"]); ?>"><?php echo ($nav["band_text"]); ?></span><?php endif; ?>
                            </a>
                            <ul class="dropdown-menu">
                                <?php if(is_array($children)): $i = 0; $__LIST__ = $children;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subnav): $mod = ($i % 2 );++$i;?><li role="presentation"><a role="menuitem" tabindex="-1" style="color:<?php echo ($subnav["color"]); ?>"
                                                               href="<?php echo (get_nav_url($subnav["url"])); ?>"
                                                               target="<?php if(($subnav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($subnav["title"]); if(($subnav["band_text"]) != ""): ?><span class="badge" style="background: <?php echo ($subnav["band_color"]); ?>"><?php echo ($subnav["band_text"]); ?></span><?php endif; ?></a>
                                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul>
                        </li>
                        <?php }else{ ?>
                        <li class="<?php if((get_nav_active($nav["url"])) == "1"): ?>active<?php else: endif; ?>">
                            <a href="<?php echo (get_nav_url($nav["url"])); ?>"
                               target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>" style="color:<?php echo ($nav["color"]); ?>"><?php echo ($nav["title"]); if(($nav["band_text"]) != ""): ?><span class="badge" style="background: <?php echo ($nav["band_color"]); ?>"><?php echo ($nav["band_text"]); ?></span><?php endif; ?></a>
                        </li>
                        <?php } endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>

        </div>

        <!--导航栏菜单项-->

        <div class="row visible-xs">
            <div class="navbar-header col-xs-3 pull-right text-left">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav_bar_main">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
        </div>


    </nav>
</div>

<a id="goTopBtn"></a>
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div id="main-container" class="container">
    <div class="row" >
        
    <section>
        <div class="col-xs-10 col-xs-offset-1 register" style="margin-top: 60px;margin-bottom: 120px;">
            <div class="col-xs-12"><h1 style="font-size: 18px;color: #333333;">欢迎注册<?php echo C('WEB_SITE');?>账号</h1></div>
            <div class="col-xs-12 rg_go">
                <div class="col-sm-4 col-xs-6" style="position: relative;padding: 0;margin-bottom: 20px;">
                    <img src="/app/Public/Home/images/start_image.png" class="img-responsive" alt="" style="height: 40px;">

                    <div style="margin-top: -35px;color: white;line-height: 30px;font-size: 16px;margin-left: 21px;">
                        填写用户信息
                    </div>
                </div>
                <?php $src_upload=$src_finish="/app/Public/Home/images/todo_image.png"; if($type=="upload"){ $src_upload="/app/Public/Home/images/finish_image.png"; }elseif($type=="finish"){ $src_upload=$src_finish="/app/Public/Home/images/finish_image.png"; } ?>
                <div class="col-sm-4 col-xs-6" style="position: relative;padding: 0;">
                    <img src="<?php echo ($src_upload); ?>" class="img-responsive" alt="" style="height: 40px;">

                    <div style="margin-top: -35px;color: white;line-height: 30px;font-size: 16px;margin-left: 21px;">
                        上传头像（可跳过）
                    </div>
                </div>
                <div class="col-sm-4 col-xs-6 col-sm-offset-0 col-xs-offset-6" style="position: relative;padding: 0;">
                    <img src="<?php echo ($src_finish); ?>" class="img-responsive" alt="" style="height: 40px;">

                    <div style="margin-top: -35px;color: white;line-height: 30px;font-size: 16px;margin-left: 21px;">
                        注册完成
                    </div>
                </div>
            </div>
            <style>
                input{
                    display: inline-block;
                }
            </style>
            <?php if($type == 'start'): ?><div class="col-xs-12 col-md-6">
                    <form class="" action="/app/index.php?s=/home/user/step3.html" method="post">
                        <div class="form-group">
                            <label for="username" class=".sr-only col-xs-12" style="display: none"></label>
                            <input type="text" id="username" onblur="setNickname(this);" class="form-control" placeholder="请输入用户名"
                                   ajaxurl="/member/checkUserNameUnique.html" errormsg="请填写4-16位用户名"
                                   nullmsg="请填写用户名"
                                   datatype="*4-16" value="" name="username">
                            <span class="help-block">输入用户名，只允许字母和数字和下划线</span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group">
                            <label for="nickname" class=".sr-only col-xs-12" style="display: none"></label>
                            <input type="text" id="nickname" class="form-control" placeholder="请输入昵称"
                                   ajaxurl="/member/checkNickNameUnique.html" errormsg="请填写2-16位昵称"
                                   nullmsg="请填写昵称"
                                   datatype="*2-16" value="" name="nickname">

                            <span class="help-block">输入昵称，只允许中文、字母和数字和下划线</span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class=".sr-only col-xs-12" style="display: none"></label>
                            <input type="text" id="inputEmail" class="form-control" placeholder="请输入电子邮件"
                                   ajaxurl="/member/checkUserEmailUnique.html" errormsg="请填写正确格式的邮箱" nullmsg="请填写邮箱"
                                   datatype="e" value="" name="email">
                            <span class="help-block">输入邮箱地址</span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group">
                            <div id="password_block" class="input-group">
                                <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码"
                                       errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-20" name="password">

                                <div class="input-group-addon"><a style="width: 100%;height: 100%"
                                                                  href="javascript:void(0);"
                                                                  onclick="change_show(this)">show</a></div>
                            </div>
                            <span class="help-block">请输入密码</span>
                            <div class="clearfix"></div>
                        </div>
                        <?php if(C(VERIFY_OPEN) == 1 OR C(VERIFY_OPEN) == 2): ?><div class="form-group">
                                <label for="verifyCode" class=".sr-only col-xs-12" style="display: none"></label>

                                <div class="col-xs-4" style="padding: 0px;">
                                    <input type="text" id="verifyCode" class="form-control" placeholder="验证码"
                                           errormsg="请填写正确的验证码" nullmsg="请填写验证码" datatype="*5-5" name="verify">
                                    <span class="help-block">输入验证码</span>
                                </div>
                                <div class="col-xs-8 lg_lf_fm_verify">
                                    <img class="verifyimg reloadverify img-responsive" alt="点击切换" src="<?php echo U('verify');?>"
                                         style="cursor:pointer;">
                                </div>
                                <div class="col-xs-12 Validform_checktip text-warning lg_lf_fm_tip"></div>
                                <div class="clearfix"></div>
                            </div><?php endif; ?>
                        <div style="float: left;vertical-align: bottom;margin-top: 12px;color: #848484;">
                            已有账户， <a href="<?php echo U('Home/User/login');?>" title="" style="color: #03B38B;">登录</a>
                        </div>
                        <button type="submit" class="btn btn-primary pull-right">提 交</button>
                    </form>
                </div><?php endif; ?>
            <?php if($type == 'upload'): ?><style>
        .jcrop-holder > div > div {
            border-radius: 50%;
        }
    </style>


    <?php $user = query_user(array('avatar128')); ?>

        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-top: 20px">
            <div class="thumbnail" style="padding: 16px;">
                <img src="<?php echo ($user["avatar128"]); ?>" class="avatar-img" style="width: 128px;height: 128px"/>
            </div>
        </div>
        <div class="col-xs-8 col-lg-offset-1" style="margin-top: 20px;">
            <p class="text-warning">设置新头像</p>

            <p class="text-muted">支持jpg，png，gif，bmp等格式，可以在大照片中裁剪比较满意的部分</p>

            <form action="<?php echo U('UserCenter/Config/doUploadAvatar');?>" id="avatar_form" method="post"
                  enctype="multipart/form-data">
                <?php if(is_ie()): ?><input type="file" class="btn btn-default" name="image"/>
                    <?php else: ?>
                    <p class="hide">
                        <input type="file" name="image"/>
                    </p>

                    <div class="btn btn-primary" id="select_file_button">选择文件</div><?php endif; ?>
                <p class="text-error" id="submitTip"></p>
            </form>
            <p id="upload_tip" class="text-danger"></p>

            <div id="uploaded_image_div" style="display: none;">
                <div class="thumbnail" style="width: 410px;">
                    <img id="uploaded_image" style="width: 100%;" class="thumbnails"/>
                </div>
                <p class="text-danger" id="save_avatar_tip"></p>
                <p>
                    <a class="btn btn-primary" id="save_avatar_button" data-url="<?php echo U('Home/User/doCropAvatar');?>">选区裁剪后保存头像</a>
                </p>
            </div>
        </div>
        <div class="clearfix visible-md-block"></div>
        <div class="col-xs-4"><a class="btn btn-default" href="<?php echo U('Home/User/step3');?>" title="">跳过此步骤</a></div>



    <link rel="stylesheet" type="text/css" href="/app/Public/static/jcrop/jquery.Jcrop.css"/>
    <script src="/app/Public/static/jcrop/jquery.Jcrop.js"></script>
    <script src="/app/Public/static/browser/jquery.browser.js"></script>
    <script>
        var temp;

        $(function () {
            var crop;
            var jcrop_api;
            //选择图片文件之后立即上传表单
            $('[name=image]').change(function () {
                $('#avatar_form').submit();
            });

            $('#avatar_form').submit(function (e) {
                e.preventDefault();

                $.ajax(this.action, {
                    files: $(":file", this),
                    iframe: true,
                    processData: false
                }).complete(function (data) {
                    var json = data.responseJSON;

                    $('#avatar_form').trigger('onJson', [json])
                });
            });

            //头像上传后显示图片内容
            $('#avatar_form').bind('onJson', function (e, json) {
                //如果发生错误，则显示错误信息
                if (!json.success) {
                    $('#upload_tip').text(json.message);
                }

                //隐藏图片上传表单
                $('#avatar_form').hide();

                //显示图片内容
                $('#uploaded_image').attr('src', json.image);
                $('#uploaded_image_div').show();

                //图片加载完之后 开启图片切割
                $('#uploaded_image').load(function () {
                    $('#uploaded_image').Jcrop({
                        aspectRatio: 1,
                        onSelect: updateCoordinate,
                        minSize: [64,64],
                        setSelect: [0,0,366,366]
                    },function(){
                        jcrop_api=this;
                        crop=jcrop_api.tellScaled();
                    });


                })
            });
            function updateCoordinate(c) {
                crop = c;
            }

            //点击选择文件按钮之后显示选择文件对话框
            $('#select_file_button').click(function () {
                $('[name=image]').trigger('click');
            });

            //点击保存头像后
            function showAvatarTip(text) {
                $('#save_avatar_tip').text(text);
            }

            $('#save_avatar_button').click(function () {
                //检查是否已经裁剪过
                if (crop.w == undefined || crop.w == 0) {
                    showAvatarTip('请先选出图片中需要的部分');
                    return;
                }

                //显示正在保存
                $(this).text('正在保存');
                $(this).addClass('disabled');

                //隐藏错误消息
                showAvatarTip('');

                //提交到服务器
                var url = $(this).attr('data-url');
                var imageWidth = $('.jcrop-holder img').width();
                var imageHeight = $('.jcrop-holder img').height();
                var crop2 = crop.x / imageWidth + ',' + crop.y / imageHeight + ',' + crop.w / imageWidth + ',' + crop.h / imageHeight;
                $.post(url, {crop: crop2}, function (a) {
                    if (a.status) {
                        if(a.url){
                            location.href = a.url;
                        }
                    } else {
                        showAvatarTip(a.info);

                        //恢复按钮
                        $('#save_avatar_button').text('保存头像');
                        $('#save_avatar_button').removeClass('disabled');
                    }
                });
            })
        })
    </script><?php endif; ?>
            <?php if($type == 'finish'): ?><div class="col-xs-12" style="font-size: 16px;margin-top: 30px;">
                    <span>感谢您注册 <?php echo C('WEB_SITE');?> ，希望你玩的愉快！ <a href="<?php echo U('Usercenter/Config/index');?>" title="">完善个人资料</a> 或 <a href="<?php echo U('Weibo/Index/index');?>" title="">前往首页</a></span>
                </div><?php endif; ?>
        </div>
    </section>

    </div>
</div>

<script type="text/javascript">
    $(function(){
        $(window).resize(function(){
            $("#main-container").css("min-height", $(window).height() - 343);
        }).resize();
    })
</script>
	<!-- /主体 -->

	<!-- 底部 -->
	<!-- 底部
================================================== -->
<div style="padding: 5px"></div>
<div class="footer-jumbotron footer_bar">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div><h2><a href="http://www.ourstu.com" target="_blank"><?php echo C('FOOTER_TITLE');?></a></h2>

                    <p class="han_p"><?php echo C('FOOTER_SUMMARY');?>
                    </p>

                    <div class="row">


                        <?php if(!empty($icp)): ?><div class="col-xs-6">备案号：<a href="http://www.miitbeian.gov.cn/" target="_blank"><?php echo ($icp); ?></a>
                            </div><?php endif; ?>
                        <div class="col-xs-6 text-right">
                            <!--// 如未获得thinkox官方授权，请勿删除此处的文字和链接 购买请查看 http://tox.ourstu.com/fee.html -->
                            <a href="http://tox.ourstu.com/" target="_blank">Powered By ThinkOX</a>
                            <!--// 如未获得thinkox官方授权，请勿删除此处的文字和链接 购买请查看 http://tox.ourstu.com/fee.html end -->
                        </div>
                        <div class="col-md-12">
                            <?php echo ($count_code); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="footer_right">
                    <?php echo C('FOOTER_RIGHT');?>
                </div>
            </div>
            <div class="col-md-2">
                <?php echo C('FOOTER_QCODE');?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/app/Public/Core/js/ext/placeholder/placeholder.js"></script>
<script type="text/javascript" src="/app/Public/Core/js/ext/atwho/atwho.js"></script>
<link type="text/css" rel="stylesheet" href="/app/Public/Core/js/ext/atwho//atwho.css"/>


    <script type="text/javascript">
        if(MID==0){
            $(document)
                    .ajaxStart(function () {
                        $("button:submit").addClass("log-in").attr("disabled", true);
                    })
                    .ajaxStop(function () {
                        $("button:submit").removeClass("log-in").attr("disabled", false);
                    });
            $("form").submit(function () {
                var self = $(this);
                $.post(self.attr("action"), self.serialize(), success, "json");
                return false;

                function success(data) {
                    if (data.status) {
                        setTimeout(function () {
                            window.location.href = data.url
                        }, 10);
                    } else {
                        toast.error(data.info, '温馨提示');
                        //self.find(".Validform_checktip").text(data.info);
                        //刷新验证码
                        $(".reloadverify").click();
                    }
                }
            });

            function change_show(obj) {
                if ($(obj).text().trim() == 'show') {
                    var value = $('#inputPassword').val().trim();
                    var html = '<input type="text" value="' + value + '" id="inputPassword" class="form-control" placeholder="请输入密码" errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-20" name="password">' +
                            '<div class="input-group-addon"><a style="width: 100%;height: 100%" href="javascript:void(0);" onclick="change_show(this)">hide</a></div>';
                    $('#password_block').html(html);
                } else {
                    var value = $('#inputPassword').val().trim();
                    var html = '<input type="password" value="' + value + '" id="inputPassword" class="form-control" placeholder="请输入密码" errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-20" name="password">' +
                            '<div class="input-group-addon"><a style="width: 100%;height: 100%" href="javascript:void(0);" onclick="change_show(this)">show</a></div>';
                    $('#password_block').html(html);
                }
            }




            function setNickname(obj){
                var text= jQuery.trim( $(obj).val());
                if(text!=null&&text!=''){
                    $('#nickname').val(text);
                }
            }

            $(function () {
                var verifyimg = $(".verifyimg").attr("src");
                $(".reloadverify").click(function () {
                    if (verifyimg.indexOf('?') > 0) {
                        $(".verifyimg").attr("src", verifyimg + '&random=' + Math.random());
                    } else {
                        $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/, '') + '?' + Math.random());
                    }
                });
            });
        }
    </script>
 <!-- 用于加载js代码 -->
<script>
    $(function() {
        $("img.lazy").lazyload({effect: "fadeIn",threshold:200,failure_limit : 100});
    });
</script>
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
    
</div>

	<!-- /底部 -->
</body>
</html>