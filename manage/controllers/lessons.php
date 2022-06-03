<?php
if(isset($_POST['save_index']) && $_POST['save_index'])
{
	$item = $_POST['index'];
	foreach($item as $row)
	{
		$key = array_search($row,$item);
		$pdo -> exec("
					UPDATE lesson_course
					SET sort = '".$row."'
					WHERE id_lesson = '".$key."'
					");
	}
}
############# Usuni�cie z MySQL lekcji ################
if(isset($_GET['action']) && $_GET['action']=="delete_lesson_course") {
	$pdo -> exec("
					DELETE FROM lesson
					WHERE id_lesson = '".$_GET['id']."'
					");
	$pdo -> exec("
					DELETE FROM lesson_course
					WHERE id_lesson = '".$_GET['id']."'
					");

	$stmt = $pdo -> query("
	SELECT *
	FROM attachment
	WHERE id_lesson = '".$_GET['id']."';
	");
	foreach($stmt as $row)
	{
		unlink(ABSOLUTE_PATH_EDU."files/".$row['filename']);
	}

	$stmt->closeCursor();
	unset($stmt);

	$pdo -> exec("
					DELETE FROM attachment
					WHERE id_lesson = '".$_GET['id']."'
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
								FROM lesson_course c, lesson l
								WHERE l.id_lesson = c.id_lesson and c.id_course = '".$row['id_course']."'
								ORDER BY c.sort
	");
	foreach($stmt1 as $row1)
	{
		$row_list[] = $row1; //wpisywanie do tabeli, tabel z danymi uczestnik�w kursu
	}

	$stmt1->closeCursor();
	unset($stmt1);

	($row_list!="")?$row['lesson_list'] = $row_list:true; // je�eli uczestnicy istniej� to dopisanie tablicy asocjacyjnej z danymi uczesnik�w do tablicy wy�wietlajacej kursy

	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
###########################################################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy lekcji bez kurs�w ################
$stmt = $pdo -> query("
							SELECT l.name,  l.id_lesson
							FROM lesson_course lc, lesson l
							WHERE l.id_lesson = lc.id_lesson and lc.id_course NOT IN (
							    SELECT id_course
							    FROM course
							)
");

foreach($stmt as $row)
{
	$lessons[] = $row;
}

$stmt->closeCursor();
unset($stmt);
if(isset($lesson)) $smarty->assign('lesson',$lessons);
###########################################################################################
?>