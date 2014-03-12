package it.othala.cartflow.view;

import it.othala.dto.ArticleDTO;
import it.othala.view.BaseView;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

@ManagedBean
public class CartFlowView extends BaseView{

	private List<ArticleDTO> articles;
	
	public List<ArticleDTO> getArticles() {
		return articles;
	}
	
	private int number6 = 100;  
    
    private int number7 = 1000;  
    
    

	public int getNumber6() {
		return number6;
	}



	public void setNumber6(int number6) {
		this.number6 = number6;
	}



	public int getNumber7() {
		return number7;
	}



	public void setNumber7(int number7) {
		this.number7 = number7;
	}



	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		articles=new ArrayList<>();
		ArticleDTO art=new ArticleDTO();
		art.setBrand("ARMANI");
		art.setDescription("Jeans super Slim");
		art.setImagesUrl("406918_mrp_fr_m2.jpg");
		art.setStrPrice("120,00");
		for (int i=0; i<=10;i++)
		{
			articles.add(art);
		}
		return null;
	}

}
