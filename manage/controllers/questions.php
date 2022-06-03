<?php

############# Pobranie z MySQL i przekazanie do SMARTY listy kurs�w z lekcjami ################
$stmt = $pdo -> query("
							SELECT *
							FROM questions
							WHERE id_exam = '".$_GET['id']."'
							ORDER BY sort
");

foreach($stmt as $row)
{
	##################################################
	$row_list = []; //zerowanie tablicy z list� uczestnik�w kursu
	$stmt1 = $pdo -> query("
								SELECT *
								FROM answers
								WHERE id_question = '".$row['id_question']."'
								ORDER BY sort
	");
	foreach($stmt1 as $row1)
	{
		$row_list[] = $row1; //wpisywanie do tabeli, tabel z danymi uczestnik�w kursu
	}

	$stmt1->closeCursor();
	unset($stmt1);

	($row_list!="")?$row['answer_list'] = $row_list:true; // je�eli uczestnicy istniej� to dopisanie tablicy asocjacyjnej z danymi uczesnik�w do tablicy wy�wietlajacej kursy

	$question[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('question',$question);
###########################################################################################

		$stmt = $pdo -> query("
							SELECT name
							FROM exams
							WHERE id_exam = '".$_GET['id']."';
		");
		$exam = $stmt -> fetch();

		$stmt->closeCursor();
		unset($stmt);

		$smarty->assign('exam',$exam);


$stmt = $pdo -> query("
							SELECT *
							FROM questions
							ORDER BY sort
");
foreach($stmt as $row)
{
	$questions[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('questions',$questions);
?>