(function($){
  $(function(){

	 $('.dropdown-trigger').dropdown()
	 $('.modal').modal();
    $('.collapsible').collapsible();
    $('.sidenav').sidenav();
	 $('select').formSelect();
	 $('.tooltipped').tooltip();


  }); // end of document ready

	 $(".closeCard").click(function() {
	 	$(".info").fadeOut(700);
	 });

})(jQuery); // end of jQuery name space