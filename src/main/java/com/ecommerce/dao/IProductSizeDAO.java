package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.ProductSize;

public interface IProductSizeDAO {
	List<ProductSize> findAll();

	ProductSize findOne(Integer id);
}
