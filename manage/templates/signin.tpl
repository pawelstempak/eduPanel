{include file="naglowek_sg.tpl"}
<main>
  <div class="section" id="index-banner">
    <div class="container">
      <div class="row center">
		  <br /><br /><br />
		  <div style="font-size:18px;" class="black-text"><br><i class="material-icons grey-text text-lighten-3" style="font-size:60px;">lock_outline</i><br /><br /></div>
		  <div style="width:300px;margin:0 auto">
	        <form action="signin" method="post">
		        <div class="input-field">
				  {$feedback.blad_logow_email_pl}
				  {$feedback.blad_logow_baza_pl}
		          <input id="email" type="email" name="email" class="validate">
		          <label for="email">Nazwa użytkownika</label>
		        </div>
		        <div class="input-field">
		          <input id="password" type="password" name="password" class="validate">
		          <label for="password">Hasło</label>
		        </div>
				  {*<div class="left">
				  <input type="checkbox" id="test6" class="filled-in" name="email_settings" value="1" />
      		  <label for="test6">Nie wylogowuj mnie</label>
				  </div>*}
				  <div>
					<br /><br /><button class="btn waves-effect waves-light" type="submit" name="action">Zaloguj</button>
				  </div>
			  </form>
		  </div>
      </div>
      <br><br>
    </div>
  </div>
</main>
  <footer class="page-footer black">
    <div class="footer-copyright">
      <div class="container center">
      </div>
    </div>
  </footer>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>