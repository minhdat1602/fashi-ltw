package com.ecommerce.dao.impl;

import java.util.List;

import com.ecommerce.dao.IPermissionDAO;
import com.ecommerce.mapper.PermissionMapper;
import com.ecommerce.model.Permission;

public class PermissionDAO extends AbstractDAO<Permission> implements IPermissionDAO {

	@Override
	public List<Permission> findAllByGroupCode(String sorting) {
		String sql = "select DISTINCT p.* from users u join users_group ug on u.group_id = ug.id join user_group_permission ugp on ugp.user_group_id = ug.id join permissions p on p.id =ugp.permission_id where ug.code = ?";
		return query(sql, new PermissionMapper(),sorting);
	}

	@Override
	public List<Permission> findAllByUserId(Integer id) {
		String sql = "select p.* from users u join users_group ug on u.group_id = ug.id join user_group_permission ugp on ugp.user_group_id = ug.id join permissions p on p.id =ugp.permission_id where u.id = ?";
		return query(sql, new PermissionMapper(), id);
	}

}
