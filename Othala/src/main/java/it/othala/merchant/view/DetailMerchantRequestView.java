package it.othala.merchant.view;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import it.othala.dto.RefoundFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.merchant.model.MerchantBean;
import it.othala.payment.paypal.dto.RefundTransactionDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalPostPaymentException;
import it.othala.payment.paypal.exception.PayPalPostRefundPaymentException;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.PayPalUtil;

@ManagedBean
@ViewScoped
public class DetailMerchantRequestView extends BaseView {

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;
	private boolean disabledConferma;

	public boolean isDisabledConferma() {
		return disabledConferma;
	}

	public MerchantBean getMerchantBean() {
		return merchantBean;
	}

	public void setMerchantBean(MerchantBean merchantBean) {
		this.merchantBean = merchantBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		disabledConferma = false;
		return null;
	}

	public void cambia(ActionEvent e) {

		try {
			RefoundFullDTO ref = merchantBean.getRefoundSelected();
			OthalaFactory.getOrderServiceInstance().updateStateRefound(ref.getIdRefound(),
					TypeStateOrder.CHANGE_COMPLETED, null);
		} catch (Exception ex) {
			addGenericError(ex, "errore nella fase di cambio");
		}
	}

	public void rimborsa(ActionEvent e) {
		try {

			RefoundFullDTO ref = merchantBean.getRefoundSelected();
			RefundTransactionDTO refTrans = OthalaFactory.getPaymentServiceInstance().requestRefund(ref,
					PayPalUtil.getProfile(getRequest()));
			if (refTrans.isPending()) {
				addInfo("Richiesta Rimborso", String.format(
						"La richiesta è in corso di verifica dal sistema PayPal, regione del pending: %s",
						refTrans.getPENDINGREASON()));
			} else if (refTrans.isFailed()) {
				addError("Richiesta Rimborso", "Il sistema PayPal ha negato l'autorizzazione al rimborso");
			} else {
				addInfo("Richiesta di Rimborso", "Operazione eseguita correttamente");
				disabledConferma = true;
				try {
					merchantBean.setRefoundRequest(OthalaFactory.getOrderServiceInstance().getRefounds(null, null,
							null, TypeStateOrder.REQUEST_REFOUND, null, "R"));
				} catch (Exception ex) {
					log.error("errore aggiornamento prodotti dopo rimborso", ex);
				}
			}

		} catch (PayPalPostRefundPaymentException ex) {
			addOthalaExceptionError(ex, "errore dopo il rimborso");
		}

		catch (PayPalFailureException ex) {
			addOthalaExceptionError(ex, "PayPal failure Response nel requestRefund");

		} catch (PayPalException ex) {
			addOthalaExceptionError(ex, "PayPal communication error in requestRefund ");

		} catch (Exception ex) {
			addGenericError(ex, "errore nella fase di romborso");
		}
	}
}
