package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;

import java.util.Map;

public interface IMailService {

	
	public void inviaHTMLMail(String[] tos, String subject, String content,Map<String, String> inlineImages,MailPropertiesDTO mailProos,boolean bcc) throws MailNotSendException;
	public void inviaMail(String[] tos, String subject, String content,MailPropertiesDTO mailProos) throws MailNotSendException;
	public void insertNewsletterMailChimp(String email,String name,String surname,String apiKey,String listId) throws OthalaException;
	
	
	
}
