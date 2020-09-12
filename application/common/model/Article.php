<?php
namespace app\common\model;
use think\Model;
class Article extends Model{
	public function add($data){
		return $this->save($data);
	}
	
	public function getList(){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time,category_id,user_id')
			->order('id','desc')
			->where($where)
			->paginate(2);
	}
	
	public function category(){
		return $this->belongsTo('Category');
	}
	
	public function user(){
		return $this->belongsTo('User');
	}
	
	public function getTop($num=6){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time,cover_img,clicks,describe,praise,category_id,user_id')
			->order('clicks','desc')
			->where($where)
			->limit($num)
			->select();
	}
	public function getNews($num=6){
		$where=[
			'status'=>0,
		];
		return $this->field('id,title,create_time,cover_img,clicks,describe,praise,category_id,user_id')
			->order('id','desc')
			->where($where)
			->limit($num)
			->select();
	}
	
	public function getByCategory($cateid=0,$num=5){
		$where=[
			'status'=>0,
			'category_id'=>$cateid,
		];
		return $this->field('id,title,create_time,praise,describe,cover_img,clicks,category_id,user_id')
			->order('id','desc')
			->where($where)
			->paginate($num);
	}
}
?>