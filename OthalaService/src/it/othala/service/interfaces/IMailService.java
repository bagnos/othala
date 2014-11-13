package it.othala.service.interfaces;

import java.util.Map;

import com.ecwid.mailchimp.MailChimpException;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;

public interface IMailService {

	
	public void inviaHTMLMail(String[] tos, String subject, String content,Map<String, String> inlineImages,MailPropertiesDTO mailProos) throws MailNotSendException;
	public void inviaMail(String[] tos, String subject, String content,MailPropertiesDTO mailProos) throws MailNotSendException;
	public void insertNewsletterMailChimp(String email,String name,String surname,String apiKey,String listId) throws MailChimpException,OthalaException;
	
	
	
}
