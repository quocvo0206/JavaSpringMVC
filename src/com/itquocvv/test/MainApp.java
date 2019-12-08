package com.itquocvv.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.springframework.util.ResourceUtils;

public class MainApp {
	public static void main(String[] args) {
		//readProperties();
		//readProperties2();
	}

	public static void readProperties() {
		//Đọc file properties từ thư mục classes trong WEB-INF
		Properties properties = new Properties();
		try {
			File file = ResourceUtils.getFile("classpath:config/jdbc.properties");
			InputStream in = new FileInputStream(file);
			properties.load(in);
			System.out.println(properties);

			System.out.println("-----------------------");
			@SuppressWarnings("unchecked")
			Enumeration<String> enums = (Enumeration<String>) properties.propertyNames();
			while (enums.hasMoreElements()) {
				String key = enums.nextElement();
				String value = properties.getProperty(key);
				System.out.println(key + " : " + value);
			}

			System.out.println("-------------------");
			Set<Entry<Object, Object>> entries = properties.entrySet();
			for (Entry<Object, Object> entry : entries) {
				System.out.println(entry.getKey() + " : " + entry.getValue());
			}

			System.out.println("-------------------");
			Set<String> keys = properties.stringPropertyNames();
			for (String key : keys) {
				System.out.println(key + " : " + properties.getProperty(key));
			}

			System.out.println("-------------------");
			properties.forEach((key, value) -> System.out.println(key + " : " + value));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void readProperties2() {
		//Đọc file properties từ thư mục classes trong WEB-INF
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		Properties properties = new Properties();
		try {
			properties.load(classLoader.getResourceAsStream("config/jdbc.properties"));
			System.out.println(properties);
			
			
			System.out.println("-------------------");
			properties.forEach((key, value) -> System.out.println(key + " : " + value));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void writeProperties() {
		Properties properties = new Properties();
		properties.setProperty("p1", "v1");
		properties.setProperty("p2", "v2");
		properties.setProperty("p3", "v3");
		properties.setProperty("p4", "v4");
	}
}
