package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Promotion;

public class PromotionMapper implements RowMapper<Promotion>{

	@Override
	public Promotion mapRow(ResultSet resultSet) {
		Promotion promotion = new Promotion();
		try {
			promotion.setId(resultSet.getInt("id"));
			promotion.setCode(resultSet.getString("code"));
			promotion.setName(resultSet.getString("name"));
			promotion.setHeader(resultSet.getString("header"));
			promotion.setDescriptions(resultSet.getString("descriptions"));
			promotion.setImageUrl(resultSet.getString("image_url"));
			promotion.setValue(resultSet.getInt("value"));
			promotion.setDateBegin(resultSet.getDate("date_begin"));
			promotion.setDateEnd(resultSet.getDate("date_end"));
		} catch (SQLException e) {
			return null;
		}
		
		return promotion;
	}
	
}
