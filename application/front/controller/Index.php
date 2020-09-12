<?php
namespace app\front\controller;
//use think\Controller;
class Index extends Base
{
    public function index()
    {
    	$notices=model('Notice')->getTop(5);
    	$newsarticles=model('Article')->getNews(5);

		$this->assign([
			'notices'=>$notices,
			'cate'=>'',
			'newsarticles'=>$newsarticles,
			]);
		return $this->fetch();
    }
    
	public function list($id=0)
    {	
    	$categoryname=model('Category')->where('id',$id)->value('title');
    	$nav=['文章分类',$categoryname];
    	$articles=model('Article')->getByCategory($id,2);
    	$this->assign([
    		'cate_articles'=>$articles,
    		'nav'=>$nav,
    		'cate'=>$categoryname,
    		]);
		return $this->fetch();
    }
    
    public function detail($id=0)
    {	
    	$article=model('Article')->get($id);
    	$nav=[];
    	$categoryname='';
    	if(!is_null($article)){
    		$categoryname=$article['category']['title'];
    		$nav=['文章分类',$categoryname,'文章详情'];
    	}
    	model('Article')->where('id',$id)->update(['clicks'=>['inc',1]]);
    	
    	$this->assign([
    		'article'=>$article,
    		'nav'=>$nav,
    		'cate'=>$categoryname,
    		]);
		return $this->fetch();
    }
   
   	 public function notice($id=0)
    {
		$notice=model('Notice')->get($id);
		return json($notice);
    }
    
    public function up($id=0){
    	$res=model('Article')->where('id',$id)->update(['praise'=>['inc',1]]);
    	if($res>0){
    		return json(['code'=>0,'msg'=>'点赞成功']);
    	}
    	return json(['code'=>1,'msg'=>'点赞失败']);
    }
}
