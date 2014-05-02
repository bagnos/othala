package it.othala.service.interfaces;

import java.util.Map;

import it.othala.account.execption.MailNotSendException;

public interface IMailService {

	
	public void inviaHTMLMail(String[] tos, String subject, String content,Map<String, String> inlineImages) throws MailNotSendException;
	public void inviaMail(String[] tos, String subject, String content) throws MailNotSendException;
	
	
	
}
