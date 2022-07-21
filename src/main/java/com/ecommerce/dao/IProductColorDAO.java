package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.ProductColor;

public interface IProductColorDAO extends IGenericDAO<ProductColor>{
	List<ProductColor> findAll();

    ProductColor findOne(Integer id);
}
