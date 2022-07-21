package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.OrderDetails;

public interface IOrderDetailsDAO extends IGenericDAO<OrderDetails>{

	List<OrderDetails> findAllOrderDetail(Integer id);

	Integer getBuyTimesByProductGroupId(Integer id,String filter);

	Integer getSalesByProductGroupId(Integer id,String filter);
	OrderDetails findById(Integer id);
	Integer insert(OrderDetails orderDetails);
}
