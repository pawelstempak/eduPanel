{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		  <h4 class="head grey-text text-darken-2">Ustawienia konta</h4>
		  <p>Wszystkie informacje oznaczone gwiazdką <span class="red-text">*</span> są wymagane.</p>
		  <div class="row">
		    <form class="col s12" action="settings" method="post">
			 	  {if $smarty.get.id=="ok"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Dane w przesłanym formularzu zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text">Zamknij</a></div>
								</div>
				  {/if}
				  <br />
				  <h5 class="head grey-text text-darken-2">Twoje dane</h5>
		      <div class="row">
		        <div class="input-field col s12 m6">
		          <input id="name" name="name" type="text" class="validate" value="{$signin_user.name}" required>
		          <label for="name">Imię <span class="red-text">*</span></label>
		        </div>
		        <div class="input-field col s12 m6">
		          <input id="lastname" name="lastname" type="text" class="validate" value="{$signin_user.lastname}" required>
		          <label for="lastname">Nazwisko <span class="red-text">*</span></label>
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m6">
		          <input id="email" name="email" type="email" class="validate" value="{$signin_user.email}" required>
		          <label for="email">E-mail <span class="red-text">*</span></label>
		        </div>
		        <div class="input-field col s12 m6">
		          <input id="password" name="password" type="password">
		          <label for="password">Hasło <span class="red-text">*</span></label>
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m12 center">
		            <button class="btn waves-effect waves-light" type="submit" name="zapisz">Zapisz</button>
		        </div>
		      </div>
		    </form>
		  </div>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}