package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.User;

public interface IUserDAO extends IGenericDAO<User>{
	boolean exist(String username);

	Integer insert(User user);

	User findOneById(Integer id);
	boolean update(User user);
	//dat
	User getUser(String username);

	User findOneByEmail(String email);

	List<User> findAll(User pageable);

	Integer getTotalUser();
}
