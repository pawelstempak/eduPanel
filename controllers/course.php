<?php

	#DANE KURSU
	$stmt = $pdo -> query("
								SELECT *
								FROM course
								WHERE id_course = '".$_GET['id']."'
	");
	$course=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('course',$course);

	#NUMERACJA STRON
	$stmt = $pdo -> query("
								SELECT *
								FROM lesson_course
								WHERE id_course = '".$_GET['id']."'
	");
	$course_number = $stmt -> rowCount();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('course_number',$course_number);

	#DANE LEKCJI
	$stmt = $pdo -> query("
								SELECT l.name, l.content
								FROM lesson l, lesson_course c
								WHERE l.id_lesson = c.id_lesson and c.id_course = '".$_GET['id']."' and c.sort = '".$_GET['action']."'
	");
	$lesson=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('lesson',$lesson);

?>