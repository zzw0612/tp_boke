<?php
namespace app\index\model;

use think\Model;
class User extends Model
{
	public function getList(){
		$where=[
			'status'=>0,
		];
		return $this->field('id,username,create_time')
			->where($where)
			->paginate(2);
	}
	
	public function add($data){
		return $this->save($data);
	}
	
	public function searchbyusername($username){
		$where=[
			'username'=>$username,
		];
		return $this->where($where)->find();
	}
	public function loginbyusername($username,$password){
		$where=[
			'username'=>$username,
			'password'=>$password,
		];
		return $this->where($where)->find();
	}
}