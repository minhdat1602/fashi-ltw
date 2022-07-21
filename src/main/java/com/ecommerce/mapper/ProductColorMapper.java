package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.ProductColor;

public class ProductColorMapper implements RowMapper<ProductColor>{

	@Override
	public ProductColor mapRow(ResultSet resultSet) {
		ProductColor color = new ProductColor();
		try {
			color.setId(resultSet.getInt("id"));
			color.setName(resultSet.getString("name"));
			color.setCode(resultSet.getString("code"));
		} catch (SQLException e) {
			return null;
		}
		return color;
	}

}
