<?php
function smarty_modifier_round($string)
{
    return sprintf("%01.2f",round($string, 2));
}
?>