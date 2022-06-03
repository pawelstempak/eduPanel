{include file="naglowek.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h6 class="blue-text text-darken-3">Lista dostępnych kursów</h6></div>
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
				 <div style="font-weight:bold;width:100%;color:grey">Nazwa kursu</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$course}
			 <li>
	       <div class="collapsible-header">
				 <div style="width:100%" class="text-grey"><a href="course_info,{$u.id_course}"><h6><b>{$u.name}</b></h6></a></div>
			 </div>
			 </li>
			 {/foreach}
			 {if $course==""}<li><div class="collapsible-header"><div style="width:100%">Brak dostępnych kursów</div></div></li>{/if}
			 </ul>
			 <br /><br /><br />
			 <div class="row">
			 <div class="col s12 m12 l12 valign-wrapper"><h6 class="green-text text-darken-3">Lista ukończonych kursów</h6></div>
			 </div>
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header">
				 <div style="font-weight:bold;width:100%;color:grey">Nazwa kursu</div>
			 </div>
			 </li>
		  	 {foreach item=u1 from=$course1}
			 <li>
	       <div class="collapsible-header">
				 <div style="width:100%" class="text-grey"><a href="course_info,{$u1.id_course}"><h6><b>{$u1.name}</b></h6></a></div>
			 </div>
			 </li>
			 {/foreach}
			 {if $course1==""}<li><div class="collapsible-header"><div style="width:100%">Brak dostępnych kursów</div></div></li>{/if}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}