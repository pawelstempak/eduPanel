<?php
 $data_rej=time();
 $LOGGED_IN=false;
 $feedback=array();
 unset($LOGGED_IN);
class auth{

	//
	//protected $Zap;
	function auth()
	{
		//global $hidden_hash_var,$LOGGED_IN;
		$this->Sqlobject=new sql();

	}
	function user_isloggedin() {
		global $login,$id_hash,$hidden_hash_var,$LOGGED_IN;

		//have we already run the hash checks?
		//If so, return the pre-set var
		if (isset($LOGGED_IN)) {
			return $LOGGED_IN;
		}
		if ($login && $id_hash) {
			$hash=sha1($login.$hidden_hash_var);
			if ($hash == $id_hash) {
				$LOGGED_IN=true;
				return true;
			} else {
				$LOGGED_IN=false;
				return false;
			}
		} else {
			$LOGGED_IN=false;
			return false;
		}
	}

	//metoda do autoryzacji
	function user_login($email,$haslo,$login_settings) {
		global $feedback,$data_rej,$l,$cfg;
		if (!$email || !$haslo) {
			$adres_ip = $_SERVER['REMOTE_ADDR'];
			$feedback{'blad_logow_login_pl'} = "Wprowadziłeś zły login lub hasło. Spróbuj jeszcze raz.";
			$feedback['blad_logow_login_en'] = "Sorry. Incorrect login or password.";
			$feedback['blad_logow_login_ru'] = "Sorry. Incorrect login or password.";
			return $feedback;

		} else {
			$email=strtolower($email);
			$haslo=strtolower($haslo);
			$sql="SELECT * FROM user WHERE email='".$email."' AND haslo='". $haslo ."'";
			$num=$this->Sqlobject->number_rows($sql);

			$result=$this->Sqlobject->query($sql);
			$data=$this->Sqlobject->fetch($result);
			if (!$result || $num < 1){
				$adres_ip = $_SERVER['REMOTE_ADDR'];
				$feedback{'blad_logow_baza_pl'} = "Login nie został znaleziony lub złe hasło. Spróbuj jeszcze raz.";
				$feedback['blad_logow_baza_en'] = "Sorry. Login was not found or password incorrect.";
				$feedback['blad_logow_baza_ru'] = "Sorry. Login was not found or password incorrect.";
				return $feedback;

			} else {
						if($email == $cfg['email_admin'])
						{
							$this->user_set_tokens_admin($email,$login_settings);
							//' Sukces - jesteś zalogowany '
							$feedback ['stan']='true';
							return $feedback;
						}
						else
						{
							$this->user_set_tokens($email,$login_settings);
							//' Sukces - jesteś zalogowany '
							$feedback ['stan']='true';
							return $feedback;
						}
			}

		}
	}

	function user_logout() {
		$_SESSION = array();
		setcookie('PHPSESSID','',(time()),'/','',0);
		//setcookie('login','',(time()+2592000),'/','',0);
		//setcookie('id_hash','',(time()+2592000),'/','',0);
		session_destroy();
	}

	function user_set_tokens($user_name_in,$login_settings='0') {
		global $hidden_hash_var,$email,$id_hash;
		if (!$user_name_in) {
			$feedback .=  ' ERROR - User Name Missing When Setting Tokens ';
			return false;
		}
		$email=strtolower($user_name_in);
		$id_hash= sha1($email.$hidden_hash_var);
		//Rejestracja sesji
		if(!$_SESSION['email'])
		{
			$_SESSION['email'] = $email;
		}
		if(!$_SESSION['id_hash'])
		{
			$_SESSION['id_hash'] = $id_hash;
		}
		if($login_settings == '1')
		{
		setcookie('PHPSESSID',$id_hash,(time()+2592000),'/','',0);
		}
		//setcookie('login',$login,(time()+2592000),'/','',0);
		//setcookie('id_hash',$id_hash,(time()+2592000),'/','',0);

	}

