package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.Permission;

public class PermissionMapper implements RowMapper<Permission>{

	@Override
	public Permission mapRow(ResultSet resultSet) {
		Permission permission = new Permission();
		try {
			permission.setId(resultSet.getInt("id"));
			permission.setName(resultSet.getString("name"));
			permission.setAction(resultSet.getString("action"));
			return permission;
		} catch (SQLException e) {
			return null;
		}
	
	}

}
