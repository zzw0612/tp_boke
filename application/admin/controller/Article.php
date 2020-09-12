<?php
namespace app\admin\controller;
use think\Controller;
class Article extends Base
{
    public function index()
    {
    	$data=model('Article')->getList();
		return $this->fetch('',['data'=>$data]);
    }
	
	public function add()
    {
    	$Category=model('Category');
    	$data=$Category->getList();
    	$this->assign('data',$data);
    	return $this->fetch();
    }
   
   	public function save(){
    	if(request()->isAjax()){
    		$post=input('param.');
    		$post['user_id']=session('user')['id'];
    		$article=model('Article');
    		$res=$article->add($post);
    		if($res>0){
    			//$this->success('添加公告成功',url('notice/index'));
    			return json(['code'=>0,'msg'=>'添加文章成功']);
    		}else{
    			//$this->error('添加公告失败');
    			return json(['code'=>1,'msg'=>'添加文章失败']);
    		}
    	}
    }
    
    public function show()
    {
    	$id=input('param.id');
    	$article=model('Article');
    	$res=$article->get($id);
    	$this->assign('data',$res);
    	return $this->fetch();
    }
    
    public function ajaxupload(){
		$file=request()->file('file');
		if(empty($file)){return json(['code'=>1,'msg'=>'文件不能为空']);}
		$info=$file->validate(['size'=>1048576,'ext'=>'jpg,jpeg,png,gif'])->move('articleuploads');
		if($info){
			$fileP='articleuploads\\'.$info->getSaveName();
			$filePath=str_replace('\\','/',$fileP);
			return json(['code'=>0,'msg'=>$filePath]);
			
		}
		return json(['code'=>1,'msg'=>上传失败]);
	}
}
