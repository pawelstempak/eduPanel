<?php
############# Zapis do MySQL danych kursu ################
if(isset($_POST['signup']))
{
		$pdo -> exec("
			INSERT INTO course
			SET name = '".$_POST['name']."'
		");
	header("Location: courses,ok");

}
?>