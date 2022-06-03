<?php
function ClearPolishSigns1($text)
{
     $ReplacePolishSign = array(
         '�' => 'a', '�' => 'A', '�' => '�', '�' => 'E',
         '�' => 'c', '�' => 'C', '�' => 'n', '�' => 'N', '�' => 'l',
         '�' => 'L', '�' => 's', '�' => 'S', '�' => 'z',
         '�' => 'Z', '�' => 'z', '�' => 'Z', '�' => 'o', '�' => 'o'
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