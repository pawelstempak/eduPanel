<?php
####### Pobranie z MySQL danych o wybranym kursie ########
	$stmt = $pdo -> query("
								SELECT c.id_course, c.name, c.desc1, c.desc2
								FROM course c
								WHERE c.id_course = '".$_GET['id']."'
	");
	$course_info=$stmt->fetch();

	$stmt->closeCursor();
	unset($stmt);

	$smarty->assign('course',$course_info);
##########################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57251;###############
$stmt = $pdo -> query("
							SELECT *
							FROM user u, user_course c
							WHERE u.id_user = c.id_user and c.status = '1'
							ORDER BY c.c_date DESC
");
foreach($stmt as $row)
{
	$users[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('users',$users);
###########################################################################################
?>