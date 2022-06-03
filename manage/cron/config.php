<?php
error_reporting(E_ERROR | E_WARNING | E_STRICT);
DEFINE('ABSOLUTE_PATH_WWW','/home/esklep/public_html/panel/cron/');
DEFINE('ABSOLUTE_PATH','/home/esklep/public_html/panel/cron/');
DEFINE('PATH_WWW','https://panel.modny-zapach.pl/');
DEFINE('PATH','https://panel.modny-zapach.pl/');

$cfg['database_url'] = 'localhost';
$cfg['database_name'] = 'esklep_baza';
$cfg['database_login'] = 'esklep_user';
$cfg['database_password'] = 'HawryluK123.';
$cfg['db_prefix'] = '';
$cfg['email'] = "sklep@modny-zapach.pl";
$cfg['email_admin'] = "biuro@aurora-net.pl";
$cfg['promo_code_value']=5; //procentowy upust dla kupuj¹cego wykorzystuj¹cego kod rabatowy
$cfg['spread_value']=10; //procentowy zarobek dla parnera którego klient wykorzysta³ kod rabatowy

$hidden_hash_var='&9Jnd3kdf650emk&*9fmdk97883(*8hnK)';
?>