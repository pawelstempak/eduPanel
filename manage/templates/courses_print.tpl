{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h6 class="grey-text text-darken-2">Lista użytkowników którzy ukończyli kurs <b>"{$course.name}"</b></h6></div>
		</div>
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header">
				 <div style="font-weight:bold;width:25%">Imię i Nazwisko</div>
				 <div style="font-weight:bold;width:25%">Nazwa użytkownika</div>
				 <div style="font-weight:bold;width:25%">Stanowisko</div>
				 <div style="font-weight:bold;width:25%">Ostatnio ukończono</div>
			 </div>
			 </li>
		  	 {foreach item=user from=$users}
			 <li>
	       <div class="collapsible-header">
				 <div style="width:25%">{$user.name} {$user.lastname}</div>
				 <div style="width:25%">{$user.login}</div>
				 <div style="width:25%">{$user.stanowisko}</div>
				 <div style="width:25%">{$user.c_date|date_format:"%d.%m.%Y"}</div>
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