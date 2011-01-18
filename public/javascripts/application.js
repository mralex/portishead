$(function() {

$("#images li.image").hover(function() {
	$(this).find("p").fadeOut('fast');
}, function() {
	$(this).find("p").fadeIn('fast');
})

});