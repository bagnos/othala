package it.othala.account.view;

import it.othala.account.model.MyAccountBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ArticleRefounded;
import it.othala.dto.ChangeArticleDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.BarcodeNotPresentException;
import it.othala.execption.OthalaException;
import it.othala.execption.RefoundPresentException;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;

@ManagedBean
@ViewScoped
public class RichiediResoView extends BaseView {

	private OrderFullDTO order;
	private DeliveryAddressDTO address;
	private Integer idOrder;
	private String keyRefund = null;
	private BigDecimal imRefunded = BigDecimal.ZERO;
	private List<ArticleRefounded> artToRefund = new ArrayList<>();
	private List<RefoundFullDTO> elencoResi;
	private RefoundFullDTO refundSelected;
	private boolean renderDetails;
	private boolean disabledConferma;
	private Boolean richiediCambio;
	private Boolean richiedireso;
	private String note;
	private List<ChangeArticleDTO> listOptionChanges = new ArrayList<>();
	private Map<Integer, List<SelectItem>> map = new HashMap<Integer, List<SelectItem>>();
	private boolean renderStampa;

	public boolean isRenderStampa() {
		return renderStampa;
	}

	public void setRenderStampa(boolean renderStampa) {
		this.renderStampa = renderStampa;
	}

	public Map<Integer, List<SelectItem>> getMap() {
		return map;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Boolean getRichiediCambio() {
		return richiediCambio;
	}

	public void setRichiediCambio(Boolean richiediCambio) {
		this.richiediCambio = richiediCambio;
	}

	public Boolean getRichiedireso() {
		return richiedireso;
	}

	public void setRichiedireso(Boolean richiedireso) {
		this.richiedireso = richiedireso;
	}

	public boolean isDisabledConferma() {
		return disabledConferma;
	}

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

	public List<ArticleRefounded> getArtToRefund() {
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

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		try {
			if (richiediCambio != null && richiediCambio == true) {
				doInitElencaCambi();
			} else {
				doInitElencaResi();
			}
			for (RefoundFullDTO ref : elencoResi) {

				keyRefund = getLoginBean().getEmail() + "-" + ref.getIdRefound();
				keyRefund = HelperCrypt.encrypt(keyRefund);
				ref.setKeyRefound(keyRefund);
				getRequest().getSession().setAttribute(keyRefund, ref);

			}

		} catch (Exception e) {
			addGenericError(e, "errore nella int ri richiesta reso");
		}
		return null;
	}

	public String doInitRequest() {
		// TODO Auto-generated method stub

		try {
			keyRefund = getLoginBean().getEmail() + "-" + myAccountBean.getOrderSelected().getIdOrder();
			keyRefund = HelperCrypt.encrypt(keyRefund);
		} catch (Exception e) {
			addGenericError(e, "errore nella int ri richiesta reso");
		}
		return null;
	}

	private void doInitElencaResi() {
		// TODO Auto-generated method stub
		elencoResi = OthalaFactory.getOrderServiceInstance().getRefounds(null, null, getLoginBean().getEmail(), null,
				null, "R");

	}

	private void doInitElencaCambi() {
		// TODO Auto-generated method stub

		elencoResi = OthalaFactory.getOrderServiceInstance().getRefounds(null, null, getLoginBean().getEmail(), null,
				null, "C");

	}

	public void updateReso(AjaxBehaviorEvent e) {
		try {
			imRefunded = BigDecimal.ZERO;
			artToRefund = new ArrayList<>();
			String idArt = (String) e.getComponent().getAttributes().get("pgArt");
			String[] items = idArt.split("-");
			int pgArt = Integer.valueOf(items[1].trim());
			int idPrd = Integer.valueOf(items[0].trim());
			int idOrderArticle = Integer.valueOf(items[2].trim());

			ArticleRefounded artref = null;
			for (ArticleFullDTO art : myAccountBean.getOrderSelected().getCart()) {
				if (art.isSelected()) {
					artref = new ArticleRefounded(art);
					artToRefund.add(artref);

					imRefunded = imRefunded.add(art.getPriceDiscounted().multiply(new BigDecimal(art.getQtBooked())));

					if (richiediCambio != null && richiediCambio && art.getPgArticle().intValue() == pgArt
							&& art.getPrdFullDTO().getIdProduct().intValue() == idPrd
							&& art.getIdOrderArticle().intValue() == idOrderArticle) {
						ProductFullNewDTO prd = OthalaFactory.getProductServiceInstance().getProductFull(getLang(),
								art.getPrdFullDTO().getIdProduct(), false);
						updateChangeableArticle(prd, art);
					}
				}
			}

		} catch (Exception ex) {
			addGenericError(ex, "errore nella selezione del camnbio");
		}
	}

	public void richiediReso(ActionEvent e) {
		try {

			RefoundFullDTO ref = new RefoundFullDTO();
			artToRefund.clear();

			imRefunded = BigDecimal.ZERO;
			for (ArticleFullDTO art : myAccountBean.getOrderSelected().getCart()) {
				if (art.isSelected()) {
					ArticleRefounded artref = new ArticleRefounded(art);
					artToRefund.add(artref);
					imRefunded = imRefunded.add(art.getPriceDiscounted());
				}
			}
			if (artToRefund.isEmpty()) {
				addError(OthalaUtil.getWordBundle("account_changeRequest"),
						OthalaUtil.getWordBundle("account_noArticleSelected"));
				return;
			}

			ref.setCart(artToRefund);
			ref.setIdOrder(myAccountBean.getOrderSelected().getIdOrder());
			ref.setIdUser(myAccountBean.getOrderSelected().getIdUser());

			ref.setTxMotivoReso(note);
			if (richiedireso != null && richiedireso == true) {
				getRefund(ref);
			} else {
				getChange(ref);
			}
			disabledConferma = true;

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore nella richesto del reso per l'ordine "
					+ myAccountBean.getOrderSelected().getIdOrder());
		}
	}

