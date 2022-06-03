<?php
	if($_GET['delete_id']=="start")
	{
		$pdo -> exec("
		DELETE FROM user_exams_session
		WHERE id_course = '".$_GET['id']."' and id_user = '".$user->getUserId()."'
		");
	}

	if($_POST['question_id'])
	{
		$stmt = $pdo -> query("
									SELECT *
									FROM user_exams_session
									WHERE id_course = '".$_POST['id_course']."' and id_user = '".$user->getUserId()."' and id_question = '".$_POST['question_id']."'
		");
		$ile = $stmt -> rowCount();
		$stmt->closeCursor();
		unset($stmt);

		if($ile==0)
		{
			$pdo -> exec("
				INSERT INTO user_exams_session
				SET id_user = '".$user->getUserId()."', id_course = '".$_POST['id_course']."', id_question = '".$_POST['question_id']."', id_answer = '".$_POST['q'.$_POST['question_id']]."', c_date = '".time()."'
			");
		}
		else
		{
			$pdo -> exec("
				UPDATE user_exams_session
				SET id_user = '".$user->getUserId()."', id_course = '".$_POST['id_course']."', id_question = '".$_POST['question_id']."', id_answer = '".$_POST['q'.$_POST['question_id']]."', c_date = '".time()."'
				WHERE  id_course = '".$_POST['id_course']."' and id_user = '".$user->getUserId()."' and id_question = '".$_POST['question_id']."'
			");
		}
	}

	#DANE KURSU
	$stmt = $pdo -> query("
								SELECT *
								FROM exams
								WHERE id_exam = '".$_GET['id']."'
	");
	$exam=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('exam',$exam);

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
								SELECT *
								FROM questions
								WHERE id_exam = '".$_GET['id']."' and id_question = '".$_GET['action']."'
	");
	$question=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('question',$question);

	#DANE LEKCJI
	$stmt = $pdo -> query("
								SELECT *
								FROM answers
								WHERE id_question = '".$_GET['action']."'
								ORDER BY sort
	");
	foreach($stmt as $row)
	{
		$answers[] = $row;
	}
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('answers',$answers);

?>