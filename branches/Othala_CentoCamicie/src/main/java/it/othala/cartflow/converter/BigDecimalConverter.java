package it.othala.cartflow.converter;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.Locale;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@FacesConverter("it.othala.BigDecimalConverter")
public class BigDecimalConverter extends BaseConverter implements Converter {

	private static NumberFormat n = NumberFormat.getCurrencyInstance(Locale.ITALY);
	
	@Override
	public Object getAsObject(FacesContext context, UIComponent component,
			String value) {
		// TODO Auto-generated method stub
		return new BigDecimal(value);
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component,
			Object value) {
		// TODO Auto-generated method stub
		
		return getValue((BigDecimal)value);
	}
	
	public static String getValue(BigDecimal value)
	{
		BigDecimal scaleBD=((BigDecimal)value).setScale(2, RoundingMode.HALF_UP);
		Double valueDbl=scaleBD.doubleValue();
		String s = n.format(valueDbl); 
		return s;
	}

}
