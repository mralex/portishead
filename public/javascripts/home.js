$(function() {
	
	$.history.init(function(url) {
		if (url) {
			$('html, body').animate({scrollTop:0}, 'slow', 'swing');

			$("#content_box").slideUp('fast');
			$.getScript(url + '.js');
			$("#content_box").slideDown('fast');
		} else {
			$.getScript("/projects/heroes.js");
		}
	},{ unescape: "/" });

	$('a.project_link').live('click', function(e) {
		var url = $(this).attr('href');
		url = url.replace(/^.*#/, '');
		$.history.load(url);
		
		e.preventDefault();
	});

});
