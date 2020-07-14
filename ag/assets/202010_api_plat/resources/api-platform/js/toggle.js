$(document ).ready(function() {
    $(".clickable").click(function(event) {
    	var target = event.currentTarget.attributes["data-target"];
    	if (target) {
    		$("#"+target.value).slideToggle("fast");
    	}
    });
});