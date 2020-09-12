<?php
namespace app\common\model;
use think\Model;
class Category extends Model{
	public function add($data){
		return $this->save($data);
	}
	
	public function getList(){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time')
			->where($where)
			->select();
	}
	
	public function getTop($num=5){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title')
			->order('id','desc')
			->where($where)
			->limit($num)
			->select();
	}
}
?>