package it.othala.web.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.imageio.stream.FileImageInputStream;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.resizers.ProgressiveBilinearResizer;

import org.primefaces.model.UploadedFile;

public class ResizeImageUtil {

	private static String BASE_IMG_PATH = null;
	private static String BASE_IMG_PATH_HOME = null;
	private static String LIBRARY_HOME = null;
	private static final String LARGE = "LARGE_";
	private static DateFormat dateFormat = new SimpleDateFormat("ddMMyyyyHHmmssSSS");

	public static String getBaseImgPath() {
		if (BASE_IMG_PATH == null) {
			BASE_IMG_PATH = ConfigurationUtil.getProperty("BASE_IMG_PATH");
		}
		return BASE_IMG_PATH;
	}

	private static String getNomeFile(String nomeFile) {
		String file = dateFormat.format(new Date()) + "&" + nomeFile.replaceAll("&", "");
		return file;
	}

	public static String getBaseImgPathHome() {
		if (BASE_IMG_PATH_HOME == null) {
			BASE_IMG_PATH_HOME = ConfigurationUtil.getProperty("BASE_IMG_PATH_HOME");
		}
		return BASE_IMG_PATH_HOME;
	}

	public static String resizeImageThumb(String fileThumb, String format) throws IOException {

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

	public static void deleteImage(String nomeFile) {

		List<String> imgsToDel = new ArrayList<String>();
		imgsToDel.add(nomeFile);
		deleteImages(imgsToDel);
	}

	public static String resizeAndCopyImage(InputStream fileIS, String nomeFile, String format) throws IOException {
		FileInputStream isLarge = null;
		try {
			int w, h = 0;
			w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageLargeW"));
			h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageLargeH"));

			String fileResized = resizeAndCopyImage(fileIS, getBasePath(), LARGE + nomeFile, format, w, h);
			File fLarge = new File(fileResized);
			String sampleName = fLarge.getName();
			sampleName = sampleName.replace(LARGE, "");
			isLarge = new FileInputStream(fLarge);

			w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageW"));
			h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageH"));
			resizeAndCopyImage(isLarge, getBasePath(), nomeFile, format, w, h);

			return sampleName;
		} finally {
			try {
				if (fileIS != null) {
					fileIS.close();
				}
				if (isLarge != null) {
					isLarge.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	public static String getLibraryImageHome() {
		if (LIBRARY_HOME == null) {
			LIBRARY_HOME = ConfigurationUtil.getProperty("LIBRARY_HOME");
		}
		return LIBRARY_HOME;
	}

	public static String resizeAndCopyImageHome(InputStream fileIS, String nomeFile, String format, int w, int h)
			throws IOException {
		String nomeOutFile = getNomeFile(nomeFile);

		// mettere la dimensione del carosel a 1140*757
		
		resizeAndCopyImage(fileIS, getBasePathHome(), nomeOutFile, format, w, h, 0.4d);
		return nomeOutFile;
	}

	private static String resizeAndCopyImage(InputStream fileIS, String basePathToCopy, String nomeFile, String format,
			int w, int h) throws IOException {

		// fileIn.delete();

		return resizeAndCopyImage(fileIS, getBasePath(), getNomeFile(nomeFile), format, w, h, 0.9d);

	}

	private static String resizeAndCopyImage(InputStream fileIS, String basePathToCopy, String nomeFile, String format,
			int w, int h, double quality) throws IOException {

		// fileIn.delete();

		String fileResized = basePathToCopy + File.separator + nomeFile;
		Thumbnails.of(fileIS).size(w, h).outputFormat(format).outputQuality(quality).toFile(fileResized);

		return fileResized;

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

	public static String getBasePath() {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String path = extContext.getRealPath(getBaseImgPath());
		return path;
	}

	private static String getBasePathHome() {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String path = extContext.getRealPath(getBaseImgPathHome());
		return path;
	}

	public static String getFormat(UploadedFile file) {
		String format = file.getContentType().split("/")[1];
		return format;
	}

	public static String getFormat(String file) {
		String[] elems = file.split("\\.");
		String format = elems[elems.length - 1];
		return format;
	}

}
