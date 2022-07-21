package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.ProductColor;

public interface IProductColorService {
	List<ProductColor> findAll();

    ProductColor findOne(Integer id);
}
