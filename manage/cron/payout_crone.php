<?php
//ini_set( 'display_errors', 'On' );
//error_reporting( E_ALL ^ E_NOTICE);
require 'config.php';
require ABSOLUTE_PATH.'includes/class/sql.php';
require ABSOLUTE_PATH.'includes/class/auth.php';
require ABSOLUTE_PATH.'includes/class/class.upload.php';

ob_start();

##########################################################
####downloading template's file an loading tempplate######
#############existing file verification version###########
##########################################################

session_start();

$user = new auth();

	 $query = mysql_query("
	 								SELECT *
									FROM t_redeem
									WHERE id_user = '".$user->getUserId()."'
	 ");

	 while($result = mysql_fetch_array($query))
	 {
	 	if($number==""){$number = $_GET['number'];}else{$number .= $_GET['number'];}
		if($amount==""){$amount = $_GET['amount'];}else{$amount .= $_GET['amount'];}
	 }
		mysql_query("
						INSERT INTO payout
						SET number = '".$number."', amount = '".$amount."', date = '".time()."', id_user = '".$result['id_user']."'
		");

?>