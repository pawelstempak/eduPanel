{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h4 class="grey-text text-darken-2">{$exam.name}</h4></div>
		</div>
					 	  {if $smarty.get.action=="ok"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Zmiany zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text">Zamknij</a></div>
								</div>
						  {/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header">
				 <div style="font-weight:bold;"><a href="add_question">Dodaj nowe pytanie</a></div>
			 </div>
			 </li>
			 <li>
			 {foreach item=q from=$question}
			 <li class="active">
	       <div class="collapsible-header">
				 <div>{$q.name}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				{foreach item=c_user from=$q.answer_list}
				<form action="exams,ok,{$u.id_course}" name="save_index" method="post">
				<div class="row">
					<div class="col"><input type="text" name="index[{$c_user.id_exam}]" value="{$c_user.sort}" class="browser-default" style="width:22px;text-align:center;"></div>
					<div class="col"><a href="questions,{$c_user.id_exam}">{$c_user.name}</a></div>
					<div class="col"><a href="edit_exam,{$c_user.id_exam}"><i class="material-icons left red-text" style="font-size:1.35rem">edit</i></a></div>
					<div class="col"><a href="exams,delete_exam_course,{$c_user.id_exam}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
				</div>
				{/foreach}
				{if $q.answer_list==""}
				<a href="http://edu.fibris.pl/manage/create_exam">Utwórz nową odpowiedź</a>
				{else}
				<div class="row">
					<div class="col"><input type="submit" name="save_index" value="Z"></form></div>
				</div>
				{/if}
			 </div>
			 </li>
			 {/foreach}

			 {*
			 {if $lesson}
			 <li>
	       <div class="collapsible-header">
				 <div>< ...brak przypisanego egazaminu... ></div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
			  {foreach item=c_exam from=$exam}
				<div class="row">
					<div class="col"><a href="edit_exam,{$c_exam.id_exam}">{$c_exam.name}</a></div>
					<div class="col"><a href="exams,delete_exam_course,{$c_exam.id_exam}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
				</div>
			  {/foreach}
			 </div>
			 </li>
			 {/if}
			 *}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}