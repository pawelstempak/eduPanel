<?php
function smarty_modifier_promo100($string)
{
	 global $cfg;
	 $promo_price = $string;
	 $percent = $cfg['promo_code_value'];
	 $full_price = ($promo_price * 100)/(100-$percent);
	 $spread = $full_price/10;
    return sprintf("%01.2f",round($spread,2));
}
?>