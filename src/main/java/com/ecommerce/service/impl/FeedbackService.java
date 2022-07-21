package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IFeedbackDAO;
import com.ecommerce.model.Feedback;
import com.ecommerce.service.IFeedbackService;

public class FeedbackService implements IFeedbackService{
	@Inject
	private IFeedbackDAO feedbackDAO;
	@Override
	public List<Feedback> findAll() {
		return feedbackDAO.findAll();
	}
	@Override
	public void insert(Feedback feedback) {
		feedbackDAO.insert(feedback);
	}
}
