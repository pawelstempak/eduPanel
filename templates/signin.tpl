{include file="naglowek_sg.tpl"}
<main>
  <div class="section" id="index-banner">
    <div class="container">
      <div class="row center">
		  <br /><br /><br />
		  <div style="font-size:28px;" class="black-text"><br><i class="material-icons grey-text" style="font-size:60px;">lock_outline</i><br /><br />Podaj nazwę użytkownika i hasło<br /><br /></div>
		  <div style="width:300px;margin:0 auto">
	        <form action="signin" method="post">
		        <div class="input-field">
		          <input id="login" type="text" name="login" class="validate">
		          <label for="login">Nazwa użytkownika</label>
		        </div>
		        <div class="input-field">
		          <input id="password" type="password" name="password" class="validate">
		          <label for="password">Hasło</label>
		        </div>
				  <div>
					<br /><br /><button class="btn waves-effect waves-light green darken-3" type="submit" name="action">Zaloguj</button>
				  </div>
			  </form>
		  </div>
      </div>
      <br><br>
    </div>
  </div>
</main>
  <footer class="page-footer grey">
    <div class="footer-copyright">
      <div class="container center">
      Jeżeli nie zapomniałeś hasła do swojego panelu skontaktuj się z nami pod adresem <a href="mailto:{$config.email}">{$config.email}</a>
      </div>
    </div>
  </footer>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>