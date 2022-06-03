<?php
$user = new auth();

try
{
	$pdo = new PDO('mysql:host='.$_ENV['DATABASE_URL'].';dbname='.$_ENV['DATABASE_NAME'], $_ENV['DATABASE_USERNAME'], $_ENV['DATABASE_PASSWORD'], array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
}
catch(PDOException $e)
{
   echo 'Połączenie nie mogło zosta utworzone: ' . $e->getMessage();
}

$stmt=$pdo->query("SELECT * FROM user WHERE id_user='" . $user->getUserId() . "'");
$result_login_user=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);

$smarty->assign('signin_user',$result_login_user);

?>