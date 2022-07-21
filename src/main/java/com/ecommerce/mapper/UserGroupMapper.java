package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.UserGroup;

public class UserGroupMapper implements RowMapper<UserGroup>{

	@Override
	public UserGroup mapRow(ResultSet resultSet) {
		UserGroup group = new UserGroup();
		try {
			group.setId(resultSet.getInt("id"));
			group.setName(resultSet.getString("name"));
			group.setCode(resultSet.getString("code"));
			return group;
		} catch (SQLException e) {
			return null;
		}
	}
}
