package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Review;

public class ReviewMapper implements RowMapper<Review>{

	@Override
	public Review mapRow(ResultSet resultSet) {
		Review review = new Review();
		try {
			review.setId(resultSet.getInt("id"));
			review.setCommentator(resultSet.getInt("commentator"));
			review.setProductId(resultSet.getInt("product_id"));
			review.setVote(resultSet.getInt("vote"));
			review.setComment(resultSet.getString("comment"));
			review.setDateReview(resultSet.getDate("date_review"));
			review.setReply(resultSet.getString("reply"));
			return review;
		} catch (SQLException e) {
			return null;
		}
	}
}
