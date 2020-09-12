<?php
namespace app\index\controller;
use think\Controller;
use app\common\service\PhoneService;
class Phone extends Controller
{
	public function test(){
		$data=PhoneService::sendmsg('13680297219','654');
		dump($data);
	}	
	public function login(){
    	$data=['navMenu'=>['首页','用户登录']];
    	$this->assign($data);
		return $this->fetch();
	}
	public function forget(){
    	$data=['navMenu'=>['首页','找回密码']];
    	$this->assign($data);
		return $this->fetch();
	}
	public function register(){
		$data=['navMenu'=>['首页','用户注册']];
    	$this->assign($data);
		return $this->fetch();
	}	
	public function save(){
		if(request()->isPost()){
    		$post=input('post.');
    		$res=model('User')->add($post);
    		if($res>0){
    			$this->success('注册成功',url('index/phone/login'));
    		}else{
    			$this->error('注册失败');
    		}
    	}
	}
	public function checkusername(){
		$username=input('post.username');
		$data=model('User')->searchbyusername($username);
		if(is_null($data)){
			return json(['code'=>0]);//用户不存在，用户名可用
		}
		return json(['code'=>1]);//此用户名不可用
	}	
	public function loginusername(){
		if(request()->isPost()){
    		$post=input('post.');
    		$username=input('post.username');
    		$password=input('post.password');
    		$data=model('User')->loginbyusername($username,$password);
    		if(is_null($data)){
    			$this->error('用户名，密码错误');
    		}else{
    			unset($data['password']);
    			session('user',$data);
    			$this->success('登陆成功',url('admin/index/index'));
    		}
    	}
	}
	public function logout(){
		session('user',null);
		$this->success('成功退出',url('index/phone/login'));
	}
}