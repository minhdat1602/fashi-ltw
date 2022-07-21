package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IProductBrandDAO;
import com.ecommerce.model.ProductBrand;
import com.ecommerce.service.IProductBrandService;

public class ProductBrandService implements IProductBrandService{
	@Inject
	private IProductBrandDAO productBrandDAO;
	
	@Override
	public List<ProductBrand> findAll() {
		return productBrandDAO.findAll();
	}
	
}
