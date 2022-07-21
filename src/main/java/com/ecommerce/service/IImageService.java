package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Images;

public interface IImageService {
	List<Images> findAllByProductId(Integer productId);

	Integer save(String url);

	void delete(Integer id);
}
