package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IMailService;
import it.othala.util.OthalaCommonUtils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
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

public class MailService implements IMailService {

	private Session session = null;

	// private static MailChimpClient mailChimpClient = new MailChimpClient();

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
			MailPropertiesDTO mailProps, boolean bcc) throws MailNotSendException {
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
				if (bcc) {
					message.setRecipient(Message.RecipientType.BCC, new InternetAddress("adunatasoftware@gmail.com"));
				}
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
			throws OthalaException {
		String url = "https://#PREFIX#.api.mailchimp.com/2.0/lists/subscribe.json";
		String json = "{\"apikey\": \"#api_key#\",\"id\":\"#id#\",\"email\": {\"email\": \"#EMAIL#\"},\"merge_vars\": {\"new-email\": \"#EMAIL#\",\"fname\": \"#FNAME#\",\"lname\": \"#LNAME#\"},\"double_optin\": false,\"update_existing\":true}";

		json = json.replaceAll("#api_key#", apiKey);
		json = json.replaceAll("#id#", listId);
		json = json.replaceAll("#EMAIL#", email);

		if (name != null && surname != null) {
			json = json.replaceAll("#FNAME#", name);
			json = json.replaceAll("#LNAME#", surname);
		} else {
			json = json.replace(",\"fname\": \"#FNAME#\",\"lname\": \"#LNAME#\"", "");
		}
		int dash = apiKey.lastIndexOf('-');
		String prefix;
		if (dash > 0)
			prefix = apiKey.substring(dash + 1);
		else
			throw new OthalaException(new StringBuilder().append("Wrong apikey: ").append(apiKey).toString());
		url = url.replace("#PREFIX#", prefix);

		try {
			String response = OthalaCommonUtils.post(url, json);
			if (response.contains("error")) {
				throw new OthalaException(response);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new OthalaException("errore inserimento newsletter", e);
		}

	}

}
