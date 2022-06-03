<?php

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']) or isset($_POST['save_close']))
{

		$pdo -> exec("
			UPDATE exams
			SET name = '".$_POST['name']."', description = '".$_POST['description']."'
			WHERE id_exam = '".$_GET['id']."'
		");

		$pdo -> exec("
			UPDATE exam_course
			SET id_course = '".$_POST['course']."'
			WHERE id_exam = '".$_GET['id']."'
		");

	if(isset($_POST['save'])){header("Location: edit_exam,save,".$_GET['id']."");}elseif(isset($_POST['save_close'])){header("Location: exams,ok,".$_POST['course']);}

}
############### Wczytaj listê kursów do listy SELECT ####################
$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER by name
");
foreach($stmt as $row)
{
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
#########################################################################

################ Wczytanie danych dla wyœwietlanej lekcji ###############
$stmt = $pdo -> query("
SELECT *
FROM exams l, exam_course c
WHERE l.id_exam = '".$_GET['id']."' and l.id_exam = c.id_exam;
");
$exam = $stmt -> fetch();

$stmt->closeCursor();
unset($stmt);

$smarty->assign('exam',$exam);
########################################################################

?>