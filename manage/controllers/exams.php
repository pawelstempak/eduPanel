<?php
if(isset($_POST['save_index']) && $_POST['save_index'])
{
	$item = $_POST['index'];
	foreach($item as $row)
	{
		$key = array_search($row,$item);
		$pdo -> exec("
					UPDATE exam_course
					SET sort = '".$row."'
					WHERE id_exam = '".$key."'
					");
	}
}
############# Usuni�cie z MySQL lekcji ################
if(isset($_GET['action']) && $_GET['action']=="delete_exam_course") {
	$pdo -> exec("
					DELETE FROM exams
					WHERE id_exam = '".$_GET['id']."'
					");
	$pdo -> exec("
					DELETE FROM exam_course
					WHERE id_exam = '".$_GET['id']."'
					");
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy kurs�w z lekcjami ################
$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER BY name
");

foreach($stmt as $row)
{
	##################################################
	$row_list = []; //zerowanie tablicy z list� uczestnik�w kursu
	$stmt1 = $pdo -> query("
								SELECT *
								FROM exam_course c, exams l
								WHERE l.id_exam = c.id_exam and c.id_course = '".$row['id_course']."'
								ORDER BY c.sort
	");
	foreach($stmt1 as $row1)
	{
		$row_list[] = $row1; //wpisywanie do tabeli, tabel z danymi uczestnik�w kursu
	}

	$stmt1->closeCursor();
	unset($stmt1);

	($row_list!="")?$row['exam_list'] = $row_list:true; // je�eli uczestnicy istniej� to dopisanie tablicy asocjacyjnej z danymi uczesnik�w do tablicy wy�wietlajacej kursy

	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
###########################################################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy lekcji bez kurs�w ################
$stmt = $pdo -> query("
							SELECT l.name,  l.id_exam
							FROM exam_course lc, exams l
							WHERE l.id_exam = lc.id_exam and lc.id_course NOT IN (
							    SELECT id_course
							    FROM course
							)
");

foreach($stmt as $row)
{
	$exams[] = $row;
}

$stmt->closeCursor();
unset($stmt);
if(isset($exams)) $smarty->assign('exams',$exams);
###########################################################################################
?>