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
	enabledPayment();


});

function changePage(xhr, status, args) {

	if (args.validationFailed) {

	} else {
		$('.pager.wizard li.next a').click();
	}
}

function enabledPayment() {
	
	$("input[name='optionsRadiosPay']").change(function() {
		
		$('#pay-cart').removeAttr('disabled');
		$('#pay-cart').removeAttr('aria-disabled');
		$("#pay-cart").removeClass("ui-state-disabled");
	});

}
