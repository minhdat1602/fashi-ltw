package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Stock;

public interface IStockDAO extends IGenericDAO<Stock>{

     Stock findOne(Integer id);
     Stock findOne(Integer size, Integer color, Integer productId);
	List<Stock> findAllByProductId(Integer id);
	boolean update(Stock stock);
	Integer save(Stock stock);

}
