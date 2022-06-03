{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="max-width:500px;margin:0px auto">
			<h4 class="grey-text text-darken-2">Dodaj nowego użytkownika</h4><br />
			<form action="add_user" method="post">
		        <div class="input-field">
		          <input id="name" type="text" name="name" class="validate" required value="{$smarty.post.name}">
		          <label for="name">Imię</label>
		        </div>
		        <div class="input-field">
		          <input id="lastname" type="text" name="lastname" class="validate" required value="{$smarty.post.lastname}">
		          <label for="lastname">Nazwisko</label>
		        </div>
		        <div class="input-field">
		          <input id="stanowisko" type="text" name="stanowisko" class="validate" required value="{$smarty.post.stanowisko}">
		          <label for="stanowisko">Stanowisko</label>
		        </div>
		        <div class="input-field">
		          <input id="udo" type="text" name="udo" class="validate" value="{$smarty.post.stanowisko}">
		          <label for="udo">Numer UDO</label>
		        </div>
		        <div class="input-field">
		          <input id="email" type="email" name="email" class="validate" value="{$smarty.post.email}">
		          <label for="email">Adres e-mail</label>
					 {if $feedback.email_istnieje !=""}<p class="red-text">{$feedback.email_istnieje}</p><br />{/if}
		        </div>
		        <div class="input-field">
		          <input id="login" type="text" name="login" class="validate" required value="{$smarty.post.login}">
		          <label for="login">Nazwa użytkownika</label>
					 {if $feedback.login_istnieje !=""}<p class="red-text">{$feedback.login_istnieje}</p><br />{/if}
		        </div>
		        <div class="input-field">
		          <input id="password" type="password" name="password" class="validate" required>
		          <label for="password">Hasło</label>
		        </div>
				  <br />
				  <div style="text-align:center">
				  	<button class="btn waves-effect waves-light btn" type="submit" name="signup">Dodaj użytkownika</button>
				  </div>
				  <br />
			</form>
			</div>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}