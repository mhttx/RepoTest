<?php if (!defined('THINK_PATH')) exit();?><div class="span<?php echo ($addons_config["width"]); ?>">
    <div class="columns-mod">
        <div class="hd cf">
            <h5>关于ThinkOX</h5>

            <div class="title-opt">
            </div>
        </div>
        <div class="bd">
            <div class="sys-info">
                <table>
                    <tr>
                        <th>ThinkOX产品研发团队</th>
                        <td>陈一枭 肖骏涛 郑钟良 蔡培超 顾乾斌 韩永斌</td>
                    </tr>
                    <tr>
                        <th>ThinkOX官方网址</th>
                        <td>产品主页 <a href="http://www.thinkox.com" target="_blank">：www.thinkox.com</a> | ThinkOX BUG反馈：
                            <a href="http://www.thinkox.com/tox/Forum/Index/forum/id/3.html"
                               target="_blank">ThinkOX讨论区</a></td>

                    </tr>
                    <tr>
                        <th>ThinkOXQQ群</th>
                        <td>开发者群 <a target="_blank" href="http://jq.qq.com/?_wv=1027&k=SG3vsw"> <img
                                style="vertical-align: middle" border="0"
                                src="http://pub.idqqimg.com/wpa/images/group.png"
                                alt="ThinkOX开发者群" title="ThinkOX开发者群"></a>
                            &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 站长群 <a target="_blank"
                                                                         href="http://jq.qq.com/?_wv=1027&k=UPotWV"><img
                                    style="vertical-align: middle" border="0"
                                    src="http://pub.idqqimg.com/wpa/images/group.png"
                                    alt="ThinkOX开发者群" title="ThinkOX开发者群"></a>
                        </td>
                    </tr>


                    <tr>
                        <script>
                            $(function () {
                                check();
                            })
                            function check() {
                                $('#condition').load('http://www.thinkox.com/tox/index.php?s=customer/index/check');
                                $('#latest_version').load('http://www.thinkox.com/tox/index.php?s=customer/index/version');
                            }
                        </script>
                        <th>授权状态</th>
                        <td id="condition">
                            查询中，请稍候...
                        </td>
                    </tr>
                    <tr>
                        <th>升级管理</th>


                        <td><a href="<?php echo U('Admin/Update/quick');?>"><strong>点此查看补丁包</strong></a>
                        </td>
                    </tr>
                    <tr>
                        <th>ThinkOX版本号：</th>
                        <td>
                            <?php echo file_get_contents('version.txt'); ?> 【最新版本号：<span id="latest_version">查询中...</span>】
                        </td>
                    </tr>
                    <tr>
                        <th>其他</th>
                        <td><a style="width: 40%;float: left" onclick="$.get('cc.php');alert('缓存清理成功。')" class="btn">清理缓存</a>

                            <a style="width: 40%;float: left" class="btn" href="http://www.thinkox.com/fee.html"
                               target="_blank">购买商业版</a></td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</div>