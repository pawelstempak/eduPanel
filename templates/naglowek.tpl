<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>EDU Panel v.101</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/{$style}" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
</head>
<body>
<header>
	<ul id="dropdown1" class="dropdown-content">
	  {if $smarty.session.admin!=1}{/if}
	  {*<li><a href="settings" class="black-text"><i class="material-icons green-text" style="float:left">settings</i>Ustawienia</a></li>
	  <li><a href="email_settings" class="black-text"><i class="material-icons green-text" style="float:left">email</i>Zmień email</a></li>
	  *}
	  <li><a href="logout" title="Logout" class="black-text"><i class="material-icons green-text" style="float:left">power_settings_new</i>Wyloguj</a></li>
	</ul>
  <nav class="green darken-4" role="navigation">
    <div class="nav-wrapper container">
	 {*<a id="logo-container" href="strona_glowna" class="brand-logo left"><i class="material-icons red-text">bookmark</i>Dropshiping.pl</a>*}
      <ul class="right">
		  <li><a class="white-text dropdown-trigger" data-target="dropdown1"><i class="material-icons green-text" style="float:left">account_circle</i>&nbsp; Zalogowany:&nbsp;{$smarty.session.login}<i class="material-icons right">arrow_drop_down</i></a></li>
        {*<li><a href="logout" title="Logout" class="white-text"><i class="material-icons red-text" style="float:left">power_settings_new</i> &nbsp;Wyloguj</a></li>*}
      </ul>

      <ul id="nav-mobile" class="green darken-4 sidenav sidenav-fixed">
				<li class="logo"><a href="{$DIR}"><img src="img/mlogo.png" width="30" style="position: relative;top:7px;" /><span class="white-text"><b style="font-size:20px">Fibris EDU</b></span></a></li>
				<li class="divider"></li>
				<li><a href="active" class="white-text"><i class="material-icons green-text" style="float:left">library_books</i>Aktywne kursy</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li><a href="completed" class="white-text"><i class="material-icons green-text" style="float:left">assignment_turned_in</i>Ukończone kursy</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li><a href="logout" title="Logout" class="white-text"><i class="material-icons green-text" style="float:left">power_settings_new</i>Wyloguj</a></li>
				<li class="divider" style="margin-top:0px;"></li>

      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger hide-on-large-only"><i class="material-icons">menu</i></a>
    </div>
  </nav>
</header>