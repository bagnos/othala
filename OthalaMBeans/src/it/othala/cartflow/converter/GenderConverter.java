package it.othala.cartflow.converter;

import it.othala.dto.AttributeDTO;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;


@FacesConverter("it.othala.GenderConverter")
public class GenderConverter extends BaseConverter implements Converter {

	
	
	

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			for (AttributeDTO attr : getAppBean().getDomain(getLocBean().getLanguage()).getGender()) {
				if (attr.getAttributo() == intValue) {					
					return attr;
				}
			}

		}
		return null;

	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null) {
			return String.valueOf(((AttributeDTO) object).getAttributo());
		} else {
			return null;
		}
	}

}
