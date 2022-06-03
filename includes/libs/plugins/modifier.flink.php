<?php
function ClearPolishSigns1($text)
{
     $ReplacePolishSign = array(
         '¹' => 'a', '¥' => 'A', 'ê' => 'ê', 'Ê' => 'E',
         'æ' => 'c', 'Æ' => 'C', 'ñ' => 'n', 'Ñ' => 'N', '³' => 'l',
         '£' => 'L', 'œ' => 's', 'Œ' => 'S', '¿' => 'z',
         '¯' => 'Z', 'Ÿ' => 'z', '' => 'Z', 'ó' => 'o', 'Ó' => 'o'
         );

     return str_replace(array_keys($ReplacePolishSign), array_values($ReplacePolishSign), $text);
}

function FriendlyTitle1($text)
{
    $text = ClearPolishSigns1($text);

    $text = strtolower($text);

    $text = str_replace(' ', '-', $text);

    $text = preg_replace('/[^0-9a-z\-]+/', '', $text);

    $text = preg_replace('/[\-]+/', '-', $text);

    $text = trim($text, '-');

    return $text;
}

function smarty_modifier_flink($string)
{
    return FriendlyTitle1(strip_tags($string));
}


?>