{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h4 class="grey-text text-darken-2">Lista kursów</h4></div>
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
				 <div style="font-weight:bold;width:90%;">Nazwa kursu</div>
				 <div style="font-weight:bold;width:5%;text-align:center">Kursanci</div>
				 <div style="font-weight:bold;width:5%;text-align:center">Testy</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$course}
			 <li {if $smarty.get.action_id==$u.id_course}class="active"{/if}>
	       <div class="collapsible-header">
				 <div style="width:90%">{$u.name}</div>
				 <div style="width:5%;text-align:center">{$u.course_number}</div>
				 <div style="width:5%;text-align:center"></div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="courses,{$u.id_course}" method="post">
						  <div class="row">
						  	<div class="col s6 m6 l6"><h5 class="head grey-text text-darken-2">Edytuj dane kursu</h5></div>
							<div class="col s6 m6 l6"><a href="#modal{$u.id_course}" class="modal-trigger waves-effect waves-light btn-small right">Usuń kurs</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="name" name="name" type="text" class="validate" value="{$u.name}" required>
				          <label for="name">Nazwa kursu</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
							  <div class="col s4 m4 l4">
							  		<a href="#modal_user{$u.id_course}" class="modal-trigger"><i class="material-icons left blue-text">person</i>Lista aktywnych kursantów +</a><br /><br />
									{foreach item=c_user from=$u.course_list}
									<div class="row">
									<div class="col">{$c_user.name} {$c_user.lastname}</div>
									<div class="col"><a href="courses,delete_user_course,{$c_user.id_user},{$c_user.id_course}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
									</div>
									{/foreach}
							  </div>
							  <div class="col s4 m4 l4">
							  		<i class="material-icons left blue-text">check_circle</i><span class="blue-text">Ostatnio kurs ukończyli</span>
									<br /><br />
									{foreach item=cc_user from=$u.completed_course_list}
									<div class="row">
									<div class="col">{$cc_user.name} {$cc_user.lastname}</div>
									<div class="col"><a href="courses,delete_completed_user_course,{$cc_user.id_user},{$cc_user.id_course}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
									</div>
									{/foreach}
									<div><a href="courses_print,{$cc_user.id_course}">Wyświetl całą listę<i class="material-icons left blue-text" style="font-size:1.35rem">print</i></a></div>
							  </div>
							  <div class="col s4 m4 l4">
							  		<a href="#modal_test{$u.id_course}" class="modal-trigger"><i class="material-icons left blue-text">assignment_turned_in</i>Lista testów +</a>
							  </div>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="zapisz">Zapisz</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			  <div id="modal_user{$u.id_course}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>Wybierz kursantów</h4>
					<div class="row">
					{foreach item=user from=$users}
					<div class="col s12 m3 l2"><a href="courses,add_user_to_course,{$user.id_user},{$u.id_course}" class="left grey-text text-darken-4">{$user.name} {$user.lastname}</b></div>
					{/foreach}
					</div>
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat green-text">Anuluj</a>
			    </div>
			  </div>
			  <div id="modal{$u.id_course}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>Czy na pewno chcesz usunąć ten kurs?</h4>
					<p><b>"{$u.name}"</b></p>
			      <p>Wszelkie informacje o tym kursie oraz kursanci zostaną usunięci.</p><br /><a href="courses,delete,{$u.id_course}" class="white-text"><button class="btn waves-effect waves-light red">Tak, usuń ten kurs</button></a>
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