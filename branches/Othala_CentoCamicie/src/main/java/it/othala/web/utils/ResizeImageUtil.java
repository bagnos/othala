package it.othala.web.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import net.coobird.thumbnailator.Thumbnails;

public class ResizeImageUtil {
	
	private final static String BASE_IMG_PATH = "//resources//images//cartThumbinals//";
	
	
	public static String resizeImageThumb(String fileThumb) throws IOException {
		File fileIn = new File(getBasePath()+File.separator + fileThumb);
		int w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbW"));
		int h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbH"));
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileResized = fileIn.getParent() + File.separator + prefix + fileIn.getName();
		Thumbnails.of(fileIn).size(w, h).outputFormat("jpeg").toFile(fileResized);
		return prefix + fileIn.getName();
	}
	
	public static void deleteImageThumb(String nomeFile)
	{
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileToDelete=getBasePath()+File.separator+prefix+nomeFile;
		File file=new File(fileToDelete);
		file.delete();
	}

	public static String resizeAndCopyImage(InputStream fileIS, String basePathToCopy, String nomeFile)
			throws IOException {

		int w, h = 0;

		w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageW"));
		h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageH"));

		// fileIn.delete();

		String fileResized = getBasePath() + File.separator + nomeFile;

		Thumbnails.of(fileIS).size(w, h).outputFormat("jpeg").toFile(fileResized);

		return nomeFile;
	}
	
	public static void deleteImages(List<String> images)
	{
		String fileDelete=null;
		for (String img:images)
		{
			fileDelete = getBasePath() + File.separator + img;
			File file=new File(fileDelete);
			file.delete();
		}
	}
	
	private static String getBasePath()
	{
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String path=extContext.getRealPath(BASE_IMG_PATH);
		return path;
	}

}
