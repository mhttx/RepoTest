<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>ThinkOX 安装</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le styles -->
        <link href="/v/Public/static/bootstrap2/css/bootstrap.css" rel="stylesheet">
        <link href="/v/Public/static/bootstrap2/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="/v/Public/Install/css/install.css" rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
        <![endif]-->
        <script src="/v/Public/static/jquery-1.10.2.min.js"></script>
        <script src="/v/Public/static/bootstrap/js/bootstrap.js"></script>
    </head>

    <body data-spy="scroll" data-target=".bs-docs-sidebar">
        <!-- Navbar
        ================================================== -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="brand" target="_blank" href="http://www.thinkox.com">ThinkOX</a>
                    <div class="nav-collapse collapse">
                    	<ul id="step" class="nav">
                    		
    <li class="active"><a href="javascript:;">安装协议</a></li>
    <li><a href="javascript:;">环境检测</a></li>
    <li><a href="javascript:;">创建数据库</a></li>
    <li><a href="javascript:;">安装</a></li>
    <li><a href="javascript:;">完成</a></li>

                    	</ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="jumbotron masthead">
            <div class="container">
                
    <h1>ThinkOX V1 安装协议</h1>

    <p>版权所有 (c) 2014，嘉兴想天信息科技有限公司保留所有权利。</p>

    <p>ThinkOX基于<a target="_blank" href="http://www.onethink.cn">OneThink</a>的二次开发产品。感谢顶想公司为ThinkOX提供内核支持。</p>

    <p>感谢您选择ThinkOX，希望我们的努力可以为您创造价值。公司网址为 <a href="http://www.ourstu.com" target="_blank">http://www.ourstu.com</a>，产品官方网站网址为
        <a href="http://tox.ourstu.com" target="_blank">http://tox.ourstu.com</a>。</p>

    <p>
        用户须知：本协议是您于嘉兴想天信息科技有限公司关于ThinkOX产品使用的法律协议。无论您是个人或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，包括免除或者限制嘉兴想天信息科技有限公司责任的免责条款及对您的权利限制。请您审阅并接受或不接受本服务条款。如您不同意本服务条款及或嘉兴想天信息科技有限公司随时对其的修改，您应不使用或主动取消ThinkOX产品。否则，您的任何对ThinkOX的相关服务的注册、登陆、下载、查看等使用行为将被视为您对本服务条款全部的完全接受，包括接受嘉兴想天信息科技有限公司对服务条款随时所做的任何修改。</p>

    <p>本服务条款一旦发生变更,嘉兴想天信息科技有限公司将在产品官网上公布修改内容。修改后的服务条款一旦在网站公布即有效代替原来的服务条款。您可随时登陆官网查阅最新版服务条款。如果您选择接受本条款，即表示您同意接受协议各项条件的约束。如果您不同意本服务条款，则不能获得使用本服务的权利。您若有违反本条款规定，嘉兴想天信息科技有限公司工作室有权随时中止或终止您对ThinkOX产品的使用资格并保留追究相关法律责任的权利。</p>

    <p>在理解、同意、并遵守本协议的全部条款后，方可开始使用ThinkOX产品。您也可能与嘉兴想天信息科技有限公司直接签订另一书面协议，以补充或者取代本协议的全部或者任何部分。</p>

    <p>嘉兴想天信息科技有限公司拥有ThinkOX的知识产权，包括商标和著作权。本软件只供许可协议，并非出售。想天只允许您在遵守本协议各项条款的情况下复制、下载、安装、使用或者以其他方式受益于本软件的功能或者知识产权。</p>


            </div>
        </div>


        <!-- Footer
        ================================================== -->
        <footer class="footer navbar-fixed-bottom">
            <div class="container">
                <div>
                	
    <a class="btn btn-primary btn-large" href="<?php echo U('Install/step1');?>">同意安装协议</a>
    <a class="btn btn-large" style="background: white;border-radius: 0.3em;width: 100px" href="http://tox.ourstu.com">不同意</a>

                </div>
            </div>
        </footer>
    </body>
</html>