$(function() {
	var loaded = false;
	
	$("#index_hero").ajaxStart(function() {
		$("#loader").fadeIn('fast');
	})
	$("#index_hero").ajaxComplete(function() {
		$("#loader").fadeOut('fast');
	})
	
	$.history.init(function(url) {
		if (url == '' && loaded) url = '/projects/heroes';
		
		if (url && (url.length > 1)) {
			$('html, body').animate({scrollTop:0}, 200, 'swing');
		
			$("#content_box").animate({opacity: 0},{duration: 800, queue: false});
			$("#content_box").hide('slide', {direction: 'left', queue: false}, 600, function(e) {
				$.getScript(url + '.js', function(e) {
					// Animate height change?
					$("#index_hero").animate({height: $("#content_box").height()}, {duration: 400});
					
					$("#image_view li").hide();
					var firstSlide = $("#image_view li:first");
					firstSlide.show();
					firstSlide.addClass("visible");
					
					$("#content_box").show('slide', {direction: 'right'}, 300, function() {
						var tallest = 0;
						$("#image_view li").each(function(e) {
							if ($(this).height() > tallest) tallest = $(this).height();
						});
						
						$("#image_view").animate({height: tallest});
						
						updateNavHeight(firstSlide);
						$("#image_view_nav a").delay(700).animate({opacity: 0}, {duration: 400});
					});
					
					$("#content_box").animate({opacity: 1},{duration: 400, queue: false});
					
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
