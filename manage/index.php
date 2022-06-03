<?php
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//ini_set('display_errors', 'On' );
//error_reporting( E_ALL);
require '../db.php';
require '../config.php';
require MANAGE_ABSOLUTE_PATH.'includes/libs/Smarty.class.php';
require MANAGE_ABSOLUTE_PATH.'includes/class/sql.php';
require MANAGE_ABSOLUTE_PATH.'includes/class/auth.php';
require MANAGE_ABSOLUTE_PATH.'includes/class/class.upload.php';

ob_start();

$smarty = new Smarty();

$smarty->template_dir = MANAGE_ABSOLUTE_PATH.'templates/';
$smarty->compile_dir = MANAGE_ABSOLUTE_PATH.'templates_c/';
$smarty->config_dir = MANAGE_ABSOLUTE_PATH.'configs/';
$smarty->cache_dir = MANAGE_ABSOLUTE_PATH.'cache/';
$smarty->allow_php_tag = true;

$smarty->assign('DIR',APP_PATH);
$smarty->assign('time',time());
$smarty->assign('config',$cfg);
$smarty->assign('feedback',$feedback);

##########################################################
####downloading template's file an loading tempplate######
#############existing file verification version###########
##########################################################

session_start();

require MANAGE_ABSOLUTE_PATH.'includes/init.php';

$smarty->assign('ABSOLUTE_PATH_WWW',APP_ABSOLUTE_PATH);
$smarty->assign('PATH_WWW',APP_PATH);

isset($_SESSION['login'])?$session_login = $_SESSION['login']:$session_login = "";
isset($_SESSION['id_login_hash'])?$session_id_login_hash = $_SESSION['id_login_hash']:$session_id_login_hash = "";

if(sha1($session_login.$hidden_hash_var)==$session_id_login_hash){
	if(isset($_GET['page']))
	{
		if(file_exists(MANAGE_ABSOLUTE_PATH.'templates/'.$_GET['page'].'.tpl'))
		{
			if(file_exists(MANAGE_ABSOLUTE_PATH.'controllers/'.$_GET['page'].'.php')) //if controllers file exist
			{
				require 'controllers/'.$_GET['page'].'.php'; // include controllers file
			}
			$smarty -> display($_GET['page'].'.tpl'); //loading template file
		}
		else
		{
			$smarty -> display('blad404.tpl'); //loading template file
		}
	}
	else
	{
		if(file_exists(MANAGE_ABSOLUTE_PATH.'controllers/users.php')) //if controllers file exist
		{
			require 'controllers/users.php'; // include controllers file
		}
		$smarty -> display('users.tpl'); //loading template file
	}
}
else
{
		if(file_exists(MANAGE_ABSOLUTE_PATH.'controllers/signin.php')) //if controllers file exist
		{
			require 'controllers/signin.php'; // include controllers file
		}
		$smarty -> display('signin.tpl'); //loading template file
}
?>