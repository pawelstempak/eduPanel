<?php
$smarty->template_dir = APP_ABSOLUTE_PATH.'templates/';
$smarty->compile_dir = APP_ABSOLUTE_PATH.'templates_c/';
$smarty->config_dir = APP_ABSOLUTE_PATH.'configs/';
$smarty->cache_dir = APP_ABSOLUTE_PATH.'cache/';

$smarty->assign('DIR',APP_PATH);
$smarty->assign('time',time());
$smarty->assign('config',$cfg);

$smarty->assign('ABSOLUTE_PATH_WWW',APP_ABSOLUTE_PATH);
$smarty->assign('PATH_WWW',APP_PATH);
?>