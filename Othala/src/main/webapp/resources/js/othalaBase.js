function onlyNumber(id) {

	
	$("#"+id).keypress(function(e) {

		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			return false;
		}
	});

	
}

function clearCart() {
	$('#cart').text('(0)');
}