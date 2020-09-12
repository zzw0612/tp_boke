<?php
namespace app\admin\controller;
use think\Controller;
class User extends Base
{
    public function index()
    {
    	$user=new \app\index\model\User();
    	$data=$user->getList();
    	$this->assign('data',$data);
    	return $this->fetch();
    }
    
    public function add()
    {
    	return $this->fetch();
    }
    
    public function show()
    {
    	$id=input('param.id');
    	$user=new \app\index\model\User();
    	$res=$user->get($id);
    	$this->assign('data',$res);
    	return $this->fetch();
    }
    
    public function save(){
    	if(request()->isAjax()){
    		$post=input('post.');
    		
    		$val=new \app\index\validate\User();
    		if(!$val->scene('add')->check($post)){
				$this->error($val->getError());
    		}
    		$user=new \app\index\model\User();
    		$res=$user->add($post);
    		if($res>0){
    			$this->success('添加成功',url('index/index'));
    		}else{
    			$this->error('添加失败');
    		}
    	}
    }
}