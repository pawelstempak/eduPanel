<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Panel Administracyjny</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style_no_sg.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
</head>
<body>
<header>
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="settings" class="black-text"><i class="material-icons red-text" style="float:left">settings</i>Ustawienia</a></li>
	  <li><a href="email_settings" class="black-text"><i class="material-icons red-text" style="float:left">email</i>Zmień email</a></li>
	  <li><a href="logout" title="Logout" class="black-text"><i class="material-icons red-text" style="float:left">power_settings_new</i>Wyloguj</a></li>
	</ul>
  <nav class="black lighten-1" role="navigation">

    <div class="nav-wrapper container">
	 {*<a id="logo-container" href="strona_glowna" class="brand-logo left"><i class="material-icons red-text">bookmark</i>Dropshiping.pl</a>*}
      <ul class="right">
		  <li><a href="logout" title="Logout" class="white-text dropdown-button" data-activates="dropdown1"><i class="material-icons red-text" style="float:left">account_circle</i> &nbsp;{$smarty.session.email}<i class="material-icons right">arrow_drop_down</i></a></li>
        {*<li><a href="logout" title="Logout" class="white-text"><i class="material-icons red-text" style="float:left">power_settings_new</i> &nbsp;Wyloguj</a></li>*}
      </ul>

      <ul id="nav-mobile" class="grey darken-4 side-nav fixed">
				<li class="logo disabled"><a href="{$DIR}"><img src="img/logo.png" width="250" /></a></li>
				<li class="divider"></li>
				{if $smarty.session.admin==1}
				<li><a href="users" class="white-text">Użytkownicy</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li><a href="users_payments" class="white-text">Realizacja wypłat</a></li>
				{else}
				<li><a href="codes" class="white-text">Wykorzystanie kodu</a></li>
				<li class="divider" style="margin-top:0px;"></li>
			   <li><a href="funds" class="white-text">Przyznane środki</a></li>
				<li class="divider" style="margin-top:0px;"></li>
				<li><a href="payments" class="white-text">Moje wypłaty</a></li>
				<li class="divider" style="margin-top:0px;"></li>
			   <li><a href="promo_code" class="white-text">Twój kod promocyjny</a></li>
				{/if}
				<li class="divider" style="margin-top:0px;"></li>

      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse hide-on-large-only"><i class="material-icons">menu</i></a>
    </div>

  </nav>
</header>