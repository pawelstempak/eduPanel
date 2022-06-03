<?php
$user = new auth();

try
{
	$pdo = new PDO('mysql:host='.$cfg['database_url'].';dbname='.$cfg['database_name'], $cfg['database_login'], $cfg['database_password'], array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
}
catch(PDOException $e)
{
   echo 'Po³¹czenie nie mog³o zostaæ utworzone: ' . $e->getMessage();
}

$stmt=$pdo->query("SELECT * FROM admin WHERE id='" . $user->getAdminId() . "'");
$result_login_user=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);

?>