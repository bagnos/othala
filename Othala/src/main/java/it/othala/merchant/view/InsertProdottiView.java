package it.othala.merchant.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.model.ApplicationBean;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class InsertProdottiView extends BaseView {
	
	/**
	 * 
	 */
	
	@Inject
	private ApplicationBean appBean;
	
	private MenuDTO genere;
	private SubMenuDTO tipo;
	private AttributeDTO brand;
	private int sconto;
	private BigDecimal prezzo;
	private BigDecimal prezzoScontato;
	
	

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}

	public BigDecimal getPrezzoScontato() {
		return prezzoScontato;
	}

	public void setPrezzoScontato(BigDecimal prezzoScontato) {
		this.prezzoScontato = prezzoScontato;
	}

	public int getSconto() {
		return sconto;
	}

	public void setSconto(int sconto) {
		this.sconto = sconto;
	}

	public AttributeDTO getBrand() {
		return brand;
	}

	public void setBrand(AttributeDTO brand) {
		this.brand = brand;
	}

	public SubMenuDTO getTipo() {
		return tipo;
	}

	public void setTipo(SubMenuDTO tipo) {
		this.tipo = tipo;
	}

	public MenuDTO getGenere() {
		return genere;
	}

	public void setGenere(MenuDTO genere) {
		this.genere = genere;
	}

	private static final long serialVersionUID = 1L;
	

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<MenuDTO> completeGenere(String query) {
        List<MenuDTO> allMenues = appBean.getMenu();
        List<MenuDTO> filteredMenues = new ArrayList<MenuDTO>();
         
        for (int i = 0; i < allMenues.size(); i++) {
            MenuDTO menu = allMenues.get(i);
            if(menu.getTxGender().toLowerCase().startsWith(query.toLowerCase())) {
            	filteredMenues.add(menu);
            }
        }
         
        return filteredMenues;
    }
	
	public List<AttributeDTO> completeBrand(String query) {
        List<AttributeDTO> allBrands = appBean.getBrandDTO();
        List<AttributeDTO> filteredBrands = new ArrayList<AttributeDTO>();
         
        for (int i = 0; i < allBrands.size(); i++) {
        	AttributeDTO attr = allBrands.get(i);
            if(attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
            	filteredBrands.add(attr);
            }
        }
         
        return filteredBrands;
    }
	
	public List<SubMenuDTO> completeTipo(String query) {
		if (genere==null)
		{
			return null;
		}
		
        List<SubMenuDTO> allMenues = genere.getSubMenu();
        List<SubMenuDTO> filteredMenues = new ArrayList<SubMenuDTO>();
         
        for (int i = 0; i < allMenues.size(); i++) {
        	SubMenuDTO menu = allMenues.get(i);
            if(menu.getTxType().toLowerCase().startsWith(query.toLowerCase())) {
            	filteredMenues.add(menu);
            }
        }
         
        return filteredMenues;
    }
}
