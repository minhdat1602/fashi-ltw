package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IOrderDetailsDAO;
import com.ecommerce.dao.IProductColorDAO;
import com.ecommerce.dao.IProductDAO;
import com.ecommerce.dao.IProductSizeDAO;
import com.ecommerce.dao.IStockDAO;
import com.ecommerce.model.OrderDetails;
import com.ecommerce.service.IOrderDetailsService;
import com.ecommerce.service.IOrderService;

public class OrderDetailsService implements IOrderDetailsService{
	@Inject
	private IOrderDetailsDAO odDAO;
	@Inject
	private IProductColorDAO colorDAO;
	@Inject
	private IProductSizeDAO sizeDAO;
	@Inject
	private IProductDAO productDAO;
	@Inject
	private IStockDAO stockDAO;
	
	@Override
	public List<OrderDetails> findAllOrderDetail(Integer id) {
		List<OrderDetails> result = odDAO.findAllOrderDetail(id);
		for (OrderDetails orderDetails : result) {
			orderDetails.setColor((colorDAO.findOne((stockDAO.findOne(orderDetails.getStockId())).getColorId())).getName());
			orderDetails.setSize((sizeDAO.findOne((stockDAO.findOne(orderDetails.getStockId())).getSizeId())).getName());
			orderDetails.setProduct((productDAO.findOne((stockDAO.findOne(orderDetails.getStockId())).getProductId())).getName());
			orderDetails.setTotalPrice(orderDetails.getPrice() * orderDetails.getQuantity() - orderDetails.getDiscount() * orderDetails.getQuantity());
		}
		return result;
	}
	@Override
	public OrderDetails insert(OrderDetails orderDetails) {
		Integer id = odDAO.insert(orderDetails);
		return odDAO.findById(id);
	}
}
