package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IOrderDetailsDAO;
import com.ecommerce.dao.IProductGroupDAO;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;

public class ProductGroupService implements IProductGroupService{
	@Inject
	private IProductGroupDAO productGroupDAO;
	@Inject
	private IOrderDetailsDAO orderDetailDAO;
	
	@Override
	public List<ProductGroup> findAll(Integer... level) {
		return productGroupDAO.findAll(level);
	}

	@Override
	public List<ProductGroup> findAll(Integer level, String segment) {
		return productGroupDAO.findAll(level, segment);
	}

	@Override
	public ProductGroup findOneById(Integer groupId) {
		return productGroupDAO.findOneById(groupId);
	}

	@Override
	public List<ProductGroup> findByParentId(Integer parentId) {
		return productGroupDAO.findByParentId(parentId);
	}

	@Override
	public Integer save(ProductGroup group) {
		return productGroupDAO.save(group);
	}

	@Override
	public boolean update(ProductGroup group) {
		return productGroupDAO.update(group);
	}
	
	@Override
	public void setSales(List<ProductGroup> listProductGroup, String filter) {
		Integer totalSale = 0;
		for (ProductGroup productGroup : listProductGroup) {
			productGroup.setBuyTimes(orderDetailDAO.getBuyTimesByProductGroupId(productGroup.getId(),filter));
			int sales = orderDetailDAO.getSalesByProductGroupId(productGroup.getId(),filter);
			productGroup.setSales(sales);
			totalSale += sales;
			
		}
		for (ProductGroup productGroup : listProductGroup) {
			productGroup.setPercentSales((double) ((productGroup.getSales()*100/totalSale)));
		}
	}
}
