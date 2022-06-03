{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h4 class="grey-text text-darken-2">Lista utworzonych lekcji</h4></div>
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
				 <div style="font-weight:bold;">Nazwa kursu</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$course}
			 <li {if $smarty.get.id==$u.id_course}class="active"{/if}>
	       <div class="collapsible-header">
				 <div>{$u.name}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				{foreach item=c_user from=$u.lesson_list}
				<form action="lessons,ok,{$u.id_course}" name="save_index" method="post">
				<div class="row">
					<div class="col"><input type="text" name="index[{$c_user.id_lesson}]" value="{$c_user.sort}" class="browser-default" style="width:22px;text-align:center;"></div>
					<div class="col"><a href="edit_lesson,{$c_user.id_lesson}">{$c_user.name}</a></div>
					<div class="col"><a href="lessons,delete_lesson_course,{$c_user.id_lesson}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
				</div>
				{/foreach}
				{if $u.lesson_list==""}
				<a href="http://edu.fibris.pl/manage/create_lesson">Dodaj nowa lekcję</a>
				{else}
				<div class="row">
					<div class="col"><input type="submit" name="save_index" value="Z"></form></div>
					<div class="col"></div>
					<div class="col"></a></div>
				</div>
				{/if}
			 </div>
			 </li>
			 {/foreach}
			 {if $lesson}
			 <li>
	       <div class="collapsible-header">
				 <div>< ...brak przypisanego kursu... ></div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
			  {foreach item=c_lesson from=$lesson}
				<div class="row">
					<div class="col"><a href="edit_lesson,{$c_lesson.id_lesson}">{$c_lesson.name}</a></div>
					<div class="col"><a href="lessons,delete_lesson_course,{$c_lesson.id_lesson}"><i class="material-icons left red-text" style="font-size:1.35rem">delete</i></a></div>
				</div>
			  {/foreach}
			 </div>
			 </li>
			 {/if}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}