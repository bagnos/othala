package it.othala.web.utils;

import it.othala.dto.AccountDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.ShopDTO;
import it.othala.model.ApplicationBean;
import it.othala.model.LocaleManager;
import it.othala.service.factory.OthalaFactory;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AutoCompleteUtils implements Serializable {

	private ApplicationBean beanApplication;
	private LocaleManager locBean;

	
	public AutoCompleteUtils(ApplicationBean beanApp,LocaleManager locBean) {
		beanApplication = beanApp;
		this.locBean=locBean;
	}

	public List<AttributeDTO> completeGenere(String query) {
		List<AttributeDTO> allAttributeDTO =beanApplication.getDomain(locBean.getLanguage()).getGender();
		List<AttributeDTO> filteredAttributeDTO = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allAttributeDTO.size(); i++) {
			AttributeDTO attr = allAttributeDTO.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredAttributeDTO.add(attr);
			}
		}

		return filteredAttributeDTO;
	}

	public List<AttributeDTO> completeTaglia(String query) {
		List<AttributeDTO> filteredSize = new ArrayList<AttributeDTO>();
			List<AttributeDTO> allSize = beanApplication.getDomain(locBean.getLanguage()).getSize();

			for (int i = 0; i < allSize.size(); i++) {
				AttributeDTO attr = allSize.get(i);
				if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
					filteredSize.add(attr);
				}
			
		}

		return filteredSize;
	}

	public List<AttributeDTO> completeBrand(String query) {
		List<AttributeDTO> allBrands = beanApplication.getDomain(locBean.getLanguage()).getBrand();
		List<AttributeDTO> filteredBrands = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allBrands.size(); i++) {
			AttributeDTO attr = allBrands.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredBrands.add(attr);
			}
		}

		return filteredBrands;
	}

	public List<ShopDTO> completeShops(String query) {
		List<ShopDTO> allShops = beanApplication.getShopsDTO();
		List<ShopDTO> filteredShops = new ArrayList<ShopDTO>();

		for (int i = 0; i < allShops.size(); i++) {
			ShopDTO attr = allShops.get(i);
			if (attr.getTxShop().toLowerCase().startsWith(query.toLowerCase())) {
				filteredShops.add(attr);
			}
		}

		return filteredShops;
	}

	public List<AttributeDTO> completeColours(String query) {
		List<AttributeDTO> allColours = beanApplication.getDomain(locBean.getLanguage()).getColor();
		List<AttributeDTO> filteredColours = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allColours.size(); i++) {
			AttributeDTO attr = allColours.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredColours.add(attr);
			}
		}

		return filteredColours;
	}

	public List<AttributeDTO> completeTipo(String query) {

		List<AttributeDTO> allType = beanApplication.getDomain(locBean.getLanguage()).getType();
		List<AttributeDTO> filteredType = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allType.size(); i++) {
			AttributeDTO menu = allType.get(i);
			if (menu.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredType.add(menu);
			}
		}

		return filteredType;
	}

	public List<AttributeDTO> completeMaterial(String query) {
		List<AttributeDTO> allMaterial = beanApplication.getDomain(locBean.getLanguage()).getMaterial();
		List<AttributeDTO> filteredMaterial = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allMaterial.size(); i++) {
			AttributeDTO menu = allMaterial.get(i);
			if (menu.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredMaterial.add(menu);
			}
		}

		return filteredMaterial;
	}

	public static List<AccountDTO> completeAccountDTO(String query) {

		List<AccountDTO> filteredAccount = OthalaFactory
				.getAccountServiceInstance().findAccount(query.trim(), null);
		return completeAccountDTO(filteredAccount);

	}

	public static List<AccountDTO> completeAccountDTO(
			List<AccountDTO> filteredAccount) {

		OthalaUtil.getSessionMap().put(Constants.SESSION_KEY_COMPLETE_ACCOUNT,
				filteredAccount);

		return filteredAccount;
	}

	public static List<AccountDTO> getAccountCompleteSession() {
		return (List<AccountDTO>) OthalaUtil.getSessionMap().get(
				Constants.SESSION_KEY_COMPLETE_ACCOUNT);
	}

	public static AccountDTO findAccountDTO(String value) {

		List<AccountDTO> list = AutoCompleteUtils.getAccountCompleteSession();

		for (AccountDTO acc : list) {
			if (acc.getEmail().equalsIgnoreCase(value)) {

				return acc;
			}
		}
		return null;
	}

}
