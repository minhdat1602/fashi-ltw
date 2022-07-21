package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IPromotionDAO;
import com.ecommerce.mapper.PromotionMapper;
import com.ecommerce.model.Promotion;

public class PromotionDAO extends AbstractDAO<Promotion> implements IPromotionDAO{

	@Override
	public List<Promotion> findAll() {
		String sql = "select * from promotions";
		return query(sql, new PromotionMapper());
	}

	@Override
	public Promotion findOneById(Integer id) {
		String sql = "select * from promotions where id = ?";
		return query(sql, new PromotionMapper(), id).get(0);
	}

	@Override
	public void delete(int id, Integer promotionId) {
		String sql= "delete from promotion_product where product_id = ? and promotion_id = ?";
		deleted(sql, id, promotionId);
	}

	@Override
	public Integer save(int i, Integer id) {
		String sql = "insert into promotion_product (product_id, promotion_id) values (?,?)";
		return insert(sql, i,id);
	}

	@Override
	public Integer save(Promotion promotion) {
		String sql = "insert into promotions (code,name,image_url,descriptions,value,date_begin,date_end,header) values (?,?,?,?,?,?,?,?)";
		return insert(sql, 
						promotion.getCode(),
						promotion.getName(),
						promotion.getImageUrl(),
						promotion.getDescriptions(),
						promotion.getValue(),
						promotion.getDateBegin(),
						promotion.getDateEnd(),
						promotion.getHeader()
						);
	}

	@Override
	public boolean update(Promotion promotion) {
		String sql = "update promotions set code=?,name=?,image_url=?,descriptions=?,value=?,date_begin=?,date_end=?,header=? where id =?";
		return updated(sql, 
						promotion.getCode(),
						promotion.getName(),
						promotion.getImageUrl(),
						promotion.getDescriptions(),
						promotion.getValue(),
						promotion.getDateBegin(),
						promotion.getDateEnd(),
						promotion.getHeader(),
						promotion.getId()
						);

	}

}