	private void stampa(RefoundFullDTO ref) {
		// keyRefund = getLoginBean().getEmail() + "-" + ref.getIdRefound();

		// keyRefund = HelperCrypt.encrypt(keyRefund);

		getRequest().getSession().setAttribute(keyRefund, ref);
		renderStampa = true;
		// String
		// url="http://"+getRequest().getServerName()+getRequest().getContextPath()+"/RichiestaResoServlet?keyRefund="
		// + keyRefund;
		/*
		 * RequestContext.getCurrentInstance().execute(
		 * "window.open('"+url+"');");
		 */
		// RequestContext.getCurrentInstance().execute("$('#stampa').click();");

	}

	private void getChange(RefoundFullDTO ref) throws OthalaException, RefoundPresentException {
		try {
			// verifica se per gli articoli selezionati � presenta un articolo
			// da
			// cambiare
			for (ArticleRefounded art : ref.getCart()) {
				if (art.getPgArticleChangeSelected() == null) {
					// selezionata la check box ma non selezionato il cambio
					addError(OthalaUtil.getWordBundle("account_changeRequest"),
							OthalaUtil.getWordBundle("account_noArticleChangeSelected"));
					return;
				}
				for (ChangeArticleDTO chArt : art.getChangesAvailable()) {
					if (chArt.getPgArticleNew().intValue() == art.getPgArticleChangeSelected().intValue()) {
						art.setTxChangeRefound(chArt.getNoteMerchant());
						art.setPgArticleChangeSelected(chArt.getPgArticleNew());
						// inserire barcode su artRefounded
					}
				}

			}
			ref.setFgChangeRefound("C");
			ref.setIdStato(TypeStateOrder.REQUEST_CHANGE.getState());

			OthalaFactory.getOrderServiceInstance().insertRefound(ref, ConfigurationUtil.getMailProps(getRequest()));
			addInfo("Richesta Cambio",
					"La richiesta � stata effettuata correttamente, nella sezione 'Miei Cambi' port� verificare lo stato della sua richiesta. \n Stampare la ricevuta ed inserirla all'interno del pacco insieme all'atricoli da cambiare");
			stampa(ref);
		} catch (RefoundPresentException bex) {
			addOthalaExceptionError

			(bex, "refound gi� presente");
		} catch (Exception ex) {
			throw ex;
		}
	}

	private void getRefund(RefoundFullDTO ref) throws OthalaException, RefoundPresentException {

		try {
			ref.setImRefound(imRefunded);
			ref.setIdTransaction(myAccountBean.getOrderSelected().getIdTransaction());
			ref.setFgChangeRefound("R");
			ref.setFgPartialRefound(ref.getCart().size() != myAccountBean.getOrderSelected().getCart().size());
			ref.setIdStato(TypeStateOrder.REQUEST_REFOUND.getState());
			ref = OthalaFactory.getOrderServiceInstance().insertRefound(ref,
					ConfigurationUtil.getMailProps(getRequest()));

			disabledConferma = true;

			addInfo("Richesta Reso",
					"LA richiesta � stata effettuata correttamente, nella sezione 'Miei Resi' port� verificare lo stato della sua richiesta. \n Stampare la ricevuta ed inserirla all'interno del pacco insieme all'articoli da rimborsare");
			stampa(ref);

		} catch (RefoundPresentException bex) {
			addOthalaExceptionError

			(bex, "refound gi� presente");
		} catch (Exception ex) {
			throw ex;
		}
	}

	public void selectRefund(AjaxBehaviorEvent e) {
		int idRefund = Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap()
				.get("idRefund"));
		for (RefoundFullDTO art : elencoResi) {
			if (art.getIdRefound() == idRefund) {
				refundSelected = art;
				renderDetails = true;
				break;
			}
		}
	}

	public void backToRefunds(ActionEvent e) {
		renderDetails = false;
	}

	private void updateChangeableArticle(ProductFullNewDTO prd, ArticleFullDTO artSel) {
		ChangeArticleDTO artRef = null;
		if (artSel.getChangesAvailable() == null) {
			// non sono stati ancora calcolati i possibili cambi
			artSel.setChangesAvailable(new ArrayList<ChangeArticleDTO>());
			List<SelectItem> sel = new ArrayList<SelectItem>();
			for (ArticleFullDTO art : prd.getArticles()) {
				// si esclude l'articolo corrente tra le possibili scelte
				if (art.getPgArticle() != artSel.getPgArticle() && art.getQtStock() > 0) {
					artRef = valueOfArticle(art);
					artSel.getChangesAvailable().add(valueOfArticle(art));
					sel.add(new SelectItem(art.getPgArticle(), String.format("%s, %s", artRef.getSize(),
							artRef.getColor())));
				}
			}
			if (!artSel.getChangesAvailable().isEmpty()) {
				artSel.setPgArticleChangeSelected(artSel.getChangesAvailable().get(0).getPgArticleNew());
				map.put(artSel.getPgArticle(), sel);
			}

		}

	}

	private ChangeArticleDTO valueOfArticle(ArticleFullDTO a) {
		ChangeArticleDTO cArt = new ChangeArticleDTO();
		cArt.setTxBarcodeNew(a.getTxBarCode());
		cArt.setPgArticleNew(a.getPgArticle());
		cArt.setColor(a.getTxColor());
		cArt.setShop(a.getShop().getTxShop());
		cArt.setSize(a.getTxSize());
		return cArt;
	}
}
