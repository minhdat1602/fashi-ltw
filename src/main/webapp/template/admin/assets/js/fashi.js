$(window).on('load', function() {
	var page_active = $("input#flag-index").val();
	$(page_active).addClass("active");
	$(page_active).parents("ul.collapse").addClass("show");
	$(page_active).parents("li.has-sub").addClass("expand");

	$("#checkAll").on('click', function() {
		$("input[type=checkbox]").prop('checked', true);
	})
});