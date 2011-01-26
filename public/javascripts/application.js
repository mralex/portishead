$(function() {

$("#images li.image").hover(function() {
	$(this).find("p").fadeOut('fast');
}, function() {
	$(this).find("p").fadeIn('fast');
})

if ($("#flash_notice").html()) {
	$("#flash_notice").delay(3000).hide('slide', 'fast');
}

});