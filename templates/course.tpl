{include file="naglowek_course.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div><h6 class="black-text text-darken-2">{$course.name} - strona nr {$smarty.get.action}</h6><hr /></div>
			<div class="lesson_title">{$lesson.name}</div>
			<div class="lesson_content">{$lesson.content}</div>
			<div class="center">{if $smarty.get.action>1}<a href="course,{$smarty.get.action-1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Poprzednia</a>{/if} {if $smarty.get.action<$course_number}<a href="course,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Następna</a>{else}{*<a href="course_summary,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Następna</a>*}<a href="course_exam,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Następna</a>{/if}</div>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}