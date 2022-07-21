package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Collection;

public class CollectionMapper implements RowMapper<Collection>{

	@Override
	public Collection mapRow(ResultSet resultSet) {
		Collection collection = new Collection();
		try {
			collection.setId(resultSet.getInt("id"));
			collection.setCode(resultSet.getString("code"));
			collection.setName(resultSet.getString("name"));
			collection.setImageUrl(resultSet.getString("image_url"));
			collection.setDescription(resultSet.getString("descriptions"));
		} catch (SQLException e) {
			return null;
		}
		return collection;
	}
	
}
