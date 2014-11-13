package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IMailService;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.ecwid.mailchimp.MailChimpClient;
import com.ecwid.mailchimp.MailChimpException;
import com.ecwid.mailchimp.MailChimpObject;
import com.ecwid.mailchimp.method.v2_0.lists.Email;
import com.ecwid.mailchimp.method.v2_0.lists.SubscribeMethod;

public class MailService implements IMailService {

	private Session session = null;
	private static MailChimpClient mailChimpClient = new MailChimpClient();

	private void inviaMail(String from, String[] tos, String subject, String content, String type,
			MailPropertiesDTO mailProps) throws MailNotSendException {
		// TODO Auto-generated method stub
		{
			try {

				// Context initCtx = new InitialContext();
				// Context envCtx = (Context) initCtx.lookup("java:comp/env");
				// Session session = (Session) envCtx.lookup("mail/othala");
				Session session = getSession(mailProps);
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
				if (type == null) {
					type = "text/plain; charset=UTF-8";
				}
				message.setContent(content, type);

				Transport.send(message);
			} catch (MessagingException e) {
				throw new MailNotSendException(e);
			}

		}

	}

	@Override
	public void inviaMail(String[] tos, String subject, String content, MailPropertiesDTO mailProps)
			throws MailNotSendException {
		// TODO Auto-generated method stub
		inviaMail(mailProps.getFromMail(), tos, subject, content, "text/plain", mailProps);
	}

	private Session getSession(final MailPropertiesDTO mailProps) {

		if (session == null) {

			Properties props = new Properties();
			props.put("mail.smtp.auth", mailProps.getMailSmtAuth().trim());
			props.put("mail.smtp.starttls.enable", mailProps.getMailSmtpAtarttlsAnable().trim());
			props.put("mail.smtp.host", mailProps.getMailSmtpHost().trim());
			props.put("mail.smtp.port", mailProps.getMailSmtpPort().trim());

			session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(mailProps.getUsername(), mailProps.getPassword());
				}
			});
		}
		return session;
	}

	@Override
	public void inviaHTMLMail(String[] tos, String subject, String content, Map<String, String> inlineImages,
			MailPropertiesDTO mailProps) throws MailNotSendException {
		// TODO Auto-generated method stub

		{
			try {

				/*
				 * Context initCtx = new InitialContext(); Context envCtx =
				 * (Context) initCtx.lookup("java:comp/env"); Session session =
				 * (Session) envCtx.lookup("mail/othala");
				 */
				Session session = getSession(mailProps);
				Message message = new MimeMessage(session);
				InternetAddress to[] = new InternetAddress[tos.length];
				int i = 0;
				for (String address : tos) {
					to[i] = new InternetAddress(address);
					i++;
				}

				message.setFrom(new InternetAddress(mailProps.getFromMail()));
				message.setRecipients(Message.RecipientType.TO, to);
				message.setSubject(subject);

				// message.setContent(content, "text/html");
				// creates message part
				MimeBodyPart messageBodyPart = new MimeBodyPart();

				messageBodyPart.setContent(content, "text/html; charset=UTF-8");

				// creates multi-part
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);

				// adds inline image attachments
				if (inlineImages != null && inlineImages.size() > 0) {
					Set<String> setImageID = inlineImages.keySet();

					for (String contentId : setImageID) {
						MimeBodyPart imagePart = new MimeBodyPart();
						imagePart.setHeader("Content-ID", "<" + contentId + ">");
						// imagePart.setDisposition(MimeBodyPart.INLINE);

						String imageFilePath = inlineImages.get(contentId);

						FileDataSource fds = new FileDataSource(imageFilePath);

						imagePart.setDataHandler(new DataHandler(fds));

						multipart.addBodyPart(imagePart);
					}
				}

				message.setContent(multipart);

				Transport.send(message);
			} catch (MessagingException e) {
				throw new MailNotSendException(e);
			}

		}

	}

	@Override
	public void insertNewsletterMailChimp(String email, String name, String surname, String apiKey, String listId)
			throws MailChimpException, OthalaException {
		// TODO Auto-generated method stub
		// reuse the same MailChimpClient object whenever possible

		// Subscribe a person
		SubscribeMethod subscribeMethod = new SubscribeMethod();
		subscribeMethod.apikey = apiKey;
		subscribeMethod.id = listId;
		subscribeMethod.email = new Email();
		subscribeMethod.email.email = email;

		// a41ae8d28455caf721147089c33d2c56-us8
		// no messaggio di benvenuto
		subscribeMethod.double_optin = false;
		// aggiorna se esistente
		subscribeMethod.update_existing = true;
		if ((name != null && !name.isEmpty()) && (surname != null && !surname.isEmpty())) {
			subscribeMethod.merge_vars = new MergeVars(email, name, surname);
		}

		try {
			mailChimpClient.execute(subscribeMethod);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new OthalaException(e, "errore nell'invio della mail");
		}
	}

	public static class MergeVars extends MailChimpObject {

		@Field
		public String EMAIL, FNAME, LNAME;

		public MergeVars() {
		}

		public MergeVars(String email, String fname, String lname) {
			this.EMAIL = email;
			this.FNAME = fname;
			this.LNAME = lname;
		}
	}

}
