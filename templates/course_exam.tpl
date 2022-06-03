{include file="naglowek_course.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			{if $exam}
			<div></div>
			<div><h3 class="black-text text-darken-2 center">{$exam.name}</h3></div><br />
			<div><h6 class="grey-text text-darken-2 center">{$exam.desc1}</h6></div><br />
			<div><h5 class="green-text text-darken-2 center">{$exam.desc2}</h5></div>
			<br /><br />
			<div class="center"><a href="exam,1,{$exam.id_exam},start" class="waves-effect waves-light btn-large">Rozpocznij</a></div>
			{else}
			<div></div>
			<div><h3 class="black-text text-darken-2 center">Wystąpił błąd!</h3></div><br />
			<div><h6 class="red-text text-darken-2 center">Nie ma takiego kursu lub nie masz do niego dostępu.</h6></div><br />
			<div class="center"><a href="active" class="waves-effect waves-light btn-large">Wróć do listy kursów</a></div>
			{/if}
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}