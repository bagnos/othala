package it.othala.util;

import javax.xml.bind.DatatypeConverter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class HelperCrypt {

	private static Log log = LogFactory.getLog(HelperCrypt.class);

	public static String encrypt(String value) {
		return DatatypeConverter.printBase64Binary(value.getBytes());

	}

	public static String decrypt(String encrypted) {
		return new String(DatatypeConverter.parseBase64Binary(encrypted));

	}
}
