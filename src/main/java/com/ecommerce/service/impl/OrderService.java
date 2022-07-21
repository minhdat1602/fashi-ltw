package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IOrderDAO;
import com.ecommerce.model.Order;
import com.ecommerce.model.OrderDetails;
import com.ecommerce.service.IOrderService;

public class OrderService implements IOrderService{
	@Inject
	private IOrderDAO orderDAO;
	
	@Override
	public List<Order> findAll() {
		return orderDAO.findAll();
	}

	@Override
	public Order findOne(Integer id) {
		return orderDAO.findOne(id);
	}

	@Override
	public Integer getTotalOrder() {
		return orderDAO.getTotalOrder();
	}

	@Override
	public List<Order> findAll(Order pageable) {
		return orderDAO.findAll(pageable);
	}

	@Override
	public Order findOne(String code) {
		return orderDAO.findOne(code);
	}

	@Override
	public List<Order> findAllByUserId(Integer id) {
		return orderDAO.findAllByUserId(id);
	}
	//this is cua dat
	@Override
	public Order insert(Order order) {
		Integer id = orderDAO.insert(order);
		return orderDAO.findOne(id);
	}
	@Override
	public Order update(Order order) {
		orderDAO.update(order);
		return order;
	}
}
