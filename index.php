<?php

require 'config.php';

ob_start();

$smarty = new Smarty();

require APP_ABSOLUTE_PATH.'smarty_config.php';

##########################################################
####downloading template's file an loading tempplate######
#############existing file verification version###########
##########################################################

$session ?? session_start();

require APP_ABSOLUTE_PATH.'includes/init.php';

if(isset($_GET['page']))
{
	if(file_exists(APP_ABSOLUTE_PATH.'css/'.$_GET['page'].'.css')) //if css file exist
	{
		$smarty -> assign('style',$_GET['page'].'.css'); // include css file
	}
}

$_SESSION['login'] ?? $_SESSION['login'] = "";
$_SESSION['id_login_hash'] ?? $_SESSION['id_login_hash'] = "";
if(sha1($_SESSION['login'].$_ENV['HIDDEN_HASH_VAR'])==$_SESSION['id_login_hash']){
	if(isset($_GET['page']))
	{
		if(file_exists(APP_ABSOLUTE_PATH.'templates/'.$_GET['page'].'.tpl'))
		{
			if(file_exists(APP_ABSOLUTE_PATH.'controllers/'.$_GET['page'].'.php')) //if controllers file exist
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
		if(file_exists(APP_ABSOLUTE_PATH.'controllers/dashboard.php')) //if controllers file exist
		{
			require 'controllers/dashboard.php'; // include controllers file
		}
		$smarty -> display('dashboard.tpl'); //loading template file
	}
}
else
{
		if(file_exists(APP_ABSOLUTE_PATH.'controllers/signin.php')) //if controllers file exist
		{
			require 'controllers/signin.php'; // include controllers file
		}
		$smarty -> display('signin.tpl'); //loading template file
}
?>