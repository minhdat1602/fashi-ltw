package com.ecommerce.utils;

import java.util.ArrayList;
import java.util.List;

public class PriceUtils {
	public static String convert(Integer value) {
		String price = Integer.toString(value);
		int numberDot = 0;
		int step = 0;
		int length = price.length();
		for (int i = price.length() - 1; i >= 0; i--) {
			if (step!=0 && step%3==0) {
				price = price.substring(0, length-step-numberDot) + "." 
						+ price.substring(length-step-numberDot, length);
				length++;
				numberDot++;
			}
			step++;
		}
		return price;
	}
}
