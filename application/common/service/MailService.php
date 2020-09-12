<?php
namespace app\common\service;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
class MailService{
	public static $mail;
	public static function __init(){
		self::$mail=new PHPMailer();
		self::$mail->isSMTP();
		self::$mail->CharSet="utf8";
		self::$mail->Host='smtp.qq.com';
		self::$mail->SMTPAuth=true;
		self::$mail->Username=config('email.Username'); //发送方邮箱
		self::$mail->Password=config('email.Password');
		self::$mail->setFrom(config('email.Username'),config('email.Nickname'));//发件人信息
		self::$mail->addReplyto(config('email.Username'),config('email.Nickname'));//回复人信息
		self::$mail->SMTPSecure="ssl";
		self::$mail->Port=465;
	}
	public static function send($toemail,$title,$info){
		self::__init();
		self::$mail->Subject=$title;
		self::$mail->Body=$info;
		if(is_array($toemail)){
			foreach($toemail as $vo){
				self::$mail->addAddress($vo,'send');
				!self::$mail->send()?$msg[]=[
					'mail'=>$vo,'msg'=>self::$mail->ErrorInfo]:$msg[]=[
					'mail'=>$vo,'msg'=>'邮箱发送成功'];
				}
				return ['code'=>1,'msg'=>$msg];
			}else{
				self::$mail->addAddress($toemail,'send');
				if(!self::$mail->send()){
					return ['code'=>1,'msg'=>self::$mail->ErrorInfo];
				}else{
					return ['code'=>0,'msg'=>'邮箱发送成功'];
				}
		}
	}
	
	public static function sendMail($toemail,$title,$info,$attachment=null){
		self::__init();
		self::$mail->isHTML(true);
		self::$mail->addAddress($toemail);
		self::$mail->Subject=$title;
		self::$mail->Body=$info;
		if($attachment){
			if(is_string($attachment)){
				is_file($attachment)&&self::$mail->AddAttachment($attachment);
			}else if(ia_array($attachment)){
				foreach($attachment as $file){
					is_file($file)&&self::$mail->AddAttachment($file);
				}
			}
		}
		if(!self::$mail->send()){
			return ['code'=>1,'msg'=>self::$mail->ErrorInfo];
		}
		else{
			return ['code'=>0,'msg'=>'邮箱发送成功'];
		}
	}
	
}

?>