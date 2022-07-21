package com.ecommerce.dao.impl;

import com.ecommerce.dao.IUserDAO;
import com.ecommerce.mapper.UserMapper;
import com.ecommerce.model.User;

import java.util.List;

public class UserDAO extends AbstractDAO<User> implements IUserDAO{
	
	@Override
	public boolean exist(String username) {
		String sql = "select * from users where username = ?";
		if (query(sql, new UserMapper(), username).size()>0)return true;
		else return false;
	}

	public boolean update(User user){
		StringBuilder sql = new StringBuilder();
		sql.append("update users set ");
		sql.append("password = ?,");
		sql.append("fname = ?,");
		sql.append("lname = ?,");
		sql.append("email = ?,");
		sql.append("phone = ?,");
		sql.append("gender = ?,");
		sql.append("birthday = ?,");
		sql.append("address = ?,");
		sql.append("status = ?,");
		sql.append("group_id = ?");
		sql.append(" where id = ?");
		return updated(sql.toString(),user.getPassword() ,user.getFirstName(), user.getLastName(), user.getEmail(),
				user.getPhone(), user.getGender(), user.getBirthday(), user.getAddress(), user.getStatus(),
				user.getGroupId(), user.getId());
	}

	/*@Override
	public Integer insert(User user) {
		StringBuilder sql = new StringBuilder("insert into users (password, email, phone, gender,birthday,address,status,group_id,date_register,fullname) ");
		sql.append("value (?,?,?,?,?,?,?,?,?,?) ");
		return insert(sql.toString(),
				user.getPassword(),
				user.getEmail(),
				user.getPhone(),
				user.getGender(),
				user.getBirth(),
				user.getAddress(),
				user.getStatus(),
				user.getGroupId(),
				user.getFullname());
	}*/
/*	@Override
	public Integer insert(User user) {
		StringBuilder sql = new StringBuilder("insert into users " +
				"(fname,lname,username, password, email,status,group_id, gender,phone,address,birthday) ");
		sql.append("value (?,?,?,?,?,?,?,?,?,?,?) ");
		return insert(sql.toString(),
				user.getFirstName(),
				user.getLastName(),
				user.getUsername(),
				user.getPassword(),
				user.getEmail(),
				user.getStatus(),
				user.getGroupId(),
				user.getGender(),
				user.getPhone(),
				user.getAddress(),
				user.getAddress(),
				user.getBirthday());
	}*/

	//cua thang dat sua
	@Override
	public Integer insert(User user) {
		StringBuilder sql = new StringBuilder("insert into users " +
				"(fname,lname,username, password, email,status,group_id,date_register) ");
		sql.append("value (?,?,?,?,?,?,?,?) ");
		return insert(sql.toString(),
				user.getFirstName(),
				user.getLastName(),
				user.getUsername(),
				user.getPassword(),
				user.getEmail(),
				user.getStatus(),
				user.getGroupId(),
				user.getDateRegister());
	}


	@Override
	public User findOneById(Integer id) {
		String sql = "select * from users where id = ?";
		return query(sql, new UserMapper(), id).get(0);
	}
	
	@Override
	public User getUser(String username){
		String sql = "select * from users where username = ?";
		List<User> list = query(sql, new UserMapper(), username);
		return list.size() == 0 ? null : list.get(0);
	}

	@Override
	public User findOneByEmail(String email) {
		String sql = "select * from users where email = ?";
		List<User> list = query(sql, new UserMapper(), email);
		return list.size() == 0 ? null :list.get(0);
	}

	@Override
	public List<User> findAll(User pageable) {
		String sql;
		if (pageable.getGroupId()!=null) {
			sql = "select * from users where status = 1 and group_id = ? limit ?,?";
		} else {
			sql = "select * from users where status = 1 and group_id <> 1 limit ?,?";
			return query(sql, new UserMapper(),pageable.getOffset(),pageable.getMaxPageItem());
		}
		return query(sql, new UserMapper(),pageable.getGroupId(),pageable.getOffset(),pageable.getMaxPageItem());
	}

	@Override
	public Integer getTotalUser() {
		String sql = "select count(id) from users where status = 1";
		return count(sql);
	}

}
