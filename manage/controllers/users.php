<?php
############# Zapis do MySQL danych u&#191;ytkownika ################
if(isset($_POST['zapisz']))
{
		$pdo -> exec("
			UPDATE user
			SET name = '".$_POST['name']."',
			lastname = '".$_POST['lastname']."',
			stanowisko = '".$_POST['stanowisko']."',
			udo = '".$_POST['udo']."',
			login = '".$_POST['login']."',
			email = '".$_POST['email']."'
			WHERE id_user = '".$_POST['id_user']."'
		");
		if($_POST['password']!="")
		{
			$pdo -> exec("
				UPDATE user
				SET haslo = '".$_POST['password']."'
				WHERE id_user = '".$_POST['id_user']."'
			");
		}
	header("Location: users,ok");

}
#################################################################

############# Usuni&#39081;e z MySQL u&#191;ytkownika ################
if(isset($_GET['action']) && $_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM user
					WHERE id_user = '".$_GET['id']."'
					");
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57251;###############
$stmt = $pdo -> query("
							SELECT *
							FROM user
							ORDER BY udo DESC
");
foreach($stmt as $row)
{
	$users[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('users',$users);
###########################################################################################
?>