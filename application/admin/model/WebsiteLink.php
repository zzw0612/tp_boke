<?php
namespace app\admin\model;
use think\Model;
class WebsiteLink extends Model{
	public function add($data){
		return $this->save($data);
	}
	
	public function getList(){
		$where=[
			'status'=>0,
		];
		return $this->field('id,website_name,href,website_logo')
			->order('id','desc')
			->where($where)
			->paginate(2);
	}
	
	
}
?>