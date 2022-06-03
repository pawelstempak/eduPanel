{include file="naglowek_course.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			{if $course_result == 1}
			<div><h6 class="black-text text-darken-2">Podsumowanie</h6><hr /></div>
			<div style="text-align:center"><h1>Gratulacje</h1></div>
			<div class="lesson_title">Wszystkie twoje odpowiedzi były poprawne.</div>
			<div class="lesson_content">Jeżeli chcesz utrwalić swoje informacje, rozpocznij kurs od nowa poniżej.<br />Możesz także znaleźć go w zakładce kursy ukończone.<br />Dziękuje za udział w kursie.</div>
			<div class="center"><a href="course_info,{$id_course.id_course}" class="waves-effect waves-light btn-large blue">Rozpocznij od nowa</a>&nbsp;&nbsp;&nbsp;<a href="dashboard" class="waves-effect waves-light btn-large green">Zakończ</a></div>
			{else}
			<div><h6 class="black-text text-darken-2">Podsumowanie</h6><hr /></div>
			<div class="lesson_title"><i class="material-icons large">sentiment_very_dissatisfied</i><br />Bardzo nam przykro</div>
			<div class="lesson_content">Nie odpowiedziałeś(aś) poprawnie na wszystkie zadane pytania testowe.<br />Powtórz kurs od początku oraz odpowiedz poprawnie na zadane pytania testowe.<br />Możesz także powtórzyć go później. Kurs jest dostępny w zakładce kursy aktywne.</div>
			<div class="center"><a href="course_info,{$id_course.id_course}" class="waves-effect waves-light btn-large blue">Rozpocznij od nowa</a>&nbsp;&nbsp;&nbsp;<a href="dashboard" class="waves-effect waves-light btn-large red">Powtórz później</a></div>
			{/if}
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}