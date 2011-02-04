function ProjectCarousel() {

	function updateNavHeight(slide) {
		$("#image_view_nav a").css("height", slide.find("img").height());
	}


	var firstSlide = $("#image_view li:first");
	var lastSlide = $("#image_view li:last");

	if ($("#image_view li").length > 1) {
		// Project Images
		// 
		// Slide carousel

		var carouselPaused = false;
		var currentSlide = null;
		var slideTimeout = null;
		
		function updateSlide(slide) {
			currentSlide = slide;
			
			updateNavHeight($(currentSlide));
			
			nextSlide(slide);
		}
		
		function nextSlide(slide, delay) {
			var stdDelayTime = 5000;
			var fadeTime = 500;

			if (carouselPaused) return;

			slideTimeout = window.setTimeout(function(e) {
				$(slide).fadeOut(fadeTime);
				if ($(slide).next().length == 0) {
					$(slide).parent().find("li").first().fadeIn(fadeTime, function() { updateSlide(this); });
				} else {
					$(slide).next().fadeIn(fadeTime, function() { updateSlide(this); });
				}
			}, delay ? delay : stdDelayTime);
		}

		$("#image_view li").hide();
		$("#image_view li").first().show(0, function(e) {
			currentSlide = this;
			nextSlide(this);
			updateNavHeight($(this));
			$("#image_view_nav a").css('opacity', '0');
		});

		$("#image_view ul, #image_view_nav a").hover(function() {
			window.clearTimeout(slideTimeout);
			carouselPaused = true;
		}, function() {
			carouselPaused = false;
			nextSlide(currentSlide, 1000);
		});
		
		$("#image_view_nav a.next").click(function(e) {
			var next = $(currentSlide).next();

			if (next.length == 0) {
				// loop back
				next = firstSlide;
			}

			$("#image_view li").fadeOut('fast', function(e) {
				updateNavHeight(next);
			});
			next.fadeIn('fast');
			
			currentSlide = next[0];

			e.preventDefault();
		});

		$("#image_view_nav a.prev").click(function(e) {
			var previous = $(currentSlide).prev();

			if (previous.length == 0) {
				// loop back
				previous = lastSlide;
			}

			$("#image_view li").fadeOut('fast', function(e) {
				updateNavHeight(previous);
			});
			previous.fadeIn('fast');
			
			currentSlide = previous[0];
			
			e.preventDefault();
		});
	}
	// end of carousel
	
}
