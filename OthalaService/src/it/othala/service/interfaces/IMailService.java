package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;

public interface IMailService {

	public void inviaMail(String from,String[] tos, String subject, String content) throws MailNotSendException;
	public void inviaMail(String[] tos, String subject, String content) throws MailNotSendException;
	
}
