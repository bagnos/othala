package it.othala.service;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserAlReadyActivatedException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.execption.UserNotResetStateException;
import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;
import it.othala.dto.MailDTO;
import it.othala.dto.MailGroupDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.enums.TypeCustomerState;
import it.othala.service.interfaces.IAccountService;
import it.othala.service.interfaces.IMailService;
import it.othala.service.template.Template;
import it.othala.service.template.Template.TipoTemplate;
import it.othala.util.HelperCrypt;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.IOUtils;

public class AccountService implements IAccountService {


	private IAccountDAO accountDAO;
	private IMailService mailService;

	private final String CUSTOMER_ROLE = "CUSTOMER";

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	public void setAccountDAO(IAccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public AccountDTO loginAccount(String mail, String pswd)
			throws BadCredentialException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerAccount(AccountDTO account, MailPropertiesDTO mailProps)
			throws DuplicateUserException, BadCredentialException,
			MailNotSendException {

		if (accountDAO.existAccount(account.getEmail()) > 0) {
			throw new DuplicateUserException(account.getEmail());
		}

		accountDAO.insertAccount(account);
		accountDAO.insertAccountRole(account.getEmail(), CUSTOMER_ROLE);

		/*
		inviaMailRegistrazione(account.getEmail(), account.getName(),
				account.getPsw(), mailProps);*/

	}

	@Override
	public void resetPasswordAccount(String email, MailPropertiesDTO mailProps)
			throws UserNotFoundException, MailNotSendException,
			UserNotActivatedException {
		// TODO Auto-generated method stub

		if (accountDAO.existAccount(email) == 0) {
			throw new UserNotFoundException(email);
		}

		if (accountDAO.getAccount(email).getState() != TypeCustomerState.ATTIVATO
				.getState()) {
			throw new UserNotActivatedException(email);
		}

		accountDAO.changeStateAccount(email,
				TypeCustomerState.RESET_PSW.getState());
		inviaResetMailRegistrazione(email, mailProps);
	}

	@Override
	public int removeAccount(List<AccountDTO> listAccount) {
		// TODO Auto-generated method stub
		List<String> email = new ArrayList<>();
		if (listAccount == null || listAccount.isEmpty()) {
			return 0;
		}
		for (AccountDTO acc : listAccount) {
			email.add(acc.getEmail());
		}
		return accountDAO.changeStateAccount(email,
				TypeCustomerState.CESSATO.getState());
	}

	@Override
	public int activeAccount(List<AccountDTO> listAccount) {
		// TODO Auto-generated method stub
		List<String> email = new ArrayList<>();
		if (listAccount == null || listAccount.isEmpty()) {
			return 0;
		}
		for (AccountDTO acc : listAccount) {
			email.add(acc.getEmail());
		}
		return accountDAO.changeStateAccount(email,
				TypeCustomerState.ATTIVATO.getState());
	}

	@Override
	public void modifyAccount(String OldEmail, AccountDTO account)
			throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	private void inviaMailRegistrazione(String email, String name, String psw,
			MailPropertiesDTO mailProps) throws MailNotSendException {
		String content;
		try {
			content = Template.getContenFile(TipoTemplate.MailRegistrazione);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}
		content = content.replaceAll("<MAIL>", email);
		content = content.replaceAll("<NAME>", name);
		content = content.replaceAll("<PSW>", psw);
		content = content.replaceAll("<SITE>", mailProps.getDnsSite());
		content = content.replaceAll("<COMPANY_NAME>",
				mailProps.getCompanyName());
		content = content.replaceAll("<CONTEXT_ROOT>",
				mailProps.getContextRoot());
		content = content.replaceAll("<BOARD_URL>", mailProps.getBoardUrl());
		String encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		mailService.inviaMail(new String[] { email },
				"Welcome " + mailProps.getCompanyName(), content, mailProps);
	}

	private void inviaResetMailRegistrazione(String email,
			MailPropertiesDTO mailPros) throws MailNotSendException {
		String content = null;
		String encryptMail = null;
		try {
			content = Template.getContenFile(TipoTemplate.MailResetPSW);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<SITE>", mailPros.getDnsSite());
		content = content.replaceAll("<CONTEXT_ROOT>",
				mailPros.getContextRoot());

		encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		String subject = "Reset Password ";
		subject += mailPros.getCompanyName();

		mailService.inviaMail(new String[] { email }, subject, content,
				mailPros);
	}

	@Override
	public void activatedAccount(String email) throws UserNotFoundException,
			UserAlReadyActivatedException {
		// TODO Auto-generated method stub
		// INSERIRE LA VERIFICA SEL L'UTENTE è GIA PIN STATO ATTIVAZIONE
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		if (acc.getState() == TypeCustomerState.ATTIVATO.getState()) {
			throw new UserAlReadyActivatedException(email);

		}

		int res = accountDAO.changeStateAccount(email,
				TypeCustomerState.ATTIVATO.getState());
		if (res == 0) {
			// INSERIRE UN MESSAGGIO DEL LANGUAGE.
			throw new UserNotFoundException(email);
		}
	}

	@Override
	public void changePassworResetdAccount(String email, String psw)
			throws UserNotFoundException, UserNotResetStateException {
		// TODO Auto-generated method stub
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		if (acc.getState() != TypeCustomerState.RESET_PSW.getState()) {
			throw new UserNotFoundException(email);
		}

		accountDAO.updatePassword(email, psw);

		accountDAO.changeStateAccount(email,
				TypeCustomerState.ATTIVATO.getState());
	}

	@Override
	public void changePassworAccount(String email, String psw)
			throws UserNotFoundException {
		// TODO Auto-generated method stub
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		accountDAO.updatePassword(email, psw);
	}

	@Override
	public AccountDTO verifyPasswordAccount(String email, String psw)
			throws BadCredentialException {
		if (email == null || email.isEmpty() || psw == null || psw.isEmpty()) {
			throw new BadCredentialException();
		}
		AccountDTO name = accountDAO.verifyPassword(email, psw);
		if (name == null || name.getEmail().isEmpty()) {
			throw new BadCredentialException();
		}
		return name;

	}

	@Override
	public List<AccountDTO> findAccount(String surname, String name) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(surname, name);
	}

	@Override
	public List<AccountDTO> listAccount() {
		// TODO Auto-generated method stub
		return accountDAO.getAccount();
	}

	@Override
	public AccountDTO findAccount(String email) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(email);
	}