	function user_set_tokens_admin($user_name_in,$login_settings='0') {
		global $hidden_hash_var,$email,$id_hash;
		if (!$user_name_in) {
			$feedback .=  ' ERROR - User Name Missing When Setting Tokens ';
			return false;
		}
		$email=strtolower($user_name_in);
		$id_hash= sha1($email.$hidden_hash_var);
		//Rejestracja sesji
		if(!$_SESSION['email'])
		{
			$_SESSION['email'] = $email;
		}
		if(!$_SESSION['id_hash'])
		{
			$_SESSION['id_hash'] = $id_hash;
		}
		if(!$_SESSION['admin'])
		{
			$_SESSION['admin'] = 1;
		}
		if($login_settings == '1')
		{
		setcookie('PHPSESSID',$id_hash,(time()+2592000),'/','',0);
		}
		//setcookie('login',$login,(time()+2592000),'/','',0);
		//setcookie('id_hash',$id_hash,(time()+2592000),'/','',0);

	}

	function user_confirm($hash,$email) {
		/*
			funkja zatwierdzajaca zapisanie sie do serwisu
			poprzez aktywacje linka wyslanego mailem
		*/

		global $feedback,$hidden_hash_var;

		//weryfikacja emaila
		$new_hash=sha1($email.$hidden_hash_var);
		if ($new_hash && ($new_hash==$hash)) {
			//find this record in the db

			$sql="SELECT * FROM user WHERE zatwierdz_hash='$hash'";
			$num=$this->Sqlobject->number_rows($sql);
			$result=$this->Sqlobject->query($sql);
			$data=$this->Sqlobject->fetch($result);
			if (!$result || $num < 1) {
				$feedback['hash_niema']= ' Sorry. Hash was not found !';
				return $feedback;
			} else {
					//potwierdzenie emaila i aktywacja konta
					$feedback ['konto_aktywne']= ' Your profile is active. You can log in into catalogue now.';
					//$this->user_set_tokens(mysql_result($result,0,'login'));//odznaczone umozliwia zalogowanie bezposrednio po aktywacji linka rejestracyjnego
					$this->Sqlobject->set_table('produkty');
					$this->Sqlobject->set('czy_zatwierdz',1);
					$filter=" zatwierdz_hash='$hash'";
					$this->Sqlobject->update_db2($filter);
					$feedback['stan_zatwierdz']='true';
					return $feedback;
			}
		} else {
			$feedback['hash_blad']= 'Problem z hash. Brak potwierdzenia.';
			return $feedback;
		}
	}

