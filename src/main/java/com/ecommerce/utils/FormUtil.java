package com.ecommerce.utils;


import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil {
	public static <T> T toModel(Class<T> tclass, HttpServletRequest request) {
		T object = null;
		try {
			object = tclass.newInstance();
			BeanUtils.populate(object, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException | InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}
}