	@Override
	public void richiediFidelity(String nome, String cognome, String email,
			String cell, String emailMerchant, String site,
			MailPropertiesDTO mail) throws MailNotSendException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("<nome>" + nome + "</nome>");
		sb.append("<cognome>" + cognome + "</cognome>");
		sb.append("<email>" + email + "</email>");
		sb.append("<cell>" + cell + "</emacellil>");
		sb.append("<site>" + email + "</site>");

		String content = null;

		try {
			content = Template.getContenFile(TipoTemplate.MailFidelityRequest);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<nome>", nome);
		content = content.replaceAll("<cognome>", cognome);
		content = content.replaceAll("<email>", email);

		mailService.inviaMail(new String[] { emailMerchant }, site
				+ ":richiesta censimento Fidelity Card", content, mail);
	}

	@Override
	public void insertMail(Integer idMailGroup, String txUser, String txNome) {
		if (accountDAO.listMail(idMailGroup, txUser).isEmpty()) {
			accountDAO.insertMail(idMailGroup, txUser, txNome);
		}

	}

	@Override
	public void updateMail(Integer idMail, Integer idMailGroup, String txUser,
			String txNome) {
		accountDAO.updateMail(idMail, idMailGroup, txUser, txNome);

	}

	@Override
	public void deleteMail(Integer idMail) {
		accountDAO.deleteMail(idMail);

	}

