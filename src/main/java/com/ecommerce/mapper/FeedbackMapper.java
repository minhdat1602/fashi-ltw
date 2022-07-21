package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Feedback;

public class FeedbackMapper implements RowMapper<Feedback>{

	@Override
	public Feedback mapRow(ResultSet resultSet) {
		Feedback feedback = new Feedback();
		try {
			feedback.setId(resultSet.getInt("id"));
			feedback.setContent(resultSet.getString("content"));
			feedback.setProblem(resultSet.getString("problem"));
			feedback.setUserId(resultSet.getInt("user_id"));
			return feedback;
		} catch (SQLException e) {
			return null;
		}
		
	}
	
}
