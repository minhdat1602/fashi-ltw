package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IProductColorDAO;
import com.ecommerce.model.ProductColor;
import com.ecommerce.service.IProductColorService;

public class ProductColorService implements IProductColorService{
	@Inject
	private IProductColorDAO productColorDAO;
	
	@Override
	public List<ProductColor> findAll() {
		return productColorDAO.findAll();
	}

	@Override
	public ProductColor findOne(Integer id) {
		return productColorDAO.findOne(id);
	}

}
