package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IProductSizeDAO;
import com.ecommerce.model.ProductSize;
import com.ecommerce.service.IProductSizeService;

public class ProductSizeService implements IProductSizeService{

	@Inject
	private IProductSizeDAO productSizeDAO;
	@Override
	public List<ProductSize> findAll() {
		return productSizeDAO.findAll();
	}

	@Override
	public ProductSize findOne(Integer id) {
		return productSizeDAO.findOne(id);
	}

}
