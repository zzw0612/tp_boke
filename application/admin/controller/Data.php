<?php
namespace app\admin\controller;
use think\Controller;
use \tp5er\Backup;
class Data extends Base
{
    public function index()
    {
 		$config=array(
 			'path'=>'./Data/',//数据库备份路径
 			'part'=>20971520,//数据库备份大小
 			'compress'=>0,//数据库备份文件是否启用压缩   0不压缩   1压缩
 			'level'=>9,//数据库备份文件压缩级别  1普通   4一般   9最高
 		);
 		
 		$db=new Backup($config);
 		
 		$type=input('action');
 		switch($type){
 			//备份
 			case "backup":
 				$tables=$db->dataList();
 				foreach($tables as $k=>$v){
 					$db->backup($v['name'],0);
 				}
 				$file=$db->getFile();
 				$this->success('备份成功，文件名为'.$file['filename'],'admin/data/index');
 				break;
 			//下载
 			case "download":
 				$time=input('time');
 				$db->downloadFile($time);
 				break;
 			//还原
 			case "restore":
 				$time=input('time');
 				//$db->import1(0,$time);
 				$this->success('还原成功','admin/data/index');
 				break;
 			//删除
 			case "del":
 				$time=input('time');
 				$db->delFile($time);
 				$this->success('删除成功','admin/data/index');
 				break;
 			//没操作则查询已备份所有数据
 			default:
 				return $this->fetch('data/index',['list'=>$db->fileList()]);
 		}
 		
    }

   
}
