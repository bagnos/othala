package it.othala.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.Locale;

public class OthalaCommonUtils {

	private static NumberFormat n = NumberFormat.getCurrencyInstance(Locale.ITALY);

	public static String getImporto(BigDecimal value) {
		// TODO Auto-generated method stub
		BigDecimal scaleBD = value.setScale(2, RoundingMode.HALF_UP);
		Double valueDbl = scaleBD.doubleValue();
		String s = n.format(valueDbl);
		return s;
	}

}
