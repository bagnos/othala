package it.othala.account.view;

import it.othala.account.model.MyAccountBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.execption.OthalaException;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;

import org.primefaces.context.RequestContext;

@ManagedBean
@ViewScoped
public class RichiediResoView extends BaseView {

	private OrderFullDTO order;
	private DeliveryAddressDTO address;
	private Integer idOrder;
	private String keyRefund = null;
	private BigDecimal imRefunded = BigDecimal.ZERO;
	private List<ArticleFullDTO> artToRefund = new ArrayList<>();
	private List<RefoundFullDTO> elencoResi;
	private RefoundFullDTO refundSelected;
	private boolean renderDetails;

	public RefoundFullDTO getRefundSelected() {
		return refundSelected;
	}

	public void setRefundSelected(RefoundFullDTO refundSelected) {
		this.refundSelected = refundSelected;
	}

	public boolean isRenderDetails() {
		return renderDetails;
	}

	public List<RefoundFullDTO> getElencoResi() {
		return elencoResi;
	}

	public List<ArticleFullDTO> getArtToRefund() {
		return artToRefund;
	}

	public BigDecimal getImRefunded() {
		return imRefunded;
	}

	public String getKeyRefund() {
		return keyRefund;
	}

	@ManagedProperty(value = "#{myAccountBean}")
	private MyAccountBean myAccountBean;

	public void setMyAccountBean(MyAccountBean myAccountBean) {
		this.myAccountBean = myAccountBean;
	}

	public Integer getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(Integer idOrder) {
		this.idOrder = idOrder;
	}

	public DeliveryAddressDTO getAddress() {
		return address;
	}

	public void setAddress(DeliveryAddressDTO address) {
		this.address = address;
	}

	public OrderFullDTO getOrder() {
		return order;
	}

	public void setOrder(OrderFullDTO order) {
		this.order = order;
	}

	public String doInitElencaResi() {
		// TODO Auto-generated method stub
		elencoResi = OthalaFactory.getOrderServiceInstance().getRefounds(null, null, getLoginBean().getEmail(), null,
				null);
		return null;

	}

	public void updateReso(AjaxBehaviorEvent e) {
		imRefunded = BigDecimal.ZERO;
		artToRefund = new ArrayList<>();
		for (ArticleFullDTO art : myAccountBean.getOrderSelected().getCart()) {
			if (art.isSelected()) {
				artToRefund.add(art);
				imRefunded = imRefunded.add(art.getTotalPriced());
			}
		}
	}

	public void richiediReso(ActionEvent e) {
		try {
			
			
			RefoundFullDTO ref = new RefoundFullDTO();
			artToRefund.clear();

			imRefunded = BigDecimal.ZERO;
			for (ArticleFullDTO art : myAccountBean.getOrderSelected().getCart()) {
				if (art.isSelected()) {
					artToRefund.add(art);
					imRefunded = imRefunded.add(art.getTotalPriced());
				}
			}
			if (artToRefund.isEmpty()) {
				addError("Richiesta Reso", "Nessun articolo selezionato");

				return;
			}

			ref.setCart(artToRefund);
			ref.setIdOrder(myAccountBean.getOrderSelected().getIdOrder());
			ref.setImRefound(imRefunded);
			ref.setIdTransaction(myAccountBean.getOrderSelected().getIdTransaction());
			ref.setIdUser(myAccountBean.getOrderSelected().getIdUser());

			ref = OthalaFactory.getOrderServiceInstance().insertRefound(ref);

			keyRefund = getLoginBean().getEmail() + "-" + myAccountBean.getOrderSelected().getIdOrder();
			keyRefund = HelperCrypt.encrypt(keyRefund);
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("", ref);

			addInfo("Richesta Reso",
					"LA richiesta è stata effettuata correttamente, nella sezione 'Miei Resi' portà verificare lo stato della sua richiesta. \n Stampare la ricevuta ed inserirla all'interno del pacco");
			RequestContext.getCurrentInstance().execute(
					"$(window).scrollTop();window.open('../SpedisciOrdineServlet?keyRefund=" + keyRefund + "');");

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore nella richesto del reso per l'ordine "
					+ myAccountBean.getOrderSelected().getIdOrder());
		}
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}

	public void selectRefund(AjaxBehaviorEvent e) {
		int idRefund = Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext()
				.getRequestParameterMap().get("idRefund"));
		for (RefoundFullDTO ord : elencoResi) {
			if (ord.getIdRefound() == idRefund) {
				refundSelected=ord;
				renderDetails = true;
				break;
			}
		}
	}
	

	public void backToRefunds(ActionEvent e) {
		renderDetails = false;
	}
}