	function user_change_password ($new_password1,$new_password2,$login,$old_password) {
		global $feedback;
		//new passwords present and match?
		if ($new_password1 && ($new_password1==$new_password2)) {
			//is this password long enough?
			if ($this->account_pwvalid($new_password1)) {
				//all vars are present?
				if ($login && $old_password) {
					//lower case everything
					$login =strtolower($login );
					$old_password=strtolower($old_password);
					$new_password1=strtolower($new_password1);
					//sprawdzanie czy poprawny login i stare haslo ?
					$sql="SELECT * FROM user WHERE login ='$login ' AND haslo='". $old_password ."'";
					$num=$this->Sqlobject->number_rows($sql);
					$result=$this->Sqlobject->query($sql);

					if (!$result || $num < 1) {
						$feedback['login_stare_haslo_pl']= 'Niepoprawne stare hasło'.mysql_error();
						$feedback['login_stare_haslo_en']= 'Incorrect old password'.mysql_error();
						$feedback['login_stare_haslo_ru']= 'Incorrect old password'.mysql_error();
						return $feedback;
					} else {

						//Podmienianie hasla starego na nowe w bazie danych
						$this->Sqlobject->set_table('user');
						$this->Sqlobject->set('haslo',$new_password1);
						$this->Sqlobject->set('login',$login);
						$filter=" login='$login' AND haslo='". $old_password. "'";
						$result=$this->Sqlobject->update_db2($filter);

						if (!$result) {
							$feedback['blad_zmiany']= ' Password was not change '.mysql_error();

							return $feedback;
						} else {
							$feedback['stan_podmiana']= 'true';

							return $feedback;
						}

					}
				} else {
					$feedback['popraw_haslo_login_pl']= ' Niepoprawne stare hasło ';
					return $feedback;
				}
			} else {
				$feedback['nowe_haslo_pl']= ' Nowe hasło ma niewłasciwy format. Zmien hasło.';
				return $feedback;
			}
		} else {
			$feedback['p_nowe_haslo']= ' You had not fill the gap.';
			return $feedback;
		}
	}
/*
	function user_lost_password ($email,$login) {
		global $feedback,$hidden_hash_var;

		if ($email && $login) {
			$login=strtolower($login);
			//sprawdzanie czy poprawny login i poprawny email ?
				$sql="SELECT * FROM user WHERE login='$login' AND email='$email'";
				$num=$this->Sqlobject->number_rows($sql);
				$result=$this->Sqlobject->query($sql);
			if (!$result || $num < 1) {
				//zly login lub email
				$feedback['zly_login_email']= ' Sorry. Incorrect login or email address.';
				return $feedback;
			} else {
				//create a secure, new password
				$nowe_haslo=strtolower(substr(sha1(time().$login.$hidden_hash_var),1,14));
				//Podmienianie hasla starego na nowe w bazie danych
				$this->Sqlobject->set_table('user');
				$this->Sqlobject->set('haslo',sha1($nowe_haslo));
				$this->Sqlobject->set('login',$login);
				$filter=" login='$login'";
				$this->Sqlobject->update_db2($filter);

				//Wysyla prostego maila z nowym haslem
				$this->user_send_new_haslo($email,$nowe_haslo);
				$feedback['zmiana_hasla_ok']= ' Your new password has been send by email address.';
				$feedback['stan_zmiana']='true';
				return $feedback;
			}
		} else {
			$feedback['login_email']= ' Sorry. Login or email address was not found.';
			return $feedback;
		}
	}

	function user_change_email ($password1,$new_email,$user_name) {
		global $feedback,$hidden_hash_var;
		if ($this->validate_email($new_email)) {
			$hash=sha1($new_email.$hidden_hash_var);
			//change the confirm hash in the db but not the email -
			//send out a new confirm email with a new hash
			$user_name=strtolower($user_name);
			$password1=strtolower($password1);
			$sql="UPDATE user SET confirm_hash='$hash' WHERE user_name='$user_name' AND password='". sha1($password1) ."'";
			$result=mysql_query($sql);
			if (!$result || mysql_affected_rows($result) < 1) {
				$feedback .= ' Sorry. Incorrect User Name Or Password ';
				return false;
			} else {
				$feedback .= ' Confirmation Sent ';
				$this->user_send_confirm_email($new_email,$hash);
				return true;
			}
		} else {
			$feedback .= ' New Email Address Appears Invalid ';
			return false;
		}
	}
	*/
	function user_send_confirm_admin_email($email) {
		global $email_admin,$cfg;

		$subject="Informacja o nowej rejestracji na Modny-zapach.pl";
		$message="Zarejestrował się nowy użytkownik na stronie";
		$message.="\n\nAurora-labs.pl";
		//$subject=iconv("UTF-8","ISO-8859-2", $subject);
		//$subject='=?iso-8859-2?B?'.base64_encode($subject).'?=';
		$headers .= "From: ".$cfg['email_sklepu']." <".$cfg['email_sklepu'].">\n";
		//$message = nl2br ($message);
		//$message = stripslashes ($message);
		if(mail($email, $subject, $message, $headers)){
			return  true;
		}else{
			$feedback['wys_mail']='Email sending failure';
			return false;
		}

	}

	function user_send_confirm_email($email,$subject,$message) {
		global $cfg;

		$subject  = "=?UTF-8?B?".base64_encode($subject)."?=\n";
		$message  = wordwrap($message, 70);
		$headers  = "From: ".$cfg['email_sklepu']." <".$cfg['email_sklepu'].">\n";
		$headers .= "Content-Type: text/plain; charset=\"utf-8\"\n\n";
		if(mail($email, $subject, $message, $headers)){
			return  true;
		}else{
			$feedback['wys_mail']='Email sending failure';
			return false;
		}

	}

	function getUserId() {
			$q=mysql_query("SELECT id FROM user WHERE email='" . $_SESSION['email'] . "'");
			$r=mysql_fetch_array($q);
			return $r['id'];
	}

	function ifSettings() {
			$q=mysql_query("SELECT * FROM settings WHERE id_user='" . $this->getUserId() . "'");
			$r=mysql_fetch_array($q);
			if($r['full_name']!="" and $r['country']!="" and $r['city']!="" and $r['code']!="" and $r['street']!="" and $r['number']!="" and
				$r['nip']!="" and $r['regon']!="" and $r['edgkrs']!="" and $r['edgkrs_w']!="" and $r['person']!="" and $r['phone']!="" and $r['account']!="" and $r['bank']!="")
				{
					return true;
				}
				else
				{
					return false;
				}

	}

