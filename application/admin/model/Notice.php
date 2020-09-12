<?php
namespace app\admin\model;
use think\Model;
class Notice extends Model{
	public function add($data){
		return $this->save($data);
	}
	
	public function getList(){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time')
			->order('id','desc')
			->where($where)
			->paginate(2);
	}
	
	public function getTop($num=6){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time')
			->order('id','desc')
			->where($where)
			->limit($num)
			->select();
	}
}
?>