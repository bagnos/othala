package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IMailService;

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
			throws OthalaException {
		// 2009-03-26 21:35:57
		/*
		 * String parms =
		 * "\"data[api_key]\": \"#api_key#\",\"data[id]\": \"#id#\",\"data[email]\": \"#EMAIL#\",\"data[merges][EMAIL]\": \"#EMAIL#\",\"data[merges][FNAME]\": \"#FNAME#\",\"data[merges][LNAME]\": \"#LNAME#\",\"data[update_existing]\": \"true\",\"data[double_optin]\": \"false\" "
		 * ;
		 * 
		 * parms=parms.replaceAll("#api_key#", apiKey);
		 * parms=parms.replaceAll("#id#", listId);
		 * parms=parms.replaceAll("#EMAIL#", email);
		 * parms=parms.replaceAll("#FNAME#", name);
		 * parms=parms.replaceAll("#LNAME#", surname);
		 */

		String url = "https://#PREFIX#.api.mailchimp.com/2.0/lists/subscribe.json";
		String json = "{\"apikey\": #api_key#,\"id\":#id#,\"email\": {\"email\": #EMAIL#},\"merge_vars\": {\"new-email\": #EMAIL#},\"double_optin\": false,\"update_existing\":true}";
		json = json.replaceAll("#api_key#", apiKey);
		json = json.replaceAll("#id#", listId);
		json = json.replaceAll("#EMAIL#", email);
		int dash = apiKey.lastIndexOf('-');
		String prefix;
		if (dash > 0)
			prefix = apiKey.substring(dash + 1);
		else
			throw new OthalaException(new StringBuilder().append("Wrong apikey: ").append(apiKey).toString());
		url=url.replace("#PREFIX#", prefix);
		/*
		 * json=json.replaceAll("#FNAME#", name);
		 * json=json.replaceAll("#LNAME#", surname);
		 */

		try {
			post(url, json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new OthalaException("errore inserimento newsletter", e);
		}
		// TODO Auto-generated method stub
		// reuse the same MailChimpClient object whenever possible

		// Subscribe a person
		/*
		 * SubscribeMethod subscribeMethod = new SubscribeMethod();
		 * subscribeMethod.apikey = apiKey; subscribeMethod.id = listId;
		 * subscribeMethod.email = new Email(); subscribeMethod.email.email =
		 * email;
		 * 
		 * subscribeMethod.double_optin = false;
		 * 
		 * subscribeMethod.update_existing = true; if ((name != null &&
		 * !name.isEmpty()) && (surname != null && !surname.isEmpty())) {
		 * subscribeMethod.merge_vars = new MergeVars(email, name, surname); }
		 * 
		 * try { mailChimpClient.execute(subscribeMethod); } catch (IOException
		 * e) { // TODO Auto-generated catch block throw new OthalaException(e,
		 * "errore nell'invio della mail"); }
		 */
	}

	/*
	 * public static class MergeVars extends MailChimpObject {
	 * 
	 * @Field public String EMAIL, FNAME, LNAME;
	 * 
	 * public MergeVars() { }
	 * 
	 * public MergeVars(String email, String fname, String lname) { this.EMAIL =
	 * email; this.FNAME = fname; this.LNAME = lname; } }
	 */

	public String post(String url, String payload)
		    throws IOException
		    
		  {
		HttpURLConnection conn=null;    
		URL mcUrl = new URL(url);
		conn = ((HttpURLConnection)mcUrl.openConnection());
		conn.setDoOutput(true);
		conn.setConnectTimeout(15000);
		conn.setReadTimeout(15000);
		conn.setRequestMethod("POST");

		    byte[] bytes = payload.getBytes("UTF-8");
		    conn.addRequestProperty("Content-Type", "application/json; charset=utf-8");
		    conn.setRequestProperty("Content-Length", Integer.toString(bytes.length));
		    conn.getOutputStream().write(bytes);

		    InputStream is = conn.getResponseCode() == 200 ?conn.getInputStream() : conn.getErrorStream();
		    Reader reader = new InputStreamReader(is, "UTF-8");
		    StringBuilder sb = new StringBuilder();
		    char[] buf = new char[4096];
		    int cnt;
		    while ((cnt = reader.read(buf)) >= 0) {
		      sb.append(buf, 0, cnt);
		    }
		    return sb.toString();
		  }

}
