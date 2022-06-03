<?php
function smarty_modifier_round4($string)
{
    return sprintf("%01.4f",round($string, 4));
}
?>