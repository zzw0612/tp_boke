<?php
namespace app\front\controller;
use think\Controller;
class Base extends Controller
{
    protected function initialize(){
    	$categorys=model('Category')->getTop(5);
    	$articles=model('Article')->getTop(5);
    	$this->assign([
    		'categorys'=>$categorys,
    		'hotarticles'=>$articles,
    		
    	]);
    }
   
}
