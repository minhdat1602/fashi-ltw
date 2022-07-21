package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;

public interface IProductGroupService {
	List<ProductGroup> findAll(Integer... level);
	List<ProductGroup> findAll(Integer level, String segment);

	ProductGroup findOneById(Integer groupId);

	List<ProductGroup> findByParentId(Integer parentId);
	Integer save(ProductGroup group);
	boolean update(ProductGroup group);
	void setSales(List<ProductGroup> listProductGroup, String filter);
}
