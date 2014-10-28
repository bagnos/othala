function initPrezzo() {
	$("#prezzoPrd").change(function() {
		changePrezzo();
	});
	$("#sconto").change(function() {
		changePrezzo();
	});

	function changePrezzo() {
		

		var prezzo = $("#prezzoPrd_input").val();
		prezzo = prezzo.replace(/\u20ac/g, '');
		var arr =prezzo.split(',');
		arr[0] = arr[0].replace(".", "");
		prezzo = arr[0] + "."+arr[1];

		prezzo=parseFloat(prezzo);
		var sconto = $("#sconto_input").val();
		sconto = parseFloat(sconto);
		prezzoSconto = (prezzo * sconto) / 100;
		var totale = prezzo - prezzoSconto;
		totale = totale.toFixed(2);
		totale = totale.replace(".", ",");
		$("#totPrezzoPrd_input").val(totale);
		$("#totPrezzoPrd_input").change();
	}
}
