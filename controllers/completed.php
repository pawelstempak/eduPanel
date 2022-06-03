<?php

############# Pobranie z MySQL i przekazanie do SMARTY listy ukoñczonych kursów ################
$stmt = $pdo -> query("
							SELECT *
							FROM course c, user_course u
							WHERE u.id_course = c.id_course and u.id_user = '".$user->getUserId()."' and u.status = '1'
							ORDER BY name
");

foreach($stmt as $row)
{
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);
$smarty->assign('course',$courses);
###########################################################################################
?>