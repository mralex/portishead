$(function() {
	
if ($("#index_hero li").length > 1) {
	// Homepage
	// 
	// Hero carousel
	
	var carouselPaused = false;
	var currentHero = null;
	var heroTimeout = null;
	
	function nextHero(hero, delay) {
		var stdDelayTime = 3000;
		var fadeTime = 600;
				
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
	$("#index_hero").hover(function() {
		window.clearTimeout(heroTimeout);
		carouselPaused = true;
		$(currentHero).find(".details").fadeIn('fast');
	}, function() {
		$(currentHero).find(".details").fadeOut('fast');
		carouselPaused = false;
		nextHero(currentHero, 1000);
	})
}

// Form manipulation code adapted from Railscasts #197 (http://railscasts.com/episodes/197)

// Remove the image
$("a.remove_image").live("click", function(e) {
	$(this).closest("li").prev().find("input[type=hidden]").first().val(true);
	$(this).closest(".inputs").fadeOut();

	e.preventDefault();
});


// Adding an image
$("a.add_image").click(function(e) {
	var id = new Date().getTime();
	var rx = new RegExp("new_image", "g");
	var content = $(this).attr('data-fields');
	
	$(this).parent().find("fieldset.inputs").last().after(content.replace(rx, id));
	
	e.preventDefault();
});

$(".hero_check").live("click", function(e) {
	$(".hero_check").attr("checked", false);
	$(this).attr("checked", true);
});

$("#images li.image").hover(function() {
	$(this).find("p").fadeOut('fast');
}, function() {
	$(this).find("p").fadeIn('fast');
})

});