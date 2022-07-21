package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IImageDAO;
import com.ecommerce.mapper.ImageMapper;
import com.ecommerce.model.Images;

public class ImageDAO extends AbstractDAO<Images> implements IImageDAO{

/*	//cai nay cua thg ngu LONG
	@Override
	public List<Images> findAllByProductId(Integer productId) {
		StringBuilder sql = new StringBuilder("select i.id,i.image_url ");
									sql.append("from images i join images_type it ");
													sql.append("on i.id = it.image_id ");
													sql.append("join products p ");
													sql.append("on p.id = it.data_id ");
									sql.append("where it.type = 1 and p.id = ?");
		return query(sql.toString(), new ImageMapper(), productId);
	}*/

	@Override
	public Integer save(String url) {
		String sql = "insert into images (image_url) values(?)";
		return insert(sql, url);
	}

	@Override
	public void delete(Integer id) {
		String sql = "delete from images where id = ?";
		deleted(sql, id);
	}

	//cai nay cua thang dep trai dat
	@Override
	public List<Images> findAllByProductId(Integer productId) {
		String sql = "select i.* from images i join images_type it on i.id = it.image_id where data_id = ?";
		return query(sql, new ImageMapper(), productId);
	}
	
}
