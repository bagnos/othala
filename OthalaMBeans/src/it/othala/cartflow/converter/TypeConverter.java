package it.othala.cartflow.converter;

import it.othala.dto.AttributeDTO;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@FacesConverter("it.othala.TypeConverter")
public class TypeConverter extends BaseConverter implements Converter {
	
	

	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			for (AttributeDTO attr : getAppBean().getDomain(getLocBean().getLanguage()).getType()) {
				if (attr.getAttributo() == intValue) {					
					return attr;
				}
			}

		}
		return null;

	}

	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null) {
			return String.valueOf(((AttributeDTO) object).getAttributo());
		} else {
			return null;
		}
	}

}
