package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Feedback;

public interface IFeedbackDAO extends IGenericDAO<Feedback>{
	List<Feedback> findAll();
	void insert(Feedback feedback);
}
