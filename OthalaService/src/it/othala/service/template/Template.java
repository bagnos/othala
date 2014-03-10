package it.othala.service.template;

import java.io.IOException;

import org.apache.commons.io.IOUtils;

public class Template {

	public enum TipoTemplate {
		MailRegistrazione,MailResetPSW;

		private TipoTemplate() {

		}

	}

	public static String getContenFile(TipoTemplate temp) throws IOException {

		String nameFile = null;
		switch (temp) {
		case MailRegistrazione:
			nameFile = "MailRegistrazione.txt";
			break;
		case MailResetPSW:
			nameFile = "MailResetPSW.txt";
			break;
			
		default:
			return null;
		}

		String contentFile = IOUtils.toString(Template.class.getResourceAsStream(nameFile), "UTF-8");
		
		return contentFile;

	}

}