	function getPromoCode($email) {
				$sql="SELECT * FROM user WHERE email='".$email."'";
				$result=mysql_fetch_array(mysql_query($sql));
				return substr($result['zatwierdz_hash'],0,8);
	}

	function getNowMinus21Days() {
				return time()-1814400;
	}

	//metoda do rejestracji
	function user_register($email,$haslo1) {

		global $feedback,$hidden_hash_var,$data_rej,$cfg;

				$email=strtolower($email);
				$haslo1=strtolower($haslo1);

				//sprawdzanie czy email istnieje w bazie?
				$sql_e="SELECT * FROM user WHERE email='".$email."'";
				$num_e=$this->Sqlobject->number_rows($sql_e);
				$result_e=$this->Sqlobject->query($sql_e);

				if($result_e && $num_e > 0){
					$feedback['email_istnieje']=  'Powyższy adres e-mail już istnieje.';
					return $feedback;
				}else{

					//create a new hash to insert into the db and the confirmation email
					$adres_ip = $_SERVER['REMOTE_ADDR'];
					$adres_proxy = $_SERVER['HTTP_X_FORWARDED_FOR'];
					$adres_host = $_SERVER['REMOTE_HOST'];

					$hash=sha1($email.$hidden_hash_var);
					$this->Sqlobject->set_table('user');
					$this->Sqlobject->set('email',$email);
					$this->Sqlobject->set('haslo',$haslo1);
					$this->Sqlobject->set('zatwierdz_hash',$hash);//email hash
					$this->Sqlobject->set('czy_zatwierdz','0');
					$this->Sqlobject->set('adres_host',$adres_host);
					$this->Sqlobject->set('adres_ip',$adres_ip);
					$this->Sqlobject->set('data_rej',$data_rej);
					$this->Sqlobject->set('adres_proxy',$adres_proxy);
					$result=$this->Sqlobject->insert_db();

					$q = mysql_query("SELECT * FROM t_user WHERE email = '".$email."'");
					$r = mysql_fetch_array($q);

					mysql_query("UPDATE t_user SET id_user = '".$r['id']."' WHERE id = '".$r['id']."'");

					if (!$result) {
						$feedback['mysql']= ' ERROR - '.mysql_error();
						return $feedback;
					} else {
						//funkjcja wysylania meila z potwierdzeniem
						//$this->user_send_confirm_email($cfg['email_sklepu']);
						$feedback['stan']= 'true';
						$feedback['hash']= $hash;
						return $feedback;
					}//$result

				}//$result && $num

	}//user_register

