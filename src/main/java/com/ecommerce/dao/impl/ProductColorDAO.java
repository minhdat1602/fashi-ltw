package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IProductColorDAO;
import com.ecommerce.mapper.ProductColorMapper;
import com.ecommerce.model.ProductColor;

public class ProductColorDAO extends AbstractDAO<ProductColor> implements IProductColorDAO{

	@Override
	public List<ProductColor> findAll() {
		String sql = "select * from products_color";
		return query(sql, new ProductColorMapper());
	}

	@Override
	public ProductColor findOne(Integer id) {
		String sql = "select * from products_color where id = ?";
		List<ProductColor> list = query(sql, new ProductColorMapper(), id);
		return list.size() == 0 ? null : list.get(0);
	}

}
