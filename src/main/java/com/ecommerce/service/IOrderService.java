package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Order;
import com.ecommerce.model.OrderDetails;

public interface IOrderService {
	List<Order> findAll();

	Order findOne(Integer id);

	Integer getTotalOrder();
	List<Order> findAll(Order pageable);

	Order findOne(String code);

	List<Order> findAllByUserId(Integer id);

	Order insert(Order order);
	Order update(Order order);
}
