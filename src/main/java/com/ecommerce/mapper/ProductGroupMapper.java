package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.ProductGroup;

public class ProductGroupMapper implements RowMapper<ProductGroup>{

	@Override
	public ProductGroup mapRow(ResultSet resultSet) {
		ProductGroup productGroup = new ProductGroup();
		try {
			productGroup.setId(resultSet.getInt("id"));
			productGroup.setLevel(resultSet.getInt("level"));
			productGroup.setName(resultSet.getString("name"));
			productGroup.setCode(resultSet.getString("code"));
			productGroup.setParentId(resultSet.getInt("parent_id"));
		} catch (SQLException e) {
			return null;
		}
		return productGroup;
	}
	
}
