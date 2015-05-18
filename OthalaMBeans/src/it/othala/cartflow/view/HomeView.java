package it.othala.cartflow.view;

import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class HomeView extends BaseView {

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
	
		
		
		log.info("Access Site");		
		changeLocale();
		return null;
	}
}
