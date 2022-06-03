{include file="naglowek_course.tpl"}
<main>

  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div><h6 class="black-text text-darken-2">{$exam.name} - <b>pytanie nr {$smarty.get.action}</b></h6><hr /></div>
			<div class="lesson_title">{$question.name}</div>
			<div class="lesson_content">
				{if $smarty.get.action==4}
				<form name="formf" action="course_summary,{$smarty.get.action+1},{$smarty.get.id}" method="post" onSubmit="return evalGroup()">
				{else}
				<form name="formf" action="exam,{$smarty.get.action+1},{$smarty.get.id}" method="post" onSubmit="return evalGroup()">
				{/if}
				<input type="hidden" name="question_id" value="{$smarty.get.action}" />
				<input type="hidden" name="id_course" value="{$smarty.get.id}" />
				{foreach item=a from=$answers}
				  <label>
				    <input name="q{$question.id_question}" type="radio" id="test{$a.id_answer}" value="{$a.id_answer}" />
				    <span for="test{$a.id_answer}">{$a.name}</span>
				  </label>
				  <br />
				{/foreach}
			</div>
			{literal}
			  <script type="text/javascript">
					function evalGroup()
					{
						var group = document.formf.q{/literal}{$question.id_question}{literal};
						for (var i=0; i<group.length; i++) {
						if (group[i].checked)
						break;
						}
						if (i==group.length)
						{
						alert("Musisz zaznaczyć odpowiedź.");
						return false;
						}
						else
						{
						return true;
						}
					}
			  </script>
			{/literal}
			<div class="center">{*{if $smarty.get.action>1}<a href="course,{$smarty.get.action-1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Poprzednia</a>{/if} {if $smarty.get.action<$course_number}<a href="course,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Następna</a>{else}<a href="course_summary,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large">Następna</a>{if $smarty.get.action==4}<a href="course_summary,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large" onSubmit="return validate()">Dalej</a>{else}<a href="exam,{$smarty.get.action+1},{$smarty.get.id}" class="waves-effect waves-light btn-large" onSubmit="return validate()">Dalej</a>{/if}*}{*{/if}*}<button type="submit" name="Dalej" class="waves-effect waves-light btn-large" />Dalej</button></div>
			</form>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}