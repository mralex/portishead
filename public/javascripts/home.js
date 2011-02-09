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
			$('html, body').animate({scrollTop:0}, 400, 'swing');
		
			$("#content_box").animate({opacity: 0},{duration: 800, queue: false});
			$("#content_box").hide('slide', {direction: 'left', queue: false}, 600, function(e) {
				$.getScript(url + '.js', function(e) {
					$("#project").height($("#content_box").height());
					$("#index_hero").animate({height: $("#content_box").height()}, {duration: 400});
					
					var firstSlide = $("#image_view li:first");

					$("#image_view li").hide();
					firstSlide.show();
					firstSlide.addClass("visible");
					
					$("#content_box").show('slide', {direction: 'right'}, 300);
					
					$("#content_box").animate({opacity: 1},{duration: 400, queue: false});
					
					// Google Analytics Tracking, if it exists
					if (typeof _gaq === "object") _gaq.push(['_trackPageview', url])
				});
			});
			loaded = true;
		} else {
			$("#index_hero").css("height", 'inherit');
			$.getScript("/projects/heroes.js", function(e) {
				$("#index_hero").css("height", $("#content_box").height());
				
				// Google Analytics Tracking, if it exists
				if (typeof _gaq === "object") _gaq.push(['_trackPageview', "/projects/heroes.js"])
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
