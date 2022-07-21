package com.ecommerce.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.inject.Inject;

import com.ecommerce.dao.IProductDAO;
import com.ecommerce.dao.IReviewDAO;
import com.ecommerce.model.Review;
import com.ecommerce.service.IReviewService;
import com.ecommerce.service.IUserService;

public class ReviewService implements IReviewService{
	@Inject 
	private IProductDAO productDAO;
	@Inject
	private IReviewDAO reviewDAO;
	@Inject
	private IUserService userService;
	@Override
	public List<Review> findAll() {
		List<Integer> listProductId = reviewDAO.findAllProductId();
		List<Review> listReview = new ArrayList<Review>();
		for (Integer productId : listProductId) {
			Review review = new Review();
			review.setProduct(productDAO.findOne(productId));
			review.setId(productId);
			review.setTotalComment(reviewDAO.countByProductId(productId));
			review.setAverageStar(reviewDAO.avgStar(productId));
			listReview.add(review);
		}
		return listReview;
	}
	@Override
	public List<Review> findAllByProductId(Integer id) {
		List<Review> listReview = reviewDAO.findAllByProductId(id);
		for (Review review : listReview) {
			review.setUser(userService.findOneById(review.getCommentator()));
		}
		return listReview;
		
	}
	@Override
	public Double avgStarByProductId(Integer id) {
		return reviewDAO.avgStar(id);
	}
	@Override
	public boolean update(Review review) {
		return reviewDAO.update(review);
	}
	@Override
	public Integer save(Review review) {
		return reviewDAO.save(review);
	}

	
}
