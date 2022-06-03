<?php

	$stmt = $pdo -> query("
								SELECT c.id_course, c.name, c.desc1, c.desc2
								FROM course c, user_course u
								WHERE u.id_user = '".$user->getUserId()."' and u.id_course = c.id_course and c.id_course = '".$_GET['id']."'
	");
	$course_info=$stmt->fetch();

	$stmt->closeCursor();
	unset($stmt);

	$smarty->assign('course',$course_info);

?>