<?php
############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']) or isset($_POST['save_close']))
{
		$pdo -> exec("
			INSERT INTO exams
			SET name = '".$_POST['name']."', description = '".$_POST['content']."'
		");

		$stmt = $pdo -> query("
							SELECT id_exam
							FROM exams
							WHERE id_exam = LAST_INSERT_ID();
		");
		$last_id = $stmt -> fetch();

		$stmt->closeCursor();
		unset($stmt);

		$stmt = $pdo -> query("
							SELECT max(sort)
							FROM exam_course
							WHERE id_course = '".$_POST['course']."';
		");
		$MAX_SORT = $stmt -> fetchColumn();
		$MAX_SORT++;
		$pdo -> exec("
			INSERT INTO exam_course
			SET id_exam = '".$last_id['id_exam']."', id_course = '".$_POST['course']."', sort = '".$MAX_SORT."'
		");
		$stmt->closeCursor();
		unset($stmt);


	if(isset($_POST['save'])){header("Location: edit_exam,save,".$last_id['id_exam']."");}elseif(isset($_POST['save_close'])){header("Location: exams,ok");}

}

$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER BY name
");
foreach($stmt as $row)
{
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
?>