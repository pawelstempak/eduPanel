<?php
	$user = new auth();

	$stmt = $pdo -> query("
								SELECT id_course
								FROM exam_course
								WHERE id_exam = '".$_GET['id']."'
	");
	$course=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('id_course',$course);

	if($_POST['question_id'])
	{
	//$sql = "INSERT INTO user_exams_session (id_user, id_question, id_answer,c_date) VALUES (?,?,?,?)";
	//$pdo->prepare($sql)->execute([$user->getUserId(), $_POST['question_id'], $_POST['q'.$_POST['question_id']],$time]);

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


		$checkExam = true;
		$stmt = $pdo -> query("
									SELECT *
									FROM user_exams_session
									WHERE id_user = '".$user->getUserId()."' and id_course = '".$_GET['id']."'
		");

			foreach($stmt as $row)
			{
				$stmt1 = $pdo -> query("
											SELECT status
											FROM answers
											WHERE id_answer = '".$row['id_answer']."'
				");
				$answer=$stmt1->fetch();
				if($answer['status']=="0"){$checkExam=false;}
				$stmt1->closeCursor();
				unset($stmt1);
			}

		$stmt->closeCursor();
		unset($stmt);

		if($checkExam == true)
		{
			$pdo -> exec("
				UPDATE user_course
				SET status = '1', c_date = '".time()."'
				WHERE id_course = '".$course['id_course']."' and id_user = '".$user->getUserId()."'
				");
			$smarty->assign('course_result',1);
		}
		else
		{
			$smarty->assign('course_result',0);
		}
	}

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
?>