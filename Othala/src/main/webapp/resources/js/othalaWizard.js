$(document).ready(function() {

	$('#rootwizard').bootstrapWizard({
		'tabClass' : 'bwizard-steps',
		onTabClick : function(tab, navigation, index) {

			return false;

		}
	});

	if ($('#user').length > 0) {

		$('.pager.wizard li.next a').click();

	} else {
		$('.pager.wizard li.next a').click();

		$('.pager.wizard li.previous a').click();

	}
	$('#chkSpe').click(copyAllAddress());

});

function changePage(xhr, status, args) {
 
	if (args.validationFailed) {

	} else {
		$('.pager.wizard li.next a').click();
		$('body').scrollTop(0);
	
	}
}

function initDeliverySection() {
	alignfromFattToSped();
	initAddress();
	copyAllAddress();
}

function previousPage(xhr, status, args) {

	$('.pager.wizard li.previous a').click();
	$('body').scrollTop(0);

}

function copyAllAddress() {

	$('#chkSpe').click(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#nameFat').val($('#nameSpe').val());
			$('#cognomeFat').val($('#cognomeSpe').val());
			$('#telefonoFat').val($('#telefonoSpe').val());
			$('#indirizzoFat').val($('#indirizzoSpe').val());
			$('#postaleFat').val($('#postaleSpe').val());
			$('#cittaFat').val($('#cittaSpe').val());
			$('#provFat').val($('#provSpe').val());
			$('#typeFat').val($('#typeSpe').val());

		}
	});
};

function alignfromFattToSped() {

	$('#nameSpe').keyup(function() {

		if ($('#chkSpe').prop('checked')) {
			$('#nameFat').val(this.value);
		}
	});

	$('#cognomeSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#cognomeFat').val(this.value);
		}
	});

	$('#telefonoSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#telefonoFat').val(this.value);
		}
	});

	$('#indirizzoSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#indirizzoFat').val(this.value);
		}
	});

	$('#postaleSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#postaleFat').val(this.value);
		}
	});

	$('#cittaSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#cittaFat').val(this.value);
		}
	});

	$('#provSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#provFat').val(this.value);
		}
	});

	$('#typeSpe').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#typeFat').val(this.value);
		}
	});

}

function initAddress() {

	$("#telefonoFat").keypress(function(e) {

		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			return false;
		}
	});

	$("#telefonoSpe").keypress(function(e) {

		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			return false;
		}
	});
}
