package com.ecommerce.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.model.User;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet resultSet) {
		User user = new User();
		try {
			user.setId(resultSet.getInt("id"));
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));
			user.setFirstName(resultSet.getString("fname"));
			user.setLastName(resultSet.getString("lname"));
			user.setEmail(resultSet.getString("email"));
			user.setPhone(resultSet.getInt("phone"));
			user.setGender(resultSet.getString("gender"));
			user.setBirthday(resultSet.getDate("birthday"));
			user.setAddress(resultSet.getString("address"));
			user.setStatus(resultSet.getInt("status"));
			user.setGroupId(resultSet.getInt("group_id"));
			user.setDateRegister(resultSet.getDate("date_register"));
			//admin (code's dat)
		} catch (SQLException e) {
			return null;
		}
		return user;
	}

}
