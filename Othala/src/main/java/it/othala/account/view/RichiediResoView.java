package it.othala.account.view;

import it.othala.account.model.MyAccountBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ArticleRefounded;
import it.othala.dto.ChangeArticleDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.execption.OthalaException;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;
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
	private Map<String, List<SelectItem>> map = new HashMap<String, List<SelectItem>>();

	public Map<String, List<SelectItem>> getMap() {
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
		elencoResi = OthalaFactory.getOrderServiceInstance().getRefounds(null, null, getLoginBean().getEmail(), null,
				null);
		if (richiediCambio!=null && richiediCambio==true)
		{
			doInitElencaCambi();
		}
		else
		{
			doInitElencaResi();
		}
		return null;
	}

	public String doInitElencaResi() {
		// TODO Auto-generated method stub
		
		
		return null;

	}
	
	public String doInitElencaCambi() {
		// TODO Auto-generated method stub
		
		
		
		
		return null;

	}
	
	

	public void updateReso(AjaxBehaviorEvent e) {
		try {
			imRefunded = BigDecimal.ZERO;
			artToRefund = new ArrayList<>();
			String idArt= (String) e.getComponent().getAttributes().get("pgArt");
			String[] items=idArt.split("-");
			int pgArt=Integer.valueOf(items[1].trim());
			int idPrd=Integer.valueOf(items[0].trim());
			for (ArticleFullDTO art : myAccountBean.getOrderSelected().getCart()) {
				if (art.isSelected()) {
					ArticleRefounded artref = new ArticleRefounded(art);
					artToRefund.add(artref);
					imRefunded = imRefunded.add(art.getTotalPriced());
					
					if (richiediCambio!=null && richiediCambio && art.getPgArticle().intValue()==pgArt && art.getPrdFullDTO().getIdProduct().intValue()==idPrd) {
						ProductFullNewDTO prd = OthalaFactory.getProductServiceInstance().getProductFull(getLang(),
								art.getPrdFullDTO().getIdProduct());
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
					imRefunded = imRefunded.add(art.getTotalPriced());
				}
			}
			if (artToRefund.isEmpty()) {
				addError(OthalaUtil.getWordBundle("account_changeRequest"), OthalaUtil.getWordBundle("account_noArticleSelected"));
				return;
			}

			ref.setCart(artToRefund);
			ref.setIdOrder(myAccountBean.getOrderSelected().getIdOrder());
			ref.setIdUser(myAccountBean.getOrderSelected().getIdUser());
			if (richiedireso!=null && richiedireso==true)
			{
				 getRefund(ref);
			}
			else
			{
				getChange(ref);
			}
			
			addInfo(OthalaUtil.getWordBundle("othala_okExceution"), null);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore nella richesto del reso per l'ordine "
					+ myAccountBean.getOrderSelected().getIdOrder());
		}
	}
	
	private void getChange(RefoundFullDTO ref) throws OthalaException
	{
		//verifica se per gli articoli selezionati è presenta un articolo da cambiare
		for (ArticleRefounded art:ref.getCart())
		{
			if (art.getChangeSelected()==null)
			{
				addError(OthalaUtil.getWordBundle("account_changeRequest"), OthalaUtil.getWordBundle("account_noArticleChangeSelected"));
				return;
			}
			for (ChangeArticleDTO chArt:art.getChangesAvailable())
			{
				if (chArt.getCdBarcode().equalsIgnoreCase(art.getChangeSelected()))
				{
					art.setTxChangeRefound(chArt.getNoteMerchant());
					//inserire barcode su artRefounded
				}
			}			
			
		}
		OthalaFactory.getOrderServiceInstance().insertRefound(ref);
		
		
	}
	
	private void getRefund(RefoundFullDTO ref) throws OthalaException
	{
		ref.setImRefound(imRefunded);
		ref.setIdTransaction(myAccountBean.getOrderSelected().getIdTransaction());			
		ref = OthalaFactory.getOrderServiceInstance().insertRefound(ref);
		disabledConferma = true;

		keyRefund = getLoginBean().getEmail() + "-" + myAccountBean.getOrderSelected().getIdOrder();
		keyRefund = HelperCrypt.encrypt(keyRefund);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("", ref);

		addInfo("Richesta Reso",
				"LA richiesta è stata effettuata correttamente, nella sezione 'Miei Resi' portà verificare lo stato della sua richiesta. \n Stampare la ricevuta ed inserirla all'interno del pacco");
		RequestContext.getCurrentInstance().execute(
				"$(window).scrollTop();window.open('../RichiestaResoServlet?keyRefund=" + keyRefund + "');");

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
		ChangeArticleDTO artRef=null;
		if (artSel.getChangesAvailable() == null) {
			artSel.setChangesAvailable(new ArrayList<ChangeArticleDTO>());
			List<SelectItem> sel=new ArrayList<SelectItem>();
			for (ArticleFullDTO art : prd.getArticles()) {
				if (art.getPgArticle() != artSel.getPgArticle() && art.getQtStock() > 0) {
					artRef=valueOfArticle(art);
					artSel.getChangesAvailable().add(valueOfArticle(art));
					sel.add(new SelectItem(art.getTxBarCode(), String.format("%s, %s",artRef.getSize(),artRef.getColor())));
				}
			}
			if (!artSel.getChangesAvailable().isEmpty()) {
				artSel.setChangeSelected(artSel.getChangesAvailable().get(0).getCdBarcode());
				map.put(artSel.getTxBarCode(), sel);
			}
			
			
		}

	}

	private ChangeArticleDTO valueOfArticle(ArticleFullDTO a) {
		ChangeArticleDTO cArt = new ChangeArticleDTO();
		cArt.setCdBarcode(a.getTxBarCode());
		cArt.setColor(a.getTxColor());
		cArt.setShop(a.getShop().getTxShop());
		cArt.setSize(a.getTxSize());

		return cArt;
	}
}
