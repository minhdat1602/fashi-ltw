package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IOrderDetailsDAO;
import com.ecommerce.mapper.OrderDetailsMapper;
import com.ecommerce.model.OrderDetails;

public class OrderDetailsDAO extends AbstractDAO<OrderDetails> implements IOrderDetailsDAO{

	@Override
	public List<OrderDetails> findAllOrderDetail(Integer id) {
		String sql = "select * from orders_detail where order_id = ?";
		return query(sql, new OrderDetailsMapper(), id);
	}

	@Override
	public Integer getBuyTimesByProductGroupId(Integer id, String filter) {
		StringBuilder sql  = new StringBuilder("select count(od.quantity) from orders_detail od join stocks on od.stock_id = stocks.id join products p on p.id = stocks.product_id join orders o on o.id = od.order_id where p.group_id = ? ");
		if (filter.equalsIgnoreCase("CURRENT_DATE")) {
			sql.append(" and o.date_sell = ");
		} else if (filter.equalsIgnoreCase("WEEK(CURRENT_DATE())")) {
			sql.append(" and WEEK(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("MONTH(CURRENT_DATE())")) {
			sql.append(" and MONTH(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("YEAR(CURRENT_DATE())")) {
			sql.append(" and YEAR(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("ALLTIME")) {
			return count(sql.toString(),id);
		}
		sql.append(filter);
		return count(sql.toString(), id, filter);
	}

	@Override
	public Integer getSalesByProductGroupId(Integer id, String filter) {
		StringBuilder sql = new StringBuilder("select  sum(od.price*od.quantity - od.discount*od.quantity) from orders_detail od join stocks on od.stock_id = stocks.id join products p on p.id = stocks.product_id join orders o on o.id = od.order_id where p.group_id = ? ");
		if (filter.equalsIgnoreCase("CURRENT_DATE")) {
			sql.append(" and o.date_sell = ");
		} else if (filter.equalsIgnoreCase("WEEK(CURRENT_DATE())")) {
			sql.append(" and WEEK(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("MONTH(CURRENT_DATE())")) {
			sql.append(" and MONTH(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("YEAR(CURRENT_DATE())")) {
			sql.append(" and YEAR(o.date_sell) = ");
		} else if (filter.equalsIgnoreCase("ALLTIME")) {
			return count(sql.toString(),id);
		}
		sql.append(filter);
		return count(sql.toString(), id, filter);
	}
	@Override
	public OrderDetails findById(Integer id) {
		String sql = "select * from orders_detail where id = ?";
		List<OrderDetails> list = query(sql, new OrderDetailsMapper(),id);
		return list.size() == 0 ? null : list.get(0);
	}
	@Override
	public Integer insert(OrderDetails orderDetails) {
		String sql = "insert into orders_detail (order_id, price, discount,quantity,stock_id) " +
				"values (?,?,?,?,?)";
		return insert(sql, orderDetails.getOrderId(), orderDetails.getPrice(), orderDetails.getDiscount(),
				orderDetails.getQuantity(),orderDetails.getStockId());
	}
}
