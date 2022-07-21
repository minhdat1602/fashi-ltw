package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IOrderDAO;
import com.ecommerce.mapper.OrderDetailsMapper;
import com.ecommerce.mapper.OrderMapper;
import com.ecommerce.model.Order;
import com.ecommerce.model.OrderDetails;

public class OrderDAO extends AbstractDAO<Order> implements IOrderDAO{

	@Override
	public List<Order> findAll() {
		String sql = "select * from orders";
		return query(sql, new OrderMapper());
	}

	@Override
	public Order findOne(Integer id) {
		String sql = "select * from orders where id = ?";
		List<Order> list = query(sql, new OrderMapper(), id);
		return list.size() == 0 ? null : list.get(0);
	}

	@Override
	public Integer getTotalOrder() {
		String sql = "select count(id) from orders";
		return count(sql);
	}

	@Override
	public List<Order> findAll(Order pageable) {
		String sql = "select * from orders  order by "+ pageable.getSorting() + " " + pageable.getSortBy() +" limit ?,? ";
		return query(sql, new OrderMapper(), pageable.getOffset(), pageable.getMaxPageItem());
	}

	@Override
	public Order findOne(String code) {
		String sql = "select * from orders where code = ?";
		List<Order> list = query(sql, new OrderMapper(), code);
		return (list.size() > 0) ? list.get(0) : null;
	}

	@Override
	public List<Order> findAllByUserId(Integer id) {
		String sql = "select * from orders where user_id = ?";
		return query(sql, new OrderMapper(), id);
	}
	@Override
	public Integer insert(Order order) {
		String sql = "insert into orders (code, total_sell_price,total_discount,total_money,status," +
				"coupon,user_id,date_sell) values (?,?,?,?,?,?,?,?)";
		return insert(sql,order.getCode(),order.getTotalSellPrice(),order.getTotalDiscount(),
				order.getTotalSellPrice(), order.getStatus(), order.getCouponId(), order.getUserId()
				,order.getDateSell());
	}
	@Override
	public void update(Order order) {
		String sql = "update orders set status = ? where id = ?";
		update(sql, order.getStatus(), order.getId());
	}
}
