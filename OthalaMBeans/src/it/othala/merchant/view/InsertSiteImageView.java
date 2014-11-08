package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.enums.ArticleUpdate;
import it.othala.enums.TypeGroupSiteImages;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class InsertSiteImageView extends BaseView {

	private List<SiteImagesDTO> imagesSiteGroup = new ArrayList<>();
	private List<SiteImagesDTO> imagesSite = new ArrayList<>();
	private List<SiteImagesDTO> imagesSiteGroupSeletcetd = new ArrayList<>();
	private String idTypeGroupImage;

	public void setImagesSiteGroupSeletcetd(List<SiteImagesDTO> imagesSiteGroupSeletcetd) {
		this.imagesSiteGroupSeletcetd = imagesSiteGroupSeletcetd;
	}

	private List<SelectItem> imagesGroup = new ArrayList<SelectItem>();

	public List<SelectItem> getImagesGroup() {
		return imagesGroup;
	}

	public List<SiteImagesDTO> getImagesSiteGroupSeletcetd() {
		return imagesSiteGroupSeletcetd;
	}

	public List<SiteImagesDTO> getImagesSiteGroup() {
		return imagesSiteGroup;
	}

	public String getIdTypeGroupImage() {
		return idTypeGroupImage;
	}

	public void setIdTypeGroupImage(String typeGroupImage) {
		this.idTypeGroupImage = typeGroupImage;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		imagesSite = OthalaFactory.getSiteImagesServiceInstance().listSiteImages();
		List<String> gruppi = OthalaFactory.getSiteImagesServiceInstance().listGruppiSiteImages();
		for (String gruppo : gruppi) {
			imagesGroup.add(new SelectItem(gruppo));
		}

		return null;
	}

	public void removeImgPrd(ActionEvent e) {

		imagesSiteGroup.removeAll(imagesSiteGroupSeletcetd);
		List<String> imagesList = new ArrayList<String>();
		for (SiteImagesDTO img : imagesSiteGroupSeletcetd) {
			imagesList.add(img.getTxName());
		}
		ResizeImageUtil.deleteImagesHome(imagesList);
	}

	public void moveUp(ActionEvent e) {
		int i = 0;
		int j = 0;
		for (SiteImagesDTO img : imagesSiteGroup) {
			if (img == imagesSiteGroupSeletcetd.get(0)) {
				break;
			}
			i++;
		}

		j = i - 1;
		j=j<0?0:j;

		Collections.swap(imagesSiteGroup, i, j);
	}

	public void moveDown(ActionEvent e) {
		int i = 0;
		int j = 0;
		for (SiteImagesDTO img : imagesSiteGroup) {
			if (img == imagesSiteGroupSeletcetd.get(0)) {
				break;
			}
			i++;
		}

		j = i +1;
		j=j>imagesGroup.size()-1?imagesGroup.size()-1:j;
		Collections.swap(imagesSiteGroup, i, j);
	}

	public void conferma(ActionEvent e) {
		try {
			OthalaFactory.getSiteImagesServiceInstance().updateSiteImages(imagesSiteGroup);
		} catch (Exception ex) {
			addGenericError(null, "errore inserimento immagini home");
		}
	}

	public void selectGroupImage(AjaxBehaviorEvent e) {

		imagesSiteGroup = new ArrayList<SiteImagesDTO>();
		for (SiteImagesDTO siteImage : imagesSite) {
			if (siteImage.getTxGroupImages().equalsIgnoreCase(idTypeGroupImage)) {
				imagesSiteGroup.add(siteImage);
			}
		}
	}

	public void handleFileUpload(FileUploadEvent event) {
		UploadedFile file = event.getFile();
		String fileResized = null;

		for (SiteImagesDTO img : imagesSiteGroup) {
			if (img.getTxName().equalsIgnoreCase(file.getFileName())) {
				addError("Inserimento immagine", "immagine già prrsente");
				return;
			}
		}

		try {
			if (file != null) {

				try {
					fileResized = copyFile(file);

				} catch (IOException e) {
					log.error("errore upload", e);
					addError("Upload", file.getFileName() + " errore nell'upload");
				}

				SiteImagesDTO siteImgDTO = new SiteImagesDTO();

				siteImgDTO.setTxName(file.getFileName());
				siteImgDTO.setTxLibrary(ResizeImageUtil.getLibraryImageHome());
				siteImgDTO.setTxGroupImages(idTypeGroupImage);
				// che è?
				siteImgDTO.setUrlRedirect(null);
				imagesSiteGroup.add(siteImgDTO);
				addInfo("Upload", file.getFileName() + " è stata caricata correttamente");

			}
		} catch (Exception e) {
			addGenericError(e, "errore inserimento immagine");
		}
	}

	private String copyFile(UploadedFile file) throws IOException {

		// File result = new File(extContext.getRealPath(BASE_IMG_PATH +
		// file.getFileName()));

		// FileOutputStream fileOutputStream = new FileOutputStream(result);
		InputStream inputStream = file.getInputstream();
		String format = file.getContentType().split("/")[1];

		// IOUtils.copy(inputStream, fileOutputStream);

		String fileResized = null;
		try {
			fileResized = ResizeImageUtil.resizeAndCopyImage(inputStream, file.getFileName(), idTypeGroupImage, format);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			addGenericError(e, "errore upload immagine");

		}

		return fileResized;

	}
}
