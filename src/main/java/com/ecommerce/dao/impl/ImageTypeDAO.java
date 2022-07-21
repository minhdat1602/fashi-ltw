package com.ecommerce.dao.impl;

import com.ecommerce.dao.IImageTypeDAO;
import com.ecommerce.model.ImagesType;

public class ImageTypeDAO extends AbstractDAO<ImagesType> implements IImageTypeDAO{

	@Override
	public void deleteAllByProductId(Integer id) {
		String sql = "delete from images_type where data_id = ?";
		deleted(sql, id);
	}

	@Override
	public Integer save(Integer imageId, Integer productId) {
		String sql = "insert into images_type (type, data_id, image_id) values (1,?,?)";
		return insert(sql, productId, imageId);
	}
	
}