	//metoda do rejestracji
	function user_register1($login,$haslo1,$haslo2,$company_name,$nip,$first_name,$last_name,$email,$re_email,$address,$address1,$country,$phone) {

		global $feedback,$hidden_hash_var,$data_rej,$cfg;

			if(!$login){
				$feedback['p_login_pl'] = 'Wypełnij pole';
				$feedback['p_login_en'] = 'You have not fill the gap.';
				$feedback['p_login_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}elseif(!$this->account_namevalid($login)){

			}

			if(!$haslo1){
				$feedback['p_haslo_pl'] = 'Wypełnij pole';
				$feedback['p_haslo_en'] = 'You have not fill the gap.';
				$feedback['p_haslo_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}elseif(!$this->account_pwvalid($haslo1)){

			}elseif($haslo1!=$haslo2){
				$feedback['haslo_rozne_pl']=  'Hasła nie pasują do siebie.';
				$feedback['haslo_rozne_en']=  'Passwords dosen\'t match';
				$feedback['haslo_rozne_ru']=  'Passwords dosen\'t match';
			}

			if(!$email){
				$feedback['p_email_pl'] = 'Wypełnij pole';
				$feedback['p_email_en'] = 'You have not fill the gap.';
				$feedback['p_email_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}elseif(!$this->validate_email($email)){
				$feedback['email_pl']=  'Niepoprawny adres e-mail';
				$feedback['email_en']=  'Email incorrect.';
				$feedback['email_ru']=  'Email incorrect.';
			}
			/*
			elseif($email!=$re_email){
				$feedback['re_email_pl']=  'Adresy e-mail nie pasują do siebie';
				$feedback['re_email_en']=  'Bussiness emails dosen\'t match';
				$feedback['re_email_ru']=  'Bussiness emails dosen\'t match';
			}*/

			if(!$company_name){
				$feedback['p_company_name_pl']=  'Wypełnij pole';
				$feedback['p_company_name_en'] = 'You have not fill the gap.';
				$feedback['p_company_name_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}
			/*
			if(!$first_name){
				$feedback['p_first_name_pl'] = 'Wypełnij pole';
				$feedback['p_first_name_en'] = 'You have not fill the gap.';
				$feedback['p_first_name_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}
			if(!$last_name){
				$feedback['p_last_name_pl'] = 'Wypełnij pole';
				$feedback['p_last_name_en'] = 'You have not fill the gap.';
				$feedback['p_last_name_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}
			*/
			if(!$phone){
				$feedback['p_phone_pl']=  'Wypełnij pole';
				$feedback['p_phone_en'] = 'You have not fill the gap.';
				$feedback['p_phone_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}
			/*
			if(!$nip){
				$feedback['p_nip_pl']=  'Wypełnij pole';
				$feedback['p_nip_en'] = 'You have not fill the gap.';
				$feedback['p_nip_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}
			*/
			if(!$address){
				$feedback['p_address_pl']=  'Wypełnij pole';
				$feedback['p_address_en'] = 'You have not fill the gap.';
				$feedback['p_address_ru'] = '&#1059; &#1074;&#1072;&#1089; &#1085;&#1077;&#1090; &#1079;&#1072;&#1087;&#1086;&#1083;&#1085;&#1080;&#1090;&#1100; &#1101;&#1090;&#1086;&#1090; &#1087;&#1088;&#1086;&#1073;&#1077;&#1083;.';
			}

		//all vars present and passwords match?
		if ($login && $haslo1 && $haslo1==$haslo2 && $email && $this->validate_email($email) && $company_name && $phone && $address) {

			//haslo lub/i login bledny?
			if ($this->account_namevalid($login) && $this->account_pwvalid($haslo1)) {
				$login=strtolower($login);
				$haslo1=strtolower($haslo1);

				//sprawdzanie czy login istnieje w bazie?
				$sql="SELECT * FROM user WHERE login='".$login."'";
				$num=$this->Sqlobject->number_rows($sql);
				$result=$this->Sqlobject->query($sql);

				//sprawdzanie czy email istnieje w bazie?
				$sql_e="SELECT * FROM user WHERE email='".$email."'";
				$num_e=$this->Sqlobject->number_rows($sql_e);
				$result_e=$this->Sqlobject->query($sql_e);

				if ($result && $num > 0) {
					$feedback['login_pl']=  'Ten login jest już używany. Wybierz inny login. ';
					$feedback['login_en']=  'It seems that login has been used. Try other login. ';
					$feedback['login_ru']=  '&#1050;&#1072;&#1078;&#1077;&#1090;&#1089;&#1103;, &#1095;&#1090;&#1086; &#1042;&#1086;&#1081;&#1090;&#1080; &#1073;&#1099;&#1083; &#1080;&#1089;&#1087;&#1086;&#1083;&#1100;&#1079;&#1086;&#1074;&#1072;&#1085;. &#1055;&#1086;&#1087;&#1088;&#1086;&#1073;&#1091;&#1081;&#1090;&#1077; &#1076;&#1088;&#1091;&#1075;&#1086;&#1081; &#1083;&#1086;&#1075;&#1080;&#1085;.';
					return $feedback;
				}
				elseif($result_e && $num_e > 0){
					$feedback['email_istnieje_pl']=  'Podany adres e-mail już istnieje.';
					$feedback['email_istnieje_en']=  'It seems that email address has been used.';
					$feedback['email_istnieje_ru']=  'It seems that email address has been used.';
					return $feedback;
				}else{

					//create a new hash to insert into the db and the confirmation email
					$adres_ip = $_SERVER['REMOTE_ADDR'];
					$adres_proxy = $_SERVER['HTTP_X_FORWARDED_FOR'];
					$adres_host = $_SERVER['REMOTE_HOST'];

					$hash=sha1($email.$hidden_hash_var);
					$this->Sqlobject->set_table('user');
					$this->Sqlobject->set('login',$login);
					$this->Sqlobject->set('imie',$first_name);
					$this->Sqlobject->set('nazwisko',$last_name);
					$this->Sqlobject->set('email',$email);
					$this->Sqlobject->set('haslo',$haslo1);
					$this->Sqlobject->set('zatwierdz_hash',$hash);//email hash
					$this->Sqlobject->set('czy_zatwierdz','0');
					$this->Sqlobject->set('adres_host',$adres_host);
					$this->Sqlobject->set('adres_ip',$adres_ip);
					$this->Sqlobject->set('data_rej',$data_rej);
					$this->Sqlobject->set('adres_proxy',$adres_proxy);
					$this->Sqlobject->set('nazwa_firmy',$company_name);
					$this->Sqlobject->set('nip',$nip);
					$this->Sqlobject->set('data_rej',$data_rej);
					$this->Sqlobject->set('last_valid_login','');
					$this->Sqlobject->set('last_valid_login_ip','');
					$this->Sqlobject->set('last_invalid_login','');
					$this->Sqlobject->set('last_invalid_login_ip','');
					$this->Sqlobject->set('adres',$address);
					$this->Sqlobject->set('adres1',$address1);
					$this->Sqlobject->set('kraj',$country);
					$this->Sqlobject->set('telefon',$phone);
					$this->Sqlobject->set('type','1');
					$result=$this->Sqlobject->insert_db();

					if (!$result) {
						$feedback['mysql']= ' ERROR - '.mysql_error();
						return $feedback;
					} else {
						//funkjcja wysylania meila z potwierdzeniem
						$this->user_send_confirm_admin_email($cfg['email_sklepu']);
						$this->user_send_confirm_admin_email($cfg['email_sklepu1']);
						$feedback['stan']= 'true';
						$feedback['hash']= $hash;
						return $feedback;
					}//$result

				}//$result && $num
			} else {
				return $feedback;
			}//$this->account_namevalid($login)
		} else {

			return $feedback;
		}//$nazwisko&&$imie
	}//user_register

	function user_getid() {
		global $G_USER_RESULT;
		//see if we have already fetched this user from the db, if not, fetch it
		if (!$G_USER_RESULT) {
			$G_USER_RESULT=mysql_query("SELECT * FROM user WHERE user_name='" . $this->user_getname() . "'");
		}
		if ($G_USER_RESULT && mysql_num_rows($G_USER_RESULT) > 0) {
			return db_result($G_USER_RESULT,0,'id');
		} else {
			return false;
		}
	}

	function user_getrealname() {
		global $G_USER_RESULT;
		//see if we have already fetched this user from the db, if not, fetch it
		if (!$G_USER_RESULT) {
			$G_USER_RESULT=mysql_query("SELECT * FROM user WHERE user_name='" . $this->user_getname() . "'");
		}
		if ($G_USER_RESULT && mysql_num_rows($G_USER_RESULT) > 0) {
			return db_result($G_USER_RESULT,0,'real_name');
		} else {
			return false;
		}
	}

	function user_getemail() {
		global $G_USER_RESULT;
		//see if we have already fetched this user from the db, if not, fetch it
		if (!$G_USER_RESULT) {
			$G_USER_RESULT=mysql_query("SELECT * FROM user WHERE user_name='" . $this->user_getname() . "'");
		}
		if ($G_USER_RESULT && mysql_num_rows($G_USER_RESULT) > 0) {
			return db_result($G_USER_RESULT,0,'email');
		} else {
			return false;
		}
	}

	function user_getname() {
		if (user_isloggedin()) {
			return $GLOBALS['user_name'];
		} else {
			//look up the user some day when we need it
			return ' ERROR - Not Logged In ';
		}
	}

	function account_pwvalid($pw) {
		global $feedback;
		if (strlen($pw) < 6) {
			$feedback['haslo_krotkie_pl'] .= " Hasło musi mieć co najmniej 6 znaków. ";
			$feedback['haslo_krotkie_en'] .= " Password must be 6 chars at least. ";
			$feedback['haslo_krotkie_ru'] .= " Password must be 6 chars at least. ";
			return false;
		}
		if(eregi('^[0-9]*$',$pw)){
			$feedback['haslo_same_cyfry_pl']= " Hasło nie może zawierać tylko cyfr.";
			$feedback['haslo_same_cyfry_en']= " Password incorrect. Digits only is nod allowed.  ";
			$feedback['haslo_same_cyfry_ru']= " Password incorrect. Digits only is nod allowed.  ";
			return false;
		}
		return true;
	}

	function account_namevalid($name) {
		global $feedback;

		// no spaces
		if (strrpos($name,' ') > 0) {
			$feedback['login_spacje_pl']= " Login nie może zawierać spacji. ";
			$feedback['login_spacje_en']= " Login invalid. Spaces are not allowed. ";
			$feedback['login_spacje_ru']= " Login invalid. Spaces are not allowed. ";
			return false;
		}

		// must have at least one character
		if (strspn($name,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") == 0) {
			$feedback['login_litera_pl']= "Login musi zawierać przynajmniej jedną literę.";
			$feedback['login_litera_en']= "Login have to has one letter  at least.";
			$feedback['login_litera_ru']= "Login have to has one letter  at least.";
			return false;
		}

		// must contain all legal characters
		if (strspn($name,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_")
			!= strlen($name)) {
			$feedback['login_n_znak_pl']= " Niedozwolony znak w loginie. ";
			$feedback['login_n_znak_en']= " Invalid character in login. ";
			$feedback['login_n_znak_ru']= " Invalid character in login. ";
			return false;
		}

		// min and max length
		if (strlen($name) < 5) {
			$feedback['login_krotki_pl']= "Login zbyt krótki. Minimum 5 znaków.  ";
			$feedback['login_krotki_en']= "Login to short. 5 characters at least.  ";
			$feedback['login_krotki_ru']= "Login to short. 5 characters at least.  ";
			return false;
		}
		if (strlen($name) > 15) {
			$feedback['login_dlugi_pl']= " Login za długi. Maksimum 15 znaków. ";
			$feedback['login_dlugi_en']= " Login to long. 15 characters max. ";
			$feedback['login_dlugi_ru']= " Login to long. 15 characters max. ";
			return false;
		}

		// illegal names
		if (eregi("^((root)|(bin)|(daemon)|(adm)|(lp)|(sync)|(shutdown)|(halt)|(mail)|(news)"
			. "|(uucp)|(operator)|(games)|(mysql)|(httpd)|(nobody)|(dummy)"
			. "|(www)|(cvs)|(shell)|(ftp)|(irc)|(debian)|(ns)|(download))$",$name)) {
			$feedback['nazwa_zarez']= " Niedozwolona nazwa .";
			return false;
		}
		if (eregi("^(anoncvs_)",$name)) {
			$feedback['cvs']= "Name is reserved for CVS.";
			return false;
		}

		return true;
	}
	function account_valid($name) {
		global $feedback;
		if (eregi('[0-9\\?\+\.\=\<\>\{\}\^\%\$\#\@\!\*\(\)\;\'\"\[-]',$name)){

			return false;
		}
		/*if (strspn($name,"abcÓ&#8222;&#328;&#8364;&#168;deÓ&#8222;&#328;&#8222;&#8364;fghijkl&#212;&#201;&#328;&#8364;&#353;mno&#212;&#8218;&#336;&#8218;pqrsÓ&#8218;&#327;Ćtuvwxyz&#212;&#201;&#212;&#205;Ó&#8222;&#328;&#8364;&#382;ABCÓ&#8222;&#328;&#8364;&#160;DEÓ&#8222;&#327;&#152;FGHIJKL&#212;&#201;&#327;&#129;MNO&#212;&#8218;&#328;&#8364;śPQRSÓ&#8218;&#327;&#731;TUVWXYZ&#212;&#201;&#327;&#203;Ó&#8218;&#327;&#356;")
			!= strlen($name)) {

			return false;
		}*/
		return true;
	}
	function account_numvalid($liczba) {
		if(!ereg('([0-9]$)', $liczba)){
			return false;
		}
		return true;
	}

	function account_telvalid($telefon) {
		if(!ereg('^\+48([0-9]{9}$)', $telefon)){
			return false;
		}
		return true;
	}
	function validate_email ($address) {
		return (ereg('^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+'. '@'. '[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.' . '[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$', $address));
	}
}
?>