package it.othala.service.interfaces;

import it.othala.execption.MailNotSendException;

public interface IMailService {

	public void inviaMail(String from,String[] tos, String subject, String content) throws MailNotSendException;
}
