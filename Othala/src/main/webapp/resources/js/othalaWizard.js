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

	alignfromFattToSped();
	initAddress();
	copyAllAddress();

});

function changePage(xhr, status, args) {

	if (args.validationFailed) {

	} else {
		$('.pager.wizard li.next a').click();
		$('body').scrollTop(0);

	}
}

function previousPage(xhr, status, args) {

	$('.pager.wizard li.previous a').click();
	$('body').scrollTop(0);

}

function copyAllAddress() {
	$('#chkSpe').click(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#nameSpe').val($('#nameFat').val());
			$('#cognomeSpe').val($('#cognomeFat').val());
			$('#telefonoSpe').val($('#telefonoFat').val());
			$('#indirizzoSpe').val($('#indirizzoFat').val());
			$('#postaleSpe').val($('#postaleFat').val());
			$('#cittaSpe').val($('#cittaFat').val());
			$('#provSpe').val($('#provFat').val());

		}
	});
};

function alignfromFattToSped() {

	$('#nameFat').keyup(function() {

		if ($('#chkSpe').prop('checked')) {
			$('#nameSpe').val(this.value);
		}
	});

	$('#cognomeFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#cognomeSpe').val(this.value);
		}
	});

	$('#telefonoFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#telefonoSpe').val(this.value);
		}
	});

	$('#indirizzoFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#indirizzoSpe').val(this.value);
		}
	});

	$('#postaleFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#postaleSpe').val(this.value);
		}
	});

	$('#cittaFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#cittaSpe').val(this.value);
		}
	});

	$('#provFat').keyup(function() {
		if ($('#chkSpe').prop('checked')) {
			$('#provSpe').val(this.value);
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
