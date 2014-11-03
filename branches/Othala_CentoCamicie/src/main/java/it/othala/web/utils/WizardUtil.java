package it.othala.web.utils;

public class WizardUtil {
	public static String NextStepWizard() {
		return "initDeliverySection();nextPage();";
	}

	public static String initAccessWizard() {
		StringBuilder sb = new StringBuilder();

		sb.append("$(document).ready(function() {");
		sb.append("alert('ciao');");

		sb.append("$('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps',onTabClick: function(tab, navigation, index) {");

		sb.append("return false;");		
		sb.append("	}});");
		sb.append("nextPage();previousPage();");

		sb.append("});");
		return sb.toString();

	}

	public static String initNoAccessWizard() {

		StringBuilder sb = new StringBuilder();
		sb.append("$(document).ready(function() {");
		sb.append("$('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps',onTabClick: function(tab, navigation, index) {");
		sb.append("return false;");
		sb.append("	}});");
		sb.append("$('.pager.wizard li.next a').click();");
		sb.append("$('.pager.wizard li.previous a').click();");
		

		sb.append("});");
		return sb.toString();
	
	}
}
