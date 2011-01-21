$(function() {
	
	$.history.init(function(url) {
		if (url) {
			$('html, body').animate({scrollTop:0});

			$("#content_box").slideUp('fast');
		//	$.getScript(url);
			$.getScript("/projects/heroes.js");
			$("#content_box").slideDown('fast');
		} else {
			$.getScript("/projects/heroes.js");
		}
	},{ unescape: "/" });

	$('a.project_link').live('click', function(e) {
		var url = $(this).attr('href');
		url = url.replace(/^.*#/, '');
		$.history.load(url);
		return false;
	});

});
