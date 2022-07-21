package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IProductBrandDAO;
import com.ecommerce.mapper.ProductBrandMapper;
import com.ecommerce.mapper.RowMapper;
import com.ecommerce.model.ProductBrand;
import com.ecommerce.service.IProductBrandService;

public class ProductBrandDAO extends AbstractDAO<ProductBrand> implements IProductBrandDAO{

	@Override
	public List<ProductBrand> findAll() {
		String sql = "SELECT * FROM products_brand";
		return query(sql, new ProductBrandMapper());
	}
	
}
