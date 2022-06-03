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
			<form action="create_lesson" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col l6">
				<h4 class="grey-text text-darken-2">Utwórz nową lekcję</h4>
				</div>
				<div class="col l6 right-align">
				<div class="right"><button class="btn waves-effect waves-light btn red" onclick="location='lessons'">Zamknij</button></div>
				<div class="right"><button class="btn waves-effect waves-light btn" type="submit" name="save_close">Zapisz i zamknij</button></div>
				<div><button class="btn waves-effect waves-light btn" type="submit" name="save">Zapisz</button></div>
				</div>
			</div>
				  <div class="input-field">
				    <select required name="course">
				      <option value="">Wybierz kurs</option>
						{foreach item=u from=$course}
				      <option value="{$u.id_course}">{$u.name}</option>
						{/foreach}
				    </select>
				    <label>Wybierz kurs do jakiego przypisać lekcję.</label>
				  </div>
		        <div class="input-field">
		          <input id="name" type="text" name="name" class="validate" required>
		          <label for="name">Tu wpisz tytuł lekcji</label>
		        </div>
					<div class="file-field input-field">
					<div class="btn">
					<span>Dodaj załącznik</span>
					<input type="file" name="attachment">
					</div>
					<div class="file-path-wrapper">
					<input class="file-path validate" type="text" name="attachment">
					</div>
					</div>
		        <div class="input-field">
			          <textarea name="content" id="tinymcetextarea"></textarea>
		        </div>
			</form>
			</div>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}