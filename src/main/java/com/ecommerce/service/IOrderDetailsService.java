package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.OrderDetails;

public interface IOrderDetailsService {

	List<OrderDetails> findAllOrderDetail(Integer id);
	OrderDetails insert(OrderDetails orderDetails);
}
