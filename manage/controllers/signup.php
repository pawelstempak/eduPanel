<?php
			if(isset($_POST['signup']))
			{
				$singup_result=$user->user_register($_POST['name'],$_POST['lastname'],$_POST['email'],$_POST['login'],$_POST['password']);
				if($singup_result['stan']=='true'){

					//$singin_result=$user->user_login($_POST['login'],$_POST['password']);
					//if($singin_result['stan']=='true'){

						//header('Location:'.PATH);

					//}

				}
				else
				{
					$smarty->assign('feedback',$singup_result);
				}
			}
?>