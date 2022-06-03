<?php
############# Zapis do MySQL danych o kursancie - przypisanie do kursu ################
if(isset($_GET['action']) && $_GET['action']=="add_user_to_course")
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
#################################################################

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

############# Usuni&#39081;e z MySQL u&#191;ytkownika ################
if(isset($_GET['action']) && $_GET['action']=="delete_user_course") {
	$pdo -> exec("
					DELETE FROM user_course
					WHERE id_course = '".$_GET['action_id']."' and id_user = '".$_GET['id']."'
					");
}

############# Usuni&#39081;e z MySQL u&#191;ytkownika ################
if(isset($_GET['action']) && $_GET['action']=="delete_completed_user_course") {
	$pdo -> exec("
					UPDATE user_course
					SET status = '0'
					WHERE id_course = '".$_GET['action_id']."' and id_user = '".$_GET['id']."'
					");
}

############################################################

############# Usuni&#39081;e z MySQL kursu wraz z powiazanymi u&#191;ytkownikami################
if(isset($_GET['action']) && $_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM course
					WHERE id_course = '".$_GET['id']."'
					");
	$pdo -> exec("
					DELETE FROM user_course
					WHERE id_course = '".$_GET['id']."'
					");
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57251;###############
$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER BY name
");

foreach($stmt as $row)
{

	############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57316;o wyskakuj1cego okienka ################
	$users = [];
	$stmt3 = $pdo -> query("
									SELECT * 
									FROM user
									WHERE user.id_user
									NOT IN (
										SELECT user_course.id_user
										FROM user_course
										)
	");
	foreach($stmt3 as $row3)
	{
		$users[] = $row3;
	}
	$stmt3->closeCursor();
	unset($stmt3);
	$smarty->assign('users',$users);
	###########################################################################################

	##################### Lista aktywnych uczestnik&#55957;&#57323;ursu ###################################
	$row_list = []; //zerowanie tablicy z list1 uczestnik&#55957;&#57323;ursu
	$stmt1 = $pdo -> query("
								SELECT *
								FROM user_course c, user u
								WHERE u.id_user = c.id_user and c.id_course = '".$row['id_course']."' and c.status = '0'
								ORDER BY u.lastname
	");
	foreach($stmt1 as $row1)
	{
		$row_list[] = $row1; //wpisywanie do tabeli, tabel z danymi uczestnik&#55957;&#57323;ursu
	}

	$stmt1->closeCursor();
	unset($stmt1);

	($row_list!="")?$row['course_list'] = $row_list:true; // je&#191;eli uczestnicy istniej1 to dopisanie tablicy asocjacyjnej z danymi uczesnik&#55957;&#57316;o tablicy wy&#156;wietlajacej kursy

	$row_list_c = ""; //zerowanie tablicy z list1 uczestnik&#55957;&#57323;ursu
	$stmt2 = $pdo -> query("
								SELECT COUNT(*)
								FROM user_course
								WHERE id_course = '".$row['id_course']."' and status = '0'
	");

	$row['course_number'] =  $stmt2->fetchColumn(); // je&#191;eli uczestnicy istniej1 to dopisanie tablicy asocjacyjnej z liczb1 kursant&#55956;&#57034;
	$stmt2->closeCursor();
	unset($stmt2);
	###################################################

	##################### Lista uczestnik&#55957;&#57323;ursu kt&#55942;&#56544;go uko&#55371;&#56953;3y ###################################
	$completed_list = []; //zerowanie tablicy z list1 uczestnik&#55957;&#57323;ursu
	$stmt1c = $pdo -> query("
								SELECT *
								FROM user_course c, user u
								WHERE u.id_user = c.id_user and c.id_course = '".$row['id_course']."' and c.status = '1'
								ORDER BY c.c_date DESC
								LIMIT 10
	");
	foreach($stmt1c as $row1c)
	{
		$completed_list[] = $row1c; //wpisywanie do tabeli, tabel z danymi uczestnik&#55957;&#57323;ursu
	}

	$stmt1c->closeCursor();
	unset($stmt1c);

	($completed_list!="")?$row['completed_course_list'] = $completed_list:true; // je&#191;eli uczestnicy istniej1 to dopisanie tablicy asocjacyjnej z danymi uczesnik&#55957;&#57316;o tablicy wy&#156;wietlajacej kursy

	###################################################

	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
###########################################################################################
?>