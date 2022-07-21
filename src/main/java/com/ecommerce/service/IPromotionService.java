package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Promotion;

public interface IPromotionService {
	List<Promotion> findAll();
	Promotion findOneById(Integer id);
	void delete(int[] ids, Integer promotionId);
	void save(int[] ids, Integer id);
	Integer save(Promotion promotion);
	boolean update(Promotion promotion);
}
