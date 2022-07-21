package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IUserGroupDAO;
import com.ecommerce.mapper.UserGroupMapper;
import com.ecommerce.model.UserGroup;

public class UserGroupDAO extends AbstractDAO<UserGroup> implements IUserGroupDAO{

	@Override
	public List<UserGroup> findAll() {
		String sql = "select * from users_group";
		return query(sql, new UserGroupMapper());
	}

	@Override
	public UserGroup getNameByUserId(Integer id) {
		String sql = "select ug.* from users_group ug join users u on ug.id = u.group_id where u.id = ?";
		return query(sql, new UserGroupMapper(),id).get(0);
	}

}
