<?php
namespace app\admin\controller;
use think\Controller;
class Category extends Base
{
    public function index()
    {
    	$Category=model('Category');
    	$data=$Category->getList();
    	$this->assign('data',$data);
    	return $this->fetch();
    }
    
    public function add()
    {
    	return $this->fetch();
    }
    
    public function save(){
    	if(request()->isAjax()){
    		$post=input('post.');
    		$Category=model('Category');
    		$res=$Category->add($post);
    		if($res>0){
    			return json(['code'=>0,'msg'=>'添加成功']);
    		}else{
    			return json(['code'=>1,'msg'=>'添加失败']);
    		}
    	}
    }
}