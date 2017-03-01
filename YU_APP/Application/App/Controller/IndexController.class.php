<?php
namespace App\Controller;
use Think\Controller;
class IndexController extends Controller
{
   
    public function feedback($uid,$token,$content){
        $this->requireAppLogin($token);
        $model = M('AppFeedback');
        $map['uid'] = $uid;
        $contact = M('Member')->field('qq')->where($map)->select();
        $ip =$_SERVER['REMOTE_ADDR'];
        $aid = M('AppApp')->field('id')->order('id desc')->find();
        $data=array('uid'=>$uid,'contact'=>$contact['0']['qq'],'ip'=>$ip,'content'=>$content,'fb_time'=>time(),'aid'=>$aid['id'],'status'=>1);
        $info=$model->add($data);
        if($info){
       // echo '反馈成功!';
        $result = array('retCode'=>1,'message'=>'反馈成功!','data'=>'');
        echo json_encode($result );
       //return $this->apiSuccess('反馈成功!');
        }else{
       // echo '反馈失败!';
       //return $this->apiError('反馈失败!');
        $result = array('retCode'=>0,'message'=>'反馈失败!','data'=>'');
        echo json_encode($result );
        }
    }
     public function appdownload(){
        $this->requireAppLogin($token);
        $model = M('AppApp');
        $map['status']=1;
        $info = $model->field('id,download_count')->where($map)->order('update_time desc')->find();
        $map['id']=$info['id'];
        $appdownloadinfo = $model->field('app_path')->where($map)->select();
        $string=strrev($appdownloadinfo['0']['app_path']);
        $filearr = explode('/', $string);
        $file_name=strrev($filearr[0]);
        if (! file_exists ($appdownloadinfo['0']['app_path'])) { 
            $result = array('retCode'=>0,'message'=>'文件不存在!','data'=>'');
            echo json_encode($result );
            //return $this->apiError('文件不存在!'); 
            exit ();  
        } else {  
        $file = fopen ($appdownloadinfo['0']['app_path'], "r" );  
        Header ( "Content-type: application/octet-stream" );  
        Header ( "Accept-Ranges: bytes" );  
        Header ( "Accept-Length: " . filesize ($appdownloadinfo['0']['app_path']) );  
        Header ( "Content-Disposition: attachment; filename=" . $file_name );   
        echo fread ( $file, filesize ($appdownloadinfo['0']['app_path']) );  
        fclose ( $file );
        $info['download_count'] ++;
        $condition['id']= $info['id'];
        $model->where($condition)->save($info);
        exit ();  
        }
    }
    public function requireAppLogin($token)
     {
        $user = M("UserToken");
        $result = $user->select();
        $info = 'false';
        foreach ($result as $key => $value) 
        {
            if($value['token']==$token){
            $info = 'true';
            }
        }
        if($info=='false'){
        $result = array('retCode'=>0,'message'=>'token验证失败!','data'=>'');
        echo json_encode($result);
        exit;
        }
    }
}