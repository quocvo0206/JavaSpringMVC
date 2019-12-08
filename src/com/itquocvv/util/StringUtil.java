package com.itquocvv.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringUtil {

	public static String md5(String str) {
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());

			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String getText(String str, int totalChar) {
		if (totalChar > str.length()) {
			return str;
		}
		String result = "";
		try {
			int endIndex = str.lastIndexOf(" ", totalChar);
			result = str.substring(0, endIndex);
		} catch (Exception e) {
			System.out.println("Lỗi xử lí rút gọn text");
		}
		return result + " ...";
	}

}
