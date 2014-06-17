package it.othala.cartflow.converter;

import it.othala.dto.ShopDTO;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;


@FacesConverter("it.othala.ShopConverter")
public class ShopConverter extends BaseConverter implements Converter {

	
	
	

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			
						 
			for (ShopDTO sh : getAppBean().getShopsDTO()) {
				if (sh.getIdShop().intValue() == intValue) {
					
					return sh;
				}
			}

		}
		return null;

	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null) {
			return String.valueOf(((ShopDTO) object).getIdShop());
		} else {
			return null;
		}
	}

}
