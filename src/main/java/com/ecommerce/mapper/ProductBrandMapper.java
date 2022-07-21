package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.ProductBrand;

public class ProductBrandMapper implements RowMapper<ProductBrand>{

	@Override
	public ProductBrand mapRow(ResultSet resultSet) {
		ProductBrand brand = new ProductBrand();
		try {
			brand.setId(resultSet.getInt("id"));
			brand.setName(resultSet.getString("name"));
			brand.setCode(resultSet.getString("code"));
		} catch (SQLException e) {
			return null;
		}
		return brand;
	}
		
}
