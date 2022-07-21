package com.ecommerce.utils;

public class ImageUtil {
	public static String createLink(String link) {
		if (link.contains("id")) {
			return link;
		}
		String id = link.substring(link.lastIndexOf("/d/")+3, link.lastIndexOf("/view"));
		String result = "https://drive.google.com/uc?export=view&id=" + id;
		return result;
	}
}
