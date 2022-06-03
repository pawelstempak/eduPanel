{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="max-width:500px;margin:0px auto">
			<h4 class="grey-text text-darken-2">Dodaj nowy kurs</h4><br />
			<form action="create_course" method="post">
		        <div class="input-field">
		          <input id="name" type="text" name="name" class="validate" required>
		          <label for="name">Tu wpisz nazwę kursu</label>
		        </div>
				  <br />
				  <div style="text-align:center">
				  	<button class="btn waves-effect waves-light btn" type="submit" name="signup">Zapisz</button>
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