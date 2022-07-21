package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Images;

public interface IImageDAO extends IGenericDAO<Images>{
	List<Images> findAllByProductId(Integer productId);

	Integer save(String url);

	void delete(Integer id);
}
