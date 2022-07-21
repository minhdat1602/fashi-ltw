package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Order;
import com.ecommerce.model.OrderDetails;

public interface IOrderDAO extends IGenericDAO<Order>{
	List<Order> findAll();

	Order findOne(Integer id);

	Integer getTotalOrder();

	List<Order> findAll(Order pageable);

	Order findOne(String code);

	List<Order> findAllByUserId(Integer id);

	Integer insert(Order order);
	void update(Order order);

}
