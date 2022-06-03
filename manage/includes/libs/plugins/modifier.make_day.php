<?php
function smarty_modifier_make_day($string)
{
    return sprintf("%01.2f",round($string, 2));
}
?>