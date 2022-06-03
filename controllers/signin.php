<?php
$_POST['login'] ?? $_POST['login'] = "";
if(sha1($_SESSION['login'].$_ENV['HIDDEN_HASH_VAR'])!=$_SESSION['id_login_hash']){
			if($_POST['login']!="" and $_POST['password']!="")
			{
				$sing_in_result=$user->user_login($_POST['login'],$_POST['password'],$_POST['login_settings']);
				if($sing_in_result['stan']=='true'){
					header('Location: '.APP_PATH);
				}
			}
}
else
{
header('Location: '.APP_PATH);
}
?>