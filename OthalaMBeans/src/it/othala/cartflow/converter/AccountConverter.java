package it.othala.cartflow.converter;

import it.othala.dto.AccountDTO;
import it.othala.dto.AttributeDTO;
import it.othala.web.utils.AutoCompleteUtils;
import it.othala.web.utils.Constants;
import it.othala.web.utils.OthalaUtil;

import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@FacesConverter("it.othala.AccountConverter")
public class AccountConverter extends BaseConverter implements Converter {

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			return AutoCompleteUtils.findAccountDTO(value);

		}
		return null;

	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null) {
			return((AccountDTO) object).getEmail();
		} else {
			return null;
		}
	}

}
