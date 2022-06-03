{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h4 class="grey-text text-darken-2">Użytkownicy</h4></div>
		</div>
					 	  {if $smarty.get.id=="ok"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Dane w przesłanym formularzu zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text">Zamknij</a></div>
								</div>
						  {/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header">
			 	 <div style="font-weight:bold;width:10%">UDO</div>
				 <div style="font-weight:bold;width:45%">Imię i Nazwisko</div>
				 <div style="font-weight:bold;width:45%">Nazwa użytkownika</div>
			 </div>
			 </li>
		  	 {foreach item=user from=$users}
			 <li>
	       <div class="collapsible-header">
				 <div style="width:10%">{$user.udo}</div>
				 <div style="width:45%">{$user.name} {$user.lastname}</div>
				 <div style="width:45%">{$user.login}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form action="users" method="post">
						  <div class="row">
						  	<div class="col s6 m6 l6"><h5 class="head grey-text text-darken-2">Edytuj dane użytkownika</h5></div>
							<div class="col s6 m6 l6"><a href="#modal{$user.id_user}" class="modal-trigger waves-effect waves-light btn-small right">Usuń użytkownika</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m6">
				          <input id="name" name="name" type="text" class="validate" value="{$user.name}" required>
				          <label for="name">Imię</label>
				        </div>
				        <div class="input-field col s12 m6">
				          <input id="lastname" name="lastname" type="text" class="validate" value="{$user.lastname}" required>
				          <label for="lastname">Nazwisko</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s12 m6">
				          <input id="stanowisko" name="stanowisko" type="text" class="validate" value="{$user.stanowisko}" required>
				          <label for="stanowisko">Stanowisko</label>
				        </div>
				        <div class="input-field col s12 m6">
				          <input id="udo" name="udo" type="text" class="validate" value="{$user.udo}">
				          <label for="udo">Numer UDO</label>
				        </div>
				      </div>
						<div class="row">
				        <div class="input-field col s12 m6">
				          <input id="email" name="email" type="email" class="validate" value="{$user.email}" required>
				          <label for="email">E-mail</label>
				        </div>
				        <div class="input-field col s12 m6">
				          <input id="login" name="login" type="text" class="validate" value="{$user.login}" required>
				          <label for="login">Nazwa użytkownika</label>
				        </div>
						</div>
						<div class="row">
				        <div class="input-field col s12 m6">
				          <input id="password" name="password" type="text" value="{$user.haslo}">
				          <label for="password">Hasło</label>
				        </div>
				        <div class="input-field col s12 m6">
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
						  		<input type="hidden" name="id_user"	value="{$user.id_user}">
				            <button class="btn waves-effect waves-light" type="submit" name="zapisz">Zapisz</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			  <div id="modal{$user.id_user}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>Usunąć użytkownika?</h4>
			      <p>Wszelkie informacje o tym użytkowniku zostaną usunięte.</p><br /><a href="users,delete,{$user.id_user}" class="red-text">Tak, usuń <b>{$user.login}</b></a>
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat green-text">Nie kasuj</a>
			    </div>
			  </div>
			 {/foreach}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}