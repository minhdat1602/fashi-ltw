package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IPromotionDAO;
import com.ecommerce.model.Promotion;
import com.ecommerce.service.IPromotionService;

public class PromotionService implements IPromotionService{
	@Inject
	private IPromotionDAO promotionDAO;
	
	@Override
	public List<Promotion> findAll() {
		return promotionDAO.findAll();
	}

	@Override
	public Promotion findOneById(Integer id) {
		return promotionDAO.findOneById(id);
	}

	@Override
	public void delete(int[] ids, Integer promotionId) {
		for (int id : ids) {
			promotionDAO.delete(id,promotionId);
		}
	}

	@Override
	public void save(int[] ids, Integer id) {
		for (int i : ids) {
			promotionDAO.save(i,id);
		}
	}

	@Override
	public Integer save(Promotion promotion) {
		return promotionDAO.save(promotion);
	}

	@Override
	public boolean update(Promotion promotion) {
		return promotionDAO.update(promotion);
	}
		
}
