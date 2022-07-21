package com.ecommerce.utils;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HTTPUtil {
	private String value;
	
	private HTTPUtil(String value) {
		this.value = value;
	}
	
	public <T> T toModel(Class<T> tclass) {
		try {
			return new ObjectMapper().readValue(value, tclass);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public static HTTPUtil of (BufferedReader reader) {
		StringBuilder builder = new StringBuilder();
		String line;
		try {
			while((line = reader.readLine()) != null) {
				builder.append(line);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return new HTTPUtil(builder.toString());
	}
}
