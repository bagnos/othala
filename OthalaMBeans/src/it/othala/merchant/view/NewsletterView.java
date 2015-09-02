package it.othala.merchant.view;

import it.othala.dto.MailDTO;
import it.othala.dto.MailGroupDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.ResizeImageUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class NewsletterView extends BaseView {

	private List<MailGroupDTO> groups;
	private Integer idGroupSelected;
	private String email;
	private String name;
	private String surname;
	private String testoMail;
	private String ogettoMail;
	private String baseImgPath;
	private String fileImg;
	private String absoluteFileImg;
	private List<MailDTO> mail;
	private String groupSelected;

	public String getGroupSelected() {
		return groupSelected;
	}

	public List<MailDTO> getMail() {
		return mail;
	}

	public String getFileImg() {
		return fileImg;
	}

	public String getOgettoMail() {
		return ogettoMail;
	}

	public void setOgettoMail(String ogettoMail) {
		this.ogettoMail = ogettoMail;
	}

	public String getTestoMail() {
		return testoMail;
	}

	public void setTestoMail(String testoMail) {
		this.testoMail = testoMail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Integer getIdGroupSelected() {
		return idGroupSelected;
	}

	public void setIdGroupSelected(Integer idGroupSelected) {
		this.idGroupSelected = idGroupSelected;
	}

	public List<MailGroupDTO> getGroups() {
		return groups;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		testoMail = null;
		ogettoMail = null;

		baseImgPath = ConfigurationUtil.getProperty("BASE_IMG_PATH_NEWSLETTER");
		baseImgPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath(baseImgPath);
		groups = OthalaFactory.getAccountServiceInstance().listMailGroup(null);
		return null;
	}

	public void mostra(ActionEvent e) {
		for (MailGroupDTO mgroup : groups) {
			if (mgroup.getIdMailGroup().intValue() == idGroupSelected.intValue()) {
				groupSelected = mgroup.getTxMailGroup();
				break;
			}
		}

		mail = OthalaFactory.getAccountServiceInstance().listMail(idGroupSelected, null);
		RequestContext.getCurrentInstance().execute("PF('dlgGroup').show();");
	}

	public void inviaMail(ActionEvent e) {
		List<MailDTO> users = OthalaFactory.getAccountServiceInstance().listMail(idGroupSelected, null);
		MailPropertiesDTO mailProps = ConfigurationUtil.getMailPropsNewsLetter(getRequest());
		String imgContenuto = null;
		if (fileImg != null) {
			imgContenuto = ConfigurationUtil.getHttpPathImagesNewsletter(getRequest()) + fileImg;
		}
		try {
			BundleMail bundle = new BundleMail(users, testoMail, imgContenuto, ogettoMail, mailProps);
			MailThread mThread = new MailThread(bundle);
			mThread.start();
			addInfo("Newsletter", "Mail inviata correttamente");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addError("Errore Invio mail", "si è verificato un problema nell'invio della mail.");
			log.error("erroe invio mail", e1);
		}

	}

	private class BundleMail {
		List<MailDTO> users;
		String testoMail;
		String imgContenuto;
		String oggettoMail;
		MailPropertiesDTO mailProps;

		public BundleMail(List<MailDTO> users, String testoMail, String imgContenuto, String oggettoMail,
				MailPropertiesDTO mailProps) {
			// TODO Auto-generated constructor stub
			this.users = users;
			this.testoMail = testoMail;
			this.imgContenuto = imgContenuto;
			this.oggettoMail = oggettoMail;
			this.mailProps = mailProps;
		}
	}

	private class MailThread extends Thread {
		private BundleMail mail;

		MailThread(BundleMail mail) {
			this.mail = mail;
		}

		public void run() {
			try {
				long inizio = System.currentTimeMillis();
				log.info("THREAD MAIL: inizio invio newsletter");
				OthalaFactory.getAccountServiceInstance().sendMailNewsletter(this.mail.users, this.mail.testoMail,
						this.mail.imgContenuto, this.mail.oggettoMail, this.mail.mailProps);
				long end = System.currentTimeMillis() - inizio;

				log.info("THREAD MAIL: Newsletter inviata tempo = "
						+ String.format(
								"%d min, %d sec",
								TimeUnit.MILLISECONDS.toMinutes(end),
								TimeUnit.MILLISECONDS.toSeconds(end)
										- TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(end))));

			} catch (Exception e) {
				// TODO Auto-generated catch block
				log.error("errore invio mail thread asincrono", e);
			}

		}

	}

	public void handleFileUpload(FileUploadEvent event) throws IOException {

		InputStream inputStream = null;
		OutputStream outputStream = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateSuffix = dateFormat.format(new Date());
		try {
			UploadedFile file = event.getFile();
			inputStream = file.getInputstream();

			fileImg = dateSuffix + file.getFileName();
			absoluteFileImg = baseImgPath + File.separator + fileImg;
			outputStream = new FileOutputStream(new File(absoluteFileImg));

			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}

		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (outputStream != null) {
				try {
					// outputStream.flush();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}

	}

}
