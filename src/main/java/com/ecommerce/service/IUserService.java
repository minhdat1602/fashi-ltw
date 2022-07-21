package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.User;

public interface IUserService {
	boolean exist(String username);

	User insert(User user);
	User findOneById(Integer id);
	//dat
	User getUser(String username);
	boolean update(User user);
	User findOneByEmail(String email);

	List<User> findAll(User pageable);

	Integer getTotalUser();
}
