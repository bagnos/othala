package it.othala.merchant.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.GroupImagesDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IProductService;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.event.PhaseId;
import javax.faces.model.SelectItem;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class InsertSiteImageView extends BaseView {

	private List<SiteImagesDTO> imagesSiteGroup = new ArrayList<>();
	private List<SiteImagesDTO> imagesSiteGroupSeletcetd = new ArrayList<>();

	private String idTypeGroupImage;
	private List<GroupImagesDTO> groupImagesDTO = new ArrayList<>();
	private GroupImagesDTO groupImagesSelected = null;
	private List<AttributeDTO> gender;
	private String txAlt;

	public String getTxAlt() {
		return txAlt;
	}

	public void setTxAlt(String txAlt) {
		this.txAlt = txAlt;
	}

	public GroupImagesDTO getGroupImagesSelected() {
		return groupImagesSelected;
	}

	private List<SelectItem> genderGroup = new ArrayList<>();
	private Integer idGenderSelected;

	public Integer getIdGenderSelected() {
		return idGenderSelected;
	}

	public void setIdGenderSelected(Integer idGenderSelected) {
		this.idGenderSelected = idGenderSelected;
	}

	public List<SelectItem> getGenderGroup() {
		return genderGroup;
	}

	public List<GroupImagesDTO> getGroupImagesDTO() {
		return groupImagesDTO;
	}

	public void setImagesSiteGroupSeletcetd(List<SiteImagesDTO> imagesSiteGroupSeletcetd) {
		this.imagesSiteGroupSeletcetd = imagesSiteGroupSeletcetd;
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
		groupImagesDTO = OthalaFactory.getSiteImagesServiceInstance().getSiteImagesForUpdate();
		gender = getBeanApplication().getDomain().getGender();
		for (AttributeDTO img : gender) {
			genderGroup.add(new SelectItem(img.getAttributo(), img.getValore()));
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
		try {
			int i = 0;
			int j = 0;
			for (SiteImagesDTO img : imagesSiteGroup) {
				if (img == imagesSiteGroupSeletcetd.get(0)) {
					break;
				}
				i++;
			}

			j = i - 1;
			j = j < 0 ? 0 : j;

			Collections.swap(imagesSiteGroup, i, j);
		} catch (Exception ex) {
			addGenericError(ex, "errore moveUP immagine");
		}
	}

	public void moveDown(ActionEvent e) {
		try {
			int i = 0;
			int j = 0;
			for (SiteImagesDTO img : imagesSiteGroup) {
				if (img == imagesSiteGroupSeletcetd.get(0)) {
					break;
				}
				i++;
			}

			j = i + 1;
			j = j > imagesSiteGroup.size() - 1 ? imagesSiteGroup.size() - 1 : j;
			Collections.swap(imagesSiteGroup, i, j);
		} catch (Exception ex) {
			addGenericError(ex, "errore moveUP immagine");
		}
	}

	public void conferma(ActionEvent e) {
		try {

			GroupImagesDTO groupImages = new GroupImagesDTO();

			if (imagesSiteGroup.size() == 0) {
				addError("Inserimento Immagine", "Nessuna immagine selezionata");
				return;
			}

			groupImages.setTxGroupImages(imagesSiteGroup.get(0).getTxGroupImages());

			groupImages.setListImages(imagesSiteGroup);

			OthalaFactory.getSiteImagesServiceInstance().updateGroupImages(groupImages);
			reset();
			getBeanApplication().resetImgHome();
			getBeanApplication().resetDomain();
			addInfo("Inserimento Immagine", "Operazione Eseguita correttamente");

		} catch (Exception ex) {
			reset();
			addGenericError(ex, "errore inserimento immagini home");

		}

	}

	private void reset() {
		imagesSiteGroupSeletcetd = null;
		idTypeGroupImage = null;
		groupImagesSelected = null;
		imagesSiteGroup = null;
		txAlt=null;
		groupImagesDTO = OthalaFactory.getSiteImagesServiceInstance().getSiteImagesForUpdate();
	}

	public void selectGroupImage(AjaxBehaviorEvent e) {

		imagesSiteGroup = new ArrayList<SiteImagesDTO>();
		for (GroupImagesDTO group : groupImagesDTO) {
			if (group.getTxGroupImages().equalsIgnoreCase(idTypeGroupImage)) {
				imagesSiteGroup = group.getListImages();
				groupImagesSelected = group;
				return;
			}
		}
	}

	public void handleFileUpload(FileUploadEvent event) {
		try {
			if (!PhaseId.INVOKE_APPLICATION.equals(event.getPhaseId())) {
				event.setPhaseId(PhaseId.INVOKE_APPLICATION);
				event.queue();
			} else {
				// do stuff here, #{ngoPhotoBean.description} is set

				UploadedFile file = event.getFile();
				String fileResized = null;

				if (groupImagesSelected.getFgGender()
						&& (idGenderSelected == null || idGenderSelected.intValue() == -1)) {
					addError("Inserimento immagine - selezionare una categoria", "");

					return;
				}

				if (imagesSiteGroup.size() >= groupImagesSelected.getNrImages()) {
					addError("Inserimento immagine - raggiunto il numero massi di immagini per il gruppo selezionato",
							"");
					return;
				}

				if (file == null) {
					addError("Inserimento immagine - immagine non selezionata", "");
					return;
				}

				for (SiteImagesDTO img : imagesSiteGroup) {
					if (img.getTxName().equalsIgnoreCase(file.getFileName())) {
						addError("Inserimento immagine - immagine gi� presente", "");
						return;
					}
				}

				if (file != null) {

					try {
						fileResized = copyFile(file, groupImagesSelected);

					} catch (IOException e) {
						log.error("errore upload", e);
						addError("Upload", file.getFileName() + " errore nell'upload");
					}

					SiteImagesDTO siteImgDTO = new SiteImagesDTO();

					siteImgDTO.setTxName(fileResized);
					siteImgDTO.setTxLibrary(groupImagesSelected.getTxLibrary());
					siteImgDTO.setTxGroupImages(groupImagesSelected.getTxGroupImages());
					siteImgDTO.setTxAlt(txAlt);

					if (groupImagesSelected.getFgGender()) {
						siteImgDTO.setIdGender(idGenderSelected);

						for (SelectItem group : genderGroup) {
							if (((int) group.getValue()) == idGenderSelected.intValue()) {
								siteImgDTO.setTxGender(group.getLabel());
								break;
							}
						}

					}
					siteImgDTO.setUrlRedirect(null);
					imagesSiteGroup.add(siteImgDTO);

					// addInfo("Upload", file.getFileName() +
					// " � stata caricata correttamente");

				}
			}
		} catch (Exception e) {
			addGenericError(e, "errore inserimento immagine");
		}
	}

	private String copyFile(UploadedFile file, GroupImagesDTO groupSelected) throws IOException {

		// File result = new File(extContext.getRealPath(BASE_IMG_PATH +
		// file.getFileName()));

		// FileOutputStream fileOutputStream = new FileOutputStream(result);
		InputStream inputStream = file.getInputstream();
		String format = ResizeImageUtil.getFormat(file);
		// IOUtils.copy(inputStream, fileOutputStream);

		String fileResized = null;
		try {

			fileResized = ResizeImageUtil.resizeAndCopyImageHome(inputStream, file.getFileName(), format,
					groupSelected.getMaxWidth(), groupSelected.getMaxHeight());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			addGenericError(e, "errore upload immagine");

		}

		return fileResized;

	}

	public void deleteBadImages(ActionEvent e) {

		try {

			IProductService prod = OthalaFactory.getProductServiceInstance();

			prod.cleanFolderImages(ResizeImageUtil.getBasePath());

		} catch (Exception ex) {

			reset();

			addGenericError(ex, "errore inserimento immagini home");

		}

	}

}
