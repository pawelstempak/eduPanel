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

function getAmount($string)
{
	 global $cfg;
	 $promo_price = $string;
	 $percent = $cfg['promo_code_value'];
	 $full_price = ($promo_price * 100)/(100-$percent);
	 $spread = $full_price/10;
    return sprintf("%01.2f",round($spread,2));
}

	 $query = mysql_query("
	 								SELECT *
									FROM t_order
									WHERE promo_code != '' and date < '".$user->getNowMinus21Days()."' and done = '1' and redeem = '0'
	 ");

	 while($result = mysql_fetch_array($query))
	 {

	 	$q = mysql_query("SELECT s.vat, u.id FROM settings s, user u WHERE s.id_user = u.id and u.zatwierdz_hash LIKE '%".$result['promo_code']."%'");
		$r = mysql_fetch_array($q);
		if($r['vat']==1)
		{
	 		$amount = $result['amount'];
		}
		else
		{
			$amount = $result['amount_vat'];
		}

		mysql_query("
						INSERT INTO redeem
						SET number = '".$result['order_number']."', amount = '".getAmount($amount)."', date = '".time()."', id_user = '".$r['id']."'
		");
		mysql_query("
						UPDATE t_order
						SET redeem = '1'
						WHERE id_order = '".$result['id_order']."'
		");
	}

?>