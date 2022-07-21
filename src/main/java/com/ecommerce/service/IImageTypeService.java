package com.ecommerce.service;

public interface IImageTypeService {

	void deleteAllByProductId(Integer id);

	Integer save(Integer imageId, Integer productId);

}
