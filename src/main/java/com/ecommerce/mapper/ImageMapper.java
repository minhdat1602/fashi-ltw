package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Images;

public class ImageMapper implements RowMapper<Images>{

	@Override
	public Images mapRow(ResultSet resultSet) {
		Images images = new Images();
		try {
			images.setId(resultSet.getInt("id"));
			images.setImageUrl(resultSet.getString("image_url"));
		} catch (SQLException e) {
			return null;
		}
		return images;
	}

}
