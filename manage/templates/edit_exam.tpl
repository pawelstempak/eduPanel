{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
					 	  {if $smarty.get.action=="save"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Zmiany zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text grey">Zamknij</a></div>
								</div>
						  {/if}
			<div style="margin:0px auto">
			<form action="edit_exam,{$smarty.get.id}" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col l6">
				<h4 class="grey-text text-darken-2">Edytuj test</h4>
				</div>
				<div class="col l6 right-align">
				<div class="right"><div class="btn waves-effect waves-light btn red" onclick="location='exams'">Zamknij</div></div>
				<div class="right"><button class="btn waves-effect waves-light btn" type="submit" name="save_close">Zapisz i zamknij</button></div>
				<div><button class="btn waves-effect waves-light btn" type="submit" name="save">Zapisz</button></div>
				</div>
			</div>
				  <div class="input-field">
				    <select required name="course">
					 	<option value="">Brak przypisanego testu</option>
						{foreach item=u from=$course}
				      <option value="{$u.id_course}"{if $u.id_course == $exam.id_course} selected{/if}>{$u.name}</option>
						{/foreach}
				    </select>
				    <label>Wybierz kurs do jakiego przypisać lekcję.</label>
				  </div>
		        <div class="input-field">
		          <input id="name" type="text" name="name" class="validate" required value="{$exam.name}">
		          <label for="name">Tu wpisz tytuł testu</label>
		        </div>
		        <div class="input-field">
			          <textarea name="description" class="materialize-textarea" {* id="tinymcetextarea" *}>{$exam.description}</textarea>
						 <label for="textarea1">Opis testu - wszystko to co powinien wiedzieć zdający przed przystąpieniem do testu</label>
		        </div>
			</form>
			</div>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}