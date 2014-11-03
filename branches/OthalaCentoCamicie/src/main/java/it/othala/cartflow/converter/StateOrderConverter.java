package it.othala.cartflow.converter;

import it.othala.dto.AttributeDTO;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import org.apache.commons.lang3.StringUtils;

@FacesConverter("it.othala.StateOrderConverter")
public class StateOrderConverter extends BaseConverter implements Converter {

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {

			if (StringUtils.isNumeric(value)) {
				int intValue = Integer.valueOf(value);

				if (intValue != -1) {
					for (AttributeDTO attr : getAppBean().getStatesOrder()) {
						if (attr.getAttributo() == intValue) {

							return attr;
						}
					}
				}
			}

		}
		return null;

	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null && !object.toString().equalsIgnoreCase("-1")) {
			return String.valueOf(((AttributeDTO) object).getAttributo());
		} else {
			return null;
		}
	}

}
