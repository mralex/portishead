$(function() {
	var loaded = false;
	
	$.history.init(function(url) {
		if (url == '' && loaded) url = '/projects/heroes';
		
		if (url && (url.length > 1)) {
			$('html, body').animate({scrollTop:0}, 100, 'swing');
		
			$("#content_box").animate({opacity: 0},{duration: 200, queue: false});
			$("#content_box").hide('slide', {direction: 'left', queue: false}, 400, function(e) {
				$.getScript(url + '.js', function(e) {
					// Animate height change?
					$("#index_hero").css("height", $("#content_box").height());
					
					$("#content_box").show('slide', {direction: 'right'}, 300);
					$("#content_box").animate({opacity: 1},{duration: 200, queue: false});
					
				});
			});
			loaded = true;
		} else {
			$("#index_hero").css("height", 'inherit');
			$.getScript("/projects/heroes.js", function(e) {
				$("#index_hero").css("height", $("#content_box").height());
			});
			loaded = true;
		}
	},{ unescape: "/" });

	$('a.project_link').live('click', function(e) {
		var url = $(this).attr('href');
		url = url.replace(/^.*#/, '');
		$.history.load(url);
		
		e.preventDefault();
	});
	
	$('#header h1 a').click(function(e) {
		$.history.load('');
		e.preventDefault();
	});

});
