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
	
	alignfromFattToSped();

});

function changePage(xhr, status, args) {

	if (args.validationFailed) {

	} else {
		$('.pager.wizard li.next a').click();
	}
}



function alignfromFattToSped() {
	
	$('#nameFat').keyup(function() {		
		
		if ($('#chkSpe').prop('checked')) {
			$('#nameSpe').val(this.value);			
		}
	});
	
	$('#cognomeFat').keyup(function() {		
		if ($('#chkSpe').prop('checked')){
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

}
