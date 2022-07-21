package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.ProductSize;

public interface IProductSizeService {
	List<ProductSize> findAll();

    ProductSize findOne(Integer id);
}
