package it.othala.service;

import it.othala.execption.MailNotSendException;
import it.othala.service.interfaces.IMailService;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class MailService implements IMailService {

	private Session session = null;

	@Override
	public void inviaMail(String from, String[] tos, String subject, String content) throws MailNotSendException {
		// TODO Auto-generated method stub
		{
			try {
				
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				Session session = (Session) envCtx.lookup("mail/othala");
				Message message = new MimeMessage(session);
				InternetAddress to[] = new InternetAddress[tos.length];
				int i = 0;
				for (String address : tos) {
					to[i] = new InternetAddress(address);
					i++;
				}

				message.setFrom(new InternetAddress(from));
				message.setRecipients(Message.RecipientType.TO, to);
				message.setSubject(subject);
				message.setContent(content, "text/plain");

				Transport.send(message);
			} catch (NamingException | MessagingException e) {
				throw new MailNotSendException(e);
			}

		}

	}

	@Override
	public void inviaMail(String[] tos, String subject, String content) throws MailNotSendException {
		// TODO Auto-generated method stub
		inviaMail(ConfigurationService.getProperty(ConfigurationService.FROM_MAIL), tos, subject, content);
	}

	final String username = "username@gmail.com";
	final String password = "password";

	private Session getSession() {

		if (session == null) {

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			 session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
		}
		return session;
	}

}
