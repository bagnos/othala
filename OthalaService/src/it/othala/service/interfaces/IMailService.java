package it.othala.service.interfaces;

import java.util.Map;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;

public interface IMailService {

	
	public void inviaHTMLMail(String[] tos, String subject, String content,Map<String, String> inlineImages,MailPropertiesDTO mailProos) throws MailNotSendException;
	public void inviaMail(String[] tos, String subject, String content,MailPropertiesDTO mailProos) throws MailNotSendException;
	
	
	
}
