package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IImageDAO;
import com.ecommerce.model.Images;
import com.ecommerce.service.IImageService;

public class ImageService implements IImageService{
	@Inject
	private IImageDAO imageDAO;
	@Override
	public List<Images> findAllByProductId(Integer productId) {
		return imageDAO.findAllByProductId(productId);
	}
	@Override
	public Integer save(String url) {
		return imageDAO.save(url);
	}
	@Override
	public void delete(Integer id) {
		imageDAO.delete(id);
	}

}
