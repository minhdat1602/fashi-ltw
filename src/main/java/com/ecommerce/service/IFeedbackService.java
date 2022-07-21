package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Feedback;

public interface IFeedbackService {
	List<Feedback> findAll();
	void insert(Feedback feedback);
}
