package it.othala.merchant.view;

import it.othala.view.BaseView;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class InsertProdottiView extends BaseView {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String gender;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<String> completeText(String query) {
        List<String> results = new ArrayList<String>();
        for(int i = 0; i < 10; i++) {
            results.add(query + i);
        }
         
        return results;
    }

}
