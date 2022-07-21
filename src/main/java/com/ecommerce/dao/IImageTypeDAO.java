package com.ecommerce.dao;

import com.ecommerce.model.ImagesType;

public interface IImageTypeDAO extends IGenericDAO<ImagesType>{

	void deleteAllByProductId(Integer id);

	Integer save(Integer imageId, Integer productId);

}
