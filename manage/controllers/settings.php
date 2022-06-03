<?php
if(isset($_POST['zapisz']))
{
		$pdo->exec("
			UPDATE admin
			SET name = '".$_POST['name']."',
			lastname = '".$_POST['lastname']."',
			email = '".$_POST['email']."'
			WHERE id = '".$user->getUserId()."'
		");
		if($_POST['password']!="")
		{
			$pdo->exec("
				UPDATE admin
				SET haslo = '".$_POST['password']."'
				WHERE id = '".$user->getUserId()."'
			");
		}
	header("Location: settings,ok");

}

?>