package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Order;

public class OrderMapper implements RowMapper<Order>{

	@Override
	public Order mapRow(ResultSet resultSet) {
		Order order = new Order();
		try {
			order.setId(resultSet.getInt("id"));
			order.setCode(resultSet.getString("code"));
			order.setTotalSellPrice(resultSet.getInt("total_sell_price"));
			order.setTotalDiscount(resultSet.getInt("total_discount"));
			order.setTotalMoney(resultSet.getInt("total_money"));
			order.setStatus(resultSet.getString("status"));
			order.setCouponId(resultSet.getInt("coupon"));
			order.setUserId(resultSet.getInt("user_id"));
			order.setDateSell(resultSet.getDate("date_sell"));
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}
		
	}

}
