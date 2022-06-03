<?php

	$stmt = $pdo -> query("
								SELECT *
								FROM exams e, exam_course u
								WHERE u.id_course = '".$_GET['id']."' and u.id_exam = e.id_exam
	");
	$exam_info=$stmt->fetch();

	$stmt->closeCursor();
	unset($stmt);

	$smarty->assign('exam',$exam_info);

?>