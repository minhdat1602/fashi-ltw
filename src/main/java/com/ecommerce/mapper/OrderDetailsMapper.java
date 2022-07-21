package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.OrderDetails;

public class OrderDetailsMapper implements RowMapper<OrderDetails>{

	@Override
	public OrderDetails mapRow(ResultSet resultSet) {
		OrderDetails details = new OrderDetails();
		try {
			details.setId(resultSet.getInt("id"));
			details.setOrderId(resultSet.getInt("order_id"));
			details.setPrice(resultSet.getInt("price"));
			details.setDiscount(resultSet.getInt("discount"));
			details.setQuantity(resultSet.getInt("quantity"));
			details.setStockId(resultSet.getInt("stock_id"));
		} catch (SQLException e) {
			return null;
		}
		return details;
	}

}
