$(function() {
	// Form manipulation code adapted from Railscasts #197 (http://railscasts.com/episodes/197)

	// Remove the link
	$("a.remove_link").live("click", function(e) {
		$(this).closest("li").prev().find("input[type=hidden]").first().val(true);
		$(this).closest(".inputs").fadeOut();

		e.preventDefault();
	});


	// Adding a link
	$("a.add_link").click(function(e) {
		var id = new Date().getTime();
		var rx = new RegExp("new_link", "g");
		var content = $(this).attr('data-fields');

		$(this).parent().find("fieldset.inputs").last().after(content.replace(rx, id));

		e.preventDefault();
	});

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
	
	$(".project_list_check").live("click", function(e) {
		$(".project_list_check").attr("checked", false);
		$(this).attr("checked", true);
	});
	
	$("#category_form").hide();
	$("#client_form").hide();
	
	$("#new_client a").click(function() { 
		$("#client_form").slideDown('fast');
		$("#new_client").hide();
	});

	$("#new_category a").click(function() { 
		$("#category_form").slideDown('fast');
		$("#new_category").hide();
	});
});
