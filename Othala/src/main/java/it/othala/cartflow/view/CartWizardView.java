package it.othala.cartflow.view;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.event.FlowEvent;

@ManagedBean
@ViewScoped
public class CartWizardView {

	private String email;
	private String psw;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String doInit() {
		// TODO Auto-generated method stub

		return null;
	}

	private String prova;
	private String prova1;

	public String getProva() {
		return prova;
	}

	public void setProva(String prova) {
		this.prova = prova;
	}

	public String getProva1() {
		return prova1;
	}

	public void setProva1(String prova1) {
		this.prova1 = prova1;
	}

	public String onFlowProcess(FlowEvent event) {

		return event.getNewStep();

	}

	public void loginNoRedirect(ActionEvent e) {
		int a = 0;
		a = 2;
		String a1 = email;
	}

	public String login() {
		return null;
	}

}
