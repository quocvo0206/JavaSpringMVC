package com.itquocvv.util;

import org.apache.commons.io.FilenameUtils;

public class FilenameUtil {
	public static String rename(String filename) {
		return FilenameUtils.getBaseName(filename) + "-" + System.nanoTime() + "." + FilenameUtils.getExtension(filename);
	}
}
