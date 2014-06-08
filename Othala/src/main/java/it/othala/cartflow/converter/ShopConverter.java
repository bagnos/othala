package it.othala.cartflow.converter;

import it.othala.dto.ShopDTO;
import it.othala.model.ApplicationBean;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.inject.Inject;
import javax.inject.Named;


@Named
public class ShopConverter implements Converter {

	@Inject
	private ApplicationBean appBean;
	
	

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			
						 
			for (ShopDTO sh : appBean.getShopsDTO()) {
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
			return String.valueOf(((ShopDTO) object).getTxShop());
		} else {
			return null;
		}
	}

}
