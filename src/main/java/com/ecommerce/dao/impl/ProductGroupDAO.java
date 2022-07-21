package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IProductGroupDAO;
import com.ecommerce.mapper.ProductGroupMapper;
import com.ecommerce.mapper.ProductMapper;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;

public class ProductGroupDAO extends AbstractDAO<ProductGroup> implements IProductGroupDAO{

	@Override
	public List<ProductGroup> findAll(Integer... level) {
		StringBuilder sql = new StringBuilder("SELECT distinct name, id, code, parent_id, level FROM products_group where ");
									for (int i = 0; i < level.length; i++) {
										if (i != level.length-1) {
											sql.append("level = ? or ");
										} else sql.append("level = ? ");
									}
									sql.append("GROUP BY name");
		return query(sql.toString(), new ProductGroupMapper(), level);
	}


	@Override
	public List<ProductGroup> findAll(Integer level, String segment) {
		String sql = "select p" + level + ".* from products_group p" + level;

		for(int i = level; i > 1; i--){
			sql += " join products_group p" + (i-1) + " on p" + i + ".parent_id = p" + (i-1) + ".id";
		}
		sql += " where p1.code = ?";
		return query(sql, new ProductGroupMapper(), segment);
	}

	@Override
	public ProductGroup findOneById(Integer groupId) {
		String sql = "select * from products_group where id = ?";
		List<ProductGroup> list = query(sql, new ProductGroupMapper(), groupId);;
		return list.size() == 0 ? null : list.get(0);
	}

	@Override
	public List<ProductGroup> findByParentId(Integer parentId) {
		String sql = "select * from products_group where parent_id = ?";
		return query(sql, new ProductGroupMapper(), parentId);
	}

	@Override
	public Integer save(ProductGroup group) {
		String sql = "insert into products_group (name, code, parent_id, level) values (?,?,?,?)";
		return insert(sql, group.getName(),group.getCode(), group.getParentId(),group.getLevel());
	}

	@Override
	public boolean update(ProductGroup group) {
		String sql = "update products_group set code=?,name=?,parent_id=?,level=? where id = ?";
		return updated(sql, group.getCode(),group.getName(),group.getParentId(),group.getLevel(),group.getId());
	}
}
