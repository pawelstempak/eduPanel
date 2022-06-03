<?php
ini_set( 'display_errors', 'On' );
error_reporting(E_ALL && ~E_NOTICE);

DEFINE('APP_ABSOLUTE_PATH', __DIR__.'/');
DEFINE('MANAGE_ABSOLUTE_PATH', __DIR__.'/manage/');

require APP_ABSOLUTE_PATH.'/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(APP_ABSOLUTE_PATH .'secret');
$dotenv->load();

##########################################################################
###### Input correct fronted and backend path in ./secret/.env file ######

DEFINE('APP_PATH',$_ENV['APP_PATH']);
DEFINE('MANAGE_PATH',$_ENV['MANAGE_PATH']);

##########################################################################

require APP_ABSOLUTE_PATH.'includes/libs/Smarty.class.php';
require APP_ABSOLUTE_PATH.'includes/class/auth.php';
require APP_ABSOLUTE_PATH.'includes/class/sql.php';
require APP_ABSOLUTE_PATH.'includes/class/class.upload.php';


$cfg['email'] = "admin@admin.com";
$cfg['email_admin'] = "admin@admin.com";
$cfg['ver']='1.0.2';
?>