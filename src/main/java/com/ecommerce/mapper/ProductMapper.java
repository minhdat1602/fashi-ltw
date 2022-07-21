package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Product;

public class ProductMapper implements RowMapper<Product>{

	@Override
	public Product mapRow(ResultSet resultSet) {
		Product product = new Product();
		try {
			product.setId(resultSet.getInt("id"));
			product.setCode(resultSet.getString("code"));
			product.setName(resultSet.getString("name"));
			product.setOriginPrice(resultSet.getInt("origin_price"));
			product.setSellPrice(resultSet.getInt("sell_price"));
			product.setGroupProduct(resultSet.getString("category"));
			product.setGroupId(resultSet.getInt("group_id"));
			product.setBrandId(resultSet.getInt("brand_id"));
			product.setBrandProduct(resultSet.getString("brand"));
			product.setCollectionProduct(resultSet.getString("collection"));
			product.setImageUrl(resultSet.getString("image_url"));
			product.setDescription(resultSet.getString("descriptions"));
			product.setStatus(resultSet.getInt("status"));
			product.setNewProduct(resultSet.getInt("new"));
			product.setHotProduct(resultSet.getInt("hot"));
		} catch (SQLException e) {
			return null;
		}
		return product;
	}
	
}
