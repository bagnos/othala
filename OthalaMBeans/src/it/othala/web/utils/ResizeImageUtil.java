package it.othala.web.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import net.coobird.thumbnailator.Thumbnails;

import org.primefaces.model.UploadedFile;

public class ResizeImageUtil {

	private  static String BASE_IMG_PATH = null;
	private  static String BASE_IMG_PATH_HOME = null;
	private  static String LIBRARY_HOME=null;
	private static DateFormat dateFormat = new SimpleDateFormat(
			"ddMMyyyyHHmmssSSS");
	
	

	public static String getBaseImgPath() {
		if (BASE_IMG_PATH==null)
		{
			 BASE_IMG_PATH = ConfigurationUtil.getProperty("BASE_IMG_PATH");
		}
		return BASE_IMG_PATH;
	}
	
	private static String getNomeFile(String nomeFile) {
		String file=dateFormat.format(new Date())
		+ "&"
		+ nomeFile.replaceAll("&", "");
		return file;
	}

	public static String getBaseImgPathHome() {
		if (BASE_IMG_PATH_HOME==null)
		{
			BASE_IMG_PATH_HOME = ConfigurationUtil.getProperty("BASE_IMG_PATH_HOME");
		}
		return BASE_IMG_PATH_HOME;
	}

	public static String resizeImageThumb(String fileThumb,String format) throws IOException {
		File fileIn = new File(getBasePath() + File.separator + fileThumb);
		int w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbW"));
		int h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbH"));
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileResized = fileIn.getParent() + File.separator + prefix + fileIn.getName();
		Thumbnails.of(fileIn).size(w, h).outputFormat(format).toFile(fileResized);
		return prefix + fileIn.getName();
	}

	public static void deleteImageThumb(String nomeFile) {
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileToDelete = getBasePath() + File.separator + prefix + nomeFile;
		File file = new File(fileToDelete);
		file.delete();
	}

	public static String resizeAndCopyImage(InputStream fileIS, String nomeFile, String format) throws IOException {
		int w, h = 0;
		w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageW"));
		h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageH"));
		return resizeAndCopyImage(fileIS, getBasePath(), nomeFile, format, w, h);
	}

	

	public static String getLibraryImageHome() {
		if (LIBRARY_HOME==null)
		{
			LIBRARY_HOME=ConfigurationUtil.getProperty("LIBRARY_HOME");
		}
		return LIBRARY_HOME;
	}

	
	public static String resizeAndCopyImageHome(InputStream fileIS, String nomeFile, String format,int w, int h) throws IOException
	{
		
		return resizeAndCopyImage(fileIS, getBasePathHome(), getNomeFile(nomeFile), format, w, h);
	}
	
	private static String resizeAndCopyImage(InputStream fileIS, String basePathToCopy, String nomeFile, String format,
			int w, int h) throws IOException {

		// fileIn.delete();

		String fileResized = basePathToCopy + File.separator + nomeFile;

		Thumbnails.of(fileIS).size(w, h).outputFormat(format).toFile(fileResized);

		return nomeFile;
	}

	public static void deleteImages(List<String> images) {
		deleteImages(images, getBasePath());
	}

	public static void deleteImagesHome(List<String> images) {
		deleteImages(images, getBasePathHome());
	}

	private static void deleteImages(List<String> images, String basePath) {
		String fileDelete = null;
		for (String img : images) {
			fileDelete = basePath + File.separator + img;
			File file = new File(fileDelete);
			file.delete();
		}
	}

	private static String getBasePath() {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String path = extContext.getRealPath(getBaseImgPath());
		return path;
	}

	private static String getBasePathHome() {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String path = extContext.getRealPath(getBaseImgPathHome());
		return path;
	}
	
	public static String getFormat(UploadedFile file)
	{
		String format = file.getContentType().split("/")[1];
		return format;
	}
	
	public static String getFormat(String file)
	{
		String format = file.split(".")[1];
		return format;
	}

}
