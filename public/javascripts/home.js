$(function() {
	
	if ($("#index_hero li").length > 1) {
		// Homepage
		// 
		// Hero carousel
	
		var carouselPaused = false;
		var currentHero = null;
		var heroTimeout = null;
	
		function nextHero(hero, delay) {
			var stdDelayTime = 4000;
			var fadeTime = 400;
				
			if (carouselPaused) return;
		
			//$(hero).delay(delayTime).fadeOut(fadeTime);
			heroTimeout = window.setTimeout(function(e) {
				$(hero).fadeOut(fadeTime);
				if ($(hero).next().length == 0) {
					$(hero).parent().find("li").first().fadeIn(fadeTime, function(e) {
						currentHero = this;
						nextHero(this);
					});
				} else {
					$(hero).next().fadeIn(fadeTime, function(e) {
						currentHero = this;
						nextHero(this);
					});
				}
			}, delay ? delay : stdDelayTime);
		}

		$("#index_hero li").hide();
		$("#index_hero li").first().show(0, function(e) {
			currentHero = this;
			nextHero(this);
		});
	
		$("#index_hero .details").hide();
	
		$("#index_hero ul").hover(function() {
			window.clearTimeout(heroTimeout);
			carouselPaused = true;
			$(currentHero).find(".details").show('slide');
		}, function() {
			$(currentHero).find(".details").hide('slide');
			carouselPaused = false;
			nextHero(currentHero, 1000);
		});
	}

});
