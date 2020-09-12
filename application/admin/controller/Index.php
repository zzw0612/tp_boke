<?php
namespace app\admin\controller;
use think\Controller;
class Index extends Base
{
    public function index()
    {
    	  $info =[
           '操作系统'=>PHP_OS,
           '运行环境'=>$_SERVER["SERVER_SOFTWARE"],
           '主机名'=>$_SERVER['SERVER_NAME'],
           'WEB服务端口'=>$_SERVER['SERVER_PORT'],
           '网站文档目录'=>$_SERVER["DOCUMENT_ROOT"],
           '浏览器信息'=>substr($_SERVER['HTTP_USER_AGENT'], 0, 40),
           '通信协议'=>$_SERVER['SERVER_PROTOCOL'],
           '请求方法'=>$_SERVER['REQUEST_METHOD'],
           'ThinkPHP版本'=> \think\facade\App::version(),
           '上传附件限制'=>ini_get('upload_max_filesize'),
           '执行时间限制'=>ini_get('max_execution_time').'秒',
           '服务器时间'=>date("Y年n月j日 H:i:s"),
           '北京时间'=>gmdate("Y年n月j日 H:i:s",time()+8*3600),
           '服务器域名/IP'=>$_SERVER['SERVER_NAME'].' [ '.gethostbyname($_SERVER['SERVER_NAME']).' ]',
           '用户的IP地址'=>$_SERVER['REMOTE_ADDR'],
           '剩余空间'=>round((disk_free_space(".")/(1024*1024)),2).'M',
           'PHP版本'=>PHP_VERSION,
           'PHP运行方式'=>php_sapi_name(),
           '服务器语言'=>$_SERVER['HTTP_ACCEPT_LANGUAGE'],          

       ];
		return $this->fetch('',['data'=>$info]);
    }

   
}
