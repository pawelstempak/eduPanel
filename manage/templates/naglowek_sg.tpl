<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Analityk</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style_sg.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
</head>
<body>
<header>
  <nav class="black lighten-1" role="navigation">
    <div class="nav-wrapper container">
	 &nbsp; <img src="img/mlogo.png" width="30" style="position: relative;top:9px;" />&nbsp;<b>Manage</b> Panel ver {$config.ver}
	 <!-- <a id="logo-container" href="strona_glowna" class="brand-logo left"><i class="material-icons pink-text text-darken-2" style="font-size:45px">account_circle</i> &nbsp;Modny-zapach.pl</a> -->
      <!-- <ul class="right hide-on-small-only">
        <li><a href="signin" title="Zaloguj się">Zaloguj się</a></li>
		  <li><a href="contact" title="Kontakt">Kontakt</a></li>
      </ul>
 	 -->
      <ul id="nav-mobile" class="sidenav">
				{*<li class="logo"><a href="http://fibris.pl"><img src="img/logo.png" width="200" /></li>
			   <li><a href="signin" style="color:#2D2D2D;border-bottom:1px #E6E6E6 solid;font-weight: 300;">Zaloguj się</a></li>
				<li><a href="signup" style="color:#2D2D2D;border-bottom:1px #E6E6E6 solid;font-weight: 300;">Zarejestruj się</a></li>
				<li><a href="contact" style="color:#2D2D2D;border-bottom:1px #E6E6E6 solid;font-weight: 300;">Kontakt</a></li>*}
			    <li>
				 <div class="user-view">
			      <div>
			        <img src="img/logo.png" width="200">
			      </div>
			    </div>
				 </li>
				<li><a href="{$PATH_WWW}signin" style="color:#2D2D2D;border-bottom:1px #E6E6E6 solid;font-weight: 300;">Fibris EDU</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
  </nav>
</header>