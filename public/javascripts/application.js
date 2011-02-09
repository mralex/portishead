$(function() {

$("#images li.image").hover(function() {
	$(this).find("p").fadeOut('fast');
}, function() {
	$(this).find("p").fadeIn('fast');
})

if ($("#flash_notice").html()) {
	$("#flash_notice").delay(3000).hide('slide', 'fast');
}


// Contact form validation
$("#contact_form form").submit(function(e) {
	var error = false;
	
	$("#contact_form span").html("");
	
	if ($("#email").val() === "") {
		$("#email").siblings(".error").html("Email address required.");
		error = true;
	}
	
	if ($("#message").val() === "") {
		$("#message").siblings(".error").html("Message required.");
		error = true;
	}
	
	if (error) {
		e.preventDefault();
		return false;
	}
	
});
});