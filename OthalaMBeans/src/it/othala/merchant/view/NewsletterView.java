package it.othala.merchant.view;

import it.othala.dto.MailDTO;
import it.othala.dto.MailGroupDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

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
		baseImgPath = ConfigurationUtil.getProperty("BASE_IMG_PATH_NEWSLETTER");
		baseImgPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath(baseImgPath);
		groups = OthalaFactory.getAccountServiceInstance().listMailGroup(null);
		return null;
	}

	public void inviaMail(ActionEvent e) {
		List<MailDTO> users = OthalaFactory.getAccountServiceInstance().listMail(idGroupSelected, null);
		MailPropertiesDTO mailProps = ConfigurationUtil.getMailPropsNewsLetter(getRequest());
		String imgContenuto = null;
		if (fileImg != null) {
			imgContenuto = ConfigurationUtil.getHttpPathImagesNewsletter(getRequest()) + fileImg;
		}
		try {
			OthalaFactory.getAccountServiceInstance().sendMailNewsletter(users, testoMail, imgContenuto, ogettoMail,
					mailProps);
			addInfo("Newsletter", "Mail inviata correttamente");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addError("Errore Invio mail", "si è verificato un problema nell'invio della mail.");
			log.error("erroe invio mail", e1);
		}

	}

	public void handleFileUpload(FileUploadEvent event) throws IOException {

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			UploadedFile file = event.getFile();
			inputStream = file.getInputstream();
			fileImg = file.getFileName();
			absoluteFileImg = baseImgPath + File.separator + file.getFileName();

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
