package it.othala.service.template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;

import org.apache.commons.io.IOUtils;

public class Template {

	public enum TipoTemplate {
		MailRegistrazione,MailResetPSW,MailIPNRefusePayment,MailIPNAcceptedPaymemtAfetPending;

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
		case MailIPNRefusePayment:
			nameFile = "MailPagamentoRifiutato.txt";
			break;
		case MailIPNAcceptedPaymemtAfetPending:
			nameFile = "MailIPNPagamentoAccettato.txt";
			break;
			
		default:
			return null;
		}

		String contentFile = IOUtils.toString(Template.class.getResourceAsStream(nameFile), "UTF-8");
		
		return contentFile;

	}
	
	public static File getFile(String nameFile) throws IOException, URISyntaxException {

		File file = File.createTempFile("xslFile", ".xsl");
		FileOutputStream fos = new FileOutputStream(file);
		IOUtils.copy(Template.class.getClassLoader().getResourceAsStream(nameFile), fos);
		
		
		return file;

	}

}
