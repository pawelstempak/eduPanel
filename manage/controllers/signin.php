<?php
			isset($_POST['email'])?$post_email = $_POST['email']:$post_email = "";
			if($post_email!="" and $_POST['password']!="")
			{
				$sing_in_result=$user->admin_login($post_email,$_POST['password'],$_POST['login_settings']);
				if($sing_in_result['stan']=='true'){
					header('Location: '.MANAGE_PATH);
				}
			}
			/*
			elseif(sha1($_SESSION['email'].$hidden_hash_var)==$_SESSION['id_hash'])
			{
				header('Location: main');
			}*/
?>