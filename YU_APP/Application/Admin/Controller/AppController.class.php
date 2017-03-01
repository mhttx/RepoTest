<?php
namespace Admin\Controller;
use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminSortBuilder;
use Think\Upload;
class AppController extends AdminController
{
    public function app($page = 1, $r = 20){
    $list = M('AppApp')->where()->page($page, $r)->order('id desc')->select();
    $totalCount = M('AppApp')->count();
    $builder = new AdminListBuilder();
    $builder->title('App管理')
            ->setStatusUrl(U('setStatus'))->buttonEnable()->buttonDisable()
            ->keyId()->keyLink('version', '版本', 'appdetail?id=###')->keyCreateTime($name='update_time',$title='更新时间')->key($name='download_count',$title='下载量')->keyStatus()
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }
    public function setStatus($ids, $status)
    {
        $builder = new AdminListBuilder();
        $builder->doSetStatus('AppApp', $ids, $status);
    }
    public function appdetail($id = 0)
    {
        $map['id'] = $id;
        $model = M('AppApp');
        $list = $model->where($map)->select();
        $builder = new AdminListBuilder();
        $builder->title('App详情')
            ->setStatusUrl(U('setStatus'))->buttonEnable()->buttonDisable()->buttonDelete()
            ->keyId()->keyText('version', '版本')->keyText($name='name',$title='名字')
            ->keyText($name='version_code',$title='版本号')
            ->keyText($name='update_info',$title='更新信息')
            ->keyText($name='download_count',$title='下载量')
            ->keyDoActionEdit('editapp?id=###')
            ->keyCreateTime($name='update_time',$title='更新时间')
            ->data($list)
            ->display();
    }
    public function editapp($id)
    {
        $app = M('AppApp')->where(array('id' => $id))->find();
        $builder = new AdminConfigBuilder();
        $builder->title('编辑app信息')
             ->keyId()->keyTextArea('version', 'app版本')
             ->keyTextArea('name','app名字')
            ->keyTextArea('version_code','app版本号')
            ->keyTextArea('update_info','app更新信息')
            ->keyCreateTime('update_time','更新时间')
            ->keyStatus()
            ->buttonSubmit(U('doEditapp'))->buttonBack()
            ->data($app)
            ->display();
    }

    public function doEditapp($id, $version, $name,$version_code,$update_info, $update_time,$status)
    {
        $data = array('version' => $version,'name' => $name,'version_code' => $version_code,'update_info' => $update_info, 'update_time' => $update_time, 'status' => $status);
        $model = M('AppApp');
        $result = $model->where(array('id' => $id))->save($data);
        if (!$result) {
            $this->error('编辑失败');
        }

        //返回成功信息
        $this->success('编辑成功', U('app'));
    }
    public function appupload(){
        if(isset($_POST['sub'])){
        $config = array(
        'mimes'         =>  array(), //允许上传的文件MiMe类型
        'maxSize'       =>  0, //上传的文件大小限制 (0-不做限制)
        'exts'          =>  array('apk','ios','cpp','txt'), //允许上传的文件后缀
        'autoSub'       =>  true, //自动子目录保存文件
        'subName'       =>  array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath'      =>     './Uploads/', //保存根路径
        'savePath'      =>  '/file/', //保存路径
        'saveName'      =>  array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'       =>  '', //文件保存后缀，空则使用原后缀
        'replace'       =>  false, //存在同名是否覆盖
        'hash'          =>  true, //是否生成hash编码
        'callback'      =>  false, //检测文件是否存在回调，如果存在返回文件信息数组
        'driver'        =>  '', // 文件上传驱动
        'driverConfig'  =>  array(), // 上传驱动配置
          );
        $file = new Upload($config);
        $fileinfo=$file->uploadOne($_FILES['file']);
        $model = M('File');
        $filedata = array('name'=>$fileinfo['name'],'savename'=>$fileinfo['savename'],'savepath'=>$fileinfo['savepath'],'ext'=>$fileinfo['ext'],'mime'=>'application/vnd.android','size'=>$fileinfo['size'],'md5'=>$fileinfo['md5'],'sha1'=>$fileinfo['sha1'],'location'=>'','driver'=>'');
        $fileid = $model->add($filedata);
        if(!$fileid){ 
            //echo '文件写入错误!';
           $this->error('文件写入错误!');
           //$this->ajaxReturn('',0,'文件写入错误!');
           exit;
        }
        $appdata = array('version'=>$_POST['appversion'],'name'=>$_POST['appname'],'version_code'=>$_POST['appversion_code'],'update_info'=>$_POST['appupdate_info'],'update_time'=>time(),'download_count'=>0,'app_path'=>'./Uploads'.$fileinfo['savepath'].$fileinfo['savename'],'aid'=>$fileid,'status'=>1);
        $appid = M('AppApp')->add($appdata);
        if(!$appid){
            //echo 'app信息写入错误!';
           $this->error('app信息写入错误!');
           //$this->ajaxReturn('',0,'app信息写入错误!');
           exit;
        }
        $this->success('app上传成功!', U('app'));
        }
        $builder = new AdminListBuilder();
        $builder->title('App上传')->setfilePostUrl(U('appupload'))
            ->display('admin_listapp');  
    }  
   public function feedback($page=1,$r=10)
    {
        //读取反馈消息列表
        $map = array('status' => array('EGT', 0));
        $model = M('AppFeedback');
        $list = $model->where($map)->order('fb_time desc')->page($page,$r)->select();
        $totalCount = $model->where($map)->count();
        //显示页面
        $builder = new AdminListBuilder();
        $builder->title('反馈消息管理')
            ->setStatusUrl(U('setAppFeedbackStatus'))->buttonEnable()->buttonDisable()->buttonDelete()
            ->keyId()->keyLink('content', '内容', 'Feedbackdetail?id=###')->keyUid()->keyCreateTime($name = 'fb_time', $title = '反馈时间')->keyStatus()
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }
    public function feedbackTrash($page = 1, $r = 20)
    {
        $builder = new AdminListBuilder();
        $builder->clearTrash('AppFeedback');
        //读取反馈消息列表
        $map = array('status' => -1);
        $model = M('AppFeedback');
        $list = $model->where($map)->page($page, $r)->select();
        $totalCount = $model->where($map)->count();
        //显示页面
        $builder->title('反馈消息回收站')
            ->buttonRestore()->buttonClear('AppFeedback')
            ->keyId()->keyLink('content', '内容', 'Feedbackdetail?id=###')->keyUid()->keyCreateTime()
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }
    public function setAppFeedbackStatus($ids, $status)
    {
        $builder = new AdminListBuilder();
        $builder->doSetStatus('AppFeedback', $ids, $status);
    }
    public function Feedbackdetail($id=1){
        $map = array('status' => array('EGT', 0));
        $map['id'] = $id;
        $model = M('AppFeedback');
        $list = $model->where($map)->select();
        $builder = new AdminListBuilder();
        $builder->title('反馈消息详情')
            ->buttonEnable()->buttonDisable()->buttonDelete()
            ->keyId()->keyText('content', '内容')->keyUid()->keyText($name = 'ip', $title = 'ip')->keyText($name = 'contact', $title = '联系方式')->keyCreateTime($name = 'fb_time', $title = '反馈时间')->keyText($name = 'aid', $title = 'appid')->keyStatus()
            ->data($list)
            ->display();
    }

}
