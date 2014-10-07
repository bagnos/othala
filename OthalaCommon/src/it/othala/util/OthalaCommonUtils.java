package it.othala.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.Locale;

public class OthalaCommonUtils {

	private static NumberFormat n = NumberFormat.getCurrencyInstance(Locale.ITALY);

	public static String getImporto(BigDecimal value) {
		// TODO Auto-generated method stub

		String s = n.format(getImportoNoCurrency(value));
		return s;
	}

	public static String getImportoNoCurrency(BigDecimal value) {
		// TODO Auto-generated method stub
		BigDecimal scaleBD = value.setScale(2, RoundingMode.HALF_UP);
		return scaleBD.toString();

	}

}
