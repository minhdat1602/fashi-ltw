package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.ProductBrand;

public interface IProductBrandDAO extends IGenericDAO<ProductBrand>{
	List<ProductBrand> findAll();
}
