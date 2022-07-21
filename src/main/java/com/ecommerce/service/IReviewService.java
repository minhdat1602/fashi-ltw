package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Review;

public interface IReviewService {
	List<Review> findAll();

	List<Review> findAllByProductId(Integer id);

	Double avgStarByProductId(Integer id);

	boolean update(Review review);

	Integer save(Review review);
}
