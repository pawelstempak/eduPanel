<?php
############# Pobranie z MySQL i przekazanie do SMARTY listy uko�czonych kurs�w ################
$stmt = $pdo -> query("
							SELECT *
							FROM course c, user_course u
							WHERE u.id_course = c.id_course and u.id_user = '".$user->getUserId()."' and u.status = '1'
							ORDER BY name
");

foreach($stmt as $row)
{
	$courses1[] = $row;
}

$stmt->closeCursor();
unset($stmt);
$smarty->assign('course1',$courses1);
###########################################################################################

############# Zapis do MySQL danych o kursancie - przypisanie do kursu ################
if(isset($_GET['action']))
{
	if($_GET['action']=="add_user_to_course")
	{
			$stmt = $pdo -> query("
												SELECT *
												FROM user_course
												WHERE id_course = '".$_GET['action_id']."' and id_user = '".$_GET['id']."'
			");
			$result = $stmt -> fetch();
			if($result['id_user_course']=="")
			{
				$pdo -> exec("
					INSERT INTO user_course
					SET id_course = '".$_GET['action_id']."', id_user = '".$_GET['id']."'
				");
			}

			$stmt->closeCursor();
			unset($stmt);

		header("Location: courses,added,".$_GET['id'].",".$_GET['action_id']."");

	}
}
#################################################################
############# Pobranie z MySQL i przekazanie do SMARTY listy u�ytkownik�w ################
$stmt = $pdo -> query("
							SELECT *
							FROM user
							ORDER BY lastname
");
foreach($stmt as $row)
{
	$users[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('users',$users);
###########################################################################################

############# Zapis do MySQL danych kursu ################
if(isset($_POST['zapisz']))
{
		$pdo -> exec("
			UPDATE course
			SET name = '".$_POST['name']."'
			WHERE id_course = '".$_GET['id']."'
		");
	header("Location: courses,ok");

}
#################################################################

############# Usuni�cie z MySQL u�ytkownika ################
if(isset($_GET['action']))
{
	if($_GET['action']=="delete_user_course") {
		$pdo -> exec("
						DELETE FROM user_course
						WHERE id_course = '".$_GET['action_id']."' and id_user = '".$_GET['id']."'
						");
	}
}
############################################################

############# Usuni�cie z MySQL kursu wraz z powiazanymi u�ytkownikami################
if(isset($_GET['action']))
{
	if($_GET['action']=="delete") {
		$pdo -> exec("
						DELETE FROM course
						WHERE id_course = '".$_GET['id']."'
						");
		$pdo -> exec("
						DELETE FROM user_course
						WHERE id_course = '".$_GET['id']."'
						");
	}
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy u�ytkownik�w ################
$stmt = $pdo -> query("
							SELECT *
							FROM course c, user_course u
							WHERE u.id_course = c.id_course and u.id_user = '".$user->getUserId()."' and u.status = '0'
							ORDER BY name
");

foreach($stmt as $row)
{
	/*
	##################################################
	$row_list = ""; //zerowanie tablicy z list� uczestnik�w kursu
	$stmt1 = $pdo -> query("
								SELECT *
								FROM user_course c, user u
								WHERE u.id = c.id_user and c.id_course = '".$row['id_course']."' and c.status = '0'
								ORDER BY u.lastname
	");
	foreach($stmt1 as $row1)
	{
		$row_list[] = $row1; //wpisywanie do tabeli, tabel z danymi uczestnik�w kursu
	}

	$stmt1->closeCursor();
	unset($stmt1);
	*/
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);
if(isset($courses))
{
	$smarty->assign('course',$courses);
}
###########################################################################################
?>