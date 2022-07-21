package com.ecommerce.service.impl;

import javax.inject.Inject;

import com.ecommerce.dao.IImageTypeDAO;
import com.ecommerce.service.IImageTypeService;

public class ImageTypeService implements IImageTypeService{
	@Inject
	private IImageTypeDAO imageTypeDAO;

	@Override
	public void deleteAllByProductId(Integer id) {
		imageTypeDAO.deleteAllByProductId(id);
	}

	@Override
	public Integer save(Integer imageId, Integer productId) {
		return imageTypeDAO.save(imageId,productId);
	}

}
