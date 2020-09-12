<?php
namespace app\admin\controller;
use think\Controller;
class Notice extends Base
{
    public function index()
    {
    	$data=model('Notice')->getList();
		return $this->fetch('',['data'=>$data]);
    }
	
	public function add()
    {
    	return $this->fetch();
    }
   
   	public function save(){
    	if(request()->isAjax()){
    		$post=input('param.');
    		$notice=model('Notice');
    		$res=$notice->add($post);
    		if($res>0){
    			//$this->success('添加公告成功',url('notice/index'));
    			return json(['code'=>0,'msg'=>'添加成功']);
    		}else{
    			//$this->error('添加公告失败');
    			return json(['code'=>1,'msg'=>'添加失败']);
    		}
    	}
    }
    
    public function show()
    {
    	$id=input('param.id');
    	$notice=model('Notice');
    	$res=$notice->get($id);
    	$this->assign('data',$res);
    	return $this->fetch();
    }
}
