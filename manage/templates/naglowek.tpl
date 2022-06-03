<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Manage Panel ver 1.01</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">

  <script src="https://cdn.tiny.cloud/1/b4vcfsvdd6gefx03rw6csavocvwv0fwanebftelfsy4j1k9f/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
  <script>	  tinymce.init({
    selector: '#tinymcetextarea',
	 height: 500,
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table directionality emoticons template paste code'
    ],
    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons | code',
	 images_upload_url: 'post_uppload.php',
	 images_upload_base_path: 'http://edu.fibris.pl/images/',
	 images_upload_credentials: true
  });
  </script>
</head>
<body>
<header>
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="settings" class="black-text"><i class="material-icons light-green-text" style="float:left">settings</i>Ustawienia</a></li>
	  {*<li><a href="email_settings" class="black-text"><i class="material-icons green-text" style="float:left">email</i>Zmień email</a></li>
	  *}
	  <li><a href="logout" title="Logout" class="black-text"><i class="material-icons light-green-text" style="float:left">power_settings_new</i>Wyloguj</a></li>
	</ul>
  <nav class="black lighten-1" role="navigation">
    <div class="nav-wrapper container">
	 {*<a id="logo-container" href="strona_glowna" class="brand-logo left"><i class="material-icons red-text">bookmark</i>Dropshiping.pl</a>*}
      <ul class="right">
		  <li><a class="white-text dropdown-trigger" data-target="dropdown1"><i class="material-icons light-green-text" style="float:left">account_circle</i>&nbsp; Zalogowany:&nbsp;{$smarty.session.login}<i class="material-icons right">arrow_drop_down</i></a></li>
        {*<li><a href="logout" title="Logout" class="white-text"><i class="material-icons red-text" style="float:left">power_settings_new</i> &nbsp;Wyloguj</a></li>*}
      </ul>

      <ul id="nav-mobile" class="grey darken-4 sidenav sidenav-fixed">
				<li class="logo"><a href="{$DIR}"><img src="img/mlogo.png" width="30" style="position: relative;top:7px;" /><span class="white-text">&nbsp;<b style="font-size:20px">Manage</b> Panel ver {$config.ver}</span></a></li>
				<li class="divider"></li>
				<li {if $smarty.get.page=="create_course"}class="active"{/if}><a href="create_course" class="white-text"><i class="material-icons white-text">library_add</i>Stwórz kurs</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li {if $smarty.get.page=="courses"}class="active"{/if}><a href="courses" class="white-text"><i class="material-icons white-text">library_books</i>Lista kursów</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li class="divider"></li>
				<li {if $smarty.get.page=="create_lesson"}class="active"{/if}><a href="create_lesson" class="white-text"><i class="material-icons white-text">input</i>Utwórz lekcję</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li {if $smarty.get.page=="lessons"}class="active"{/if}><a href="lessons" class="white-text"><i class="material-icons white-text">import_contacts</i>Lista lekcji</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li class="divider"></li>
				<li {if $smarty.get.page=="create_exam"}class="active"{/if}><a href="create_exam" class="white-text"><i class="material-icons white-text">add_box</i>Stwórz test</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li {if $smarty.get.page=="exams"}class="active"{/if}><a href="exams" class="white-text"><i class="material-icons white-text">assignment_turned_in</i>Lista testów</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li class="divider"></li>
				<li {if $smarty.get.page=="add_user"}class="active"{/if}><a href="add_user" class="white-text"><i class="material-icons white-text">person_add</i>Dodaj użytkownika</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li {if $smarty.get.page=="users" or $smarty.get.page==""}class="active"{/if}><a href="users" class="white-text"><i class="material-icons white-text">person</i>Lista użytkowników</a></li>
				<li class="divider" style="margin-top:0px;"></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger hide-on-large-only"><i class="material-icons">menu</i></a>
    </div>
  </nav>
</header>