	@Override
	public void insertMailGroup(String txMailGroup) {
		accountDAO.insertMailGroup(txMailGroup);

	}

	@Override
	public void updateMailGroup(Integer idMailGroup, String txMailGroup) {
		accountDAO.updateMailGroup(idMailGroup, txMailGroup);

	}

	@Override
	public void deleteMailGroup(Integer idMailGroup) {
		accountDAO.deleteMailGroup(idMailGroup);

	}

	@Override
	public List<MailGroupDTO> listMailGroup(Integer idMailGroup) {

		return accountDAO.listMailGroup(idMailGroup);
	}

	@Override
	public List<MailDTO> listMail(Integer idMailGroup, String txUser) {
		return accountDAO.listMail(idMailGroup, txUser);
	}

	@Override
	public void sendMailNewsletter(List<MailDTO> users, String testo,
			String imageContenuto, String subject, MailPropertiesDTO mailProps)
			throws Exception {

		File xslFile = Template
				.getFile("it/othala/service/template/mailNewsletter.xsl");
		String content = new String(java.nio.file.Files.readAllBytes(xslFile
				.toPath()));
		content = content.replace("#{testo}", testo);
		content = content.replace("#{imageContenuto}", imageContenuto);
		content = content.replace("#{imageLogo}", mailProps.getPathImgLogo());
		content = content.replace("#{serverName}", mailProps.getServerName());
		content = content.replace("#{contextName}", mailProps.getContextRoot());

		for (MailDTO mail : users) {
			mail.setTxNome(mail.getTxNome() != null ? mail.getTxNome()
					: "Cliente");
			content = content.replace("#{user}", mail.getTxNome());
			content = content.replace("#{id}", HelperCrypt.encrypt(String
					.format("%s", mail.getIdMail().toString())));
			mailService.inviaHTMLMail(new String[] { mail.getTxUser() },
					subject, content, null, mailProps, false);
		}

	}

	private String generateHtmlNewsletter(String testo, String imageContenuto,
			String imageLogo, String user) throws Exception {
		BufferedWriter out = null;
		FileWriter fstream = null;

		try {

			File xslFile = Template
					.getFile("it/othala/service/template/mailNewsletter.xsl");
			File xmlTemp = File.createTempFile("xmlTemp", ".xml");
			fstream = new FileWriter(xmlTemp);

			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(xmlTemp), "UTF8"));

			out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.write("<mail>");
			out.write("<user>");
			out.write(user);
			out.write("</user>");

			out.write("<imgLogo>");
			// out.write("cid:imageLogo");
			out.write(imageLogo);
			// inlineImages.put("imageLogo", imageLogo);
			out.write("</imgLogo>");
			if (imageContenuto != null) {
				out.write("<imgContenuto>");
				out.write(imageContenuto);
				// inlineImages.put("imgContenuto", imageContenuto);
				out.write("</imgContenuto>");
			}
			out.write("<testo>");
			out.write(testo);
			out.write("</testo>");
			out.write("</mail>");
			out.close();
			fstream.close();

			// scrivo il file xml temporaneo

			File htmlTemp = File.createTempFile("htmlTemp", ".html");

			// effetto la conversione xml,xsl to html scrivo il file html
			// temporaneo
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Source xslSource = new javax.xml.transform.stream.StreamSource(
					xslFile);
			Source xmlSource = new javax.xml.transform.stream.StreamSource(
					xmlTemp);
			javax.xml.transform.stream.StreamResult result = new StreamResult(
					htmlTemp);
			Transformer transformer;
			transformer = tFactory.newTransformer(xslSource);
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.transform(xmlSource, result);

			String html = IOUtils.toString(new FileInputStream(htmlTemp),
					"UTF-8");

			return html;

		} catch (Exception e) {
			throw e;

		}

	}



}
