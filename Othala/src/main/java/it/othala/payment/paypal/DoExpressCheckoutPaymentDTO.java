package it.othala.payment.paypal;


public class DoExpressCheckoutPaymentDTO extends PayPalResponseDTO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String PAYMENTINFO_0_TRANSACTIONID;
	private String PAYMENTINFO_0_PAYMENTSTATUS;
	private String PAYMENTINFO_0_PENDINGREASON;
	private String note;
	
	
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPAYMENTINFO_0_TRANSACTIONID() {
		return PAYMENTINFO_0_TRANSACTIONID;
	}
	public void setPAYMENTINFO_0_TRANSACTIONID(String pAYMENTINFO_0_TRANSACTIONID) {
		PAYMENTINFO_0_TRANSACTIONID = pAYMENTINFO_0_TRANSACTIONID;
	}
	public String getPAYMENTINFO_0_PAYMENTSTATUS() {
		return PAYMENTINFO_0_PAYMENTSTATUS;
	}
	public void setPAYMENTINFO_0_PAYMENTSTATUS(String pAYMENTINFO_0_PAYMENTSTATUS) {
		PAYMENTINFO_0_PAYMENTSTATUS = pAYMENTINFO_0_PAYMENTSTATUS;
	}
	public String getPAYMENTINFO_0_PENDINGREASON() {
		return PAYMENTINFO_0_PENDINGREASON;
	}
	public void setPAYMENTINFO_0_PENDINGREASON(String pAYMENTINFO_0_PENDINGREASON) {
		PAYMENTINFO_0_PENDINGREASON = pAYMENTINFO_0_PENDINGREASON;
	}
	
	
	
		
	
}
