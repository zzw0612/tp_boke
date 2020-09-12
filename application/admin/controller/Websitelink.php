<?php
namespace app\admin\controller;
use think\Controller;
class WebsiteLink extends Base
{
    public function index()
    {
    	$data=model('WebsiteLink')->getList();
		return $this->fetch('',['data'=>$data]);
    }
	
	public function add()
    {
    	
    	return $this->fetch();
    }
   
   	public function save(){
    	if(request()->isAjax()){
    		$post=input('param.');
    		$web=model('WebsiteLink');
    		$res=$web->add($post);
    		if($res>0){
    			//$this->success('添加公告成功',url('notice/index'));
    			return json(['code'=>0,'msg'=>'添加链接成功']);
    		}else{
    			//$this->error('添加公告失败');
    			return json(['code'=>1,'msg'=>'添加链接失败']);
    		}
    	}
    }
    
    public function ajaxupload(){
		$file=request()->file('file');
		if(empty($file)){return json(['code'=>1,'msg'=>'文件不能为空']);}
		$info=$file->validate(['size'=>1048576,'ext'=>'jpg,jpeg,png,gif'])->move('linkuploads');
		if($info){
			$fileP='linkuploads\\'.$info->getSaveName();
			$filePath=str_replace('\\','/',$fileP);
			return json(['code'=>0,'msg'=>$filePath]);
			
		}
		return json(['code'=>1,'msg'=>上传失败]);
	}
}
