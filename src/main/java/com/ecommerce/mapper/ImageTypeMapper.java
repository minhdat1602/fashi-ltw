package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.ImagesType;

public class ImageTypeMapper implements RowMapper<ImagesType>{

	@Override
	public ImagesType mapRow(ResultSet resultSet) {
		ImagesType imagesType = new ImagesType();
		try {
			imagesType.setId(resultSet.getInt("id"));
			imagesType.setDataId(resultSet.getInt("data_id"));
			imagesType.setType(resultSet.getInt("type"));
			imagesType.setImageId(resultSet.getInt("image_id"));
			return imagesType;
		} catch (SQLException e) {
			return null;
		}
		
	}
	
}
