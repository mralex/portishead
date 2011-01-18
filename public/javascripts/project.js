$(function() {
var currentId;

var id = currentId = $("#images li").first().attr("data-id");
$.getJSON(document.href + "/images/" + id, function(data) {
	$("#image_view").append('<li class="image_'+ data.image.id +'"><img src="' + data.image.image.url +'" /></li>')
});

$("#images li a").live("click", function(e) {
	var id = $(this).parent().attr("data-id");
	
	if (id == currentId) {
		e.preventDefault();
		return;
	}
	
	if ($("#image_view").has(".image_" + id).length == 0) {
		$.getJSON(document.href + "/images/" + id, function(data) {
			$("#image_view li").fadeOut('fast');
			$("#image_view").append('<li class="image_'+ data.image.id +'"><img src="' + data.image.image.url +'" /></li>')
		});
	} else {
		$("#image_view li").fadeOut();
		$("#image_view li.image_" + id).fadeIn();
	}
	
	currentId = id;
	
	e.preventDefault();
});

});
