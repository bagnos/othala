package it.othala.cartflow.converter;

import it.othala.dto.AttributeDTO;
import it.othala.dto.MenuDTO;
import it.othala.model.ApplicationBean;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.inject.Inject;
import javax.inject.Named;


@Named
public class GenderConverter implements Converter {

	@Inject
	private ApplicationBean appBean;
	
	

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			for (AttributeDTO attr : appBean.getGenderDTO()) {
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
