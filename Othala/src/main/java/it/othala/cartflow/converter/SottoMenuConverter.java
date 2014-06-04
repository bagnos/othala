package it.othala.cartflow.converter;

import it.othala.dto.MenuDTO;
import it.othala.dto.SubMenuDTO;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@FacesConverter("sottoMenuConverter")
public class SottoMenuConverter implements Converter {

	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if (value != null && value.trim().length() > 0) {
			int intValue = Integer.valueOf(value);
			MenuDTO menu = (MenuDTO) fc.getExternalContext().getSessionMap().get("MENUCONVERTER");
			if (menu != null) {
				for (SubMenuDTO subMenu : menu.getSubMenu()) {
					if (subMenu.getIdType() == intValue) {						
						return subMenu;
					}
				}
			}

		}
		return null;

	}

	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if (object != null) {
			return String.valueOf(((SubMenuDTO) object).getIdType());
		} else {
			return null;
		}
	}

}
